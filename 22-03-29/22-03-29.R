fund2

# Q11

# 1. midwest의 복사본 생성
my_midwest <- midwest
View(my_midwest2)

# 2. 전체 인구 대비 미성년 인구 백분율 파생변수 추가 후 백분율 40~43 지역 출력
my_midwest
my_midwest2<- my_midwest %>% mutate(avg = (poptotal-popadults)/poptotal*100)


my_midwest2 %>% filter(between(avg,40,43)) %>% select(county, state, avg) 
my_midwest2$avg

# 3. 분류기준 등급 파생변수 추가 후 지역이 몇개 있는지 확인
# large(38%이상), middle(30%~38%), small(30%미만)
my_midwest3 <- my_midwest2 %>% 
  mutate(grade = ifelse (avg>=38, "large", ifelse(avg>=30, "middle", "small")))
table(my_midwest3$grade)

# 4. 전체인구 대비 아시아인 인구 백분율 비교해 하위 15개 지역 정보 출력
my_midwest %>% mutate(avg = popasian/poptotal*100) %>% 
  select(state, county, popasian, poptotal, avg) %>% 
  arrange(avg) %>% 
  head(15)



# Q11 강사 ver

# 1. midwest의 복사본 생성 후 전체 인구 대비 미성년 인구 백분율 파생변수 추가
my_midwest
my_mid<- my_midwest %>% mutate(nonage_r = (poptotal-popadults)/poptotal*100)
View(my_mid)

# 2. 백분율 40~43 지역 출력
my_mid %>% filter(between(nonage_r,40,43)) %>% select(county, state, nonage_r) %>% 
  arrange(-nonage_r)

# 3. 분류기준 등급 파생변수 추가 후 지역이 몇개 있는지 확인
my_mid <- my_mid %>% 
  mutate(nonage_grade = ifelse (nonage_r>=38, "large", ifelse(nonage_r>=30, "middle", "small")))

table(my_midwest3$grade)
paste(round(prop.table(table(my_mid$nonage_grade))*100,2),"%")

# 4. 전체인구 대비 아시아인 인구 백분율 비교해 하위 15개 지역 정보 출력
my_mid %>% mutate(asian_r = (popasian/poptotal)*100) %>% 
  select(state, county, popasian, poptotal, asian_r) %>% 
  arrange(asian_r) %>% 
  head(15)




# 5-8. 데이터 구조 변경 ----

# 0. packages & dataset
search()
library(tidyr)
library(reshape2)

# dataset
mtcars
my_car <- mtcars
names(my_car); dim(my_car)
rownames(my_car) #행 이름


# 5-8-1. rowname -> new 컬럼 추가
tolower(rownames(my_car))
toupper(rownames(my_car))

# 1-1 1번 방법
my_car %>% mutate(rowname = tolower(rownames(my_car)))
# 1-2 2번 방법
my_car$rowname <- tolower(rownames(my_car))

head(my_car)

# 기존 rownames 삭제
rownames(my_car) <- NULL
head(my_car)


# 5-8-2. new dataset 생성

names(my_car)

my_car <- my_car %>% 
  select(rowname, am, mpg, cyl, disp)


# 5-8-3. 가로형 -> 세로형 
# 3-1 tidyr::gather
# 컬럼의 이름과 해당 컬럼의 데이터를 데이터로 변경

names(my_car)
View(my_car %>% 
       gather(key="c_key", value="c_value", cyl, disp, am), "4") 
# key = 컬럼의 이름 value = 컬럼의 데이터


my_car_gather <- my_car %>% 
  gather(key="c_key", value="c_value", cyl)

head(my_car_gather, 3)  
dim(my_car_gather)
names(my_car_gather)

# 5-8-3. 가로형 -> 세로형 
# 3-2 reshape::melt

dim(my_car)
names(my_car)
head(my_car)

my_car_melt <- my_car %>% 
  melt(measure.vars = "cyl", id.vars=c("rowname", "am", "mpg", "disp"))
#measure.vars = 녹여낼 컬럼 / id.vars = 같이 보여줄 컬럼 (녹여낼거 X)
head(my_car_melt, 3)
dim(my_car_melt)
my_car_melt


# 5-8-4. 세로형 -> 가로형

# 4-1. tydir::spred

my_car_gather %>% 
  spread(key="c_key", value="c_value")
# key값과 value값을 컬럼명과 해당 컬럼의 데이터로 변환?

my_car_spread <- my_car_gather %>% 
  spread(key="c_key", value="c_value")

names(my_car_spread)
head(my_car_spread)
dim(my_car_spread)


# dataset 비교
all.equal(my_car, my_car_spread)
# => 컬럼의 순서가 다름 / 데이터의 순서가 다름
# all.equal 결과가 true가 나오려면 모든 것이 같아야 함

# 컬럼의 순서가 데이터의 순서 정렬 후 비교
all.equal((my_car %>% select(1,2,3,4,5) %>% arrange(rowname)),
          (my_car_spread %>% select(1,2,3,5,4) %>% arrange(rowname)))


# 4-2. reshape2::dcast
# dcast(함께 보여질 컬럼 ~ 컬럼화 할 data)
my_car_melt
names(my_car_melt); dim(my_car_melt)

my_car_melt %>% 
  dcast(rowname+am+mpg+disp ~ variable)

my_car_dcast <- my_car_melt %>% 
  dcast(rowname+am+mpg+disp ~ variable)

names(my_car_dcast); dim(my_car_dcast)
head(my_car_dcast)


# 5-8-5. reshape2::acast  ----
# reshape2 패키지 안에만 존재
# 행렬과 배열로 return
# reshape2::acast(x1 ~ x2 ~ x3)
# reshape2::acast(행기준 ~ 데이터값 ~ 열기준)

head(my_car_melt)
dim(my_car_melt)

my_car_melt %>% 
  acast(rowname ~ disp ~ variable)

my_car_acast <- my_car_melt %>% 
  acast(rowname ~ disp ~ variable)

class(my_car_acast)


V

# VQ7 강사 ver

# 7-1)
ggplot(data=my_mpg, aes(x=cty, y=hwy))+geom_point()

# 7-2)

# 그래프
temp_mid <- ggplot(data=midwest, aes(x=poptotal, y=popasian))+geom_point()+
  xlim(0,500000)+ylim(0,10000)

class(temp_mid)

# 저장
getwd()
ggsave(filename="temp_mid.jpg", plot=temp_mid,
       width=20, height=15, units="cm", dpi=1000)

# units = c("in", "cm", "mm", "px") 크기
# dpi = 해상도




# 8. 이상치(Outlier)  ----

# 8-1. 논리적인 이상치  ----

# 8-1-1. 이상치 dataset 생성
# 성별: 1~2, 설문: 1~5

t_out <- data.frame(mw=c(1,2,1,1,2,4),
                    survey=c(1,3,5,4,10,3))
t_out


# 8-1-2. 논리적인 이상치 확인
table(t_out)
table(t_out$mw)
table(t_out$survey)

boxplot(t_out)
names(boxplot(t_out))
boxplot(t_out)$stats
boxplot(t_out$mw)$stats
boxplot(t_out$survey)$stats

car::Boxplot(t_out)
t_out[6,"mw"]     # 이상치 인덱스 위치가 6번째
t_out[5,"survey"] # 이상치 인덱스 위치가 5번째

# 8-1-3. 논리적인 이상치 제거
# filter() -> NA 변경 -> !is.na() 활용 분석

# t_out$mw
ifelse(t_out$mw==4, NA, t_out$mw)   # mw값이 4이면 NA로 표기
t_out$mw <- ifelse(t_out$mw==4, NA, t_out$mw)
t_out

# t_out$survey
ifelse(t_out$survey > 5, NA, t_out$survey)  # survey값이 5보다 크면 NA로 표기
t_out$survey <- ifelse(t_out$survey > 5, NA, t_out$survey)
t_out


# 8-1-4. 결측치 제거 후, 분석
t_out %>% filter(!is.na(mw)&!is.na(survey)) %>%group_by(mw) %>% 
  summarise(m_survey=mean(survey))




# 8-2. 극단적인 이상치 ----
# 논리적인 판단기준: 사람의 키(0.5 ~ 2.5m)
# 통계적인 판단기준: sd+-3 이상/이하 or +-1.5IQR 이상/이하

# 8-2-1. 극단적인 이상치 확인
out_mpg <- mpg
dim(out_mpg)

boxplot(out_mpg$hwy)$stats
car::Boxplot(out_mpg$hwy)

out_mpg[223,"hwy"]


# 8-2-2. 극단치 제거
# 조건에 부합하지 않는 값은 NA 변경 -> NA제외 분석
# 조건: 12~37

ifelse(out_mpg$hwy<12 | out_mpg$hwy>37, NA, out_mpg$hwy)
# hwy값이 12보다 작거나 37보다 크면 NA로 변경

table(ifelse(out_mpg$hwy<12 | out_mpg$hwy>37, NA, out_mpg$hwy))   # NA값 빼고 출력
table(ifelse(out_mpg$hwy<12 | out_mpg$hwy>37, NA, out_mpg$hwy),useNA="ifany")   # NA값 포함 출력

out_mpg$hwy <- ifelse(out_mpg$hwy<12 | out_mpg$hwy>37, NA, out_mpg$hwy)
table(is.na(out_mpg$hwy))


# 8-2-3. 결측치 제외 후 분석
dim(out_mpg)

out_mpg %>% group_by(drv) %>% summarise(mean(hwy))

out_mpg %>% group_by(drv) %>% summarise(m_hwy=mean(hwy, na.rm=T), n=n())



# VQ8-1.
View(mpg)
library(dplyr)
my_mpg2 <- mpg %>% filter(class == "midsize") %>% select(manufacturer, model, cty, class) %>% 
  group_by(manufacturer) %>%
  summarise(m_cty=mean(cty)) %>% 
  arrange(-m_cty) %>% head(5)

ggplot(data = my_mpg2, aes(x=reorder(manufacturer, -m_cty), y=m_cty))+geom_col()


# VQ8-2. 자동차 class별 빈도 막대
my_mpg3 <- mpg %>% group_by(class) %>% 
  summarise(count = n()) %>% 
  arrange(-count)

ggplot(data = my_mpg3, aes(x=reorder(class, -count), y=count))+geom_col()



# VQ9 상자그림
my_mpg4 <- mpg %>% group_by(class) %>% 
  filter(class=="compact" | class=="midsize" | class=="suv" | class=="minivan" | class=="pickup")
View(my_mpg4)

ggplot(data=my_mpg4, aes(x=class, y=cty))+
  geom_boxplot()

# VQ9 강사 ver
tt <- unique(mpg$class)

t_mpg <- mpg %>% select(class, cty) %>%
  filter(class %in% c(tt[c(-4, -7)]))

box_p <- ggplot(data=t_mpg, aes(x=class, y=cty))+geom_boxplot()  
ggsave(filename="box_p.jpg", plot=box_p)



# VQ10

# 10-1
my_mpg2 <- mpg
my_mpg2$cty[c(11,23,50,78,111,132,150,161,183,201)] <- NA

# 10-2-1
table(is.na(my_mpg2$drv))
table(is.na(my_mpg2$cty))

# 10-2-2
my_mpg2 %>% filter(!is.na(my_mpg2$cty)) %>% 
  group_by(drv) %>% 
  summarise(m_cty=mean(cty))


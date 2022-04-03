# funds2
# R&D 6-3 ----

# R&D 6-3. 다음 조건에서 총 100명 인원 중, 남여 평균키 구해라 (벡터활용)

# 1. 100명의 키 정보 (단위 :cm)를 랜덤하게 생성
# mean : 172cm / sd: 7
# 단 164, 182, 173, 165, 178은 반드시 포함 시킬 것

height <- round(rnorm(n = 100, mean = 172, sd = 7),0)
height
c(164,182,173,165,178) %in% height
round(mean(height))
round(sd(height),0)


# 2. 성별은 남여 50명씩 취합한 것으로 가정하고 각 성별 평균 키 정보 구해라

gender <- rep(c("M", "W"),50)
set.seed(123);
gender <- sample(gender)

info <- data.frame()
info <- data.frame(gender, height)
info
info %>% group_by(gender) %>%
  summarise(gh=mean(height))
tapply(height, gender, mean)



# R&D 6-3 강사 ver  ----

# 1) 키정보 생성: 100개
# mean: = 172 / sd = 7
# 실측치 : 164, 182, 173, 165, 178

gen_h0 <- rnorm(100, mean=172, sd=7)
mean(gen_h0); sd(gen_h0)  # 171.759 / 6.593

gen_h1 <- c(164, 182, 173, 165, 178, rnorm(95, mean=172, sd=7)); gen_h1
mean(gen_h1); sd(gen_h1)  # 171.617 / 6.656


# 2) 남녀 정보 생성: 100개
gd <- rep(c("M", "F"), 50); gd
table(gd)             # *
length(gd[gd=="F"])   # *
length(gd[gd=="M"])   # *

# 3) index별(남녀별) 평균-키 값
head(gen_h1, 10)
head(gen_h1[gd=="M"], 5)       # **
gen_h1[gd=="F"]       # **

gd=="M"
gen_h1[T]
gen_h1[F]

gen_h1[gd=="M"]       # **
mean(gen_h1[gd=="M"])
mean(gen_h1[gd=="F"])
c(mean(gen_h1[gd=="M"]), mean(gen_h1[gd=="F"]))
tapply(gen_h1,gd,mean)

# 4) index 벡터의 길이가 긴 경우?? (문제점)

# dataset
m_vec <- rnorm(10000, mean=160, sd=30);m_vec
length(m_vec)

# index
m_ind <- rep(51:100, 200); m_ind
length(m_ind)
unique(m_ind)
length(unique(m_ind))   # unique 50개

# 50개의 그룹별 평균
c(mean(m_vec[m_ind==51]),mean(m_vec[m_ind==52]),
  mean(m_vec[m_ind==53]),mean(m_vec[m_ind==54]),
  mean(m_vec[m_ind==55]),mean(m_vec[m_ind==56]))
# 모든 인덱스를 직접 key-in??

# 5) 4)의 문제점 해결   # ****
tapply(m_vec, m_ind, mean)

# 정리 : 벡터 두개를 만들어서 하나를 인덱스로 사용





# 과제  ----

# 1. 주말 과제: 교재 324~387 까지 실습 해서 Rmd 로 제출 ----


# 국내 휴양림 분포  ----

# 1) 엑셀파일 가져오기
forest_example_data <- read_excel("forest_example_data.xls"); forest_example_data

colnames(forest_example_data) <- c("name", "city", "gubun", "area", "number", "stay",
                                   "city_new", "code", "codename")
str(forest_example_data)
head(forest_example_data)


# freq() 함수로 빈도분석 하기
# 그래프 보이게 (디폴트값)
freq(forest_example_data$city, plot = T, main = "city")
# 그래프 안보이게
freq(forest_example_data$city, plot = F, main = "city")

# table() 함수로 시보별 휴양림빈도분석 하기
city_table <- table(forest_example_data$city)
city_table
barplot(city_table)
ggplot(data=forest_example_data, aes(x=city))+
  geom_bar(width = 0.8)

# count() 함수로 빈도분석 후 내림차순 정렬하기
count(forest_example_data, city) %>% arrange(desc(n))
count(forest_example_data, city) %>% arrange(-(n))

# 소재지 시도명으로 시도별 분포 확인 후 내림차순 정렬하기
count(forest_example_data, city_new) %>% arrange(desc(n))
count(forest_example_data, city_new) %>% arrange(-(n))

# 제공기관명으로 시도별 분포 확인 후 내림차순 정렬하기
count(forest_example_data, codename) %>% arrange(desc(n))
count(forest_example_data, codename) %>% arrange(-(n))



# 해외 입국자 추이 확인 ----

# 1) 엑셀파일 가져오기
entrance_xls <- read_excel("entrance_exam.xls"); entrance_xls
str(entrance_xls)
head(entrance_xls)
names(entrance_xls)

# 2) 컬럼명 변경 및 공백 제거
colnames(entrance_xls) <- c("country", "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL",
                            "AUG", "SEP", "OCT", "NOV", "DEC")
entrance_xls$country <- gsub(" ", "", entrance_xls$country); entrance_xls

# 3) 1월 기준 상위 5개국 추출
entrance_xls|> nrow()
entrance_xls %>%  nrow()

top5_country <- entrance_xls[order(-entrance_xls$JAN),] %>% head(n = 5)
top5_country <- entrance_xls %>% arrange(-JAN) %>% head(n = 5)
top5_country

# 4) 시각화를 위한 데이터 구조 재구조화(melt 함수)
library(reshape2)
top5_melt <- melt(top5_country, id.vars="country", variable.name = "mon"); top5_melt
head(top5_melt)

# 5) 데이터 시각화
# 5-1) 선그래프
ggplot(top5_melt, aes(x = mon, y = value, group = country)) +
  geom_line(aes(col = country))

# 5-1-1) 선그래프 제목 지정 및 y축 범위 조정
ggplot(top5_melt, aes(x = mon, y = value, group = country)) +
  geom_line(aes(col = country)) +
  ggtitle("2020년 국적별 입국 수 변화 추이") +
  scale_y_continuous(breaks = seq(0, 500000, 50000))

# 5-2) 막대 그래프
ggplot(top5_melt, aes(x = mon, y = value, fill = country)) +
  geom_bar(stat = "identity", position = "dodge")

# 5-2-1) 누적 막대 그래프
ggplot(top5_melt, aes(x = mon, y = value, fill = country)) +
  geom_bar(stat = "identity", position = "stack")

#ggplot(top5_melt, aes(x = mon, y = value, fill = country)) +
#  geom_bar(stat = "identity")



# 코로나  ----

# 1) 엑셀파일 가져오기
xlsdata <- read_excel("covid19.xls"); xlsdata


# 2) 데이터 컬럼 추출 및 열, 이름 변경
data_raw <- xlsdata[,c(2:4,7 )]; data_raw
names(data_raw) <-  c("state", "city", "name", "addr"); data_raw


# 3) 빈도분석하기

# 3-1) state 빈도 분석
table(data_raw$state)
barplot(table(data_raw$state))
ggplot(data=data_raw, aes(x=state))+
  geom_bar(width = 0.8)

# 3-2) city 빈도 분석 
data_raw %>% count(city)

# 3-3) 대전 선별진료소 데이터 추출
daejeon_data <- data_raw[data_raw$state == "대전",]; daejeon_data
nrow(dajeon_data)
ncol(dajeon_data)


# 4) 지도 시각화
install.packages("ggmap")
library(ggmap)
?ggmap

# 4-1) 위도와 경도 데이터 가져오기
ggmap_key <- "AIzaSyDh05C9oJ6tZfFLfh9mSYcMsZRpa_ntVp0"
register_google(ggmap_key)

daejeon_data <- mutate_geocode(data = daejeon_data, location = addr,
                               source = "google")
daejeon_data
View(daejeon_data)
head(daejeon_data$lon...5)

# 4-2) 대전시 지도 시각화 하기
daejeon_map <- get_googlemap("대전", maptype = "roadmap", zoom = 11)
ggmap(daejeon_map) + geom_point(data = daejeon_data, aes(x = lon...5, y = lat...6,
                                                         col = factor(name)), size = 3)

# 4-3) 마커로 위치 표시하고 위치 이름 넣기
daejeon_data_marker <- data.frame(daejeon_data$lon...5, daejeon_data$lat...6)
daejeon_map <- get_googlemap("대전", maptype = "roadmap", zoom = 11,
                             markers = daejeon_data_marker)
ggmap(daejeon_map) + geom_text(data = daejeon_data, aes(x = lon...5, y = lat...6),
                               size = 3, label = daejeon_data$name)



# 서울시 지역별 미세먼지 농도 비교  ----

# 1) 엑셀파일 가져오기
library(readxl)
dustdata <- read_excel("dustdata.xlsx"); dustdata

View(dustdata)
str(dustdata)
names(dustdata)

# 2) 성북구와 중구 데이터만 추출
dustdata_anal <- dustdata[, c("날짜", "성북구", "중구")]; dustdata_anal
View(dustdata_anal)
head(dustdata_anal)

# 3) 결측치 확인
is.na(dustdata_anal)
sum(is.na(dustdata_anal))

# 4) 데이터 탐색 후 시각화

# 4-1) 지역별 미세먼지 농도의 기술통계량 구하기
library(psych)
describe(dustdata_anal$성북구)
describe(dustdata_anal$중구)

# 4-2) 성북구와 중구 미세먼지 농도 상자 그림(boxplot) 그리기
boxplot(dustdata_anal$성북구, dustdata_anal$중구, main = "finedust_compare",
        xlab = "AREA", names = c("성북구", "중구"), ylab = "FINEDUST_PM",
        col = c("blue", "green"))

# 5) 데이터 분석 (가설 검정)
# 귀무 : 중구와 성북구 미세먼지 농도의 평균에 차이가 없다
# 대립 : 중구와 성북구 미세먼지 농도의 평균에 차이가 있다

# 5-1) f검정으로 지역별 미세먼지 농도의 분산 차이 검정 var.test()
# 두 집단의 분산에 차이가 있는지 없는지 분석
var.test(dustdata_anal$중구, dustdata_anal$성북구)
# 등분산 (집단간의 분산이 동일) / 귀무가설 채택 = 집단간 차이가 없다 = 등분산 가정 만족

# 5-2) t검정으로 지역별 미세먼지 농도의 평균 차이를 검정 t.test()
# 변수가 정규분포를 따르고 있을 때 사용가능한 분석 기법
# t.test(data=dustdata_anal, dustdata_anal$중구, dustdata_anal$성북구, var.equal=T)
t.test(dustdata_anal$중구, dustdata_anal$성북구, var.equal=T)
# p-value > 0.05(유의기준(수준)?) = 귀무 채택




# 2. Quiz 6-4 제출 (Rmd)  ----

# 1) 사용자 함수를 구현해 주어진 엑셀 파일의 여러 sheet를 한번에 로딩

r_xl <- function(x){
  
  switch(x, cus = read_excel("Union_ds.xlsx", sheet = 1, col_names = T),
         pro = read_excel("Union_ds.xlsx", sheet = 2, col_names = T),
         ord = read_excel("Union_ds.xlsx", sheet = 3, col_names = T))
}
cus <- r_xl('cus'); cus
pro <- r_xl('pro'); pro
ord <- r_xl('ord'); ord

# 2-1) 주문을 3회 이상한 고객정보
library(dplyr)
ord_info <- full_join(cus, ord, by="c_id"); ord_info

ord_info1 <- ord_info %>% group_by(c_id, c_name, addr) %>% 
  summarise(ord_count=n()) %>% 
  filter(ord_count >= 3)
ord_info1

# 2-2) 5회 이상 주문 된 상품정보
ord_info2 <- full_join(pro, ord, by="p_id"); ord_info2

ord_info2 <- ord_info2 %>% group_by(p_id, p_name, p_price) %>% 
  summarise(pro_count=n()) %>% 
  filter(pro_count >= 5)

ord_info2

# 2-3) 결합
ord_info3 <- bind_rows (ord_info1, ord_info2)
ord_info3 <- ord_info3 %>% select(c_id, c_name, addr, p_id, p_name, p_price)
ord_info3

# 3) 구매내역 정보 상세히 조회
ord_info5 <- full_join(cus, ord, by="c_id")
ord_info5 <- full_join(ord_info5, pro, by="p_id")
ord_info5

# 4) 고객 중 100만원 이상을 소비한 고객 조회
ord_info6 <- ord_info5 %>% group_by(c_id, c_name) %>% 
  summarise(p_count=n(),
            c_pay=sum(p_price)) %>% 
  select(c_id, c_name, p_count, c_pay) %>% 
  filter(c_pay>1000000) %>% 
  arrange(-c_pay)
ord_info6
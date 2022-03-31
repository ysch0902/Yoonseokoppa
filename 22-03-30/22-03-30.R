# funds2

# 5-8-5. reshape2::acast  ----
# 세로형 -> 가로형   (용해된 data를 컬럼명으로 펼침)
# reshape2 패키지 안에만 존재
# reshape2::acast(x1 ~ x2 ~ x3)
# reshape2::acast(행기준 ~ 열기준 ~ 제 3의 기준)
# return : array (배열), matrix (행렬)
# 데이터는 용해되었던 key와 value 중 value


# 1) dataset

df_p <- read.table(header = TRUE, stringsAsFactors = F, text = "
age gender name p_type p_topping
 20  F     D소휘 R     t_포테이토
 20  M     D기도 L     t_쉬림프
 23  M     D도일 L     t_쉬림프
 25  F     D혜원 R     t_포테이토
 20  M     D우혁 L     t_고구마
 15  M     D기범 L     t_페페로니
 25  F     D현정 L     t_페페로니
 27  M     D동준 L     t_스테이크
 23  M     D준태 L     t_불고기
 29  F     D구연 L     t_포테이토
"); df_p


# 2) 토핑컬럼(p-topping) 용해
library(tidyr)
names(df_p)
head(df_p)

df_p %>% 
  gather(key="c_key", value="c_value", p_topping)

df_p_gather<- df_p %>% 
  gather(key="c_key", value="c_value", p_topping)
df_p_gather

# 3) 행과 열만 지정
library(reshape2)
df_p_gather %>% acast(gender ~ name)
df_p_a1 <- df_p_gather %>% acast(gender ~ name)


# 4) 1,2,3 기준 / 제 3의 기준열 추가 (p_type)
names(df_p_gather)
df_p_gather %>% acast(gender~name~p_type)


# 5) 1,2,3 + 4 기준 / 제 3의 기준열 추가 (p_type + age)
df_p_gather %>% acast(gender~name~p_type+age)





# VQ10 강사 ver

# 1) NA처리
my_mpg <- ggplot2::mpg

my_mpg$cty[c(11, 23, 50, 78, 111, 132, 150, 161, 183, 201)] <- NA


# 2) 구동방식별 평균- cty

# 결측치 확인
table(is.na(my_mpg$drv))
table(is.na(my_mpg$cty))

# drv, 평균-cty
my_mpg %>% filter(!is.na(my_mpg$cty)) %>% 
  group_by(drv) %>% 
  summarise(m_cty=mean(cty)) %>% 
  arrange(-m_cty)




# A. mpp (코로플레스도, choropleth map)  ----

# 0. packages & datasets  ----
rm(list=ls())
ls()

# 0-1. packages
# 1) packages: ggiraphExtra  # 단계별 구분도 관련 함수
# ggChoropleth(), 단계구분도 함수
# 2) packages: mapproj       # 단계별 구분도 plotting 시에 필수
# 3) packages: maps          # 지도정보
# 4) packages: ggplot2       # map_data()
# map data를 data.frame으로 변환
# 5) packages: tibble        # rownames_to_column()

install.packages("ggiraphExtra")
install.packages("mapproj")
install.packages("maps")
install.packages("tibble")

library(ggiraphExtra)
library(mapproj)
library(maps)
library(ggplot2)
library(tibble)
?map_data
map_data("state")
dim(map_data("state"))


# 0-2. dataset
data(package="datasets")
head(USArrests)
?USArressts
my_USArr <- USArrests
names(my_USArr)



# 1. data 전처리 (pre-processsing)
?rownames_to_column()  # tibble
names(my_USArr)   # 4개
head(USArrests)

# 1-1. rowname -> column  ----
my_USArr<- rownames_to_column(my_USArr, var = "state")
# tibble::rownames_to_column() 이용해서 행 이름을 state 변수로 바꿔 새 데이터 프레임을 생성
names(my_USArr)   # 5개
head(my_USArr)

# 1-2. state 대문자 -> 소문자 ----
my_USArr$state<- tolower(my_USArr$state); my_USArr



# 2. 지도 준비 (map preparation)

# 2-1. 지도확인 ----
map("usa")
map("state")    *
  map("county")

# 2-2. 지도 data 가져오기
USA_map <- map_data("state")
names(USA_map)
head(USA_map)
str(USA_map)
dim(USA_map)
unique(my_USArr)

setdiff(unique(my_USArr$state), unique(USA_map$region))
setdiff(unique(USA_map$region),unique(my_USArr$state))


# 3. choropleth map (단계구분도)  ----
?ggChoropleth
names(my_USArr) # biz data
names(USA_map)  # map data

ggChoropleth(data=my_USArr,
             map=USA_map,
             aes(fill=Murder,
                 map_id=state),
             title="USA Arrest Rate(Murder)",
             col="darkblue")

# data =지도에 표현할 데이터
# map = 지도 데이터
# aes(fill) = 색으로 표현할 변수
# mpa_id = 지역 기준 변수
# title = 지도 제목
# col = 선 색상



# 4. interactive map
ggChoropleth(data=my_USArr,
             map=USA_map,
             aes(fill=Murder,
                 map_id=state),
             title="USA Arrest Rate(Murder)",
             col="darkblue",
             interactive=T)



# 5. HTML 파일 저장하기
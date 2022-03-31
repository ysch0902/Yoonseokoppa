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




# R&D 6-1.  ----

# 1) 특정문자를 조회 #SQL> like 연산자
# packages: stringr
# packages: data.table

# R&D 6-1-1

# Q1-1 제조사 이름에 "a"가 들어가는 제조사 리스트
q1_1 <- mpg$manufacturer[str_detect(mpg$manufacturer, "a")]
unique(q1_1)

# Q1-2 제조사 이름에 "a"로 시작하는 제조사 리스트
q1_2 <- mpg$manufacturer[str_detect(mpg$manufacturer, "^a")]
unique(q1_2)

# Q1-3 제조사 이름에 "a"로 끝나는 제조사 리스트
q1_3 <- mpg$manufacturer[str_detect(mpg$manufacturer, "a$")]
unique(q1_3)



# 6-1-1. 강사 ver

install.packages("data.table")
library(data.table)

my_mpg <- mpg

# 문자 a를 가지고 있는 제조사 리스트 (data.table)
my_mpg %>% filter(manufacturer %like% 'a') %>% 
  distinct(manufacturer)

# 문자 a를 가지고 있는 제조사 리스트 (stringr)
my_mpg %>% filter(str_detect(manufacturer, "a")) %>% 
  distinct(manufacturer)


# 문자 a로 시작하는 제조사 리스트 (data.table)
my_mpg %>% filter(manufacturer %like% '^a') %>% 
  distinct(manufacturer)

# 문자 a를 시작하는 제조사 리스트 (stringr)
my_mpg %>% filter(str_detect(manufacturer, "^a")) %>% 
  distinct(manufacturer)


# 문자 c로 끝나는 제조사 리스트 (data.table)
my_mpg %>% filter(manufacturer %like% 'c$') %>% 
  distinct(manufacturer)

# 문자 c로 끝나는 제조사 리스트 (stringr)
my_mpg %>% filter(str_detect(manufacturer, "c$")) %>% 
  distinct(manufacturer)


# 문자 c | i | s를 포함하는 제조사 리스트 (data.table)
my_mpg %>% filter(manufacturer %like% '[cis]') %>% 
  distinct(manufacturer)

# 문자 c | i | s를 포함하는 제조사 리스트 (stringr)
my_mpg %>% filter(str_detect(manufacturer, "[cis]")) %>% 
  distinct(manufacturer)





# R&D 6-1-2.  ----

installed.packages()
names(installed.packages()) # data.frame이 아니기 때문에 NULL값이 나옴
colnames(installed.packages()) # colnames를 사용하면 matrix, 행렬도 값이 나옴

# 타입변경
ins_pkg<- as.data.frame(installed.packages())
names(ins_pkg)  # data.frame로 타입을 변환시켜서 names 함수를 사용


pkg_check <- function(x){
  xx <- x %in% installed.packages()[,1]
  return(xx)
}

pkg_check("xml")
pkg_check("dplyr")


# R&D 6-2

# 1. 오라클에 접속해 emp, depart 테이블 inner join
library(RJDBC)
library(DBI)
library(rJava)
library(odbc)

# 2. db 드라이버 생성(ojdbc8.jar)

jdbc_D <-JDBC(driverClass = "oracle.jdbc.OracleDriver", 
              classPath = "C:/Database/dbhomeXE/jdbc/lib/ojdbc8.jar")

# 3. targetDB Connection

jdbc_D

dm_con1 <- dbConnect(jdbc_D, "jdbc:oracle:thin:@192.168.56.1:1521:XE","HR","HR")

# 4. 쿼리문 작성

# 4-1.쿼리 작성
q1 <-  "select d.department_name as d_name, e.salary as e_salary,
    avg(salary) as avg
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name, e.salary"

# 4-2. 작성 쿼리 csv로 저장 후 R로 가져옴
q1_1 <-  dbGetQuery(dm_con1, q1)

write.csv(q1_1, file = "q1.csv")

q2<- read.csv("q1.csv")

# 4-3. tapply()로 평균내기
# tapply(평균을 구할 변수, 그룹화 할 변수, 평균을 구할 함수(mean()))
tapply(q2$AVG, q2$D_NAME, mean)




# 6. 데이터 분석 및 가공  ----

# 6-1. apply  ----
# apply(data, 방향, 함수, 인자)
# 방향 : 1(행), 2(열)

a1 <- matrix(1:12, 2, 4)  # 1부터 12까지 2행 4열  /  열우선
a1
a2 <- matrix(1:12, 2, 4, byrow = T)  # 1부터 12까지 2행 4열  /  행우선
a2

apply(a1, 1, min) # a1 자리는 vector 안됨
apply(a1, 2, max)
class(apply(a1, 2, max))


# 6-1-2. 다른 함수 활용
a3 <- matrix(c("dima_구현", "dima_동준", "dima_기도", "dima_기범"), 2, 2)
a3

# 사용자 함수 생성
search()

d_sub <- function(x){
  
  return(stringr::str_sub(x, 6, 7))
  # str_sub(string, 시작, 끝) : 특정한 위치에서 데이터(인덱스)를 짤라오는
}

d_sub(a3)

# *****
a3
apply(a3, 1, d_sub) # data = a3, 방향 = 1, 함수 = d_sub (사용자 정의 함수)
apply(a3, 2, d_sub) # data = a3, 방향 = 2, 함수 = d_sub (사용자 정의 함수)


# 6-1-3. apply testing  ----
my_exam <- read.csv("ss_exam.csv")
dim(my_exam)
head(my_exam)

my_exam[, -1:-2]
apply(my_exam[, -1:-2], 1, sum)     # 30개
apply(my_exam[, -1:-2], 1, mean)    # 30개

apply(my_exam[, -1:-2], 2, sum)     # 4개
apply(my_exam[, -1:-2], 2, mean)    # 4개

# NA처리
# apply() : NA처리 안됨 (단, 함수옵션은 사용가능)
# 단, 함수옵션은 사용가능
head(my_exam)
my_exam[4, 5:6] <- NA
head(my_exam)

# NA처리 후 , 결과 확인 (X)
apply(my_exam[, -1:-2], 1, sum)    # 29개  *
apply(my_exam[, -1:-2], 1, mean)    # 29개  **

apply(my_exam[, -1:-2], 2, sum)    # 2개     ***
apply(my_exam[, -1:-2], 2, mean)    # 2개     ****

# 함수옵션 사용시 결과 확인 (O)
apply(my_exam[, -1:-2], 1, mean, na.rm = T)   # na.rm은 mean(함수)의 인자
apply(my_exam[, -1:-2], 2, mean, na.rm = T)   # na.rm은 mean(함수)의 인자

# 함수옵션을 사용하지 않는 apply의 대안?? 
rowSums(my_exam[, -1:-2], na.rm = T)  # *
rowMeans(my_exam[, -1:-2], na.rm = T)  # **

colSums(my_exam[, -1:-2], na.rm = T)  # ***
colMeans(my_exam[, -1:-2], na.rm = T)  # ****




# 6-2. apply계열 함수 비교  ----
# apply, sapply, lapply

# 6-2-0. dataset 정의
t_app <- matrix(c(1:9), 3, 3)
t_app

# 사용자 정의 함수
mt<- function(x){
  
  return(x^2)
}

# 6-2-1. apply
t_app
apply(t_app, 2, max)  # 1 = 행 중심, 2= 열 중심
apply(t_app, 2, mt)
apply(t_app, 1, mt)
class(apply(t_app, 1, mt))    # return : 행렬
class(apply(t_app, 2, max))   # return : 벡터

# NA처리
t_app[2, 2:3] <- NA
t_app

apply(t_app, 2, max, na.rm = T) # O
apply(t_app, 2, mt, na.rm = T)  # ERROR - 
# apply함수에서 사용자 정의 함수의 인자는 기능 안함 


# 6-2-2. sapply   # 벡터로 return
t_app <- matrix(c(1:9), 3, 3)
t_app

sapply(t_app, max)
sapply(t_app, mt)


# 6-2-3. lapply   # 리스트로 return
t_app

lapply(t_app, max)
lapply(t_app, mt)



# 6-3. tapply ----
# tapply(벡터, index, 함수, 함수인자)
# tapply(평균을 구할 변수, 그룹화 할 변수, 평균을 구할 함수(mean()))
# 그룹별 연산

iris
names(iris)
unique(iris$Species)

tapply(iris$Sepal.Length, iris$Species, mean)
tapply(iris$Sepal.Length, iris$Species, sum)
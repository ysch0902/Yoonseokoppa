# 준비

library(ggplot2)
search()
data(package ="ggplot2") #Dataset 확인
str(mpg) #data의 상세속성
head(mpg, 10)
View(mpg) #원자료 조회 (row data)


#평균 - 고속도로 연비?  (고속도로 연비 - hwy)
mean(mpg$hwy) #mpg라는 dataset에서 특정 dataframe만 연결시킬 때 $ 기호 사용

#max - 고속도로 연비?
max(mpg$hwy)

#max - 고속도로 연비?
min(mpg$hwy)

#히스토그램?
hist(mpg$hwy)


# 0. work directory ----

getwd()
read.csv("ss_exam.csv")

# wd 변경
setwd("C:/PR/R_Works")
getwd()
read.csv("ss_exam.csv") #wd가 변경되서(자식폴더에 있기 때문에) csv 파일 읽을 수 없음 ERROR

getwd()
read.csv("C:/PR/R_Works/DIMA_Kita/ss_exam.csv") #절대주소로 불러오기

read.csv("./DIMA_Kita/ss_exam.csv") #상대주소로 불러오기


# wd 변경 #원래대로
setwd("C:/PR/R_Works/DIMA_Kita")
getwd()
read.csv("ss_exam.csv")


# 파일이동 #부모폴더로 (파일명: ss_exam_p.csv)
getwd() # C:/PR/R_Works/DIMA_Kita <- 현재 wd
read.csv("ss_exam_p.csv") #파일이 현재 wd에 없음 ERROR
read.csv("../ss_exam_p.csv") # 파일 정상적으로 불러옴


# 1. 변수 ----
# 변수 선언은 가급적 소문자로

a <- 3
a

# 에러
2a <-  3  # 숫자로 시작 X

a-b <- 3  # -(하이픈) 사용 X

ac@b <- 3 # 특수기호 사용 X

.13 <- 3  # .숫자 형식 X

#가능
.a <-  3  # .문자 형식 사용 O
.a
a_b <- 3  # 문자 중간의 _(언더바) 사용 O
a_b


# 1-1. 변수 선언  ----

a <- 2; a
aa <- 5^10; aa
AA <- 10; AA

a+aa
a*aa
a*AA


# 1-2. 여러개의 값을 선언(c(), seq()) ----

bb <- c(10,20,30,40,50); bb
bb2 <- c(10:50); bb2  # c(start:end)

#seq(start, end, by= +-num)
cc1 <-  seq(10, 50, by=10); cc1
cc2 <-  seq(100, 20, by=-20); cc2


# 1-3. 연속값 변수 계산하기 ----

dd <-  seq(10, 100, by=10); dd
length(dd)

ee <- seq(100, by=-5); ee
length(ee)

dd+ee


# Q #에러 이유
# 긴(큰) 변수의 길이 = 짧은(작은) 변수의 길이*n
d1 <- c(1:10); d1
d2 <- c(1:3); d2

d1+d2  #d1의 길이 = d2의 길이*n (배수) 가 아니기 때문에 ERROR


# 1-4. 문자변수 선언  ----

h1 <- "aaa"; h1
length(h1)

h2 <- "hello R~!"; h2
length(h2)

h3 <- "hello R Programming~!"; h3
length(h3)

h4 <- c("hello", "R", "Programming"); h4 #데이터 사이즈(길이)에 상관 없이 ""에 묶이면 하나로 처리
length(h4)


# 문자변수 연산 ?? ----
h1+h2 #ERROR


# 1-5. 반복 문자변수 선언 (rep()) ----
# rep(date, each, times, length.out)
# data = data
# each = 각 개별 data 하나하나의 반복횟수
# times = 데이터 전체의 반복횟수
# length.out = 표현되는 전체 데이터의 사이즈

r1 <- rep(1,5); r1
r2 <- rep(1:5, 3); r2

rep(1:5, each=3)
rep(1:5, each=10)
rep(1:5, each=10, length.out=100)
rep(1:5, each=10, length.out=200)

rep(1:5, each=2, times=3)
rep(1:5, each=2, times=3, length.out=100)


rep(1:5)
rep(1:5, each=2)
rep(1:5, each=2, times=3)
rep(1:5, each=2, times=3, length.out=100)


# 1-6. 집합연산을 활용한 변수선언 (중복X, 합교차=)  ----

set1 <- seq(10, 100, by=2); set1; length(set1)
set2 <- seq(30, 150, by=4); set2; length(set2)

# 합 #중복 X # 59개
u_set <- union (set1, set2); u_set; length(u_set)
46+31 #59개
77-59 #18개가 교집합

# 교 # 18개
i_set <- intersect (set1, set2); i_set; length(i_set)
# 18개

# 차
d_set <- setdiff (set1, set2); d_set; length(d_set)
# set1 - set2 = 28개 (set1)

d_set2 <- setdiff (set2, set1); d_set2; length(d_set2)
# set2 - set1 = 13개 (set2)

# =
setequal(set1, set2) # false
setequal(c(1,2,3), c(3,2,2,1,1,1,2,3)) # true -> 중복값은 제거하기 때문

# is.element()
is.element(12, set1) # 12가 set1에 존재하는지의 여부 # true
is.element(12, set2) # 12가 set2에 존재하는지의 여부 # false


# 1-7. 데이터 정렬 (sort(), order())  ----

help(sort)
?order()

r1 <- rep(1,5); r1; length(r1)
r2 <- rep(1:5, 3); r2; length(r2) #times = 3

# sort # return값 : data
sort(r1)
sort(r2)

# order # return값 : 원자료 (row data)의 index 값 <index of raw data based on sorted data>
sort(r1)
order(r1)

sort(r2)
order(r2)

# q2
r2[order(r2)] # r2[index] => 해당 인덱스의 data return

order(r2)
paste(order(r2), collapse = ",")

r2[c(1,6,11,2,7,12,3,8,13,4,9,14,5,10,15)]
sort(r2)

# 역정렬
sort(r2[order(r2)], decreasing = T)



# 1-8. named vector ----

data()
search()
data(package = "datasets")  # 패키지 내 dataset 확인

islands
length(islands)

# data type 확인
mode(islands[1])
class(islands[1])

View(islands)

# data 조회
head(islands)

# hist()   #hist(숫자) *인수값이 숫자일때만 가능*
hist(islands)

# qplot()
search()
ggplot2::qplot(islands) # 메모리에 올리지 않고도 사용 가능


# named vector 생성-1 ----

c2 <- c(a=1, a=10, a=1, b=1, b=1, c=5, c=6) # 각 숫자에 name 붙여준것
c2

hist(c2)
ggplot2::qplot(c2)


# named vector 생성-2 ----

xx <- c(1, 3, 4)
xx

names(xx) <-c("enji", "guhyun", "sunghwan") # xx의 값에 name 붙여주기
xx


# 1-9. factor (범주형 데이터) ----
# Categorical data <-> Numerical data
# 1) 명목형(nominal) : 크기 비교가 불가 (ex: 미국, 한국)
# 2) 순서형(ordinal) : 순서 비교 가능 (ex: 대, 중, 소)

# [문법]
# factor(x,         # 팩터값
#        levels,    #팩터 레벨, c() 활용
 #       ordered)   #순서 여부, T | F

# 관련 함수
# as.factor(x)
# levels(x)
# nlevels(x)
# is.factor(x)
# is. ordered(x)

# factor test
print("===== 일반 데이터 =====")
aa <- c(1,1,1,2,2,3,4,4,4,5,5,5,5,5); aa

class(aa)
mode(aa)
levels(aa)
nlevels(aa)
is.factor(aa)
is.ordered(aa)


print("===== factor 데이터 =====")
f.aa <- as.factor(aa); f.aa
levels(f.aa)
nlevels(f.aa)
is.factor(f.aa)

f.aa[10]
f.aa[7]
levels(f.aa)[6]
levels(f.aa)[5]
levels(f.aa)[2]

aaa <- c(1,1,1,3,4,4,4,5,5,5,5,5); aaa
f.aaa <- as.factor(aaa); f.aaa
levels(f.aaa)


# 1-10. 형 변환 ----
# as.****(X)

# as.numeric(X)     # x => 수치형으로 변환
# as.integer(x)     # x => 정수형으로 변환
# as.double(x)      # x => 실수형으로 변환
# numeric > double > integer ??

# as.character(x)   # x => 문자형으로 변환
# as.logical(x)     # x => 논리형으로 변환

# as.factor(x)      # x => 팩터형으로 변환
# as.data.frame(x)  # x => data.frame형으로 변환

# is.****(x)        # 형 확인
is.factor(f.aaa)
is.numeric(f.aaa)

# 1-11. date type 확인  ----
# class(), mode(), typeof()

# 1-11-1. 숫자
# numeric > double > integer
# R에서는 double을 기본 수치로 인식

dima_n <- 33
class(dima_n)   # numeric
mode(dima_n)    # numeric
typeof(dima_n)  # double

# 숫자 벡터
dima_nv <-  c(1,2,3)
class(dima_nv)  # numeric
mode(dima_nv)   # numeric
typeof(dima_nv) # double


# 1-11-2. 문자

dima_c <- "dima"; dima_c
class(dima_c)   #character
mode(dima_c)    #character
typeof(dima_c)  #character

# 문자 벡터
dima_cv <- c("d", "i", "m", "a"); dima_cv
class(dima_cv)
mode(dima_cv)
typeof(dima_cv)


# 1-11-3. factor

d_factor <- factor(c("D", "D", "M", "A", "i", "i")); d_factor
class(d_factor)   #factor   # ** 직관적으로 볼 때 가장 정확
mode(d_factor)    #numeric
typeof(d_factor)  #integer


# 1-11-4. 행렬  matrix (data, 행, 열) # (기본값) byrow = F

m1 <- c(1:20); m1
matrix(m1, 2, 2)    #2행 2열 # 열먼저 Key-in
mm1 <- matrix(m1, 5, 4)    #5행 4열  # 열먼저 Key-in
matrix(m1, 5, 3)    #5행 3열  # 열먼저 Key-in

matrix(m1, 5, 4, byrow = T)    #5행 4열 # 행먼저 Key-in

class(mm1)    #matric, array  **
mode(mm1)     #numeric
typeof(mm1)   #integer        *


# 1-11-5. 배열 array(data, dim=c(행, 열, 차원))

arr1 <- rep(1:100, length.out=20)
arr2 <- array(arr1, dim=c(2,10))

class(arr2)   #matric, array  **
mode(arr2)    #numeric
typeof(arr2)  #integer        *

arr3 <- array(arr1, dim=c(2,5,4)); arr3

class(arr3)   #array    **
mode(arr3)    #numeric
typeof(arr3)  #integer  *


# 1-11-6. data.frame

a1 <- c(1:5)
a2 <- c(6:10)
a1; a2

a.df <- data.frame(a1, a2)
a.df

class(a.df)   #data.frmae   **
mode(a.df)
typeof(a.df)


# 1-11-7. list

j5 <- seq(10, 100, by=5); j5
j5.list <- list(j5, "dima", a.df, arr3, mm1)
j5.list

class(j5.list)    #list   **
mode(j5.list)     #list
typeof(j5.list)   #list   *

# 인덱스[[]]
j5.list[[2]]

j5.list[5]
j5.list[[5]]


# 2. 함수 ----

print("함수")       # 인수갯수가 1개만 가능
print(1); print(2)  # 자동개행

# cat()
cat("함수", "a")   # 인수갯수가 여러개도 가능
cat("함수", "a", "b", "\n", "c", "d") #개행 "\n'
cat("함수", "a", "b", "c", fill=1)

sum(1,2,3)
Sys.Date()


# 2-1. 문자처리 함수 (paste)  ----

h1
h2
h3
h4

paste(h4, collapse = "+") #변수가 여러개일 때 사용
paste(h4, collapse = " ^^; ")
paste(h4, collapse = " ")
length(paste(h4, collapse = " "))


#문제
paste(h1,h2)
paste(h2,h3)
paste(h2,3)
length(paste(h2,3))


# 2-2.  사용자 정의 함수  ----
# 인수 = 숫자 3개,  출력 = 합계와 평균을 출력

f.dima <- function(a,b,c){
  
  d.sum <- sum(a,b,c)
  d.avg <- d.sum/3
  
  # print(d.sum)
  # print(d.avg)
  
  cat(d.sum, d.avg)
}

#print()
f.dima(1,2,3)

d.sum_avg <- f.dima(1,2,3)
d.sum_avg
#cat()
f.dima(1,2,3)

d.sa <- f.dima(1,2,3)
d.sa

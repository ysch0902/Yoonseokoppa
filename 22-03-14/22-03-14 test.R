# R TEST  ----

#0. 명령어
# 명령어 실행 ----
# 실행 : ctrl + enter
# 복사 : shift + alt + 방향키
# 복사내용 이동 : alt + 방향키
# 명령어 이어서 실행: aaa; bbb
# 콘솔창 삭제: ctrl + l
# <- : alt + -
# code grouping : alt + l
# comment : ctrl + shift + c
# %>% (pipe) : ctrl + shift + m


#1. 연산자----

#1-1. 사칙연산
3+4
3*4
3/4
3+4; 3*4; 3/4


#1-3. 비교연산 ---- 맞으면 True, 틀리면 False
3>4
3>=4
3<=4
3==4
3!=4
!(3==4) #nested 비교연산

#1-3. 변수할당  ----
a = 4       # 함수 안에 값을 비교시에 사용
aa <- 5     # ** (변수 할당시 주로 사용)
6 -> aaa

a; aa; aaa

#1-4. 거듭제곱  ----
3 ^ 4 # 3**4
2^2
2^3

#1-5. 몫과 나머지 ----
20 %% 4 #몫
20 % % 4

20 %% 4


#2. 유용한 함수 ----

#2-1. 디렉토리 위치 ----
getwd() # 현재 wd 위치 확인
        # 작업 wd 변경 = setwd("...")


#2-2. 문자 출력 ----
print("hello world!!")
print('hello world')

#2-3. HELP  ----
?getwd
help(print)
?mpg
library(help = "ggplot2")

#2-4. 버전확인 ----
R.version
RStudio.Version()

#2-5. view() ----
View(installed.packages())


#3. R-Test ----

#3-1 package install (패키지 설치)  ----
install.packages("dplyr")
install.packages("ggplot2")

#3-2 package memory loading ---- 패키지 (메모리에) 올림
search()  #현재 사용가능한 packages 리스트 보여줌
library(dplyr)
library(ggplot2)

#3-3 package detaching from memory ---- 패키지 (메모리에) 내림
search()  #현재 사용가능한 packages 리스트 보여줌
detach("package:ggplot2")
detach("package:dplyr")

#3-4. dataset in ** packages  ----
data(package = "ggplot2")
#mpg = ggplot2에 있는 데이터
mpg #이미 메모리에 올랐기 때문에 다른 명령문 없이 사용 가능

#3-5.  dataset 속성 ----

# cdhlmnstrV
class(mpg)    #data object 타입
class(a)

dim(mpg)      #행과 열

head(mpg)     #dateset의 앞쪽 6행 조회
head(mpg, 10)

length(mpg)   #객체의 길이

mode(mpg)     #data의 속성 / class와 유사

names(mpg)    #컬럼의 이름

str(mpg)      #data의 상세속성 **중*요**

tail(mpg)     #dateset의 뒷쪽 6행 조회

rownames(mpg) #행의 이름

View(mpg)     #원자료 (raw data) 조회

# typeof(mpg)   #class(), mode()와 유사


#3-6. 회사별 고속도로 평균-고속도로 연비(내림정렬)  ----
#SQL> select.... gf() from.. group by.. order by..;

library(dplyr)
search()
names(mpg)
head(mpg)
dim(mpg)

mpg %>% 
  group_by(manufacturer) %>% 
  summarise(m.hwy=mean(hwy)) %>% 
  arrange(desc(m.hwy))

#mean = 평균
#arrange = order by


#3-7.  Ford사의 model별 평균-고속도로 연비(내림정렬)  ----
#SQL> select.. gf() from.. where.. group by.. order by..;

mpg %>% 
  filter(manufacturer == "ford") %>% 
  group_by(manufacturer, model) %>% 
  summarise(m.hwy=mean(hwy)) %>%
  arrange(desc(m.hwy))


#3-8. 도심연비(cty)-배기량(displ) # 상관관계  ----
#qplot()
?qplot()
search()

names(mpg)

qplot(data=mpg, x=displ, y=cty, col=displ)
#col = color


#3-9. 월간 소비동향, 월간 저축동향  ----
economics
names(economics)
help(economics)

#월간 소비동향
?ggplot
ggplot(data=economics,
       aes(x=date, y=pce))+geom_line()

#월간 저축동향
ggplot(data=economics,
       aes(x=date, y=psavert))+geom_line()


#3-10 회귀분석(ML: 독립변수x -> 종속변수y)  ----
#머신러닝 기법: 지도학습(정답이 주어짐)
#원인(x, 배기량: displ) -> 결과(y, 고속도로연비: hwy)
#y = b0 + b1x1 + b2x2....
#y = b1x1
#lm()
help(lm)
lm(data=mpg, hwy~displ)  #lm(dateset, y~x1) -> x1에 의해서 y값이 결정되는지
lm.mpg <- lm(data=mpg, hwy~displ)
lm.mpg

ls()
rm(a)
a
aa
aaa
lm.mpg

summary(lm.mpg)

lm.mpg2 <- lm(data=mpg, hwy~displ+drv)
# y = x1+x2

summary(lm.mpg2)

lm.mpg3 <- lm(data=mpg, hwy~displ+drv+model)
summary(lm.mpg3)

lm.mpg4 <- lm(data=mpg, hwy~displ+drv+model+cyl+fl)
summary(lm.mpg4)

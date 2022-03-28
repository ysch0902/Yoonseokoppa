# stats ----

# Q1-1. 모든 과목에 대한 표준편차, 분산 + 산점도

my_exam %>% summarise(sd(database),
                      sd(java),
                      sd(japan),
                      sd(eng))

var(my_exam$database)
var(my_exam$java)
var(my_exam$japan)
var(my_exam$eng)

plot(my_exam$database)
plot(my_exam$java)
plot(my_exam$japan)
plot(my_exam$eng)
pairs.panels(my_exam[c("database","java","japan","eng")])


# Q1-2. 모든 과목에 대한 왜도, 첨도 + 분포도

sk_ex <- my_exam %>% summarise(sk_db=skewness(database),
                               sk_java=skewness(java),
                               sk_jap=skewness(japan),
                               sk_eng=skewness(eng))
sk_ex <- round(sk_ex,3)

kt_ex <- my_exam %>% summarise(kt_db=kurtosis(database),
                               kt_java=kurtosis(java),
                               kt_jap=kurtosis(japan),
                               kt_eng=kurtosis(eng))
kt_ex <- round(kt_ex,3)

plot(density(my_exam$database))
plot(density(my_exam$java))
plot(density(my_exam$japan))
plot(density(my_exam$eng))



# Q1-1. 강사 ver

# 표준편차
sd_ex <- my_exam %>% summarise(sd(database),
                               sd(java),
                               sd(japan),
                               sd(eng))
sd_ex <- round(sd_ex,3)

# 분산
var_ex <- my_exam %>% summarise(var(database),
                                var(java),
                                var(japan),
                                var(eng))
var_ex <- round(var_ex,3)

# 산점도
plot(my_exam$database,  pch=2, cex=2, xlab="DATABASE", col="darkred",
     main=paste("db_sd:", sd_ex[1], "db_var:", var_ex[1]))
points(15,mean(my_exam$database), cex=3)

plot(my_exam$java,  pch=3, cex=2, xlab="JAVAE", col="blue",
     main=paste("jv_sd:", sd_ex[2], "jv_var:", var_ex[2]))
points(15,mean(my_exam$java), cex=3)

plot(my_exam$japan,  pch=4, cex=2, xlab="JAPAN", col="darkgreen",
     main=paste("jp_sd:", sd_ex[3], "jp_var:", var_ex[3]))
points(15,mean(my_exam$japan), cex=3)

plot(my_exam$eng,  pch=5, cex=2, xlab="ENG", col="black",
     main=paste("e_sd:", sd_ex[4], "e_var:", var_ex[4]))
points(15,mean(my_exam$eng), cex=3)



# Q1-2. 강사 ver

sk_ex <- my_exam %>% summarise(sk_db=skewness(database),
                               sk_java=skewness(java),
                               sk_jap=skewness(japan),
                               sk_eng=skewness(eng))
sk_ex <- round(sk_ex,3)

kt_ex <- my_exam %>% summarise(kt_db=kurtosis(database),
                               kt_java=kurtosis(java),
                               kt_jap=kurtosis(japan),
                               kt_eng=kurtosis(eng))
kt_ex <- round(kt_ex,3)

plot(density(my_exam$database),
     main=paste("db_sk:", sk_ex[1], " kt:", kt_ex[1]))

plot(density(my_exam$java),
     main=paste("java_sk:", sk_ex[2], " kt:", kt_ex[2]))

plot(density(my_exam$japan),
     main=paste("japan_sk:", sk_ex[3], " kt:", kt_ex[3]))

plot(density(my_exam$eng),
     main=paste("eng_sk:", sk_ex[4], " kt:", kt_ex[4]))




# 4-3. 표준정규분포 ----
# standard normal distribution
# dnorm(x, mean=0, sd=1)
# => 특정 관측ㄷ값에 대한 y축의 (확률밀도함수 값)을 return


# 1)

temp <- seq(-5,5); temp
summary(temp)

mean(temp)  # 평균 0
var(temp)   # 분산 11
sd(temp)    # 표준편차 3.316625

sqrt(var(temp)) # 표준편차 = 루트(분산)
plot(temp)


# 2)
xx <- seq(-5,5,length=300);xx
summary(xx)

mean(xx)
median(xx)
var(xx)     # 8.417(300개)    # 8.587(100개)
sd(xx)      # 2.901(300개)    # 2.930(100개)

plot(xx)


# 3) dnorm()  # (default) mean=0 sd-1

#temp
dnorm(temp)
dnorm(temp, mean=0, sd=1) # snd (표준정규분포)

all.equal(dnorm(temp), dnorm(temp, mean=0, sd=1))

# xx
dnorm(xx)
dnorm(xx, mean=0, sd=1)


# 4) 분포도

par(mfrow=c(2,2))

# temp
temp
length(temp)
plot(temp, main="단순 산점도")
plot(density(temp), main="밀도 추정")   # density = 밀도 추정함수 (추정치)
plot(dnorm(temp), type="l", main="표준정규분포??")
# mean=0, sd=1
# 실제: mean=0, sd=3.317

plot(dnorm(temp, mean=0, sd=3.317), type="l", main="실제 분포도??")

# xx
xx
length(xx)
plot(xx, main="단순 산점도")
plot(density(xx), main="밀도 추정")
plot(xx, dnorm(xx), type="l", main="xx 표준정규분포??")
# mean=0, sd=1
# 실제: mean=0, sd= 2.901

plot(xx, dnorm(xx, mean=0, sd=2.901), type="l", main="xx 실제 분포도??" )


plot(xx, dnorm(xx), type="l", main="xx_n(0, 1)")  # 표준 정규분포
# mean=0, sd=1
# 실제: mean=0, sd= 2.901

plot(xx,dnorm(xx, mean=0, sd=2.901), type="l", main="xx_n(0, 2.901)")   # 실제 분포
# dnorm 앞에 변수명 넣어주면 실제 분포 값 나옴 / 넣지 않으면 추정 값
# 표준 편차의 크기가 커지거나 작아짐에 따라 그래프의 모양이 변함
# 표준 편차의 값이 커지면 그래프는 옆으로 퍼진다


# Q

# Q-1
summary(my_exam$database)
mean(my_exam$database)
mean(my_exam$java)
mean(my_exam$japan)
mean(my_exam$eng)
sd(my_exam$database)
sd(my_exam$java)
sd(my_exam$japan)
sd(my_exam$eng)

plot(my_exam$database, main="db 산점도")
plot(my_exam$java, main="java 산점도")
plot(my_exam$japan, main="japan 산점도")
plot(my_exam$eng, main="eng 산점도")

plot(density(my_exam$database), type="l", main="db 밀도추정")
plot(density(my_exam$java), type="l", main="java 밀도추정")
plot(density(my_exam$japan), type="l", main="japan 밀도추정")
plot(density(my_exam$eng), type="l", main="eng 밀도추정")

dnorm(my_exam$database, mean=0, sd=1)
dnorm(my_exam$java, mean=0, sd=1)
dnorm(my_exam$japan, mean=0, sd=1)
dnorm(my_exam$eng, mean=0, sd=1)

plot(my_exam$database, dnorm(my_exam$database, mean=56.13, sd=1), type="l")
plot(my_exam$java, dnorm(my_exam$java, mean=84.53, sd=1), type="l")
plot(my_exam$japan, dnorm(my_exam$japan, mean=75.76, sd=1), type="l")
plot(my_exam$eng, dnorm(my_exam$eng, mean=62.9, sd=1), type="l")

plot(my_exam$database,dnorm(my_exam$database, mean=0, sd=19.59), type="l")
plot(my_exam$java, dnorm(my_exam$java, mean=0, sd=12.17), type="l")
plot(my_exam$japan, dnorm(my_exam$japan, mean=0, sd=14.24), type="l")
plot(my_exam$eng, dnorm(my_exam$eng, mean=0, sd=24.32), type="l")

plot(my_exam$database, dnorm(my_exam$database, mean=56.13, sd=19.59), type="l")
plot(my_exam$java, dnorm(my_exam$java, mean=84.53, sd=12.17), type="l")
plot(my_exam$japan, dnorm(my_exam$japan, mean=75.76, sd=14.24), type="l")
plot(my_exam$eng, dnorm(my_exam$eng, mean=62.9, sd=24.32), type="l")




# V ----

# 7. 데이터 결측치  ----

# 7-1. NA 포함 dataset 생성

df_temp <- data.frame(mw = c("M", "M", NA, "F", NA, "F", "M", NA, "M", "F"),
                      score = c(65, 77, 98, 88, 76, NA, 46, NA, 100, NA))
df_temp


# 7-2. 결측치 확인

is.na(df_temp)
table(is.na(df_temp)) # F-14, T-6


# 7-2-1. 결측치가 있으면 안되는 이유

mean(df_temp$score)
min(df_temp$score)

mean(df_temp$score, na.rm=T)
min(df_temp$score, na.rm=T)
# na.rm => NA 제거 후 계산


# 7-2-2. 컬럼별로 결측치 확인

table(is.na(df_temp$mw))      # F-7, T-3
table(is.na(df_temp$score))   # F-7, T-3


# 7-3. 결측치 제거 후, 분석방법

# 7-3-1. 모든 행 제거 방식

df_real <- na.omit(df_temp)  # 권장 X
mean(df_real$score)   # 75.2


# 7-3-2. 컬럼별 접근 제거

df_temp
df_temp %>% filter(!is.na(df_temp$mw))
df_temp %>% filter(!is.na(df_temp$score))

df_real2 <- df_temp %>% filter(!is.na(df_temp$score))
mean(df_real2$score)


# 7-4. 결측치 제외 방법
# 나중에 NA가 측정될 것을 대비하는 것

# 7-4-1. 함수 레벨에서 결측치 제외

df_temp
mean(df_temp$score, na.rm=T)
sum(df_temp$score, na.rm=T)

# 7-4-2. NA값 제외 (실습)

# 1) dataset 로딩

temp_exam <- read.csv("ss_exam.csv")
temp_exam


# 2) NA 추가 및 확인

# NA 사전확인
names(temp_exam)
dim(temp_exam)
table(is.na(temp_exam))
sum(is.na(temp_exam))
colSums(temp_exam)         # colSums() 함수 성격
colSums(is.na(temp_exam))  # colSums() 함수 성격

# NA 추가
head(temp_exam)
temp_exam[c(2,3,4,11,23,25), "database"] <- NA

# NA 재확인
table(is.na(temp_exam))
sum(is.na(temp_exam))
colSums(temp_exam)         # database sum이 안됨 (NA 때문)  => NA
colSums(is.na(temp_exam))  # colSums() 함수 성격

# NA값 제외
temp_exam %>% summarise(mean(database))                 # X (NA)
temp_exam %>% summarise(m_db=mean(database, na.rm=T))   # O


# 7-5. 결측치 대체 방법
# 자주 대체되는 값: min, max, mean, median, dima_mode, 0

# 7-5-1. 대체값 구하기
temp_exam2 <- read.csv("ss_exam.csv")
temp_exam2[c(2,3,7,11,23,25), "database"] <- NA   # NA 처리
temp_exam2

table(is.na(temp_exam2))
mean(temp_exam2$database, na.rm = T)           # 56.625
median(temp_exam2$database, na.rm = T)         # 50
subs <- median(temp_exam2$database, na.rm = T) # median을 대체값으로 선정
subs




# 7-5-2. NA를 대체값으로 처리 후, 분석

table(is.na(temp_exam2$database))
colSums(is.na(temp_exam2))

?ifelse()  # base::

ifelse(is.na(temp_exam2$database), subs, temp_exam2$database)
# NA면 대체값을 NA가 아니면 원래 값을 뿌려라

temp_exam2$database <- ifelse(is.na(temp_exam2$database), subs, temp_exam2$database)

temp_exam2 %>% summarise(m_db=mean(database)) # 55.3



# VQ7

# VQ 7-1
# mpg에서 도시연비와 고속도로연비 간의 관계파악을 위한 산점도 구성
# x= cty, y=hwy
library(ggplot2)
ggplot(data=mpg, aes(x=cty, y=hwy))+geom_point()

# VQ 7-2
# midwest에서 전체인구(poptotal)과 아시아 인구(popasian)간의 관계를 확인
# 산점도 : x= 전체인구, y=아시아 인구
# 범위설정: 전체인구 <=50만명, 아시아 인구 <= 1만명
ggplot(data=midwest, aes(x=poptotal, y=popasian))+geom_point()+
  xlim(0,500000)+
  ylim(0,10000)


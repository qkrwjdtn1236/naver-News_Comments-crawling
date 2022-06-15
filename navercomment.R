#install.packages("RSelenium")
#install.packages("seleniumPipes")
#install.packages("rvest")
#install.packages("httr")
#install.packages("writexl")

library(dplyr) # 전처리 작업에 사용할 패키지
library(tm)
library(stringr)
library(KoNLP)
library(RSelenium)
library(seleniumPipes)
library(rvest)
library(httr)
library(writexl)
library(memoise)

url <- 'https://n.news.naver.com/article/comment/009/0004967438'

# Selenium 접속하기 위한 주소 입력
remDr <- remoteDriver(
  remoteServerAddr="localhost",
  port=4445L,
  browserName="chrome")

# 열기
remDr$open()

# 해당주소 접속
remDr$navigate(url)

# html소스 가져오기
body <- remDr$getPageSource()[[1]]
body <- body %>% read_html()

# 스레드 현상으로 인해서 버그 관련
Sys.sleep(0.01)
# frames <- remDr$findElement(using = "class",
#                   value = 'u_cbox_btn_more')

while(1){
  tryCatch({
    remDr$findElement(using = "class",
                      value = 'u_cbox_btn_more')$clickElement()
    
    Sys.sleep(0.01)
    
  },error=break)
}

for( i in 0:40)
{
  # 더보기 없어질때까지 버튼 클릭하는 코드 수행문
  tryCatch({
    remDr$findElement(using = "class",
                      value = 'u_cbox_btn_more')$clickElement()
    
    Sys.sleep(0.01)
    
  })
}


text <- c()
# 비어있는 펙터형(자료형 하나만 있는 배열)으로 초기화 -> 댓글 넣을 변수
#     remDr$findElement(using="class",value="u_cbox_btn_more")$getElemetText()
body <- remDr$getPageSource()[[1]]
body<- body%>%read_html()
text<- body %>% html_nodes("span.u_cbox_contents") %>% html_text()
cat(text)
review <- data.frame(text)
review
# write.csv(df,'C:/Users/user/Desktop/R setting/result.csv')

# writexl::write_xlsx(review,"C:/Users/user/Desktop/R setting/review.xlsx")



HMA <- sapply(review, extractNoun, USE.NAMES=F)
#vHMA <- unlist(HMA)

HMA <- gsub("OO","", HMA)
HMA <- gsub("ㅋ","", HMA)
HMA <- gsub("c","", HMA)

corp=Corpus(VectorSource(HMA))
corp=tm_map(corp, content_transformer(tolower))
corp=tm_map(corp, removeNumbers)
corp=tm_map(removeWords, stopwords('english'))
corp=tm_map(corp, removePunctuation)
corp=tm_map(corp, stripWhitespace)

class(corp)
tdm <- TermDocumentMatrix(corp, control=list(wordLengths=c(4, 10)))
dim(tdm)
str(dim)
inspect(tdm)

m=as.matrix(tdm)  # m이 의미하는 것은???
m1 <- m[order(-rowSums(m)),]

adjmatrix <- m1%*%t(m1)


adjmatrix   #  adjmatrix가 의미하는 것은??
str(adjmatrix)
write.csv(adjmatrix, "C:/Users/user/Desktop/R setting/adjmatrix.csv")
# naver-News_Comments-crawling
R언어로 네이버 뉴스 댓글 크롤링하는 코드입니다.


# 사용하기 전 프로그램 설치

1. R Language 설치
 * 유의사항 : R 4.2.0 버전에서 제대로 코드가 실행 안되는 버그가 있습니다. 4.1.3 버전으로 설치하여 사용하세요. (KoNLP에서 버그 발생)
 * 다운로드 링크 : https://cran.yu.ac.kr/bin/windows/base/old/4.1.3/R-4.1.3-win.exe (다운로드 링크 4.1.3 버전입니다.)

2. R studio 설치
 * R studio는 R언어 IDE 프로그램입니다. 무료버전으로 무난하게 사용이 가능합니다.
 * 다운로드 링크 : https://download1.rstudio.org/desktop/windows/RStudio-2022.02.3-492.exe

3. Java 설치(JDK 설치)
 * koNLP에서 구동하기 위해서 설치가 필요.
 * 다운로드 링크 : https://download.oracle.com/java/18/latest/jdk-18_windows-x64_bin.exe

4. Rtools 설치(권장)
 * koNLP 구동하기 위한 설치(권장)
 * 다운로드 링크 : https://cran.r-project.org/bin/windows/Rtools/rtools40-x86_64.exe

5. 크롬 설치
 * 크롬 대중화되어 설치방법 생략

6. Gephi 설치
 * 시각화 프로그램
 * 다운로드 링크 : https://github.com/gephi/gephi/releases/download/v0.9.5/gephi-0.9.5-windows-x64.exe

# 코드 활용법

1. packageInstallCode.R 실행 후 코드 모두 실행
2. navercomment.R 파일에 추출하고자 하는 네이버 뉴스 사이트 링크 복사 후, 18번 줄 코드 수정
3. start.bat 파일 실행하여 클롤링 환경 구축
4. navercomment.R 모두 실행
5. 바탕화면에 R setting풀더 - adjmatrix.csv 파일 생성 확인 후 시각화 프로그램 구동
6. gephi 프로그램 실행후 adjmatrix.csv 파일 열고 charset EUC-KR 설정 후 파일 열기
7. 우측 Filters - Topology - Degree Range 선택 후, 적절한 범위 지정 후 Filter 누르기

#!/bin/bash
#스크립트 시작
 
if [ "$(id -u)" -ne 0 ]; then #uid가 root가 아니라면 
    echo "이 스크립트는 root로 실행하세요." #root실행하라고 응답
    exit 1 # 스크립트 종료
fi  # 첫번째 if문 끝
 
if [ $# -eq 1 ]; then # 만약 명령 개수가 1개라면
    directory="$1" # 디렉토리 변수에 저장
fi # 두번째 if문 끝
 
if [ ! -d "$directory" ]; then # 만약 디렉토리 변수가 디렉토리가 아니라면
    echo "$directory 는 유효한 디렉토리가 아닙니다." # 디렉토리가 아니라고 응답
    exit 1 # 스크립트 종료
fi  # 세번째 if문 끝
 
find "$directory" -type f -exec du -sh {} + | sort -rh | head -n 20
# 디렉토리 변수를 찾는다 / 파일을 찾는 조건(type f) / 파일 크기 human-readable 형식(1K,1M) 출력 (-exec du -sh {} +) / 파일 용량 역순 정렬(sort -rh) / 상위 20개만(head)

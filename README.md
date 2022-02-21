# setting 할때 필요한 사항

1. oracle18c (username: 'hr', pw: 'hr')이어야됨
2. 테이블 존재하는지 확인하기. (테이블 존재하지 않을시 프로젝트 내에 **/webapp/resources/sql/*.sql** 파일을 실행하여 테이블 생성하기)

# 권한별로 경로 나누기

1. 모든 사용자(비회원 **포함**)가 접속가능한 웹페이지라면 /everyone/**** 경로를 사용.
2. 회원(members)만 접속가능하다면 /member/** 경로 사용.
3. 관리자(admin)만 접속가능하다면 /admin/** 경로 사용.

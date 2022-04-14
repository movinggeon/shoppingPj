
[![Video Label](http://img.youtube.com/vi/jlEddtRgM8g/0.jpg)](https://youtu.be/jlEddtRgM8g)




## setting 할때 필요한 사항

1. MYSQL 연결 정보 단톡방 확인<br><br>
~~2. 테이블 존재하는지 확인하기. (테이블 존재하지 않을시 프로젝트 내에 **/webapp/resources/sql/*.sql** 파일을 실행하여 테이블 생성하기)~~<br><br>
2. 테이블 생성 예정 (2022-03-14) members 생성

## 권한별로 경로 나누기

~~1. 모든 사용자(비회원 **포함**)가 접속가능한 웹페이지라면 /everyone/** 경로를 사용.~~<br>
~~2. 회원(members)만 접속가능하다면 /member/** 경로 사용.~~<br>
~~3. 관리자(admin)만 접속가능하다면 /admin/** 경로 사용.~~<br>

1. 모든 사용자 (비회원 포함) url 제한 없음 <br>
ex) /boards/viewBoard
2. 회원(member) /*/member/** <br>
ex) /boards/member/insertReview
3. 관리지(admin) /*/admin/** <br>
ex) /boards/admin/insertEvent

<h2>파일 생성</h2>

1.com.group6.shopping.(DB테이블 명)을 설정되있음. <br>
2.com.group6.shopping.batis 안에 모든 테이블의 dao 모여져있음. 설정사항이니 웬만해서는 여기서 하기<br>
3.header footer 안붙으면 tiles 문제니 말할 것 (tiles jsp쪽 에러뜨면 겁나 불편함. 계속 불편하면 지울 예정)<br>

## 주의사항

1. 다른 조원이 코드를 쉽게 해석하기 위해 간단한 주석 달아주기 (주석이 길어지거나 추가적인 정보가 필요한 경우 참고한 url 링크 달아주기).
2. 추가적인 dependency나 xml 파일이 필요한 경우 톡방에 말해주기(말하고나서 추가하기!!).
3. css 설정시 태그 네임 등 상세하게 입력해서 다른 조원과 설정 겹치는거 방지하기
  ```html
    <!-- html 예시 -->
    <div class = login>
      <a href = "/">홈페이지</a>
      <div class = "loginForm">
          ...
      </div>
    </div>
  ```
  
  ```css
    /* css 예시 */

    div.login a{
        color:red;
    }
    
    div.login .loginForm{
        width: 100%;
    }
  ```


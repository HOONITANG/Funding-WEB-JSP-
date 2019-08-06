# funding 프로젝트
목적 : 펀딩 사이트의 기본 기능 구현에 집중하여 진행하는 프로젝트
의도 : 프로젝트를 진행하면서 JSP MVC1을 복습한다

## 기간

2019년 05월 03일 ~ 2019년 05월 22일

### Prerequisites(전제조건)

What things you need to install the software and how to install them

```
Eclipse IDE, MySQL
```

### Database

DBMS에 첨부된 backup.sql을 사용하여 테이블을 만들어야합니다.

```
sql > backup.sql > DB명
```


## 펀딩 사이트 전체 기본기능

기본 기능은 아래와 같음

1. 회원관리
   * 회원가입
   * 로그인
   * 로그아웃
   * 회원목록보기
   * 회원 삭제

2. 펀딩관리
   * 펀딩 등록
   * 펀딩 삭제
   * 펀딩 목록
   * 펀딩 상세보기

### 기능상세

1. 회원관리
   * 회원 DTO 생성 
      - UserDTO.java
      
   * 회원 DAO 생성 (M)
      - UserDAO.java
      
      - int userJoin(HttpServletRequest req) 
          - 회원가입 Form에서 전달한 request로 처리 (insert)
          - userId
          - userPasswd
          - userEmail
      
      - int userIdCheck(String userId) 
          - 로그인 Form에서 로그인 처리 (select)
          - Sigin_in_ok.jsp에서 return 값에 따라 다른 경고문 출력 
          - 0 : 비밀번호 에러
          - 1 : 로그인 성공
          - -1 : 아이디 에러
          - 99 : 데이터 베이스 에러
          
      - int userIdCheck(String userId) 
          - 회원가입 Form에서 아이디 중복 처리 (select)
          - JavaScript 정규표현식을 통해 유효성 검사 
          
   * 회원가입FORM (V,C)
      - Join_in.jsp (V) -> Join_in.ok.jsp (C)
   * 아이디 중복처리 FORM (V,C)   
      - Id_check_ok.jsp (V) -> IdCheckForm.jsp (C)
   * 로그인FORM (V,C)
      - Sign_in.jsp (V) -> Sign_in_ok.jsp (C)
   * 로그아웃 (C)
      - Sign_out.jsp (C)
   * 회원목록보기
      - (추가예정)
   * 회원 삭제
      - (추가예정)

2. 펀딩 관리
   * 펀딩 DTO 생성 
      - ItemDTO.java
   * 펀딩 DAO 생성 (M)
      - ItemDAO.java
      
      - int itemWrite(HttpServletRequest req) (select)
          - 펀딩 등록 FORM에서 받은 request로 처리
          - item_picture_name
          - item_title
          - item_goal_money
          - item_content
          
      - Vector<ItemDTO> getItemList() (select)
          - 입력해온 프로젝트 전체 리스트를 반환하는 메서드로 메인화면에 사용됨
  
      - ItemDTO itemShow(int itemId) (select)
          - 글 번호를 통해 선택한 프로젝트를 ItemDTO를 통해 반환함
          
      - int itemUpdate(HttpServletRequest req) (insert)
          - 펀딩 수정 FORM에서 받아온 입력값을 글 번호를 통해 프로젝트를 선택하여 수정함
          - 입력 데이터 : itemWrite(HttpServletRequest req)와 동일
          
      - int itemDelete(int itemId)
          - 글 번호를 통해 선택한 프로젝트를 delete 쿼리를 이용해 삭제함
      - String getPicName(int itemId)
          - 프로젝트가 제거,수정 될 때 자료실에 있는 사진들을 지우기 위해 선택된 프로젝트의             사진이름 을 가져옴
          
   * 펀딩 목록 FORM
      - item_list.jsp(V) -> item_proc.jsp(C)
          - 버튼 이벤트에 따라 상세보기,삭제,제거 flag의 값을 설정하여 item_proc.jsp에
            전달함       
            
   * 펀딩 등록 FORM
      - item_input_form.jsp(V) -> item.proc.jsp(C) 
      
   * 펀딩 삭제 FORM
      - item_list.jsp(V) -> item_proc.jsp(C)
          - input type을 hidden으로 설정하여 item_proc.jsp에게 flag를 insert값으로 전달함
   * 펀딩 수정 FORM
      - item_update.jsp(V) -> item.proc.jsp(C)
  
   * 펀딩 상세보기 FORM
       - item_dtail.jsp(V)
          - 상세보기 FORM
       - item_list.jsp(V) -> item_proc.jsp(C)
          - input type을 hidden으로 설정하여 item_proc.jsp에게 flag를 detail값으로 전달함


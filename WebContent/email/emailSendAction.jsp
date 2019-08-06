
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="funding.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="util.Gmail"%>
<%@ page import="java.util.Properties" %>
<!DOCTYPE html>
<html>
<head>
<% request.setCharacterEncoding("UTF-8"); //요청페이지에서 들어오는 값들을 모두 UTF-8로 받겠다는 의미%>   
<meta charset="EUC-KR">
<title>이메일 보내기</title>
</head>
<body>

<jsp:include page ="/top.jsp" flush="false"/>
<% 
	UserDAO userDAO = new UserDAO();
	String user_sid = null;
	if(session.getAttribute("user_sid_key") != null) {
		user_sid = (String) session.getAttribute("user_sid_key");
	} 
	
	if(user_sid == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = '/login/Sign_in.jsp'");
		script.println("</script>");
		script.close();
	}
	
	// 접속한 아이디가 이메일 인증을 받았는 지 확인
	int emailChecked = userDAO.getUserEmailChecked(user_sid);
	
	if(emailChecked == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 이메일 인증을 받으셨습니다.');");
		script.println("location.href = '/index.jsp'");
		script.println("</script>");
		script.close();
	}
	
	else { 
		String host = "http://localhost:8080/funding/";
		String from = "taehoon.data@gmail.com";
		String to = userDAO.getUserEmail(user_sid);
		String subject = "본인 인증을 위한 이메일 인증메일입니다.";
		String content = "다음 링크에 접속하여 이메일 인증을 진행하세요." +
		"<a href='" + host + "email/emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일인증하기</a>";

		// https://ktko.tistory.com/entry/JAVA-SMTP%EC%99%80-Mail-%EB%B0%9C%EC%86%A1%ED%95%98%EA%B8%B0Google-Naver
		// smtp에 관한 설명
		// https://www.tutorialspoint.com/javamail_api/javamail_api_smtp_servers.htm
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			//Authenticator 객체에게 PasswordAuthentication클래스 생성자로 사용자 아이디와 비밀번호를 제공함.
			Authenticator auth = new Gmail();
			
			//메일 세션을 만들 때 Authenticator 객체를 제공하고 Authenticator 콜백 중에 사용자 이름과 암호 정보를 제공하십시오.
			Session ses = Session.getInstance(p, auth);

			//전처적인 메시지 설정 , 메시지제목, 보낼아이디, 받을아이디, 메시지포맷,내용,보내기
			ses.setDebug(true);
			
			// 위 환경 정보로 "메일 세션"을 만들고 빈 메시지를 만든다
			// 발신자, 수신자, 참조자, 제목, 본문 내용 등을 설정한다
					
			//MimeMessage 객체생성, 보내는 제목
			
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			
			//보낼 사람 주소
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			
			//받은 사람의 주소 
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			// 메일 포맷설정
			msg.setContent(content, "text/html;charset=UTF8");
			Transport.send(msg);
			
		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('에러가 발생했습니다...');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}
	}
%>	

<div>
<p> 이메일 발송이 완료되었습니다. 작성하였던 메일에서 확인해 주세요</p>
</div>
</body>
</html>
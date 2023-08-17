package com.sist.service;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
public class SendMailService {
	int size=0;
	
    public JavaMailSender javaMailSender() {
    	
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        mailSender.setUsername("hsyoung17@gmail.com");
        mailSender.setPassword("hwdexihmmrexrqyp");

        Properties props = mailSender.getJavaMailProperties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        return mailSender;
    }
    
    // 인증키 생성
    private String getKey(int size) {
    	this.size=size;
    	return getAuthCode();
    }
    
    // 인증코드 난수 발생
    private String getAuthCode() {
    	Random random=new Random();
    	StringBuffer buffer=new StringBuffer();
    	int num=0;
    	while(buffer.length() < size) {
    		num=random.nextInt(10);
    		buffer.append(num);
    	}
    	return buffer.toString();
    }
    
    // 인증메일 발송
    @RequestMapping(value="member/sendEmail_ok.do", produces = "text/plain;charset=utf-8")
    public String sendAuthMail(String email) throws UnsupportedEncodingException, javax.mail.MessagingException {
    	// 6자리 난수 인증번호 생성
    	String authKey=getKey(6);
    	System.out.println("authKey: "+authKey);// 생성여부 확인
    	
        JavaMailSender sender = javaMailSender();
        MimeMessage message = sender.createMimeMessage();
        String mailContent = "<h1>[이메일 인증]</h1><br>"
        		+ "<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"
                + "<a href='http://localhost/web/member/join_confirm.do?email=" 
                + email+ "&authKey=" + authKey +"' target='_blenk'>이메일 인증 확인</a>";
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        
	    // 보내는 사람 정보
	    String fromEmail = "hsyoung17@gmail.com";
	    String fromName = "관리자";
	    
	    // 받는 사람 정보
	    String toEmail = email;
	    
	    helper.setFrom(new InternetAddress(fromEmail, fromName));
	    helper.setTo(toEmail);
	    helper.setSubject("와디즈 회원가입 인증메일");
	    helper.setText(mailContent,true);
	    
	    sender.send(message);
	    
	    return authKey;
    }
}

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
import org.springframework.web.bind.annotation.GetMapping;
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
    public String getKey(int size) {
    	this.size=size;
    	return getAuthCode();
    }
    
    // 인증코드 난수 발생
    public String getAuthCode() {
    	Random random=new Random();
    	StringBuffer buffer=new StringBuffer();
    	int num=0;
    	while(buffer.length() < size) {
    		num=random.nextInt(10);
    		buffer.append(num);
    	}
    	return buffer.toString();
    }
}

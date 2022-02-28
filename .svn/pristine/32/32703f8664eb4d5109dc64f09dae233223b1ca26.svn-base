package com.project.member.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	private String getKey(int size) {
		Random random = new Random();
		String randomKey = ""; 
		for(int  i = 0; i<size; i++) {
			int ran = random.nextInt(10);
			randomKey += ran;
		}
		return randomKey;
	}
	
	
	public String sendAuthMail(String emailAdd) {
		
		String authKey = getKey(6);
		
		MimeMessage mail = mailSender.createMimeMessage();
		String mailContent = "인증번호 : " + authKey;
		
		try {
			mail.setSubject("내가 보내는 이메일", "utf-8");
			mail.setText(mailContent, "utf-8", "html");
			mail.addRecipient(Message.RecipientType.TO, new InternetAddress(emailAdd));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return authKey;
	}
	
	
	
}

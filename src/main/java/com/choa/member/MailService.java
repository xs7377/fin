package com.choa.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailService {
	
	@Autowired
	private MailSender mailSender;

	public void sendMail(String from, String to, String subject, String text) {

	    SimpleMailMessage message = new SimpleMailMessage();
	    message.setFrom(from);
	    message.setTo(to);
	    message.setSubject(subject);
	    message.setText(text);
	    System.out.println(from);
	    System.out.println(to);
	    System.out.println(subject);
	    System.out.println(text);
	    mailSender.send(message);
	  }  

}
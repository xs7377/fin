package com.choa.member;

import java.io.*;

public class SendSMS
{
    public void SendMessage( String text, String number)
    {
        SMS sms = new SMS();
        
        sms.appversion("TEST/1.0");
        sms.charset("utf8");
        sms.setuser("mina7433", "rad1102");				// coolsms 계정 입력해주시면되요
     
       
	        SmsMessagePdu pdu = new SmsMessagePdu();
	        pdu.type = "SMS";
	        pdu.destinationAddress = number; //받는 사람 폰 번호
	        pdu.scAddress = "01063697433"	;       // 발신자 번호          
	        pdu.text = text;					    // 보낼 메세지 내용
	        sms.add(pdu);
	
	        try {
	            sms.connect();
	            sms.send();
	            sms.disconnect();
	        } catch (IOException e) {
	            System.out.println(e.toString());
	        }
	        sms.printr();
	        sms.emptyall();
	    
    }
}

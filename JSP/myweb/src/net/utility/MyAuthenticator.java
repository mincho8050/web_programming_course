package net.utility;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {

	private PasswordAuthentication pa;
	
	public MyAuthenticator(){
		pa=new PasswordAuthentication("soldesk@pretyimo.cafe24.com","soldesk6901"); 
	}//MyAuthenticator
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
	
}//

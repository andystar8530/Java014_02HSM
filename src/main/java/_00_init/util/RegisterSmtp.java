package _00_init.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;
@Component
public class RegisterSmtp {
	public RegisterSmtp(){
		
	}
	public void send(String title,String messages,String email) {
		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "marryme01402@gmail.com";
		final String password = "Do!ng123";// your password

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("marryme01402@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email,true));
			message.setSubject(title);
			message.setText(messages);

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);

			System.out.println("寄送email結束.");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
//	public static void main(String[] args) {
//		RegisterSmtp rs = new RegisterSmtp();
//		rs.send("test123白爛貓", "差點罵髒話", "a0912540551@gmail.com");
//	}
	
}

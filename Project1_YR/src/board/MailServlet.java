package board;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;

import java.io.*;
import java.util.*;
@WebServlet("/mailServlet")
public class MailServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		  Properties p = System.getProperties();
	        p.put("mail.smtp.starttls.enable", "true");     // STARTTLS command �� ��� �����ϰ� ����
	        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp ���� �ּ�
	        p.put("mail.smtp.auth","true");                 // AUTH command�� ����Ͽ� ����������� �� �� �ְ� �ϴ� ����
	        p.put("mail.smtp.port", "587");                 // gmail ��Ʈ
	        
	        Authenticator auth = new MyAuthentication();
	         
	        //session ���� ��  MimeMessage����
	        Session session = Session.getDefaultInstance(p, auth);
	        MimeMessage msg = new MimeMessage(session);
	         
	        try{
	            //���������ð�
	            msg.setSentDate(new Date());
	             
	            InternetAddress from = new InternetAddress() ;
	             
	             
	            from = new InternetAddress("itwillyr@gmail.com");
	             
	            // �̸��� �߽���
	            msg.setFrom(from);
	             
	             
	            // �̸��� ������
	            InternetAddress to = new InternetAddress("itwillyr@gmail.com");
	            msg.setRecipient(Message.RecipientType.TO, to);
	             
	            // �̸��� ����
	            String Subject="JSP 게시판 이메일 보내기";
	            msg.setSubject(Subject, "UTF-8");
	             
	            // �̸��� ���� 
	            
	            String Text="Text";
	            msg.setText(Text, "UTF-8");
	             
	            // �̸��� ��� 
	            msg.setHeader("content-Type", "text/html");
	             
	            //���Ϻ�����
	            javax.mail.Transport.send(msg);
	             
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }
	       
	        
	    }

	}

	class MyAuthentication extends Authenticator {
	    
	    PasswordAuthentication pa;
	    
	 
	    public MyAuthentication(){
	         
	        String id = "itwillyr@gmail.com";       // ���� ID
	        String pw = "itwillftp@@";          // ���� ��й�ȣ
	 
	        // ID�� ��й�ȣ�� �Է��Ѵ�.
	        pa = new PasswordAuthentication(id, pw);
	      
	    }
	 
	    // �ý��ۿ��� ����ϴ� ��������
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }

	}

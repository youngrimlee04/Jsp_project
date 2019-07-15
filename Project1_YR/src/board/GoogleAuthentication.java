package board;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
        passAuth = new PasswordAuthentication("itwillyr", "liezotpdfkkixmla");
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}

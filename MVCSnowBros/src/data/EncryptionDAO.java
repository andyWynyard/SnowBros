package data;

	import java.security.NoSuchAlgorithmException;

	public interface EncryptionDAO {
	    public String encrypt(String plainText) throws NoSuchAlgorithmException;
	    public boolean matches(String plainText, String sha);
	    //public String getEncryptedUser();
	    	
	    
	}


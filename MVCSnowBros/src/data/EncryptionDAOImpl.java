package data;


	import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import entities.User;

	@Component
	public class EncryptionDAOImpl implements EncryptionDAO {
	
	
	    public String encrypt(String plainText) throws NoSuchAlgorithmException {
	        MessageDigest digest;
	        digest = MessageDigest.getInstance("SHA-256");
	        byte[] hash = digest.digest(plainText.getBytes(StandardCharsets.UTF_8));
	        return Base64.getEncoder().encodeToString(hash);
	    }

	    public boolean matches(String plainText, String sha) {
	        try {
	            return encrypt(plainText).equals(sha);
	        } catch (NoSuchAlgorithmException e) {
	            return false;
	        }
	    }

	
	}


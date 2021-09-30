package co.edu.unbosque.frontend;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;


public class encrypt {
	encryp encryptar = new encryp();
	
	public String passEncrypt(String Password) throws NoSuchAlgorithmException, InvalidKeyException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException {
		String encriptado;
		try {
			encriptado = encryptar.encriptar(Password);
			return encriptado;
		}catch(UnsupportedEncodingException ex) {
			System.out.println(ex);		
		}
		return "Error";
	}
	
}

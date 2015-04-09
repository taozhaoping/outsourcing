package com.zh.core.util;

import org.jasypt.util.text.BasicTextEncryptor;


/**
 * 加密工具
 * 
 */
public class EncryptUtil {
	
	static BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
	
	static {
		textEncryptor.setPassword("outsource");
	}
	
	/**
	 * 对文本加密
	 * @param text
	 * @return
	 */
	public static String encode(String text) {
		return textEncryptor.encrypt(text);
	}
	
	/**
	 * 对文本解密
	 * @param text
	 * @return
	 */
	public static String decode(String text) {
		return textEncryptor.decrypt(text);
	}

}

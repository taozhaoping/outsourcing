package com.zh.base.util;

public class Tools {
	
	/**
	 * 隐藏邮件地址的部分内容
	 * @param address
	 * @return
	 */
	public static String mailCover(String address){
		StringBuffer retStr = new StringBuffer();
		String[] addressArray = address.split("@");
		int addLen = addressArray[0].length();
		int len = 0;
		switch(addLen){
			case 0: len = 0; break;
			case 1: len = 1; break;
			case 2: len = 1; break;
			case 3: len = 2; break;
			case 4: len = 2; break;
			case 5: len = 3; break;
			case 6: len = 4; break;
			default:len = 4; break;
		}
		
		String addressTail = "";
		String addressCenter = "";
		if(addressArray.length > 1){
			addressTail = addressArray[1]; 
		}
		
		if(address.contains("@")){
			addressCenter = "@";
		}
		
		retStr.append(addressArray[0].substring(0, len) + "***" + addressCenter + addressTail);
		return retStr.toString();
	}
	
	public static void main(String[] args) {
		System.out.println(mailCover("a"));
		System.out.println(mailCover("a@"));
		System.out.println(mailCover("a@163.com"));
		System.out.println(mailCover("a1@163.com"));
		System.out.println(mailCover("a22@163.com"));
		System.out.println(mailCover("a333@163.com"));
		System.out.println(mailCover("a4444@163.com"));
		System.out.println(mailCover("a55555@163.com"));
		System.out.println(mailCover("a666666@163.com"));
		System.out.println(mailCover("a7777777@163.com"));
	}
}

package edu.fjnu.online.util;

import java.security.MessageDigest;

public class MD5Util {
	public static String getData(String str) {
		try {
			MessageDigest digest = MessageDigest.getInstance("md5");
			byte[] data = digest.digest(str.getBytes());
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < data.length; i++) {
				String result = Integer.toHexString(data[i] & 0xff);
				String temp = null;
				if (result.length() == 1) {
					temp = "0" + result;
				} else {
					temp = result;
				}
				sb.append(temp);
			}
			return sb.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		System.out.println("e10adc3949ba59abbe56e057f20f883e".equals(getData("123456")));
		System.out.println(getData("123456"));
	}
}

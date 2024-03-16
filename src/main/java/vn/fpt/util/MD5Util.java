package vn.fpt.util;

import java.security.MessageDigest;

public class MD5Util {
    public static String hashPasswordMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte digestByte : messageDigest) {
                hexString.append(Integer.toHexString(0xFF & digestByte));
            }
            return hexString.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

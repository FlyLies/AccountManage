package net.ltr.entity;

import lombok.Data;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@Data
public class Account {
    private Integer aid;
    private Integer uid;
    private String wname;
    private String web;
    private String waccount;
    private String wpassword;

    /*加密方法*/
    public void encrypt(String key) throws Exception {
        /*算法*/
        String algorithm = "DES";
        /*加密类型*/
        String transformation = "DES";
        /*Cipher：密码，获取加密对象*/
        /*transformation：参数表示使用什么类型加密*/
        Cipher cipher = Cipher.getInstance(transformation);
        /*指定秘钥规则*/
        /*第一个参数表示：密钥，key的字节数组*/
        /*第二个参数表示：算法*/
        SecretKeySpec sks = new SecretKeySpec(key.getBytes(), algorithm);
        /*对加密进行初始化*/
        /*第一个参数：表示模式，有加密模式和解密模式*/
        /*第二个参数：表示秘钥规则*/
        cipher.init(Cipher.ENCRYPT_MODE, sks);
        /*进行加密*/
        byte[] accountBytes = cipher.doFinal(this.waccount.getBytes());
        byte[] passwordBytes = cipher.doFinal(this.wpassword.getBytes());
        /*编码*/
        Base64.Encoder encoder = Base64.getEncoder();
        this.waccount = encoder.encodeToString(accountBytes);
        this.wpassword = encoder.encodeToString(passwordBytes);
    }

    /*解密方法*/
    public void decrypt(String key) throws Exception {
        String algorithm = "DES";
        String transformation = "DES";
        Cipher cipher = Cipher.getInstance(transformation);
        SecretKeySpec sks = new SecretKeySpec(key.getBytes(), algorithm);
        /*对解密进行初始化*/
        /*第一个参数：表示模式，有加密模式和解密模式*/
        /*第二个参数：表示秘钥规则*/
        cipher.init(Cipher.DECRYPT_MODE, sks);
        Base64.Decoder decoder = Base64.getDecoder();
        /*解密*/
        byte[] accountBytes = cipher.doFinal(decoder.decode(this.waccount));
        byte[] passwordBytes = cipher.doFinal(decoder.decode(this.wpassword));
        this.waccount = new String(accountBytes, StandardCharsets.UTF_8);
        this.wpassword = new String(passwordBytes, StandardCharsets.UTF_8);
    }
}

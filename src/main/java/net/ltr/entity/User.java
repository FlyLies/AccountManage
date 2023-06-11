package net.ltr.entity;

import lombok.Data;

@Data
public class User {
    private Integer id;
    private String uname;
    private String uaccount;
    private String upassword;
    private String identity;
    private String des_key;
}

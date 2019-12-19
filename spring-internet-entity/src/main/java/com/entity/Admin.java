package com.entity;

import lombok.Data;

@Data
public class Admin {
    /** 管理员ID */
    private Integer adminId ;
    /** 权限 */
    private String adminEnabled ;
    /** 用户名 */
    private String adminUsername ;
    /** 密码 */
    private String adminPassword ;
    /** 姓名 */
    private String adminName ;
    /** 性别 */
    private String adminSex ;
    /** 年龄 */
    private Integer adminAge ;
    /** 身份证 */
    private String adminIdCard ;
    /** 地址 */
    private String adminAddress ;
    /** 电话号码 */
    private String adminPhone ;
    /** 名族 */
    private String adminNation ;
    /** 备注 */
    private String adminRemark ;
    /** 头像 */
    private String adminImage ;


}

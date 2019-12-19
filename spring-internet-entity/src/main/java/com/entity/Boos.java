package com.entity;

import lombok.Data;

@Data
public class Boos {
    /** 老板编号 */
    private Integer bossId ;
    /** 姓名 */
    private String bossName ;
    /** 电话号码 */
    private String bossPhone ;
    /** 地址 */
    private String bossAddress ;
    /** 权限 */
    private String bossEnabled ;
    /** 用户名 */
    private String bossUsername ;
    /** 密码 */
    private String bossPassword ;
    /** 身份证 */
    private String bossIdCard ;
}

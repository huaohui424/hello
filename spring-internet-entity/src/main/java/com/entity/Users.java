package com.entity;

import lombok.Data;

@Data
public class Users {
    /** 用户ID */
    private Integer usersId ;
    /** 客户姓名 */

    private String usersName ;
    /** 电话 */
    private String usersCall ;
    /** 地址 */
    private String usersAddress ;
    /** 身份证 */
    private String usersIdCard ;
    /** 密码 */
    private String usersPassword ;
    /** 性别 */
    private String usersSex ;
    /** 年龄 */
    private Integer usersAge ;
    /** 消费 */
    private Double usersConsume ;
    /** 机子号 */
    private Integer usersCarDid ;
    /** 是否会员 */
    private String usersMenBer ;
    /** 余额 */
    private Double usersBalance ;

}

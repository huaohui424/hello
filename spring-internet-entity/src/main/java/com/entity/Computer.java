package com.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/*
* 电脑类
* */
@Data
public class Computer {
    /** 机子号 */
    private Integer computerId ;
    /** 名字名称 */
    private String computerName ;
    /** 机子型号 */
    private String computerType ;
    /** 机子价格 */
    private Double computerPrice ;
    /** 数量 */
    private Integer computerCount ;
    /** 上网时间 */
    private Date computerTime ;
    /** 状态（外键） */
    private String computerNid ;
    /** 消费（外键） */
    private Double computerSid ;
    /** 备注 */
    private String computerComment ;
    /** 维修 */
    private String computerMaintain ;
    /** 图片 */
    private String computerImage ;

}

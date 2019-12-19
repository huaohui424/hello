package com.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/*
* 消费类
* */
@Data
public class Spends {
    /** 消费单号 */
    private Integer spendsId ;
    /** 上网时间 */
    private Date spendsUptime ;
    /** 下机时间 */
    private Date spendsDowntime ;
    /** 外键，会员 */
    private String spendsMenber ;
    /** 消费 */
    private Double spendsPrice ;



}

package com.entity;

import lombok.Data;

/*
* 网吧类
* */
@Data
public class Bar {
    /** 网吧ID */
    private Integer barId ;
    /** 地址 */
    private String barAddress ;
    /** 名称 */
    private String barName ;
    /** 电话 */
    private String barPhone ;
    /** 描述 */
    private String barRemark ;
    /** 图片 */
    private String barImage ;


}

package com.entity;

import lombok.Data;

@Data
public class Product {
    /** 商品ID */
    private Integer productId ;
    /** 商品名称 */
    private String productName ;
    /** 商品价格 */
    private Double productPrice ;
    /** 商品类型 */
    private String productType ;
    /** 商品数量 */
    private Integer productCount ;
    /** 备注 */
    private String productComment ;
    /** 图片 */
    private String productImage ;
}

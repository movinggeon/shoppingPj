package com.group6.shopping.carts.vo;


import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.products.vo.ProductsVO;
import com.group6.shopping.specifications.vo.SpecVO;
import lombok.*;

//필드 추가후 noargs 주석 해제 모든 vo 동일
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CartsVO {
    private int cart_id, spec_id, receipt_id, cart_price, cart_qty, cart_isCare, cart_refund; /*보증유무 (cart_isCare) -1 : 보증 적용 -2 : 보증 안됨 */
    private String mem_id;

    private SpecVO specVO; /* 가격(spec_price), 메모리(spec_memory), 와이파이 데이터(spec_network), 색상(spec_color),  */
    private ModelsVO modelsVO; /*모델 이름 (model_name)*/
    private ProductsVO productsVO; /*제품 이름 (product_name)*/

}

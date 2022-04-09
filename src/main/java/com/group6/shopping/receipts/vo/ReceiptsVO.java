package com.group6.shopping.receipts.vo;

import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.coupons.vo.CouponsVO;
import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.products.vo.ProductsVO;
import com.group6.shopping.specifications.vo.SpecVO;
import lombok.*;

import java.util.List;

@Getter
@Setter@NoArgsConstructor@AllArgsConstructor@ToString
public class ReceiptsVO {
    private int receipt_id, receipt_price, receipt_discount, coupon_id, receipt_point;
    private String receipt_imp_uid, receipt_merchant_uid, receipt_date, receipt_address, receipt_phone, mem_id;

    private CouponsVO couponsVO;
}

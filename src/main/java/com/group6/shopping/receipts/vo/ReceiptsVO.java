package com.group6.shopping.receipts.vo;

import com.group6.shopping.coupons.vo.CouponsVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReceiptsVO {

	private int receipt_id;
	private String receipt_imp_uid;
	private String receipt_merchant_uid;
	private int receipt_price;
	private int receipt_discount;
	private String receipt_date; //RestController 에서 관리
	private String receipt_address;
	private String receipt_phone;
	private String mem_id;
	private int coupon_id;
	private int receipt_point;
	
	private CouponsVO couponsVO;
}

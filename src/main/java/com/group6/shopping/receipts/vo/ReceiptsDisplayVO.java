package com.group6.shopping.receipts.vo;

import com.group6.shopping.carts.vo.CartsVO;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReceiptsDisplayVO {
    private ReceiptsVO receiptsVO;
    private List<CartsVO> cartsVOList;
}
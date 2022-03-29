package com.group6.shopping.boards.vo;

import com.group6.shopping.files.vo.FilesVO;
import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.products.vo.ProductsVO;
import com.group6.shopping.replies.vo.RepliesVO;
import com.group6.shopping.specifications.vo.SpecVO;
import lombok.*;

import java.util.List;

//필드 추가후 noargs 롬복 주석 해제 할것 이하 모든 vo 적용
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class BoardsVO {
    private int board_id, model_id,spec_id, board_rate;
    private String mem_id, board_title, board_content, board_type, board_date;

    private SpecVO specVO;
    private ModelsVO modelsVO;
    private ProductsVO productsVO;

    //private List<RepliesVO> repliesVOList;
    //private List<FilesVO> filesVOList;
}

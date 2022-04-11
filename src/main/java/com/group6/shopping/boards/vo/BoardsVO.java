package com.group6.shopping.boards.vo;

import java.util.List;

import com.group6.shopping.files.vo.FilesVO;
import com.group6.shopping.models.vo.ModelsVO;
import com.group6.shopping.products.vo.ProductsVO;
import com.group6.shopping.replies.vo.RepliesVO;
import com.group6.shopping.specifications.vo.SpecVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//필드 추가후 noargs 롬복 주석 해제 할것 이하 모든 vo 적용
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class BoardsVO {
    private int board_id, model_id,spec_id, board_rate;
    private String mem_id, board_title, board_content, board_type, board_date, s_date, e_date, board_titleimg;

    private SpecVO specVO;
    private ModelsVO modelsVO;
    private ProductsVO productsVO;

    private List<RepliesVO> repliesVOList;
    private List<FilesVO> filesVOList;
}

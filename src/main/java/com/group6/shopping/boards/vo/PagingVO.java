package com.group6.shopping.boards.vo;

import lombok.*;

@Getter@Setter@NoArgsConstructor@ToString
public class PagingVO {
    private int totalBoards, currPage, minPage, maxPage, offset, totalPage, numOfBoards = 5, pageToShow = 3;

    public PagingVO(int totalBoards, int currPage) {
        this.totalBoards = totalBoards;
        this.currPage = currPage;

        calTotalPage();
        calMinPage();
        calMaxPage();
        calOffset();
    }

    public boolean pageCheck(){
        if(this.currPage > this.totalPage || this.currPage <= 0){
            return false;
        }else{
            return true;
        }
    }

    public void calTotalPage(){
        this.totalPage = this.totalBoards / this.numOfBoards;
        if(this.totalBoards % this.numOfBoards != 0){
            this.totalPage++;
        }
    }
    public void calMinPage(){
        if(this.currPage < this.numOfBoards){
            this.minPage = 1;
        }else{
            this.minPage = this.currPage - this.pageToShow;
        }
    }
    public void calMaxPage(){
        if(this.currPage + this.pageToShow > this.totalPage){
            this.maxPage = this.totalPage;
        }else{
            this.maxPage = this.currPage + this.pageToShow;
        }
    }
    public void calOffset(){
        this.offset = (this.currPage - 1) * this.numOfBoards;
    }

}

package com.group6.shopping.receipts.service;

import com.group6.shopping.batis.CartsDAO;
import com.group6.shopping.batis.ReceiptsDAO;
import com.group6.shopping.carts.vo.CartsVO;
import com.group6.shopping.receipts.vo.ReceiptsDisplayVO;
import com.group6.shopping.receipts.vo.ReceiptsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("receiptsService")
public class ReceiptsServiceImpl implements ReceiptsService{
    @Autowired
    private ReceiptsDAO receiptsDAO;
    @Autowired
    private CartsDAO cartsDAO;

    @Override
    public List<ReceiptsVO> getAllReceipts(String mem_id) throws Exception {
        return receiptsDAO.getAllReceipts(mem_id);
    }

    @Override
    public List<ReceiptsDisplayVO> getAllReceiptsInfo(String mem_id) throws Exception {

/*        List<ReceiptsVO> receiptsVOList = receiptsDAO.getAllReceipts(mem_id);
        List<ReceiptsDisplayVO> receiptsDisplayVOList = new ArrayList<>();
        if(receiptsVOList.size() > 0){
            for(ReceiptsVO tmp: receiptsVOList){
                List<CartsVO> cartsVOList = cartsDAO.getPaidCart(tmp);
                ReceiptsDisplayVO receiptsDisplayVO = new ReceiptsDisplayVO(tmp, cartsVOList);
                receiptsDisplayVOList.add(receiptsDisplayVO);
            }
        }*/

        List<ReceiptsVO> receiptsVOList = receiptsDAO.getAllReceipts(mem_id);
        List<ReceiptsDisplayVO> receiptsDisplayVOList = new ArrayList<>();
        System.out.println("implement");
        for(ReceiptsVO tmp: receiptsVOList){
            for(CartsVO cTmp : tmp.getCartsVOList()){
                System.out.println(cTmp.toString());
                System.out.println(cTmp.getSpecVO().toString());
                System.out.println(cTmp.getProductsVO().getProduct_name() + " " + cTmp.getModelsVO().getModel_name());
            }
        }
        return receiptsDisplayVOList;
    }
}

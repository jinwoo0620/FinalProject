package com.kh.homeArt.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.homeArt.order.model.vo.OrderPageItem;

public interface OrderService {

   ArrayList<OrderPageItem> getListOrder(HashMap<String, Object> map);

}
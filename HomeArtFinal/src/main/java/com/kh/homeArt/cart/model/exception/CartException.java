package com.kh.homeArt.cart.model.exception;

public class CartException extends RuntimeException {
   public CartException() {}
   public CartException(String msg) {
      super(msg);
   }
}
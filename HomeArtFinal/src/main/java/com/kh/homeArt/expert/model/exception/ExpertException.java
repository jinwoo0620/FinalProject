package com.kh.homeArt.expert.model.exception;

public class ExpertException extends RuntimeException{
   public ExpertException() {}
   public ExpertException(String msg) {
      super(msg);
   }
}
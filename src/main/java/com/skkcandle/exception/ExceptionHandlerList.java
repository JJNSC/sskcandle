package com.skkcandle.exception;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.slf4j.Slf4j;

@Component
@ControllerAdvice
@Slf4j
public class ExceptionHandlerList {
    
    @ExceptionHandler
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public String handleOtherException(Exception e) {
       return "exception/500";
    }
   
	@ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handle404() {
       return "exception/404";
    }
    
	@ExceptionHandler(NotFoundAccountException.class)
    public String handleNotFoundAccountException(NotFoundAccountException e, HttpSession session) {
    	session.setAttribute("transferError", e.getMessage());
        return "redirect:/ch15/content";
    }
}

package com.custom;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * @author cj
 * @date 2019/11/13
 */
public class NotRegisterValidator
        implements ConstraintValidator<NotRegister,String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if(value!=null && value.equals("admin")) {
            return false;
        }else{
            return true;
        }
    }


}

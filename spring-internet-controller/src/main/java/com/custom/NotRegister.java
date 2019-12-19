package com.custom;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * @author cj
 * @date 2019/11/13
 */

@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE })
@Retention(RUNTIME)
@Constraint(validatedBy = { NotRegisterValidator.class})
public @interface NotRegister {


    String message() default "{javax.validation.constraints.Size.message}";

    Class<?>[] groups() default { };

    Class<? extends Payload>[] payload() default { };

}

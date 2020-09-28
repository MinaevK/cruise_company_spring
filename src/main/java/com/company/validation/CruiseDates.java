package com.company.validation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = CruiseDatesValidation.class)
public @interface CruiseDates {
    String message() default "Choose right dates. Arrival date shouldn`t be before departure";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}

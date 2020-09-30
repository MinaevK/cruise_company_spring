package com.company.validation;

import com.company.entity.User;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordMatchValidation implements ConstraintValidator<PasswordMatch, User> {

    @Override
    public void initialize(PasswordMatch constraintAnnotation) {

    }

    @Override
    public boolean isValid(User user, ConstraintValidatorContext context) {
        if (user.getPassword().equals(user.getPasswordConfirm()))
            return true;
        return false;
    }
}

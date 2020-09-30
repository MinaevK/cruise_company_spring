package com.company.validation;

import com.company.entity.Cruise;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDate;

public class CruiseDatesValidation implements ConstraintValidator<CruiseDates, Cruise> {
    @Override
    public void initialize(CruiseDates constraintAnnotation) {

    }

    @Override
    public boolean isValid(Cruise cruise, ConstraintValidatorContext context) {
        if (cruise.getArrivalDate().isEmpty() || cruise.getDepartureDate().isEmpty())
            return false;
        LocalDate dateArrival = LocalDate.parse(cruise.getArrivalDate());
        LocalDate dateDeparture = LocalDate.parse(cruise.getDepartureDate());
        if (dateArrival.isAfter(dateDeparture))
            return true;
        return false;
    }
}

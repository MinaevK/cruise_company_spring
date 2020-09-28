package com.company.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table
public class Cabin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull(message = "Enter cabin number")
    private Long number;
    @NotNull(message = "Fill the price")
    @Digits(message = "Wrong price format", integer = 5, fraction = 2)
    private float price;
    @Enumerated(EnumType.STRING)
    private CabinClass cabinClass;
    @ManyToOne(fetch = FetchType.EAGER)
    private Ship ship;
}

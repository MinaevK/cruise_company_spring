package com.company.entity;

import com.company.validation.CruiseDates;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table
@CruiseDates
public class Cruise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "Input the name")
    private String name;
    @DecimalMin(value = "0", message = "Decimal number from 0")
    private float cruisePrice;
    @NotBlank
    private String departureDate;
    @NotBlank
    private String arrivalDate;
    @Column
    @Enumerated(EnumType.STRING)
    @ElementCollection(targetClass = Port.class)
    private List<Port> ports;
    @ManyToOne(fetch = FetchType.EAGER)
    private Ship ship;
}

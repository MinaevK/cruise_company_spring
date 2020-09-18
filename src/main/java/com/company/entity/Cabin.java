package com.company.entity;

import lombok.*;
import org.hibernate.annotations.NaturalId;

import javax.persistence.*;

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
    private Long number;
    private float price;
    @Enumerated(EnumType.STRING)
    private CabinClass cabinClass;
    @ManyToOne(fetch = FetchType.EAGER)
    private Ship ship;
}

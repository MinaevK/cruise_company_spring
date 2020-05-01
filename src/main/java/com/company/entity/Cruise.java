package com.company.entity;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table
public class Cruise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private float cruisePrice;
    @Column
    @Enumerated(EnumType.STRING)
    @ElementCollection(targetClass = Port.class)
    private List<Port> ports;
    @ManyToOne(fetch = FetchType.EAGER)
    private Ship ship;
}

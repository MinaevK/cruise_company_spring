package com.company.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table
public class UserApplication {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(fetch = FetchType.EAGER)
    private User user;
    @ManyToOne(fetch = FetchType.EAGER)
    private Cruise cruise;
    @ManyToOne(fetch = FetchType.EAGER)
    private Cabin cabin;
    @ManyToOne(fetch = FetchType.EAGER)
    private Ship ship;
    private float price;
    private boolean paid;
    private String applicationDate;

}

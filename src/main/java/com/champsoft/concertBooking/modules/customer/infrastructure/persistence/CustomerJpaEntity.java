package com.champsoft.concertBooking.modules.customer.infrastructure.persistence;

import jakarta.persistence.*;

@Entity
@Table(name = "customers")
public class CustomerJpaEntity {

    @Id
    public String id;

    @Column(name = "full_name")
    public String fullName;

    public String address;
    public String email;
    public String status;

    public CustomerJpaEntity() {}

    // Getters & setters
}
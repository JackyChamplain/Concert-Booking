package com.champsoft.concertBooking.modules.customer.application.service;

import com.champsoft.concertBooking.modules.customer.infrastructure.persistence.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerCrudService {

    private final SpringDataCustomerRepository repository;

    public CustomerCrudService(SpringDataCustomerRepository repository) {
        this.repository = repository;
    }

    public List<CustomerJpaEntity> getAll() {
        return repository.findAll();
    }
}
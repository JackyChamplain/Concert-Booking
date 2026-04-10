package com.champsoft.concertBooking.modules.customer.application.port.out;

import com.champsoft.concertBooking.modules.customer.infrastructure.persistence.CustomerJpaEntity;
import java.util.List;
import java.util.Optional;

public interface CustomerRepositoryPort {
    List<CustomerJpaEntity> findAll();
    Optional<CustomerJpaEntity> findById(String id);
    CustomerJpaEntity save(CustomerJpaEntity entity);
    void deleteById(String id);
}
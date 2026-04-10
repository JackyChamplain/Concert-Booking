package com.champsoft.concertBooking.modules.customer.infrastructure.persistence;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SpringDataCustomerRepository extends JpaRepository<CustomerJpaEntity, String> {
}
package com.champsoft.concertBooking.modules.customer.api.mapper;

import com.champsoft.concertBooking.modules.customer.api.dto.*;
import com.champsoft.concertBooking.modules.customer.infrastructure.persistence.CustomerJpaEntity;

public class CustomerApiMapper {
    public static CustomerResponse toResponse(CustomerJpaEntity entity) {
        return new CustomerResponse(entity.id, entity.fullName, entity.address, entity.email, entity.status);
    }

    public static CustomerJpaEntity toEntity(CreateCustomerRequest request) {
        return new CustomerJpaEntity(request.id(), request.fullName(), request.address(), request.email(), request.status());
    }
}
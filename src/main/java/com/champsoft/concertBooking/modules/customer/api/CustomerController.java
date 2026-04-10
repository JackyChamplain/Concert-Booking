package com.champsoft.concertBooking.modules.customer.api;

import com.champsoft.concertBooking.modules.customer.application.service.CustomerCrudService;
import com.champsoft.concertBooking.modules.customer.infrastructure.persistence.CustomerJpaEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/customers")
public class CustomerController {

    private final CustomerCrudService service;

    public CustomerController(CustomerCrudService service) {
        this.service = service;
    }

    @GetMapping
    public List<CustomerJpaEntity> getAll() {
        return service.getAll();
    }
}
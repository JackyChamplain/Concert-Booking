package com.champsoft.concertBooking.modules.reservation.api;

import com.champsoft.concertBooking.modules.reservation.application.service.RegistrationOrchestrator;
import com.champsoft.concertBooking.modules.reservation.infrastructure.persistence.ReservationJpaEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/reservations")
public class ReservationController {

    private final RegistrationOrchestrator service;

    public ReservationController(RegistrationOrchestrator service) {
        this.service = service;
    }

    @PostMapping
    public ReservationJpaEntity book(@RequestBody ReservationJpaEntity reservation) {
        return service.book(reservation);
    }
}
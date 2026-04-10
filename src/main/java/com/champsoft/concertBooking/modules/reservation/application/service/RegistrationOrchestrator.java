package com.champsoft.concertBooking.modules.reservation.application.service;

import com.champsoft.concertBooking.modules.reservation.infrastructure.persistence.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RegistrationOrchestrator {

    private final SpringDataReservationRepository repo;

    public RegistrationOrchestrator(SpringDataReservationRepository repo) {
        this.repo = repo;
    }

    @Transactional
    public ReservationJpaEntity book(ReservationJpaEntity reservation) {
        boolean conflict = repo.findAll().stream().anyMatch(r ->
                r.customer.id.equals(reservation.customer.id) &&
                        r.showtime.time.equals(reservation.showtime.time)
        );

        if (conflict) {
            throw new RuntimeException("Customer already booked at this time");
        }

        reservation.status = "ACTIVE";
        return repo.save(reservation);
    }
}
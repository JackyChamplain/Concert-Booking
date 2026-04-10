package com.champsoft.concertBooking.modules.reservation.infrastructure.persistence;

import org.springframework.data.jpa.repository.JpaRepository;

public interface SpringDataReservationRepository extends JpaRepository<ReservationJpaEntity, String> {
}
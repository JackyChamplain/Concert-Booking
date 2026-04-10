package com.champsoft.concertBooking.modules.reservation.api.mapper;

import com.champsoft.concertBooking.modules.reservation.api.dto.*;
import com.champsoft.concertBooking.modules.reservation.infrastructure.persistence.*;

public class ReservationApiMapper {

    public static ReservationResponse toResponse(ReservationJpaEntity entity) {
        return new ReservationResponse(
                entity.getId(),
                entity.getStatus()
        );
    }

    public static ReservationJpaEntity toEntity(BookConcertRequest request) {
        ReservationJpaEntity entity = new ReservationJpaEntity();
        entity.setId(request.id());
        return entity;
    }
}
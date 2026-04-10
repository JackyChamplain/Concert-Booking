package com.champsoft.concertBooking.modules.showtime.application.port.out;

import com.champsoft.concertBooking.modules.showtime.infrastructure.persistence.ShowtimeJpaEntity;

import java.util.List;

public interface ShowtimeRepositoryPort {
    List<ShowtimeJpaEntity> findAll();

    ShowtimeJpaEntity save(ShowtimeJpaEntity entity);
}

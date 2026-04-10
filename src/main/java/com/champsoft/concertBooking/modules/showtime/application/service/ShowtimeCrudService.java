package com.champsoft.concertBooking.modules.showtime.application.service;

import com.champsoft.concertBooking.modules.showtime.application.port.out.ShowtimeRepositoryPort;
import com.champsoft.concertBooking.modules.showtime.infrastructure.persistence.ShowtimeJpaEntity;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ShowtimeCrudService {
    private final ShowtimeRepositoryPort port;

    public ShowtimeCrudService(ShowtimeRepositoryPort port) {
        this.port = port;
    }

    public List<ShowtimeJpaEntity> getAll() {
        return port.findAll();
    }

    public ShowtimeJpaEntity create(ShowtimeJpaEntity entity) {
        return port.save(entity);
    }
}
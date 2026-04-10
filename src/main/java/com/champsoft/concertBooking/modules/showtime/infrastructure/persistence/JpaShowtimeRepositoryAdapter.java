package com.champsoft.concertBooking.modules.showtime.infrastructure.persistence;

import com.champsoft.concertBooking.modules.showtime.application.port.out.ShowtimeRepositoryPort;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class JpaShowtimeRepositoryAdapter implements ShowtimeRepositoryPort {

    private final SpringDataShowtimeRepository springRepo;

    public JpaShowtimeRepositoryAdapter(SpringDataShowtimeRepository springRepo) {
        this.springRepo = springRepo;
    }

    @Override
    public List<ShowtimeJpaEntity> findAll() {
        return springRepo.findAll();
    }

    @Override
    public ShowtimeJpaEntity save(ShowtimeJpaEntity entity) {
        return springRepo.save(entity);
    }
}
package com.champsoft.concertBooking.modules.showtime.api;

import com.champsoft.concertBooking.modules.showtime.api.dto.*;
import com.champsoft.concertBooking.modules.showtime.api.mapper.ShowtimeApiMapper;
import com.champsoft.concertBooking.modules.showtime.application.service.ShowtimeCrudService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/showtimes")
public class ShowtimeController {

    private final ShowtimeCrudService service;

    public ShowtimeController(ShowtimeCrudService service) {
        this.service = service;
    }

    @GetMapping
    public List<ShowtimeResponse> getAll() {
        return service.getAll()
                .stream()
                .map(ShowtimeApiMapper::toResponse)
                .toList();
    }

    @PostMapping
    public ShowtimeResponse create(@RequestBody CreateShowtimeRequest request) {
        var entity = ShowtimeApiMapper.toEntity(request);
        return ShowtimeApiMapper.toResponse(service.create(entity));
    }
}
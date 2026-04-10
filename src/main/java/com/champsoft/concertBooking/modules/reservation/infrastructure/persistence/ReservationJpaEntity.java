package com.champsoft.concertBooking.modules.reservation.infrastructure.persistence;

import com.champsoft.concertBooking.modules.concert.infrastructure.persistence.ConcertJpaEntity;
import com.champsoft.concertBooking.modules.customer.infrastructure.persistence.CustomerJpaEntity;
import com.champsoft.concertBooking.modules.showtime.infrastructure.persistence.ShowtimeJpaEntity;
import jakarta.persistence.*;

@Entity
@Table(name = "reservations")
public class ReservationJpaEntity {

    @Id
    public String id;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    public CustomerJpaEntity customer;

    @ManyToOne
    @JoinColumn(name = "concert_id")
    public ConcertJpaEntity concert;

    @ManyToOne
    @JoinColumn(name = "showtime_id")
    public ShowtimeJpaEntity showtime;

    public String status;

    public ReservationJpaEntity() {}

    public String getId() {
        return id;
    }

    public CustomerJpaEntity getCustomer() {
        return customer;
    }

    public ConcertJpaEntity getConcert() {
        return concert;
    }

    public ShowtimeJpaEntity getShowtime() {
        return showtime;
    }

    public String getStatus() {
        return status;
    }


    public void setId(String id) {
        this.id = id;
    }

    public void setCustomer(CustomerJpaEntity customer) {
        this.customer = customer;
    }

    public void setConcert(ConcertJpaEntity concert) {
        this.concert = concert;
    }

    public void setShowtime(ShowtimeJpaEntity showtime) {
        this.showtime = showtime;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
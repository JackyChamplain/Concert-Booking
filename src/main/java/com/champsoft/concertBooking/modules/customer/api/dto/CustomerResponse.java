package com.champsoft.concertBooking.modules.customer.api.dto;

public record CustomerResponse(String id, String fullName, String address, String email, String status) {}
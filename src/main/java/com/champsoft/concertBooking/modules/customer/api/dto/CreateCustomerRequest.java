package com.champsoft.concertBooking.modules.customer.api.dto;

public record CreateCustomerRequest(String id, String fullName, String address, String email, String status) {}
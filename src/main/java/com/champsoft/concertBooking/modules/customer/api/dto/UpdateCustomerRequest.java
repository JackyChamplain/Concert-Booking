package com.champsoft.concertBooking.modules.customer.api.dto;

public record UpdateCustomerRequest(String fullName, String address, String email, String status) {}
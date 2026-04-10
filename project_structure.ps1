# ==========================================================
# FULL Concert Booking Project Generator
# Hexagonal Architecture + DDD
# ==========================================================

$base = "src/main/java/com/champsoft/concertBooking"

function WriteFile($path, $content) {
    New-Item -ItemType Directory -Force -Path (Split-Path $path) | Out-Null
    Set-Content -Path $path -Value $content
}

# ==========================================================
# MAIN APPLICATION
# ==========================================================

WriteFile "$base/ConcertBookingApplication.java" @"
package com.champsoft.concertBooking;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ConcertBookingApplication {
    public static void main(String[] args) {
        SpringApplication.run(ConcertBookingApplication.class, args);
    }
}
"@

# ==========================================================
# SHARED CONFIG
# ==========================================================

WriteFile "$base/shared/config/WebConfig.java" "package com.champsoft.concertBooking.shared.config; public class WebConfig {}"
WriteFile "$base/shared/config/OpenApiConfig.java" "package com.champsoft.concertBooking.shared.config; public class OpenApiConfig {}"
WriteFile "$base/shared/config/OpenApiGroupsConfig.java" "package com.champsoft.concertBooking.shared.config; public class OpenApiGroupsConfig {}"

WriteFile "$base/shared/web/ApiErrorResponse.java" "package com.champsoft.concertBooking.shared.web; public class ApiErrorResponse {}"
WriteFile "$base/shared/web/GlobalExceptionHandler.java" "package com.champsoft.concertBooking.shared.web; public class GlobalExceptionHandler {}"

# ==========================================================
# CONCERT MODULE
# ==========================================================

$concert = "$base/modules/concert"

# DOMAIN
WriteFile "$concert/domain/model/Concert.java" "package com.champsoft.concertBooking.modules.concert.domain.model; public class Concert {}"
WriteFile "$concert/domain/model/ConcertId.java" "package com.champsoft.concertBooking.modules.concert.domain.model; public record ConcertId(String value) {}"
WriteFile "$concert/domain/model/Name.java" "package com.champsoft.concertBooking.modules.concert.domain.model; public record Name(String value) {}"
WriteFile "$concert/domain/model/Venue.java" "package com.champsoft.concertBooking.modules.concert.domain.model; public record Venue(String value) {}"
WriteFile "$concert/domain/model/Type.java" "package com.champsoft.concertBooking.modules.concert.domain.model; public record Type(String value) {}"
WriteFile "$concert/domain/model/Price.java" "package com.champsoft.concertBooking.modules.concert.domain.model; public record Price(double value) {}"
WriteFile "$concert/domain/model/isPremium.java" "package com.champsoft.concertBooking.modules.concert.domain.model; public enum isPremium { premiumUser, defaultUser }"

# DOMAIN EXCEPTIONS
WriteFile "$concert/domain/exception/InvalidConcertNameException.java" "package com.champsoft.concertBooking.modules.concert.domain.exception; public class InvalidConcertNameException extends RuntimeException {}"
WriteFile "$concert/domain/exception/InvalidVenueNameException.java" "package com.champsoft.concertBooking.modules.concert.domain.exception; public class InvalidVenueNameException extends RuntimeException {}"

# APPLICATION
WriteFile "$concert/application/port/out/ConcertRepositoryPort.java" "package com.champsoft.concertBooking.modules.concert.application.port.out; public interface ConcertRepositoryPort {}"
WriteFile "$concert/application/service/ConcertCrudService.java" "package com.champsoft.concertBooking.modules.concert.application.service; public class ConcertCrudService {}"
WriteFile "$concert/application/service/ConcertEligibilityService.java" "package com.champsoft.concertBooking.modules.concert.application.service; public class ConcertEligibilityService {}"

# INFRASTRUCTURE
WriteFile "$concert/infrastructure/persistence/ConcertJpaEntity.java" "package com.champsoft.concertBooking.modules.concert.infrastructure.persistence; public class ConcertJpaEntity {}"
WriteFile "$concert/infrastructure/persistence/SpringDataConcertRepository.java" "package com.champsoft.concertBooking.modules.concert.infrastructure.persistence; public interface SpringDataConcertRepository {}"
WriteFile "$concert/infrastructure/persistence/JpaConcertRepositoryAdapter.java" "package com.champsoft.concertBooking.modules.concert.infrastructure.persistence; public class JpaConcertRepositoryAdapter {}"

# API
WriteFile "$concert/api/ConcertController.java" "package com.champsoft.concertBooking.modules.concert.api; public class ConcertController {}"
WriteFile "$concert/api/ConcertExceptionHandler.java" "package com.champsoft.concertBooking.modules.concert.api; public class ConcertExceptionHandler {}"
WriteFile "$concert/api/dto/CreateConcertRequest.java" "package com.champsoft.concertBooking.modules.concert.api.dto; public class CreateConcertRequest {}"
WriteFile "$concert/api/dto/UpdateConcertRequest.java" "package com.champsoft.concertBooking.modules.concert.api.dto; public class UpdateConcertRequest {}"
WriteFile "$concert/api/dto/ConcertResponse.java" "package com.champsoft.concertBooking.modules.concert.api.dto; public class ConcertResponse {}"
WriteFile "$concert/api/mapper/ConcertApiMapper.java" "package com.champsoft.concertBooking.modules.concert.api.mapper; public class ConcertApiMapper {}"

# ==========================================================
# CUSTOMER MODULE
# ==========================================================

$customer = "$base/modules/customer"

WriteFile "$customer/domain/model/Customer.java" "package com.champsoft.concertBooking.modules.customer.domain.model; public class Customer {}"
WriteFile "$customer/domain/model/CustomerId.java" "package com.champsoft.concertBooking.modules.customer.domain.model; public record CustomerId(String value) {}"
WriteFile "$customer/domain/model/FullName.java" "package com.champsoft.concertBooking.modules.customer.domain.model; public record FullName(String value) {}"
WriteFile "$customer/domain/model/Address.java" "package com.champsoft.concertBooking.modules.customer.domain.model; public record Address(String value) {}"
WriteFile "$customer/domain/model/Email.java" "package com.champsoft.concertBooking.modules.customer.domain.model; public record Email(String value) {}"
WriteFile "$customer/domain/model/CustomerStatus.java" "package com.champsoft.concertBooking.modules.customer.domain.model; public enum CustomerStatus { INACTIVE, ACTIVE, SUSPENDED }"

WriteFile "$customer/application/port/out/CustomerRepositoryPort.java" "package com.champsoft.concertBooking.modules.customer.application.port.out; public interface CustomerRepositoryPort {}"
WriteFile "$customer/application/service/CustomerCrudService.java" "package com.champsoft.concertBooking.modules.customer.application.service; public class CustomerCrudService {}"
WriteFile "$customer/application/service/CustomerEligibilityService.java" "package com.champsoft.concertBooking.modules.customer.application.service; public class CustomerEligibilityService {}"

WriteFile "$customer/infrastructure/persistence/CustomerJpaEntity.java" "package com.champsoft.concertBooking.modules.customer.infrastructure.persistence; public class CustomerJpaEntity {}"
WriteFile "$customer/infrastructure/persistence/SpringDataCustomerRepository.java" "package com.champsoft.concertBooking.modules.customer.infrastructure.persistence; public interface SpringDataCustomerRepository {}"
WriteFile "$customer/infrastructure/persistence/JpaCustomerRepositoryAdapter.java" "package com.champsoft.concertBooking.modules.customer.infrastructure.persistence; public class JpaCustomerRepositoryAdapter {}"

WriteFile "$customer/api/CustomerController.java" "package com.champsoft.concertBooking.modules.customer.api; public class CustomerController {}"
WriteFile "$customer/api/CustomerExceptionHandler.java" "package com.champsoft.concertBooking.modules.customer.api; public class CustomerExceptionHandler {}"
WriteFile "$customer/api/dto/CreateCustomerRequest.java" "package com.champsoft.concertBooking.modules.customer.api.dto; public class CreateCustomerRequest {}"
WriteFile "$customer/api/dto/UpdateCustomerRequest.java" "package com.champsoft.concertBooking.modules.customer.api.dto; public class UpdateCustomerRequest {}"
WriteFile "$customer/api/dto/CustomerResponse.java" "package com.champsoft.concertBooking.modules.customer.api.dto; public class CustomerResponse {}"
WriteFile "$customer/api/mapper/CustomerApiMapper.java" "package com.champsoft.concertBooking.modules.customer.api.mapper; public class CustomerApiMapper {}"

# ==========================================================
# SHOWTIME MODULE
# ==========================================================

$showtime = "$base/modules/showtime"

WriteFile "$showtime/domain/model/Showtime.java" "package com.champsoft.concertBooking.modules.showtime.domain.model; public class Showtime {}"
WriteFile "$showtime/domain/model/ShowtimeId.java" "package com.champsoft.concertBooking.modules.showtime.domain.model; public record ShowtimeId(String value) {}"
WriteFile "$showtime/domain/model/Date.java" "package com.champsoft.concertBooking.modules.showtime.domain.model; import java.time.LocalDate; public record Date(LocalDate value) {}"
WriteFile "$showtime/domain/model/Time.java" "package com.champsoft.concertBooking.modules.showtime.domain.model; import java.time.LocalTime; public record Time(LocalTime value) {}"

WriteFile "$showtime/application/port/out/ShowtimeRepositoryPort.java" "package com.champsoft.concertBooking.modules.showtime.application.port.out; public interface ShowtimeRepositoryPort {}"
WriteFile "$showtime/application/service/ShowtimeCrudService.java" "package com.champsoft.concertBooking.modules.showtime.application.service; public class ShowtimeCrudService {}"
WriteFile "$showtime/application/service/ShowtimeEligibilityService.java" "package com.champsoft.concertBooking.modules.showtime.application.service; public class ShowtimeEligibilityService {}"

WriteFile "$showtime/infrastructure/persistence/ShowtimeJpaEntity.java" "package com.champsoft.concertBooking.modules.showtime.infrastructure.persistence; public class ShowtimeJpaEntity {}"
WriteFile "$showtime/infrastructure/persistence/SpringDataShowtimeRepository.java" "package com.champsoft.concertBooking.modules.showtime.infrastructure.persistence; public interface SpringDataShowtimeRepository {}"
WriteFile "$showtime/infrastructure/persistence/JpaShowtimeRepositoryAdapter.java" "package com.champsoft.concertBooking.modules.showtime.infrastructure.persistence; public class JpaShowtimeRepositoryAdapter {}"

WriteFile "$showtime/api/ShowtimeController.java" "package com.champsoft.concertBooking.modules.showtime.api; public class ShowtimeController {}"
WriteFile "$showtime/api/ShowtimeExceptionHandler.java" "package com.champsoft.concertBooking.modules.showtime.api; public class ShowtimeExceptionHandler {}"
WriteFile "$showtime/api/dto/CreateShowtimeRequest.java" "package com.champsoft.concertBooking.modules.showtime.api.dto; public class CreateShowtimeRequest {}"
WriteFile "$showtime/api/dto/UpdateShowtimeRequest.java" "package com.champsoft.concertBooking.modules.showtime.api.dto; public class UpdateShowtimeRequest {}"
WriteFile "$showtime/api/dto/ShowtimeResponse.java" "package com.champsoft.concertBooking.modules.showtime.api.dto; public class ShowtimeResponse {}"
WriteFile "$showtime/api/mapper/ShowtimeApiMapper.java" "package com.champsoft.concertBooking.modules.showtime.api.mapper; public class ShowtimeApiMapper {}"

# ==========================================================
# RESERVATION MODULE (CORE + RULES)
# ==========================================================

$reservation = "$base/modules/reservation"

WriteFile "$reservation/domain/model/Reservation.java" @"
package com.champsoft.concertBooking.modules.reservation.domain.model;

// BUSINESS RULES:
// - A customer CANNOT book two concerts at the same time
// - A venue CANNOT host overlapping concerts

public class Reservation {
}
"@

WriteFile "$reservation/domain/model/ReservationId.java" "package com.champsoft.concertBooking.modules.reservation.domain.model; public record ReservationId(String value) {}"
WriteFile "$reservation/domain/model/ConcertRef.java" "package com.champsoft.concertBooking.modules.reservation.domain.model; public record ConcertRef(String concertId) {}"
WriteFile "$reservation/domain/model/CustomersRef.java" "package com.champsoft.concertBooking.modules.reservation.domain.model; public record CustomersRef(String customerId) {}"
WriteFile "$reservation/domain/model/ShowtimeRef.java" "package com.champsoft.concertBooking.modules.reservation.domain.model; public record ShowtimeRef(String showtimeId) {}"
WriteFile "$reservation/domain/model/BookingStatus.java" "package com.champsoft.concertBooking.modules.reservation.domain.model; public enum BookingStatus { ACTIVE, CANCELLED }"

# ACL PORTS
WriteFile "$reservation/application/port/out/ConcertEligibilityPort.java" "package com.champsoft.concertBooking.modules.reservation.application.port.out; public interface ConcertEligibilityPort {}"
WriteFile "$reservation/application/port/out/CustomersEligibilityPort.java" "package com.champsoft.concertBooking.modules.reservation.application.port.out; public interface CustomersEligibilityPort {}"
WriteFile "$reservation/application/port/out/ShowtimesEligibilityPort.java" "package com.champsoft.concertBooking.modules.reservation.application.port.out; public interface ShowtimesEligibilityPort {}"

WriteFile "$reservation/application/port/out/ReservationRepositoryPort.java" "package com.champsoft.concertBooking.modules.reservation.application.port.out; public interface ReservationRepositoryPort {}"

WriteFile "$reservation/application/service/RegistrationCrudService.java" "package com.champsoft.concertBooking.modules.reservation.application.service; public class RegistrationCrudService {}"
WriteFile "$reservation/application/service/RegistrationOrchestrator.java" "package com.champsoft.concertBooking.modules.reservation.application.service; public class RegistrationOrchestrator {}"

# ACL ADAPTERS
WriteFile "$reservation/infrastructure/acl/ConcertEligibilityAdapter.java" "package com.champsoft.concertBooking.modules.reservation.infrastructure.acl; public class ConcertEligibilityAdapter {}"
WriteFile "$reservation/infrastructure/acl/CustomersEligibilityAdapter.java" "package com.champsoft.concertBooking.modules.reservation.infrastructure.acl; public class CustomersEligibilityAdapter {}"
WriteFile "$reservation/infrastructure/acl/ShowtimeEligibilityAdapter.java" "package com.champsoft.concertBooking.modules.reservation.infrastructure.acl; public class ShowtimeEligibilityAdapter {}"

# PERSISTENCE
WriteFile "$reservation/infrastructure/persistence/ReservationJpaEntity.java" "package com.champsoft.concertBooking.modules.reservation.infrastructure.persistence; public class ReservationJpaEntity {}"
WriteFile "$reservation/infrastructure/persistence/SpringDataReservationRepository.java" "package com.champsoft.concertBooking.modules.reservation.infrastructure.persistence; public interface SpringDataReservationRepository {}"
WriteFile "$reservation/infrastructure/persistence/JpaReservationRepositoryAdapter.java" "package com.champsoft.concertBooking.modules.reservation.infrastructure.persistence; public class JpaReservationRepositoryAdapter {}"

# API
WriteFile "$reservation/api/ReservationController.java" "package com.champsoft.concertBooking.modules.reservation.api; public class ReservationController {}"
WriteFile "$reservation/api/ReservationExceptionHandler.java" "package com.champsoft.concertBooking.modules.reservation.api; public class ReservationExceptionHandler {}"
WriteFile "$reservation/api/dto/BookConcertRequest.java" "package com.champsoft.concertBooking.modules.reservation.api.dto; public class BookConcertRequest {}"
WriteFile "$reservation/api/dto/RenewReservationRequest.java" "package com.champsoft.concertBooking.modules.reservation.api.dto; public class RenewReservationRequest {}"
WriteFile "$reservation/api/dto/CancelReservationRequest.java" "package com.champsoft.concertBooking.modules.reservation.api.dto; public class CancelReservationRequest {}"
WriteFile "$reservation/api/dto/ReservationResponse.java" "package com.champsoft.concertBooking.modules.reservation.api.dto; public class ReservationResponse {}"
WriteFile "$reservation/api/mapper/ReservationApiMapper.java" "package com.champsoft.concertBooking.modules.reservation.api.mapper; public class ReservationApiMapper {}"

Write-Host "\n✅ FULL Concert Booking structure generated successfully!"
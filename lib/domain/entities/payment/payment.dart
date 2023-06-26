import 'package:flight_booking/core/components/enum/payment_status_enum.dart';
import 'package:flight_booking/core/components/enum/payment_type.dart';
import 'package:flight_booking/domain/entities/customer/customer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../ticket/ticket.dart';
part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
class Payment with _$Payment {
  const factory Payment({
    @Default(-1) int id,
    @Default(0) int createdDate,
    @Default(PaymentType.cash) PaymentType paymentType,
    @Default(PaymentStatus.create) PaymentStatus paymentStatus,
    @Default(0) double total,
    @Default(null) Customer? customer,
    @Default([]) List<Ticket> ticket,
  }) = _Payment;

  const Payment._();

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}

import 'dart:convert';

import 'package:cle_app/data/database/local_database/database.dart';
import 'package:equatable/equatable.dart';

class PayrollWithItems extends Equatable {
  final Payroll payroll;
  final List<PayrollLoad> loads;
  final List<PayrollItem> credits;
  final List<PayrollItem> advances;
  final List<PayrollItem> deductions;
  final List<PayrollItem> reimbursments;
  const PayrollWithItems({
    required this.payroll,
    required this.loads,
    required this.credits,
    required this.advances,
    required this.deductions,
    required this.reimbursments,
  });

  PayrollWithItems copyWith({
    Payroll? payroll,
    List<PayrollLoad>? loads,
    List<PayrollItem>? credits,
    List<PayrollItem>? advances,
    List<PayrollItem>? deductions,
    List<PayrollItem>? reimbursments,
  }) {
    return PayrollWithItems(
      payroll: payroll ?? this.payroll,
      loads: loads ?? this.loads,
      credits: credits ?? this.credits,
      advances: advances ?? this.advances,
      deductions: deductions ?? this.deductions,
      reimbursments: reimbursments ?? this.reimbursments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'payroll': payroll.toJson,
      'loads': loads.map((x) => x.toJson).toList(),
      'credits': credits.map((x) => x.toJson).toList(),
      'advances': advances.map((x) => x.toJson).toList(),
      'deductions': deductions.map((x) => x.toJson).toList(),
      'reimbursments': reimbursments.map((x) => x.toJson).toList(),
    };
  }

  factory PayrollWithItems.fromMap(Map<String, dynamic> map) {
    return PayrollWithItems(
      payroll: Payroll.fromJson(map['payroll']),
      loads: List<PayrollLoad>.from(
          map['loads']?.map((x) => PayrollLoad.fromJson(x))),
      credits: List<PayrollItem>.from(
          map['credits']?.map((x) => PayrollItem.fromJson(x))),
      advances: List<PayrollItem>.from(
          map['advances']?.map((x) => PayrollItem.fromJson(x))),
      deductions: List<PayrollItem>.from(
          map['deductions']?.map((x) => PayrollItem.fromJson(x))),
      reimbursments: List<PayrollItem>.from(
          map['reimbursments']?.map((x) => PayrollItem.fromJson(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PayrollWithItems.fromJson(String source) =>
      PayrollWithItems.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PayrollWithItems(payroll: $payroll, loads: $loads, credits: $credits, advances: $advances, deductions: $deductions, reimbursments: $reimbursments)';
  }

  @override
  List<Object> get props {
    return [
      payroll,
      loads,
      credits,
      advances,
      deductions,
      reimbursments,
    ];
  }
}

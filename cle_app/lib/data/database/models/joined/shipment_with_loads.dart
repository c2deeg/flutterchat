import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:cle_app/data/database/local_database/database.dart';

class ShipmentWithLoads extends Equatable {
  final Shipment shipment;
  final List<Load>? loads;
  final List<int>? loadIds;
  const ShipmentWithLoads({
    required this.shipment,
    required this.loads,
    this.loadIds,
  });

  ShipmentWithLoads copyWith({
    Shipment? shipment,
    List<Load>? loads,
    List<int>? loadIds,
  }) {
    return ShipmentWithLoads(
      shipment: shipment ?? this.shipment,
      loads: loads ?? this.loads,
      loadIds: loadIds ?? this.loadIds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'shipment': shipment.toJson(),
      'loads': loads?.map((x) => x.toJson()).toList(),
      'loadIds': loadIds,
    };
  }

  factory ShipmentWithLoads.fromMap(Map<String, dynamic> map) {
    return ShipmentWithLoads(
      shipment: Shipment.fromJson(map['shipment']),
      loads: map['loads'] != null
          ? List<Load>.from(map['loads']?.map((x) => Load.fromJson(x)))
          : null,
      loadIds: List<int>.from(map['loadIds']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShipmentWithLoads.fromJson(String source) =>
      ShipmentWithLoads.fromMap(json.decode(source));

  @override
  String toString() =>
      'ShipmentWithLoads(shipment: $shipment, loads: $loads, loadIds: $loadIds)';

  @override
  List<Object?> get props => [shipment, loads, loadIds];
}

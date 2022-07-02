import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Report extends Equatable {
  final String notes;
  final String location;
  final String base64Image;
  const Report({
    required this.notes,
    required this.location,
    required this.base64Image,
  });

  Report copyWith({
    String? notes,
    String? location,
    String? base64Image,
  }) {
    return Report(
      notes: notes ?? this.notes,
      location: location ?? this.location,
      base64Image: base64Image ?? this.base64Image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'notes': notes,
      'location': location,
      'Docbase64Image': base64Image,
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      notes: map['notes'] ?? '',
      location: map['location'] ?? '',
      base64Image: map['Docbase64Image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) => Report.fromMap(json.decode(source));

  @override
  String toString() =>
      'Report(notes: $notes, location: $location, base64Image: $base64Image)';

  @override
  List<Object> get props => [notes, location, base64Image];
}

Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String));
}

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String);
}

String base64String(Uint8List data) {
  return base64Encode(data);
}

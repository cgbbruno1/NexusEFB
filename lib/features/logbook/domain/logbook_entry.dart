class LogbookEntry {
  const LogbookEntry({
    required this.id,
    this.aircraftId,
    required this.date,
    this.departure,
    this.arrival,
    this.flightTimeMinutes,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String? aircraftId;
  final DateTime date;
  final String? departure;
  final String? arrival;
  final int? flightTimeMinutes;
  final DateTime createdAt;
  final DateTime updatedAt;

  LogbookEntry copyWith({
    String? id,
    String? aircraftId,
    DateTime? date,
    String? departure,
    String? arrival,
    int? flightTimeMinutes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LogbookEntry(
      id: id ?? this.id,
      aircraftId: aircraftId ?? this.aircraftId,
      date: date ?? this.date,
      departure: departure ?? this.departure,
      arrival: arrival ?? this.arrival,
      flightTimeMinutes: flightTimeMinutes ?? this.flightTimeMinutes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'aircraft_id': aircraftId,
      'date': date.toIso8601String(),
      'departure': departure,
      'arrival': arrival,
      'flight_time_minutes': flightTimeMinutes,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory LogbookEntry.fromMap(Map<String, Object?> map) {
    return LogbookEntry(
      id: map['id']! as String,
      aircraftId: map['aircraft_id'] as String?,
      date: DateTime.parse(map['date']! as String),
      departure: map['departure'] as String?,
      arrival: map['arrival'] as String?,
      flightTimeMinutes: map['flight_time_minutes'] as int?,
      createdAt: DateTime.parse(map['created_at']! as String),
      updatedAt: DateTime.parse(map['updated_at']! as String),
    );
  }
}

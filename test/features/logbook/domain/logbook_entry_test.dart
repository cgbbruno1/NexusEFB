import 'package:avaremp/features/logbook/domain/logbook_entry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final date = DateTime.parse('2026-06-14T10:30:00.000Z');
  final createdAt = DateTime.parse('2026-06-14T12:00:00.000Z');
  final updatedAt = DateTime.parse('2026-06-14T13:00:00.000Z');

  test('creates LogbookEntry with expected values', () {
    final entry = LogbookEntry(
      id: 'lb-1',
      aircraftId: 'ac-1',
      date: date,
      departure: 'SBAA',
      arrival: 'SBCY',
      flightTimeMinutes: 55,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

    expect(entry.id, 'lb-1');
    expect(entry.aircraftId, 'ac-1');
    expect(entry.date, date);
    expect(entry.departure, 'SBAA');
    expect(entry.arrival, 'SBCY');
    expect(entry.flightTimeMinutes, 55);
    expect(entry.createdAt, createdAt);
    expect(entry.updatedAt, updatedAt);
  });

  test('toMap serializes LogbookEntry', () {
    final entry = LogbookEntry(
      id: 'lb-1',
      aircraftId: 'ac-1',
      date: date,
      departure: 'SBAA',
      arrival: 'SBCY',
      flightTimeMinutes: 55,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

    expect(entry.toMap(), {
      'id': 'lb-1',
      'aircraft_id': 'ac-1',
      'date': date.toIso8601String(),
      'departure': 'SBAA',
      'arrival': 'SBCY',
      'flight_time_minutes': 55,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    });
  });

  test('fromMap deserializes LogbookEntry', () {
    final entry = LogbookEntry.fromMap({
      'id': 'lb-1',
      'aircraft_id': 'ac-1',
      'date': date.toIso8601String(),
      'departure': 'SBAA',
      'arrival': 'SBCY',
      'flight_time_minutes': 55,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    });

    expect(entry.id, 'lb-1');
    expect(entry.aircraftId, 'ac-1');
    expect(entry.date, date);
    expect(entry.departure, 'SBAA');
    expect(entry.arrival, 'SBCY');
    expect(entry.flightTimeMinutes, 55);
    expect(entry.createdAt, createdAt);
    expect(entry.updatedAt, updatedAt);
  });

  test('copyWith updates selected LogbookEntry fields', () {
    final entry = LogbookEntry(
      id: 'lb-1',
      aircraftId: 'ac-1',
      date: date,
      departure: 'SBAA',
      arrival: 'SBCY',
      flightTimeMinutes: 55,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

    final copied = entry.copyWith(
      arrival: 'SBSP',
      flightTimeMinutes: 90,
    );

    expect(copied.id, 'lb-1');
    expect(copied.aircraftId, 'ac-1');
    expect(copied.date, date);
    expect(copied.departure, 'SBAA');
    expect(copied.arrival, 'SBSP');
    expect(copied.flightTimeMinutes, 90);
    expect(copied.createdAt, createdAt);
    expect(copied.updatedAt, updatedAt);
  });
}

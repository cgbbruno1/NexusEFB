import 'package:avaremp/features/aircraft/domain/aircraft.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final createdAt = DateTime.parse('2026-06-14T12:00:00.000Z');
  final updatedAt = DateTime.parse('2026-06-14T13:00:00.000Z');

  test('creates Aircraft with expected values', () {
    const id = 'ac-1';
    const registration = 'PT-ABC';
    const model = 'C172';

    final aircraft = Aircraft(
      id: id,
      registration: registration,
      model: model,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

    expect(aircraft.id, id);
    expect(aircraft.registration, registration);
    expect(aircraft.model, model);
    expect(aircraft.createdAt, createdAt);
    expect(aircraft.updatedAt, updatedAt);
  });

  test('toMap serializes Aircraft', () {
    final aircraft = Aircraft(
      id: 'ac-1',
      registration: 'PT-ABC',
      model: 'C172',
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

    expect(aircraft.toMap(), {
      'id': 'ac-1',
      'registration': 'PT-ABC',
      'model': 'C172',
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    });
  });

  test('fromMap deserializes Aircraft', () {
    final aircraft = Aircraft.fromMap({
      'id': 'ac-1',
      'registration': 'PT-ABC',
      'model': 'C172',
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    });

    expect(aircraft.id, 'ac-1');
    expect(aircraft.registration, 'PT-ABC');
    expect(aircraft.model, 'C172');
    expect(aircraft.createdAt, createdAt);
    expect(aircraft.updatedAt, updatedAt);
  });

  test('copyWith updates selected Aircraft fields', () {
    final aircraft = Aircraft(
      id: 'ac-1',
      registration: 'PT-ABC',
      model: 'C172',
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

    final copied = aircraft.copyWith(
      registration: 'PT-XYZ',
      updatedAt: createdAt,
    );

    expect(copied.id, 'ac-1');
    expect(copied.registration, 'PT-XYZ');
    expect(copied.model, 'C172');
    expect(copied.createdAt, createdAt);
    expect(copied.updatedAt, createdAt);
  });
}

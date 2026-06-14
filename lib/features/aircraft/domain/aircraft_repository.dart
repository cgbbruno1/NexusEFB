import 'package:avaremp/features/aircraft/domain/aircraft.dart';

abstract class AircraftRepository {
  Future<List<Aircraft>> listAircraft();

  Future<Aircraft?> getAircraftById(String id);

  Future<void> saveAircraft(Aircraft aircraft);

  Future<void> deleteAircraft(String id);
}

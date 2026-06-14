import 'package:avaremp/features/logbook/domain/logbook_entry.dart';

abstract class LogbookRepository {
  Future<List<LogbookEntry>> listEntries();

  Future<List<LogbookEntry>> listEntriesByAircraft(String aircraftId);

  Future<LogbookEntry?> getEntryById(String id);

  Future<void> saveEntry(LogbookEntry entry);

  Future<void> deleteEntry(String id);
}

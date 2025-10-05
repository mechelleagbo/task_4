import 'logger.dart';
import 'models/log_entry.dart';

class MockLogger implements Logger {
  final List<LogEntry> entries = [];

  @override
  void log(LogEntry entry) {
    entries.add(entry);
    // Still print so output is visible
    print('[MockLogger] captured: ${entry.toString()}');
  }

  void showSummary() {
    print('[MockLogger] total captured: ${entries.length}');
  }
}

import 'logger.dart';
import 'models/log_entry.dart';

class ConsoleLogger implements Logger {
  @override
  void log(LogEntry entry) {
    // Console implementation prints entries with a label
    print('[ConsoleLogger] ${entry.toString()}');
  }
}
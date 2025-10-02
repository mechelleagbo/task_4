import 'models/log_entry.dart';

abstract class Logger {
  /// Record the [entry]. Implementations may print, save to file, send to server, etc.
  void log(LogEntry entry);
}

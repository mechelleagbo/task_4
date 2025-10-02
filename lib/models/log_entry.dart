class LogEntry {
  final DateTime timestamp;
  final String level; // e.g., INFO, WARN, ERROR
  final String message;

  LogEntry(this.level, this.message) : timestamp = DateTime.now();

  @override
  String toString() => '[${timestamp.toIso8601String()}] $level: $message';
}

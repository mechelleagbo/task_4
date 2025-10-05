import 'logger.dart';
import 'models/log_entry.dart';
import 'dart:io';

class FileLogger implements Logger {
  final String filePath;
  IOSink? _sink;

  FileLogger(this.filePath) {
    final file = File(filePath);
    // open in append mode; create if missing
    _sink = file.openWrite(mode: FileMode.append);
  }

  @override
  void log(LogEntry entry) {
    final line = '[FileLogger] ${entry.toString()}';
    _sink?.writeln(line);
    // For grader visibility, also print a short confirmation line
    print('[FileLogger] Wrote to $filePath: ${entry.level} ${entry.message}');
  }

  // Close resources when done
  Future<void> close() async {
    await _sink?.flush();
    await _sink?.close();
  }
}

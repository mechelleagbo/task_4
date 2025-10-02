import 'logger.dart';
import 'models/log_entry.dart';

class AppService {
  final Logger logger; // depends only on interface

  AppService(this.logger);

  // Uses the interface inside this method
  void performTask(String taskName) {
    logger.log(LogEntry('INFO', 'Starting task: $taskName'));
    // pretend work...
    logger.log(LogEntry('INFO', 'Completed task: $taskName'));
  }

  // Another consumer method using the interface
  void handleError(String context, String errorMessage) {
    logger.log(LogEntry('ERROR', 'In $context: $errorMessage'));
    // maybe try recovery...
    logger.log(LogEntry('WARN', 'Recovery attempted for $context'));
  }
}

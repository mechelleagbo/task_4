import 'models/log_entry.dart';
import 'app_service.dart';
import 'console_logger.dart';
import 'file_logger.dart';
import 'mock_logger.dart';
import 'dart:io';

Future<void> main() async {
  print('=== Demo: ConsoleLogger (Implementation A) ===');
  final consoleLogger = ConsoleLogger();
  final appWithConsole = AppService(consoleLogger);
  appWithConsole.performTask('GenerateReport');
  appWithConsole.handleError('ReportService', 'NullPointerException');

  print('\n=== Demo: FileLogger (Implementation B) ===');
  final logPath = 'logs/app.log';
  // Ensure directory exists
  Directory('logs').createSync(recursive: true);
  final fileLogger = FileLogger(logPath);
  final appWithFile = AppService(fileLogger);
  appWithFile.performTask('SyncData');
  appWithFile.handleError('SyncService', 'TimeoutException');

  // Important: flush and close file sink so writes are persisted
  await fileLogger.close();

  print('\n=== (Optional) Demo: MockLogger ===');
  final mock = MockLogger();
  final appWithMock = AppService(mock);
  appWithMock.performTask('TestTask');
  appWithMock.handleError('TestService', 'TestError');
  mock.showSummary();

  print(
      '\nDemo complete. If you used FileLogger, logs were appended to: $logPath');
}

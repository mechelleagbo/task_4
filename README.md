# Logger DI Demo (Dart)

## Run
dart run lib/main.dart

## What to look for
The run demonstrates the consumer `AppService` constructed with:
- ConsoleLogger (Implementation A): prints full log entries prefixed with `[ConsoleLogger]`.
- FileLogger (Implementation B): appends logs to `logs/app.log` and prints short confirmation lines prefixed with `[FileLogger]`.
- MockLogger (optional): captures entries in memory and prints captured lines prefixed with `[MockLogger]`.

## Files
- lib/logger.dart — interface
- lib/app_service.dart — consumer (depends only on interface)
- lib/console_logger.dart — Implementation A
- lib/file_logger.dart — Implementation B
- lib/main.dart — demo (constructs consumer with each implementation sequentially)

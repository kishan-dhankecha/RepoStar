import 'dart:developer' as dev show log;

void log(String message) => dev.log(DateTime.now().toIso8601String() + message);

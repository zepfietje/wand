import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:fly/commands/commands.dart';

void main(List<String> arguments) {
  var runner = CommandRunner('fly', 'TODO: description')
    ..addCommand(MakeCommand());

  runner.run(arguments).catchError((error) {
    if (error is UsageException) {
      print(error);
      exit(64); // Exit code 64 indicates a usage error.
    } else {
      print(error.toString().replaceFirst('Exception: ', ''));
    }
  });
}

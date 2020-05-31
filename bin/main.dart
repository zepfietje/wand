import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:wand/commands/commands.dart';

void main(List<String> arguments) {
  var runner = CommandRunner(
    'wand',
    'Command-line tool for Flutter code generation.',
  )..addCommand(MakeCommand());

  runner.run(arguments).catchError((error) {
    if (error is UsageException) {
      print(error);
      exit(64); // Exit code 64 indicates a usage error.
    } else {
      print(error.toString().replaceFirst('Exception: ', ''));
    }
  });
}

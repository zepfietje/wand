import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:wand/wand.dart';

void main(List<String> arguments) {
  var runner = CommandRunner(
    'wand',
    'Command-line tool for generating boilerplate code for Flutter.',
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

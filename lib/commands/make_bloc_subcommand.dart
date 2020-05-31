import 'dart:io';

import 'package:args/command_runner.dart';

import '../stubs/stubs.dart';
import '../utils/name.dart';

class MakeBlocSubcommand extends Command {
  @override
  String get name => 'bloc';

  @override
  String get description => 'Create a new bloc.';

  @override
  void run() async {
    if (argResults.rest.isEmpty) {
      throw UsageException('Missing "name" argument.', usage);
    }

    var name = argResults.rest.first;

    var directoryPath = 'lib/blocs/${name.toSnakeCase()}';
    var directory = Directory(directoryPath);

    if (await directory.exists()) {
      throw Exception('Bloc folder already exists!');
    }

    await Directory(directoryPath).create(recursive: true);
    await File('$directoryPath/${name.toSnakeCase()}_bloc.dart')
        .writeAsString(BlocStub(name).filled);
    await File('$directoryPath/${name.toSnakeCase()}_event.dart')
        .writeAsString(BlocEventStub(name).filled);
    await File('$directoryPath/${name.toSnakeCase()}_state.dart')
        .writeAsString(BlocStateStub(name).filled);

    print('Bloc created successfully.');
  }
}

import 'dart:io';

import 'package:args/command_runner.dart';

import '../fly.dart';
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

    var blocStub = await getStub('bloc');
    var bloc = fillName(blocStub, name);

    var eventStub = await getStub('bloc_event');
    var event = fillName(eventStub, name);

    var stateStub = await getStub('bloc_state');
    var state = fillName(stateStub, name);

    await Directory(directoryPath).create(recursive: true);
    await File('$directoryPath/${name.toSnakeCase()}_bloc.dart')
        .writeAsString(bloc);
    await File('$directoryPath/${name.toSnakeCase()}_event.dart')
        .writeAsString(event);
    await File('$directoryPath/${name.toSnakeCase()}_state.dart')
        .writeAsString(state);

    print('Bloc created successfully.');
  }
}

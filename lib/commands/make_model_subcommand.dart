import 'dart:io';

import 'package:args/command_runner.dart';

import '../stubs/stubs.dart';
import '../utils/name.dart';

class MakeModelSubcommand extends Command {
  @override
  String get name => 'model';

  @override
  String get description => 'Create a new model.';

  @override
  void run() async {
    if (argResults.rest.isEmpty) {
      throw UsageException('Missing "name" argument.', usage);
    }

    var name = argResults.rest.first;

    var directoryPath = 'lib/models';
    var file = File('$directoryPath/${name.toSnakeCase()}.dart');

    if (await file.exists()) {
      throw Exception('Model already exists!');
    }

    await Directory(directoryPath).create();
    await file.writeAsString(ModelStub(name).filled);

    print('Model created successfully.');
  }
}

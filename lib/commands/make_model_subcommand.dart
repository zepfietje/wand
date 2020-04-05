import 'dart:io';

import 'package:args/command_runner.dart';

import '../fly.dart';
import '../utils/name.dart';

class MakeModelSubcommand extends Command {
  @override
  final name = 'model';

  @override
  final description = 'Create a new model class.';

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

    var stub = await getStub('model');
    var model = fillName(stub, name);

    await Directory(directoryPath).create();
    await file.writeAsString(model);

    print('Model created successfully.');
  }
}

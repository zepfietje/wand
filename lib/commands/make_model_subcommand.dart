import 'dart:io';

import 'package:args/command_runner.dart';

import '../utils/name.dart';
import '../wand.dart';

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

    var stub = await getStub('model');
    var model = fillName(stub, name);

    await Directory(directoryPath).create();
    await file.writeAsString(model);

    print('Model created successfully.');
  }
}

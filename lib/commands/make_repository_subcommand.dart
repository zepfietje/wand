import 'dart:io';

import 'package:args/command_runner.dart';

import '../utils/name.dart';
import '../wand.dart';

class MakeRepositorySubcommand extends Command {
  @override
  String get name => 'repository';

  @override
  String get description => 'Create a new repository.';

  @override
  void run() async {
    if (argResults.rest.isEmpty) {
      throw UsageException('Missing "name" argument.', usage);
    }

    var name = argResults.rest.first;

    var directoryPath = 'lib/repositories';
    var file = File('$directoryPath/${name.toSnakeCase()}_repository.dart');

    if (await file.exists()) {
      throw Exception('Repository already exists!');
    }

    var stub = await getStub('repository');
    var repository = fillName(stub, name);

    await Directory(directoryPath).create();
    await file.writeAsString(repository);

    print('Repository created successfully.');
  }
}

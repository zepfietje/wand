import 'dart:io';

import 'package:args/command_runner.dart';

import '../fly.dart';
import '../utils/name.dart';

class MakeScreenSubcommand extends Command {
  @override
  final name = 'screen';

  @override
  final description = 'Create a new screen class.';

  MakeScreenSubcommand() {
    argParser.addFlag('stateful', negatable: false);
  }

  @override
  void run() async {
    if (argResults.rest.isEmpty) {
      throw UsageException('Missing "name" argument.', usage);
    }

    var name = argResults.rest.first;

    var directoryPath = 'lib/screens';
    var file = File('$directoryPath/${name.toSnakeCase()}_screen.dart');

    if (await file.exists()) {
      throw Exception('Screen already exists!');
    }

    var stubPath = argResults['stateful']
        ? '$packageDirectory/lib/stubs/screen_stateful.stub'
        : '$packageDirectory/lib/stubs/screen_stateless.stub';
    var stub = await getStub(
      argResults['stateful'] ? 'screen_stateful' : 'screen_stateless',
    );
    var screen = fillName(stub, name);

    await Directory(directoryPath).create();
    await file.writeAsString(screen);

    print('Screen created successfully.');
  }
}

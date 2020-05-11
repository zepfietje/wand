import 'dart:io';

import 'package:args/command_runner.dart';

import '../fly.dart';
import '../utils/name.dart';

class MakePageSubcommand extends Command {
  @override
  final name = 'page';

  @override
  final description = 'Create a new page class.';

  MakePageSubcommand() {
    argParser.addFlag('stateful', negatable: false);
  }

  @override
  void run() async {
    if (argResults.rest.isEmpty) {
      throw UsageException('Missing "name" argument.', usage);
    }

    var name = argResults.rest.first;

    var directoryPath = 'lib/pages';
    var file = File('$directoryPath/${name.toSnakeCase()}_page.dart');

    if (await file.exists()) {
      throw Exception('Page already exists!');
    }

    var stubPath = argResults['stateful']
        ? '$packageDirectory/lib/stubs/page_stateful.stub'
        : '$packageDirectory/lib/stubs/page_stateless.stub';
    var stub = await getStub(
      argResults['stateful'] ? 'page_stateful' : 'page_stateless',
    );
    var page = fillName(stub, name);

    await Directory(directoryPath).create();
    await file.writeAsString(page);

    print('Page created successfully.');
  }
}

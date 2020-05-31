import 'dart:io';

import 'package:args/command_runner.dart';

import '../stubs/stubs.dart';
import '../utils/name.dart';

class MakePageSubcommand extends Command {
  @override
  String get name => 'page';

  @override
  String get description => 'Create a new page.';

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

    await Directory(directoryPath).create();
    await file.writeAsString(
      argResults['stateful']
          ? PageStatefulStub(name).filled
          : PageStatelessStub(name).filled,
    );

    print('Page created successfully.');
  }
}

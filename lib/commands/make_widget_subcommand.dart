import 'dart:io';

import 'package:args/command_runner.dart';

import '../stubs/stubs.dart';
import '../utils/name.dart';

class MakeWidgetSubcommand extends Command {
  @override
  String get name => 'widget';

  @override
  String get description => 'Create a new widget.';

  MakeWidgetSubcommand() {
    argParser.addFlag('stateful', negatable: false);
  }

  @override
  void run() async {
    if (argResults.rest.isEmpty) {
      throw UsageException('Missing "name" argument.', usage);
    }

    var name = argResults.rest.first;

    var directoryPath = 'lib/widgets';
    var file = File('$directoryPath/${name.toSnakeCase()}.dart');

    if (await file.exists()) {
      throw Exception('Widget already exists!');
    }

    await Directory(directoryPath).create();
    await file.writeAsString(
      argResults['stateful']
          ? WidgetStatefulStub(name).filled
          : WidgetStatelessStub(name).filled,
    );

    print('Widget created successfully.');
  }
}

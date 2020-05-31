import 'dart:io';

import 'package:args/command_runner.dart';

import '../utils/name.dart';
import '../wand.dart';

class MakeWidgetSubcommand extends Command {
  @override
  String get name => 'widget';

  @override
  String get description => 'Create a new widget class.';

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

    var stub = await getStub(
      argResults['stateful'] ? 'widget_stateful' : 'widget_stateless',
    );
    var widget = fillName(stub, name);

    await Directory(directoryPath).create();
    await file.writeAsString(widget);

    print('Widget created successfully.');
  }
}

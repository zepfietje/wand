import 'package:args/command_runner.dart';

import '../commands/commands.dart';

class MakeCommand extends Command {
  @override
  String get name => 'make';

  @override
  String get description => 'Create a new class.';

  MakeCommand() {
    addSubcommand(MakeBlocSubcommand());
    addSubcommand(MakeModelSubcommand());
    addSubcommand(MakePageSubcommand());
    addSubcommand(MakeRepositorySubcommand());
    addSubcommand(MakeWidgetSubcommand());
  }
}

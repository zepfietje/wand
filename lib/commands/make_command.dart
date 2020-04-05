import 'package:args/command_runner.dart';

import '../commands/commands.dart';

class MakeCommand extends Command {
  @override
  final name = 'make';

  @override
  final description = 'Create a new class.';

  MakeCommand() {
    addSubcommand(MakeBlocSubcommand());
    addSubcommand(MakeModelSubcommand());
    addSubcommand(MakeRepositorySubcommand());
    addSubcommand(MakeScreenSubcommand());
    addSubcommand(MakeWidgetSubcommand());
  }
}

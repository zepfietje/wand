import 'package:dart_style/dart_style.dart';

import '../utils/name.dart';

abstract class Stub {
  Stub(this.name);

  final String name;

  String get template;

  String get filled => DartFormatter().format(
        template
            .replaceAll('{{ noCaseName }}', name.toNoCase())
            .replaceAll('{{ pascalCaseName }}', name.toPascalCase())
            .replaceAll('{{ snakeCaseName }}', name.toSnakeCase()),
      );
}

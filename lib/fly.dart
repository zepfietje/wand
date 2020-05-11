import 'dart:io';

import 'utils/name.dart';

String get packageDirectory =>
    Platform.script.toFilePath().replaceAll('/bin/main.dart', '');

Future<String> getStub(String name) async =>
    File('$packageDirectory/lib/stubs/$name.stub').readAsString();

String fillName(String stub, String name) => stub
    .replaceAll('{{ noCaseName }}', name.toNoCase())
    .replaceAll('{{ pascalCaseName }}', name.toPascalCase())
    .replaceAll('{{ snakeCaseName }}', name.toSnakeCase());

import '../stubs/stub.dart';

class BlocEventStub extends Stub {
  BlocEventStub(String name) : super(name);

  @override
  String get template => '''
    part of '{{ snakeCaseName }}_bloc.dart';

    abstract class {{ pascalCaseName }}Event extends Equatable {
      const {{ pascalCaseName }}Event();
    }
  ''';
}

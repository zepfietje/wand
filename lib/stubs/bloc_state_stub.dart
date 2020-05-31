import '../stubs/stub.dart';

class BlocStateStub extends Stub {
  BlocStateStub(String name) : super(name);

  @override
  String get template => '''
    part of '{{ snakeCaseName }}_bloc.dart';

    abstract class {{ pascalCaseName }}Event extends Equatable {
      const {{ pascalCaseName }}Event();
    }
  ''';
}

import '../stubs/stub.dart';

class BlocEventStub extends Stub {
  BlocEventStub(String name) : super(name);

  @override
  String get template => '''
    part of '{{ snakeCaseName }}_bloc.dart';

    abstract class {{ pascalCaseName }}State extends Equatable {
      const {{ pascalCaseName }}State();
    }

    class {{ pascalCaseName }}Initial extends {{ pascalCaseName }}State {
      @override
      List<Object> get props => [];
    }
  ''';
}

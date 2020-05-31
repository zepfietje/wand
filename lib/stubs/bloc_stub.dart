import '../stubs/stub.dart';

class BlocStub extends Stub {
  BlocStub(String name) : super(name);

  @override
  String get template => '''
    import 'dart:async';

    import 'package:bloc/bloc.dart';
    import 'package:equatable/equatable.dart';

    part '{{ snakeCaseName }}_event.dart';
    part '{{ snakeCaseName }}_state.dart';

    class {{ pascalCaseName }}Bloc extends Bloc<{{ pascalCaseName }}Event, {{ pascalCaseName }}State> {
      @override
      {{ pascalCaseName }}State get initialState => {{ pascalCaseName }}Initial();

      @override
      Stream<{{ pascalCaseName }}State> mapEventToState(
        {{ pascalCaseName }}Event event,
      ) async* {
        // TODO: implement mapEventToState
      }
    }
  ''';
}

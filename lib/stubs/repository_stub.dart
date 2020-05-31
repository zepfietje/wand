import '../stubs/stub.dart';

class RepositoryStub extends Stub {
  RepositoryStub(String name) : super(name);

  @override
  String get template => '''
    import 'package:meta/meta.dart';

    import '../api/api.dart';
    import '../models/models.dart';

    class {{ pascalCaseName }}Repository {
      {{ pascalCaseName }}Repository({
        @required this.client,
      }) : assert(client != null);

      final Client client;
    }
  ''';
}

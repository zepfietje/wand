import '../stubs/stub.dart';

class WidgetStatelessStub extends Stub {
  WidgetStatelessStub(String name) : super(name);

  @override
  String get template => '''
    import 'package:flutter/material.dart';

    class {{ pascalCaseName }} extends StatelessWidget {
      const {{ pascalCaseName }}({
        Key key,
      }) : super(key: key);
      
      @override
      Widget build(BuildContext context) {
        return Container();
      }
    }
  ''';
}

import '../stubs/stub.dart';

class PageStatelessStub extends Stub {
  PageStatelessStub(String name) : super(name);

  @override
  String get template => '''
    import 'package:flutter/material.dart';

    class {{ pascalCaseName }}Page extends StatelessWidget {
      const {{ pascalCaseName }}Page({
        Key key,
      }) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Container(),
        );
      }
    }
  ''';
}

import '../stubs/stub.dart';

class PageStatefulStub extends Stub {
  PageStatefulStub(String name) : super(name);

  @override
  String get template => '''
    import 'package:flutter/material.dart';

    class {{ pascalCaseName }}Page extends StatefulWidget {
      const {{ pascalCaseName }}Page({
        Key key,
      }) : super(key: key);

      @override
      _{{ pascalCaseName }}PageState createState() => _{{ pascalCaseName }}PageState();
    }

    class _{{ pascalCaseName }}PageState extends State<{{ pascalCaseName }}Page> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Container(),
        );
      }
    }
  ''';
}

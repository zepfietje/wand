import '../stubs/stub.dart';

class WidgetStatefulStub extends Stub {
  WidgetStatefulStub(String name) : super(name);

  @override
  String get template => '''
    import 'package:flutter/material.dart';

    class {{ pascalCaseName }} extends StatefulWidget {
      const {{ pascalCaseName }}({
        Key key,
      }) : super(key: key);
      
      @override
      _{{ pascalCaseName }}State createState() => _{{ pascalCaseName }}State();
    }

    class _{{ pascalCaseName }}State extends State<{{ pascalCaseName }}> {
      @override
      Widget build(BuildContext context) {
        return Container();
      }
    }
  ''';
}

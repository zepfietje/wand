import '../stubs/stub.dart';

class ModelStub extends Stub {
  ModelStub(String name) : super(name);

  @override
  String get template => '''
    import 'package:equatable/equatable.dart';

    class {{ pascalCaseName }} extends Equatable {
      const {{ pascalCaseName }}({
        this.id,
      });

      final int id;

      @override
      List<Object> get props => [
            id,
          ];

      factory {{ pascalCaseName }}.fromJson(Map<String, dynamic> json) {
        return {{ pascalCaseName }}(
          id: json['id'],
        );
      }

      Map<String, dynamic> toJson() {
        return {
          'id': id,
        };
      }

      {{ pascalCaseName }} copyWith({
        int id,
      }) {
        return {{ pascalCaseName }}(
          id: id ?? this.id,
        );
      }
    }
  ''';
}

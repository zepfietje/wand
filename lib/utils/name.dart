extension Name on String {
  /// Converts a name from PascalCase or a single word to no case.
  String toNoCase() =>
      replaceAllMapped(RegExp('[A-Z]'), (match) => ' ${match[0]}')
          .trim()
          .toLowerCase();

  /// Converts a name from PascalCase or a single word to PascalCase.
  String toPascalCase() {
    return toNoCase()
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join();
  }

  /// Converts a name from PascalCase or a single word to snake_case.
  String toSnakeCase() => toNoCase().replaceAll(' ', '_');
}

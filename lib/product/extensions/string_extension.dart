extension StringExtension on String {
  String get upperFirstLetter => replaceFirst(this[0], this[0].toUpperCase());
}

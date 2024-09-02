// models.dart
class Group {
  String name;
  String accountType;
  List<String> members;

  Group({
    required this.name,
    required this.accountType,
    this.members = const [],
  });
}

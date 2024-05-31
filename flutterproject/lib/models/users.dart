class User {
  final String name;
  final String email;
  final bool isApproved;

  User({
    required this.name,
    required this.email,
    required this.isApproved,
  });

  String? get status => null;

  static fromJson(user) {}

  
}

class UsernameChange {
  String username;
  UsernameChange({required this.username});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    return data;
  }
}

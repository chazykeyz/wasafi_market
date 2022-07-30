class Subscribe {
  List<dynamic> followers;
  Subscribe({required this.followers});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['followers'] = followers;
    return data;
  }
}

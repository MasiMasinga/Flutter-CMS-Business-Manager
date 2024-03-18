class User {
  final String? id;
  final String? name;
  final String? email;
  final String? password;

  User({this.id, this.name, this.email, this.password});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        password = json['password'];
}

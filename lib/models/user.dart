class User {
  late int? id;
  late String? firstname;
  late String? lastname;
  late String? email;
  late String? password;
  late String? phone_number;
  late String? avatar_url;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone_number,
       required this.password,
    required this.avatar_url,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      firstname: data['firstname'].toString(),
      lastname: data['lastname'].toString(),
      email: data['email'].toString(),
      phone_number: data['phone_number'].toString(),
      avatar_url: data['avatar_url'].toString(),
      password: data['paasword'].toString(),
    );
  }
}

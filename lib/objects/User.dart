class User {
  final int userID;
  final String email;
  final String firstName;
  final String lastName;
  final String avatarURL;

  const User({
    required this.userID,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatarURL
  });

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      userID: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatarURL: json['avatar']
    );
  }
}
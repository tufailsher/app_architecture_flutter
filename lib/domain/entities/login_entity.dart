class LoginEntity{
  final String email;
  final String password;
  const LoginEntity({required this.email,required this.password});

    Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

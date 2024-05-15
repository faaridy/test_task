class UserResponse {
  String name;
  String email;
  String phone;

  UserResponse({required this.name, required this.email, required this.phone});

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
      };

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
      );
}
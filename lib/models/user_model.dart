class UserModel {
  final String id;
  final String username;
  final String? email;
  final String? profileImage;

  const UserModel({
    required this.id,
    required this.username,
    this.email,
    this.profileImage,
  });
}

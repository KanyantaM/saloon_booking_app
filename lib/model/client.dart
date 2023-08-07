class Client {
  late String name;
  late String? id;
  late String email;
  late String password;
  late String? profilePhoto;

  Client(
      {required this.name,
      required this.email,
      required this.password,
      this.id,
      this.profilePhoto});
}

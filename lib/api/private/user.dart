class User {
  String id;
  String username;

  User(this.id, this.username);

  factory User.from(final payload) {
    return User(
      payload['id'],
      payload['username'],
    );
  }
}
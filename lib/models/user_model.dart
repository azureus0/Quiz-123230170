class User {
  String username;
  String password;

  User({required this.username, required this.password});
}

User user1 = User(username: '170', password: '170');
User user2 = User(username: 'owi', password: '123');
User user3 = User(username: 'wowo', password: '123');

List<User> userList = [user1, user2, user3];

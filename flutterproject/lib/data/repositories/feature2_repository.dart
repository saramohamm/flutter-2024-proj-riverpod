import 'dart:convert';
import '../../models/user.dart';
import '../data_providers/feature2_data_provider.dart';

class UsersRepository {
  final UsersDataProvider _usersDataProvider;

  UsersRepository(this._usersDataProvider);

  Future<List<User>> getUsers() async {
    final response = await _usersDataProvider.getUsers();
    final users = jsonDecode(response);
    final allUsers = <User>[];
    for (final user in users) {
      allUsers.add(User.fromJson(user));
    }
    return allUsers;
  }

  Future<User> getUser(String email) async {
    final response = await _usersDataProvider.getUserByEmail(email);
    final user = jsonDecode(response);
    return User.fromJson(user);
  }

  Future<void> createUser(User user, String token) async {
    await _usersDataProvider.addUser({
      'name': user.name,
      'email': user.email,
      'isApproved': user.isApproved,
    }, token);
  }

  Future<void> updateUser(User user, String token) async {
    await _usersDataProvider.updateUser({
      'name': user.name,
      'email': user.email,
      'isApproved': user.isApproved,
    }, token);
  }

  Future<void> deleteUser(String email, String token) async {
    await _usersDataProvider.deleteUser(email, token);
  }

  Future<void> approveUser(String email, String token) async {
    await _usersDataProvider.updateUser({
      'email': email,
      'isApproved': true,
    }, token);
  }

  Future<void> suspendUser(String email, String token) async {
    await _usersDataProvider.updateUser({
      'email': email,
      'isApproved': false,
    }, token);
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

class UsersDataProvider {
  final String baseUrl;

  UsersDataProvider(this.baseUrl);

  Future<String> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<String> getUserByEmail(String email) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$email'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<void> addUser(Map<String, dynamic> user, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(user),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add user');
    }
  }

  Future<void> updateUser(Map<String, dynamic> user, String token) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/${user['email']}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(user),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }
//////
  Future<void> deleteUser(String email, String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/users/$email'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}

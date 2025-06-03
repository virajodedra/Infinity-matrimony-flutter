// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// import '../user_class.dart';
//
// class ApiService {
//   // Replace this with your MockAPI URL
//   static const String baseUrl = 'https://67b41a5c392f4aa94fa95325.mockapi.io/todo/matrimony';
//
//   // 1. Create User in MockAPI
//   // Future<void> createUser(Map<String, dynamic> userData) async {
//   //   final response = await http.post(
//   //     Uri.parse(baseUrl),
//   //     headers: {'Content-Type': 'application/json'},
//   //     body: json.encode(userData),
//   //   );
//   //
//   //   if (response.statusCode == 201) {
//   //     print('User Created in MockAPI');
//   //   } else {
//   //     print('Failed to Create User in MockAPI');
//   //   }
//   // }
//   Future<User> createUser(User user) async {
//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(user.toJson()),
//     );
//     if (response.statusCode == 201) {
//       return User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to create user: ${response.statusCode}');
//     }
//   }
//   // 2. Get All Users from MockAPI
//   Future<List<Map<String, dynamic>>> getUsers() async {
//     final response = await http.get(Uri.parse(baseUrl));
//
//     if (response.statusCode == 200) {
//       // Parse the JSON response into a list of users
//       List<Map<String, dynamic>> users = List<Map<String, dynamic>>.from(
//           json.decode(response.body) as List);
//       return users;
//     } else {
//       throw Exception('Failed to load users from MockAPI');
//     }
//   }
//
//   // 3. Update User in MockAPI
//   Future<bool> updateUser(String id, Map<String, dynamic> userData) async {
//     final response = await http.put(
//       Uri.parse('$baseUrl/$id'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(userData),
//     );
//
//     if (response.statusCode == 200) {
//       print('User Updated in MockAPI');
//       return true; // Return true indicating success
//     } else {
//       print('Failed to Update User in MockAPI');
//       return false; // Return false if update failed
//     }
//   }
//
//   // 4. Delete User from MockAPI
//   Future<bool> deleteUser(String id) async {
//     final response = await http.delete(
//       Uri.parse('$baseUrl/$id'),
//     );
//
//     if (response.statusCode == 200) {
//       print('User Deleted from MockAPI');
//       return true; // Return true indicating success
//     } else {
//       print('Failed to Delete User from MockAPI');
//       return false; // Return false if delete failed
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../user_class.dart';

class ApiService {
  static const String baseUrl = 'https://67b41a5c392f4aa94fa95325.mockapi.io/todo/matrimony';

  // Get All Users - Return List<User>
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  }

  // Create User - Return the created User
  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create user: ${response.statusCode}');
    }
  }

  // Update User - Return the updated User
  // Future<User> updateUser(String id, User user) async {
  //   final response = await http.put(
  //     Uri.parse('$baseUrl/$id'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(user.toJson()),
  //   );
  //   if (response.statusCode == 200) {
  //     return User.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to update user: ${response.statusCode}');
  //   }
  // }
  Future<User> updateUser(String id, User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update user: ${response.statusCode}');
    }
  }

  // Delete User - Return void
  Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete user: ${response.statusCode}');
    }
  }
}
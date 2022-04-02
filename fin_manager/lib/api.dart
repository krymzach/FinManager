// Required Imports
import 'package:fin_manager/auth_page.dart';
import 'package:fin_manager/hash.dart';
import 'package:fin_manager/main.dart';
import 'package:fin_manager/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


// Future<bool> deleteUser(String id) async {
//   final response = await http.delete(
//     Uri.parse('http://192.168.4.30:3000/users/' + id),
//   );
//   if(response.statusCode == 200) {
//     return true;
//   } else {
//     throw Exception('Something Went Wrong');
//   }
// }





/* Function that takes in an email from a form submitted by a user and waits for
   a HTTP response that contains JSON for all of the information related to that
   user. That information is then returned in a User object. */
Future<User> fetchUser(String email) async {
  var apiLink = 'http://localhost:3000/users/email/' + email;
  final response = await http
    .get(Uri.parse(apiLink));
  if (response.statusCode == 200) {
    return(User.fromJson(jsonDecode(response.body)));
  } else {
    throw Exception('Failed to load user');
  }
}

/* Function that takes in an ID, usually from the Shared Preferences stored in
   the device. This ID is then used to retrieve a HTTP response with JSON data
   for the specific user. This data is then returned in a User object. */
Future<User> fetchUserById(String id) async {
  var apiLink = 'http://localhost:3000/users/' + id;
  final response = await http
    .get(Uri.parse(apiLink));
  if(response.statusCode == 200) {
    return(User.fromJson(jsonDecode(response.body)));
  } else {
    throw Exception('Failed to load user');
  }
}


/* Function that resets variables stored in the Shared Preferences, requiring
   that the user sign in to reenter the application. */
signOut(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('signed_in', false);
  await prefs.setString('id', "");
  Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthPage()));
}


signInUser(BuildContext context, String email, String pass) async {
  User user = await fetchUser(email);
  if (user.password == hashPassword(pass)) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('signed_in', true);
    await prefs.setString('id', user.id);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(user: user)));
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthPage(error: "Incorrect Login Credentials",)));
  }
}


signInUserId(BuildContext context, String id) async {
  User user = await fetchUserById(id);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('signed_in', true);
  await prefs.setString('id', user.id);
  Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(user: user)));
}


signUpUser(String name, String email, String pass, String confPass, BuildContext context) async {
  if(pass == confPass) {
    final response = await http.post(
      Uri.parse('http://localhost:3000/users'),
      headers: {
        "Content-Type": "application/json",
      },
      encoding: Encoding.getByName('utf-8'),
      body: jsonEncode(<String, dynamic>{
        "full_name": name,
        "email": email,
        "password": pass,
      }),
    );
    if(response.statusCode == 200) {
      signInUser(context, email, pass);
    } else {
      throw Exception('Failed to create user');
    }
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthPage(error: "Your Passwords Don't Match",)));
  }
}


// Future createGame(DateTime date, String level, String address, String homeTeam, String awayTeam, String name, String assignorID) async {
//   String dateString = date.toString();
//   final response = await http.post(
//     Uri.parse('http://localhost:3000/games'),
//     headers: {
//       "Content-Type": "application/json",
//     },
//     encoding: Encoding.getByName('utf-8'),
//     body: jsonEncode(<String, dynamic>{
//       "sport": "soccer",
//       "date_time": "$dateString",
//       "level": "$level",
//       "location_address": "$address",
//       "location_name": "$name",
//       "home_team": "$homeTeam",
//       "away_team": "$awayTeam",
//       "assignor": "$assignorID"
//     }),
//   );
//   if(response.statusCode == 200) {
//     return true;
//   } else {
//     throw Exception('Failed to create game');
//   }
// }

// Future editGame(DateTime date, String level, String address, String homeTeam, String awayTeam, String name, String gameID) async {
//   String dateString = date.toString();
//   final response = await http.put(
//     Uri.parse('http://localhost:3000/games/' + gameID),
//     headers: {
//       "Content-Type": "application/json",
//     },
//     encoding: Encoding.getByName('utf-8'),
//     body: jsonEncode(<String, dynamic>{
//       "date_time": "$dateString",
//       "level": "$level",
//       "location_address": "$address",
//       "location_name": "$name",
//       "home_team": "$homeTeam",
//       "away_team": "$awayTeam",
//     }),
//   );
//   if(response.statusCode == 200) {
//     return true;
//   } else {
//     throw Exception('Failed to create game');
//   }
// }
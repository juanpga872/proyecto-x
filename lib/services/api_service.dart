// import 'dart:convert';
// //import 'package:http/http.dart' as http;

// class ApiService {
//   final String apiUrl = "https://api.example.com/tweets";

//   Future<List<dynamic>> fetchTweets() async {
//     final response = await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);  // Decodifica la respuesta JSON
//     } else {
//       throw Exception('Failed to load tweets');
//     }
//   }
// }

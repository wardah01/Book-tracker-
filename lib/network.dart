import 'dart:convert';
import 'package:book_tracker/Models/book_model.dart';
import 'package:http/http.dart' as http;

class Network {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<BookModel>> searchBooks(String query) async {
    var url = Uri.parse('$_baseUrl?q=$query');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print('Successful call');
      var data = jsonDecode(response.body);
      if (data['items'] != null && data['items'] is List) {
        List<BookModel> books = (data['items'] as List<dynamic>)
            .map((book) => BookModel.fromJson(book as Map<String, dynamic>))
            .toList();
        if (books.isNotEmpty) {
          print("First book title: ${books[1].title}");
        


        }
        return books;
      } else {
        return [];
      }
    } else {
      print("API Error: ${response.statusCode}: ${response.body}");
      return [];
    }
  }
}


// Check → Decode → Validate → Map → Return


// Did API succeed?

//      Yes → Decode JSON

//          Did it have books?

//               Yes → Convert to models, return them

//               No → Return empty list

//      No → Print error, return empty list
import 'package:book_tracker/Components/gridview_widget.dart';
import 'package:book_tracker/Models/book_model.dart';
import 'package:book_tracker/Models/utils/detail_args.dart';
import 'package:book_tracker/network.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Network network = Network();
  List<BookModel> _books = [];
  Future<void> fetchBooks(query) async {
    try {
      var data = await network.searchBooks(query);
      setState(() {
        _books = data;
      });
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  void initState() {
    fetchBooks('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for books',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                onSubmitted: (query) => fetchBooks(query),
              ),
            ),
            GridViewWidget(books: _books),

            // Expanded(
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: ListView.builder(
            //       itemCount: _books.length,
            //       itemBuilder: (context,index){
            //     BookModel book=_books[index];
            //       return ListTile(
            //         title: Text(book.title),
            //       );
            //     }),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

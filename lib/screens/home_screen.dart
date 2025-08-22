import 'package:book_tracker/Models/book_model.dart';
import 'package:book_tracker/Models/utils/detail_args.dart';
import 'package:book_tracker/network.dart';
import 'package:book_tracker/screens/details_screen.dart';
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
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5,
                ),
                itemCount: _books.length,
                itemBuilder: (context, index) {
                  BookModel book = _books[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          print('tapped');
                          Navigator.pushNamed(context,
                           '/details',
                          arguments: BookDetailsArguments(itemBook:book),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(book.title),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(book.authors.join(',')),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

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



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
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
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
                          Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: BookDetailsArguments(itemBook: book),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.network(
                                                         'https://cors-anywhere.herokuapp.com/${book.thumbnail}' ??
                                    'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D',
                                width: 150,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(book.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(18.0),
                            //   child: Text(book.authors.join(',')),
                            // ),
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

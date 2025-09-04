
import 'package:book_tracker/Models/book_model.dart';
import 'package:book_tracker/Models/utils/detail_args.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required List<BookModel> books,
  }) : _books = books;

  final List<BookModel> _books;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                        'https://cors-anywhere.herokuapp.com/${book.thumbnail}',
                        width: 150,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        book.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
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
    );
  }
}

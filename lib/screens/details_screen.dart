import 'package:book_tracker/Models/utils/detail_args.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as BookDetailsArguments;
    final book = args.itemBook;
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.network(
                    'https://cors-anywhere.herokuapp.com/${book.thumbnail}',
                    width: 150,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  book.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  'Authors: ${book.authors.join(', ')}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Publish Date: ${book.publishedDate}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Page Count: ${book.pageCount}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(onPressed: (){}, label: Text('Favourites'),
                      icon: Icon(Icons.bookmark),
                      style: ElevatedButton.styleFrom(
    backgroundColor: Theme.of(context).colorScheme.secondary, // button color
    foregroundColor: Theme.of(context).colorScheme.primary, // text & icon color
  ),
                      ),
                      ElevatedButton.icon(onPressed: (){}, label: Text('Favourites'),
                      icon: Icon(Icons.favorite),
                        style: ElevatedButton.styleFrom(
    backgroundColor: Theme.of(context).colorScheme.secondary, // button color
    foregroundColor: Theme.of(context).colorScheme.primary, // text & icon color
  ),
                      )
                    ],
                  ),
                ),
                Text(
                  'Description:',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(book.description ?? 'no description'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

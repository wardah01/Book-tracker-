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
          child: Column(
            children: [
               Image.network(
                           'https://cors-anywhere.herokuapp.com/${book.thumbnail}' ??
                                  'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D',
                              width: 150,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
              Text(book.title,
              style: Theme.of(context).textTheme.headlineSmall,),
              Text(
                'Authors: ${(book.authors == null || book.authors!.isEmpty) ? 'Unknown' : book.authors!.join(', ')}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text('Publish Date: ${book.publishedDate}',
              style:Theme.of(context).textTheme.bodyLarge, ),
              Text('Page Count: ${book.pageCount}',
              style:Theme.of(context).textTheme.bodyLarge,),
            ],
          ),
        ),
      ),
    );
  }
}

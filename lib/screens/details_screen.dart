import 'package:book_tracker/Models/book_model.dart';
import 'package:book_tracker/Models/utils/detail_args.dart';
import 'package:book_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final args=  ModalRoute.of(context)!.settings.arguments as BookDetailsArguments;
final book=args.itemBook;
    return Scaffold(
        appBar: AppBar(
          title: Text(book.title),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        body: 
        Center(child: 
        Column(
          children: [
          
            Text('Authors:${book.authors.join(', ')}'
           // style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('Publish Date:${book.publishedDate}'),
            Text('Page Count:${book.pageCount}')
          ],
        ),),
    );
  }
}
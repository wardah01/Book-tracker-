import 'package:book_tracker/screens/details_screen.dart';
import 'package:book_tracker/screens/favourites_screen.dart';
import 'package:book_tracker/screens/home_screen.dart';
import 'package:book_tracker/screens/saved_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:  ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF4E342E),     // Deep brown
          onPrimary: Colors.white,        // Text on primary
          secondary: Color.fromARGB(255, 241, 177, 130),
          onSecondary: Colors.black,      // Text on secondary
          error: Colors.red,
          onError: Colors.white,
          surface: Color.fromARGB(255, 231, 216, 168),  // Creamy beige
          onSurface: Color(0xFF3E2723),// Text color
      
         
        ),
       
      ),
      initialRoute: '/',
      routes: {
        '/home' : (context)=> HomeScreen(),
         '/saved' : (context)=> SavedScreen(),
          '/favourites' : (context)=> FavouritesScreen(),
           '/details' : (context)=> DetailsScreen(),
      },
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex=0;
  final List<Widget> _screens=[
   HomeScreen(),
   SavedScreen(),
   FavouritesScreen(),

  ];

@override

  @override
  Widget build(BuildContext context, ) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.surface ,
      appBar: AppBar(
        title: Text('Book Tracker'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),

      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.save),label: 'Saved'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favourites'),
      ],
      selectedItemColor: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: Theme.of(context).colorScheme.primary,
      onTap: (value) {
          print('value: $value');
          setState(() {
           _currentIndex=value;
           print('current index: $_currentIndex');
          });
      },
      ),
    );
    
    
  }
}
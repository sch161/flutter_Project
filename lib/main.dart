import 'package:flutter/material.dart';
import 'package:flutter_project/models/book.dart';
import 'package:flutter_project/screens/add_screen.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/screens/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Book> books = [];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 화면 불러오기
    final screens = [
      HomeScreen(books: books),
      ListScreen(
        books: books,
        onBookDeleted: (book) {
          setState(() => books.remove(book));
        },
      ),
      AddScreen(
        onBookAdded: (book) {
          setState(() => books.add(book));
        },
      ),
    ];
    return MaterialApp(
      home: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: '리스트'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: '추가'),
          ],
        ),
      ),
    );
  }
}

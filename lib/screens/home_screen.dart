import 'package:flutter/material.dart';
import 'package:flutter_project/models/book.dart';

class HomeScreen extends StatefulWidget {
  final List<Book> books;

  const HomeScreen({required this.books});
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('나만의 책장'),
      ),

      body: Column(
        children: [
          Text('소년이 온다.'),
          Text('아낌없이 주는 나무'),
          Text('아몬드'),
          Text('전체 책 : ${widget.books.length}')
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '리스트',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '추가',
          ),
        ],
      ),

    );

  }
}
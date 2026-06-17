import 'package:flutter/material.dart';
import 'package:flutter_project/models/book.dart';
import 'package:flutter_project/screens/detail_screen.dart';
import 'package:flutter_project/const/colors.dart';

class ListScreen extends StatefulWidget {
  final List<Book> books; // book
  final Function(Book) onBookDeleted; // 삭제
  const ListScreen({required this.books, required this.onBookDeleted});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // 책 상태 색
  Color _statusColor(String status) {
    switch (status) {
      case '읽음':
        return Colors.green;
      case '읽는 중':
        return Colors.blue;
      case '읽고 싶은':
        return Colors.orange;
      default:
        return primaryColor;
    }
  }

  // 책 카테고리
  String selectedFilter = '전체';

  @override
  Widget build(BuildContext context) {
    final filteredBooks = selectedFilter == '전체'
        ? widget.books
        : widget.books.where((book) => book.status == selectedFilter).toList();

    return Scaffold(
      backgroundColor: backgroundColor,

      // 상단 바
      appBar: AppBar(
        title: Text('책 목록', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          // 카테고리 필터링
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: ['전체', '읽고 싶은', '읽는 중', '읽음'].map((filter) {
                final isSelected = selectedFilter == filter;
                return GestureDetector(
                  onTap: () => setState(() => selectedFilter = filter),
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? _statusColor(filter).withOpacity(0.1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      filter,
                      style: TextStyle(
                        color: isSelected ? _statusColor(filter) : Colors.grey,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 15),
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                return Dismissible(
                  key: Key(book.title),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    widget.onBookDeleted(book);
                  },

                  // 책 하나 카드
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(book: book),
                      ),
                    ),
                    child: Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              book.author,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _statusColor(
                                      book.status,
                                    ).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    book.status,
                                    style: TextStyle(
                                      color: _statusColor(book.status),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                ...List.generate(
                                  5,
                                  (i) => Icon(
                                    i < book.rating
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

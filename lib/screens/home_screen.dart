import 'package:flutter/material.dart';
import 'package:flutter_project/models/book.dart';
import 'package:flutter_project/const/colors.dart';

class HomeScreen extends StatefulWidget {
  final List<Book> books;

  const HomeScreen({required this.books});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // 상단 바
      appBar: AppBar(
        title: Text('나만의 책장', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),

      // 전체 책, 읽은 책, 최근 등록 책 3개
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 전체 책
                Card(
                  color: Color(0xFFEEEEFF),
                  child: SizedBox(
                    width: 150,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            '${widget.books.length}',
                            style: TextStyle(
                              fontSize: 32,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text('전체 책', style: TextStyle(color: primaryColor)),
                        ],
                      ),
                    ),
                  ),
                ),

                // 읽은 책
                Card(
                  color: Color(0xFFEEFFEE),
                  child: SizedBox(
                    width: 150,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            '${widget.books.where((book) => book.status == "읽음").length}',
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('읽음', style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // 최근 등록한 책 텍스트
            SizedBox(
              height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '최근 등록한 책',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),

            // 최근 등록한 책 3권
            ...widget.books.reversed
                .take(3)
                .map(
                  (book) => Card(
                    color: boxColor,
                    margin: EdgeInsets.only(bottom: 8),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 책 제목
                          Text(
                            book.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          // 저자
                          Text(
                            book.author,
                            style: TextStyle(color: Colors.grey),
                          ),

                          SizedBox(height: 6),

                          // 책 상태 (읽음, 읽고 싶은, 읽는 중)
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

                              // 별점
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
          ],
        ),
      ),
    );
  }
}

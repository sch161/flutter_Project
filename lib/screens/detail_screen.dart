import 'package:flutter/material.dart';
import 'package:flutter_project/models/book.dart';
import 'package:flutter_project/const/colors.dart';

class DetailScreen extends StatefulWidget {
  final Book book;

  const DetailScreen({required this.book});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

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
    final book = widget.book;
    return Scaffold(
      backgroundColor: backgroundColor,

      // 상단 바
      appBar: AppBar(
        title: Text('책 상세', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 책 표지같은 네모 박스
            Center(
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),

            // 첵 제목
            Center(
              child: Text(
                book.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),

            // 저자
            Center(
              child: Text(book.author, style: TextStyle(color: Colors.grey)),
            ),
            SizedBox(height: 8),

            // 별점
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (i) => Icon(
                    i < book.rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 28,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // 상태 텍스트
                      Text('상태', style: TextStyle(fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),

                        // 상태
                        decoration: BoxDecoration(
                          color: _statusColor(book.status).withOpacity(0.1),
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
                    ],
                  ),
                  SizedBox(height: 12),

                  // 한줄평
                  Text(
                    '"${book.review}"',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

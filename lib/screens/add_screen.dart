import 'package:flutter/material.dart';
import 'package:flutter_project/models/book.dart';
import 'package:flutter_project/const/colors.dart';

class AddScreen extends StatefulWidget {
  final Function(Book) onBookAdded;
  const AddScreen({required this.onBookAdded});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  // TextField에 입력된 값을 가져옴 (TextEditingController)
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  // 상태, 별점 기본값
  String selectedStatus = '읽고 싶은';
  int selectedRating = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // 상단 바
      appBar: AppBar(
        title: Text('책 추가', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 책 제목
            Text('책 제목', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            TextField(controller: titleController, decoration: InputDecoration(hintText: '제목을 입력하세요', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none))),
            SizedBox(height: 16),

            // 저자
            Text('저자', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            TextField(controller: authorController, decoration: InputDecoration(hintText: '저자명을 입력하세요', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none))),
            SizedBox(height: 16),

            // 독서 상태 드롭다운
            Text('독서 상태', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: DropdownButton<String>(
                value: selectedStatus,
                isExpanded: true,
                underline: SizedBox(),
                items: ['읽고 싶은', '읽는 중', '읽음'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                onChanged: (value) => setState(() => selectedStatus = value!),
              ),
            ),
            SizedBox(height: 16),

            // 별점
            Text('별점', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: List.generate(5, (index) => IconButton(
                icon: Icon(index < selectedRating ? Icons.star : Icons.star_border, color: Colors.amber, size: 32),
                onPressed: () => setState(() => selectedRating = index + 1),
              )),
            ),

            // 한줄평
            Text('한줄평', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            TextField(controller: reviewController, decoration: InputDecoration(hintText: '감상을 입력하세요', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none))),
            SizedBox(height: 24),

            // 등록하기 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor, foregroundColor: Colors.white, padding: EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                onPressed: () { // 데이터 넘겨주기
                  final book = Book(title: titleController.text, author: authorController.text, review: reviewController.text, rating: selectedRating, status: selectedStatus);
                  widget.onBookAdded(book);
                },
                child: Text('등록하기', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
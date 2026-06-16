import 'package:flutter/material.dart';
import 'package:flutter_project/models/book.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  String selectedStatus = '읽고 싶은';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('책 추가'),
      ),

      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: '제목'),
          ),
          TextField(
            controller: authorController,
            decoration: InputDecoration(labelText: '저자'),
          ),
          TextField(
            controller: reviewController,
            decoration: InputDecoration(labelText: '한줄평'),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text('등록'),
          ),
        ],
      )
    );
  }
}

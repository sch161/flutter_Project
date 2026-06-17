import 'package:flutter/material.dart';

class Book {
  final String title; // 제목
  final String author; // 저자
  final String review; // 한줄평
  final int rating; // 별점
  final String status; // 책 상태

  Book({
    required this.title,
    required this.author,
    required this.review,
    required this.rating,
    required this.status,
  });

}

class Book {
  final String title; // 제목
  final String author; // 저자
  final String status; // 상태 (읽는 중, 읽음, 읽고 싶음)
  final String review; // 한줄평

  Book({
    required this.title,
    required this.author,
    required this.status,
    required this.review,
  });
}

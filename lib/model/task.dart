import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String content;
  final bool isAchieved;
  final DateTime time;

  Task({required this.content, required this.isAchieved, required this.time});

  factory Task.fromDocument(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;
    return Task(
      content: json['content'],
      isAchieved: json['is_achieved'],
      time: json['time'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'isAchieved': isAchieved,
      'time': time,
    };
  }
}

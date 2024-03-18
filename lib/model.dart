/// 講師
class Lecturer {
  /// 姓名
  final String name;
  /// 職稱
  final String title;
  /// URL
  final String imageUrl;
  /// 授課列表
  final List<Course> courses;

  const Lecturer({
    required this.name,
    required this.title,
    required this.imageUrl,
    required this.courses,
  });
}

/// 課程
class Course {
  /// 名稱
  final String name;
  /// 簡介
  final String description;
  /// 上課星期
  final String day;
  /// 上課時間
  final String time;

  const Course({
    required this.name,
    required this.description,
    required this.day,
    required this.time,
  });
}
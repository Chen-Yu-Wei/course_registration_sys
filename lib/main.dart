import 'package:course_registration_sys/viewModel.dart';
import 'package:flutter/material.dart';

import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('講師清單'),
      ),
      body: lecturerListView(LecturerListViewModel()),
    ));
  }

  /// 講師列表Widget
  Widget lecturerListView(LecturerListViewModel viewModel) {
    return StreamBuilder<List<Lecturer>>(
      stream: viewModel.getLecturerList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          var dataList = snapshot.requireData;
          return ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return LecturerDetail(lecturer: dataList[index]);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

/// 講師詳細資訊Widget
class LecturerDetail extends StatefulWidget {
  final Lecturer lecturer;
  const LecturerDetail({super.key, required this.lecturer});

  @override
  _LecturerDetailState createState() => _LecturerDetailState();
}

class _LecturerDetailState extends State<LecturerDetail> {
  /// 是否展開
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.black
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.lecturer.imageUrl),
            ),
            title: Text(
              widget.lecturer.title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            subtitle: Text(
              widget.lecturer.name,
              style: const TextStyle(fontSize: 17, color: Colors.black),
            ),
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.remove : Icons.add),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded)
            SizedBox(
              height: 230,
              // padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Divider(
                    height: 1.0,
                    color: Colors.grey,
                    indent: 16,
                    endIndent: 16,
                  ),
                  Expanded(
                    child: CourseListView(courses: widget.lecturer.courses),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// 課程列表Widget
class CourseListView extends StatelessWidget {
  final List<Course> courses;

  const CourseListView({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return courseCard(courses[index]);
        });
  }

  /// 課程詳細資訊
  Widget courseCard(Course course) {
    return ListTile(
      leading: const Icon(Icons.calendar_month_outlined),
      title: Text(course.name),
      subtitle: Text('${course.day},${course.time}'),
      trailing: IconButton(
        icon: const Icon(Icons.arrow_forward_ios_outlined),
        onPressed: () {
          // 導向課程詳情頁
        },
      ),
    );
  }
}

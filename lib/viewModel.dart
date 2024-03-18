import 'model.dart';

class LecturerListViewModel {

  Stream<List<Lecturer>> getLecturerList(){
    /// 講師列表
    final List<Lecturer> lecturers = [
      const Lecturer(
        name: 'Albert Flores',
        title: 'Demonstrator',
        imageUrl: '',
        courses: [
          Course(
            name: '基礎程式設計',
            description: '程式設計入門課程',
            day: '每週一',
            time: '10:00-12:00',
          ),
          Course(
            name: '人工智慧概論實作',
            description: 'AI 實作課程',
            day: '每週四',
            time: '14:00-16:00',
          ),
          Course(
            name: '訊號與系統',
            description: '系統相關課程',
            day: '每週五',
            time: '10:00-12:00',
          ),
        ],
      ),
      const Lecturer(
          name: 'Floyd Miles',
          title: 'Lecturer',
          imageUrl: '',
          courses: []
      ),
      const Lecturer(
          name: 'Savannah Nguyen',
          title: 'Senior Lecturer',
          imageUrl: '',
          courses: []
      ),
      const Lecturer(
          name: 'Jenny Wilson',
          title: 'Professor',
          imageUrl: '',
          courses: []
      ),
      const Lecturer(
          name: 'Floyd Miles',
          title: 'Professor',
          imageUrl: '',
          courses: []
      )
    ];
    return Stream.value(lecturers);
  }
}

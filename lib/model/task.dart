class Task {
  final String title;
  final String description;
  final String startTime;
  final String endTime;
  final String date;
  final String category;

  Task({required this.title, required this.description, required this.startTime, required this.endTime, required this.date, required this.category});
  static List<Task> tasks = [
    Task(title: 'title', description: 'Discuss All Question About New Project', startTime: '10:00 PM', endTime: '10:00 AM', date: DateTime.now().toString(), category: 'Development'),
    Task(title: 'title', description: 'Discuss All Question About New Project', startTime: '10:00 PM', endTime: '10:00 AM', date: DateTime.now().toString(), category: 'Development'),
    Task(title: 'title', description: 'Discuss All Question About New Project', startTime: '10:00 PM', endTime: '10:00 AM', date: DateTime.now().toString(), category: 'Development'),
    Task(
        title: 'title',
        description: 'Discuss All Question About New Project',
        startTime: '10:00 PM',
        endTime: '10:00 AM',
        date: DateTime.now().add(Duration(days: 1)).toString(),
        category: 'Development'),
    Task(
        title: 'title',
        description: 'Discuss All Question About New Project',
        startTime: '10:00 PM',
        endTime: '10:00 AM',
        date: DateTime.now().add(Duration(days: 2)).toString(),
        category: 'Development'),
    // Task(
    //     title: 'title',
    //     description: 'Discuss All Question About New Project',
    //     startTime: '10:00 PM',
    //     endTime: '10:00 AM',
    //     date: DateTime.now().add(Duration(days: 2)).toString(),
    //     category: 'Development'),
    // Task(
    //     title: 'title',
    //     description: 'Discuss All Question About New Project',
    //     startTime: '10:00 PM',
    //     endTime: '10:00 AM',
    //     date: DateTime.now().add(Duration(days: 3)).toString(),
    //     category: 'Development'),
    // Task(
    //     title: 'title',
    //     description: 'Discuss All Question About New Project',
    //     startTime: '10:00 PM',
    //     endTime: '10:00 AM',
    //     date: DateTime.now().add(Duration(days: 3)).toString(),
    //     category: 'Development'),
    // Task(
    //     title: 'title',
    //     description: 'Discuss All Question About New Project',
    //     startTime: '10:00 PM',
    //     endTime: '10:00 AM',
    //     date: DateTime.now().add(Duration(days: 1)).toString(),
    //     category: 'Development'),
    // Task(
    //     title: 'title',
    //     description: 'Discuss All Question About New Project',
    //     startTime: '10:00 PM',
    //     endTime: '10:00 AM',
    //     date: DateTime.now().add(Duration(days: 1)).toString(),
    //     category: 'Development'),
    // Task(
    //     title: 'title',
    //     description: 'Discuss All Question About New Project',
    //     startTime: '10:00 PM',
    //     endTime: '10:00 AM',
    //     date: DateTime.now().add(Duration(days: 2)).toString(),
    //     category: 'Development'),
    // Task(
    //     title: 'title',
    //     description: 'Discuss All Question About New Project',
    //     startTime: '10:00 PM',
    //     endTime: '10:00 AM',
    //     date: DateTime.now().add(Duration(days: 3)).toString(),
    //     category: 'Development')
  ];
}

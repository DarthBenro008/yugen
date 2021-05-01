class TodoModel {
  final int uniqueId;
  final int epochTime;
  final String taskName;
  final int isCompleted;
  final int deadlineTaskTime;
  final String filename;
  final String note;

  TodoModel({
    required this.uniqueId,
    required this.taskName,
    required this.note,
    required this.deadlineTaskTime,
    required this.epochTime,
    required this.isCompleted,
    required this.filename,
  });

  Map<String, dynamic> toMap() {
    return {
      'uniqueId': uniqueId,
      'taskName': taskName,
      'note': note,
      'deadlineTaskTime': deadlineTaskTime,
      'epochTime': epochTime,
      "isCompleted": isCompleted,
      'filename': filename,
    };
  }
}

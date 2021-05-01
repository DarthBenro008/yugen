class DiaryModel {
  final String title;
  final String note;
  final String fileName;
  final String listOfFiles;
  final int epochTime;
  final int uniqueId;
  DiaryModel(
      {required this.uniqueId,
      required this.epochTime,
      required this.title,
      required this.fileName,
      required this.listOfFiles,
      required this.note});

  Map<String, dynamic> toMap() {
    return {
      'uniqueId': uniqueId,
      'title': title,
      'note': note,
      'listOfFiles': listOfFiles,
      'epochTime': epochTime,
      "fileName": fileName,
    };
  }
}

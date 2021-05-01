class DiaryFilesModel {
  final String fileName;
  final String fileExtension;
  final int uniqueId;
  final int epochTime;

  DiaryFilesModel({
    required this.uniqueId,
    required this.fileExtension,
    required this.fileName,
    required this.epochTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'uniqueId': uniqueId,
      'fileName': fileName,
      'fileExtension': fileExtension,
      'epochTime': epochTime,
    };
  }
}

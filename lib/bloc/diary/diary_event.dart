part of 'diary_bloc.dart';

abstract class DiaryEvent extends Equatable {
  const DiaryEvent();

  @override
  List<Object> get props => [];
}

class AddDiaryData extends DiaryEvent {
  final DiaryModel diaryModel;

  AddDiaryData(this.diaryModel);

  @override
  List<Object> get props => [diaryModel];
}

class UpdateDiaryData extends DiaryEvent {
  final DiaryModel diaryModel;

  UpdateDiaryData(this.diaryModel);

  @override
  List<Object> get props => [diaryModel];
}

class RemoveDiaryData extends DiaryEvent {
  final int uniqueId;

  RemoveDiaryData(this.uniqueId);

  @override
  List<Object> get props => [uniqueId];
}

class ReadDiaryData extends DiaryEvent {
  ReadDiaryData();

  @override
  List<Object> get props => [];
}

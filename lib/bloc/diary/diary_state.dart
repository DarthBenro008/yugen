part of 'diary_bloc.dart';

abstract class DiaryState extends Equatable {
  const DiaryState();

  @override
  List<Object> get props => [];
}

class DiaryInitial extends DiaryState {}

class DiaryLoading extends DiaryState {}

class DiaryLoaded extends DiaryState {
  
}

class DiaryError extends DiaryState {}

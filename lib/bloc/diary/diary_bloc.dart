import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yugen/models/diaryModel.dart';

part 'diary_event.dart';
part 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc() : super(DiaryInitial());

  @override
  Stream<DiaryState> mapEventToState(
    DiaryEvent event,
  ) async* {
    
  }
}

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wastedrinkdl/repositories/ai_repository.dart';

part 'ai_event.dart';
part 'ai_state.dart';

class AiBloc extends Bloc<AiEvent, AiState> {
  AiBloc(this.aiRepositpry) : super(const AiState()) {
    on<GetPrediction>(predictions);
  }

  final AiRepository aiRepositpry;

  Future<void> predictions(GetPrediction event, Emitter<AiState> emit) async {
    try {
      if (state.status == AiStatus.success) {
        emit(state.copyWith(status: AiStatus.initial));
      }
      var res = await aiRepositpry.prediction(event.file);
      if (res == 'AluCan') {
        res = 'CAN';
      }
      emit(state.copyWith(status: AiStatus.success, result: res));
    } catch (e) {
      emit(state.copyWith(status: AiStatus.failure));
    }
  }
}

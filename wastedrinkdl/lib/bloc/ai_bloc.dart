import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wastedrinkdl/repositories/ai_repository.dart';

part 'ai_event.dart';
part 'ai_state.dart';

class AiBloc extends Bloc<AiEvent, AiState> {
  AiBloc(this.aiRepositpry) : super(AiState()) {
    on<GetPrediction>(predictions);
  }

  final AiRepository aiRepositpry;

  Future<void> predictions(GetPrediction event, Emitter<AiState> emit) async {
    try {
      await aiRepositpry.prediction(event.file);
      emit(state.copyWith(status: AiStatus.success));
    } catch (e) {
      print('$e');
      emit(state.copyWith(status: AiStatus.failure));
    }
  }
}

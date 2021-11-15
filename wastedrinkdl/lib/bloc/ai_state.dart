part of 'ai_bloc.dart';

enum AiStatus { initial, success, failure }

class AiState {
  final AiStatus status;

  AiState({this.status = AiStatus.initial});

  AiState copyWith({AiStatus? status}) {
    return AiState(status: status ?? this.status);
  }
}

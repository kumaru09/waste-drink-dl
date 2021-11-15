part of 'ai_bloc.dart';

enum AiStatus { initial, success, failure }

class AiState extends Equatable {
  final AiStatus status;
  final String? result;

  const AiState({this.status = AiStatus.initial, String? result})
      : result = result ?? '';

  AiState copyWith({AiStatus? status, String? result}) {
    return AiState(
        status: status ?? this.status, result: result ?? this.result);
  }

  @override
  String toString() {
    return 'AiState {status: $status, result: $result}';
  }

  @override
  List<Object?> get props => [status, result];
}

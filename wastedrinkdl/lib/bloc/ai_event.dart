part of 'ai_bloc.dart';

@immutable
abstract class AiEvent {}

class GetPrediction extends AiEvent {
  GetPrediction({required this.file});
  final File file;
}

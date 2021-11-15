part of 'ai_bloc.dart';

@immutable
abstract class AiEvent extends Equatable {
  const AiEvent();

  @override
  List<Object> get props => [];
}

class GetPrediction extends AiEvent {
  const GetPrediction({required this.file});
  final File file;
}

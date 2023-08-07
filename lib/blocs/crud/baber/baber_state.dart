import 'package:equatable/equatable.dart';
import '../../../model/baber.dart';

abstract class BaberState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends BaberState {}

class LoadingState extends BaberState {}

class BaberLoadedState extends BaberState {
  final List<Baber> babers;

  BaberLoadedState(this.babers);

  @override
  List<Object?> get props => [babers];
}

class ErrorState extends BaberState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

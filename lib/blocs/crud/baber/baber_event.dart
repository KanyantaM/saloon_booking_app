import 'package:equatable/equatable.dart';

import '../../../model/baber.dart';

abstract class BaberEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateBaberEvent extends BaberEvent {
  final Baber baber;

  CreateBaberEvent(this.baber);

  @override
  List<Object?> get props => [baber];
}

class UpdateBaberEvent extends BaberEvent {
  final Baber baber;

  UpdateBaberEvent(this.baber);

  @override
  List<Object?> get props => [baber];
}

class DeleteBaberEvent extends BaberEvent {
  final String baberId;

  DeleteBaberEvent(this.baberId);

  @override
  List<Object?> get props => [baberId];
}

class FetchBaberEvent extends BaberEvent {}

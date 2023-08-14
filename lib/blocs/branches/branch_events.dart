
import 'package:equatable/equatable.dart';

abstract class BranchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeLocationEvent extends BranchEvent {}

class ChangeBranchEvent extends BranchEvent{
  final int branchIndex;

  ChangeBranchEvent(this.branchIndex);
}

class UseCurrentLocation extends BranchEvent{}

class SearchEvent extends BranchEvent {}

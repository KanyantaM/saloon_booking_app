part of 'branch_bloc.dart';

@immutable
abstract class BranchLocationState extends Equatable{}

//when the user presses sign in or signup the state is changed from loading to authenticated
class Loading extends BranchLocationState{
  @override
  List<Object?> get props => [];
}

//when the branch has loaded, state is changed to authenticated
class Loaded extends BranchLocationState{
  @override
  List<Object?> get props => [];
}

class NoSelectedBranch extends BranchLocationState{
  @override
  List<Object?> get props => [];
}


// the error that occurs when state is changing
class BranchLocationError extends BranchLocationState{
  final String error;

  BranchLocationError(this.error);

  @override
  List<Object?> get props => [];
}
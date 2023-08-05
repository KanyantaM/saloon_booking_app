part of 'branch_bloc.dart';

abstract class BranchLocationEvent extends Equatable{
  @override
  List<Object> get props => [];
}

//When the user signing in with email and password this even is called and the [authrepository] is called to sign in the user
class BranchLocationRequested extends BranchLocationEvent{
  final Map<String, LatLng> branch;

  BranchLocationRequested(this.branch);
}

//When the user signing up with email and password this even is called and the [authrepository] is called to sign in the user
class UserCurrentLocationRequested extends BranchLocationEvent{
  final LatLng userlocation;

  UserCurrentLocationRequested(this.userlocation);
}

//when the user siging in with google this event is called and the [authrepository] is called to sign in the user
class UserCustomLocationRequested extends BranchLocationEvent{
final String location;
UserCustomLocationRequested(this.location);
}

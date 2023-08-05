import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/repositories/googe_maps_repository.dart';

part 'branch_events.dart';
part 'branch_state.dart';

class BranchLocationBloc extends Bloc<BranchLocationEvent, BranchLocationState>{
  final  LocationRepository locationRepository;

  BranchLocationBloc({required this.locationRepository}) : super(NoSelectedBranch()){
    //When the user Presses the signin button we will send the SingInRequested event to the AuthBloc to handle it and emit theemti the Authenticated State if the user is authenticated
    on<BranchLocationRequested>((event,emit)async{
      emit(Loading());
      try{
        await authRepository.signIn(email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e){
        emit(AuthError(e.toString()));
        emit(Unauthenticated());
      }
    });

    //When the user presses the singup bottun we will send the signuprequested event to the AuthBloc to handl it and emit it to the Authenticated state if the user is authenticated
    on<SignUpRequested>((event,emit) async {
      emit (Loading());
      try{
        await authRepository.signUP(email: event.email, password: event.password);
        emit(Authenticated());
      } catch(e){
        emit(AuthError(e.toString()));
        emit(Unauthenticated());
      }
    });

    //sing in with google requrested
    on<GoogleSignInRequested>((event, emit) async{
      emit(Loading());
      try{
        await authRepository.signInWithGoogle();
        emit(Authenticated());
      }catch(e){
        emit(AuthError(e.toString()));
        emit(Unauthenticated());
      }
    });

    //sign out requested
    on<SignOutRequested>((event, emit) async{
      emit(Loading());
      try{
        await(authRepository.signOut());
        emit(Unauthenticated());
      } catch(e){
        emit(AuthError(e.toString()));
        emit(Authenticated());
  
      }
  });
}
}
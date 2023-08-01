import 'package:bloc/bloc.dart';
import 'package:beautonomi/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_events.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(Unauthenticated()){
    //When the user Presses the signin button we will send the SingInRequested event to the AuthBloc to handle it and emit theemti the Authenticated State if the user is authenticated
    on<SignInRequested>((event,emit)async{
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
      }
    });
  }
}


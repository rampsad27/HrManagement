import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_management/core/service_locator/service_locator.dart';
import 'package:hr_management/domain/repository/ilogin_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial()) {
    on<LogInRequested>((event, emit) async {
      emit(LogInLoadInProgress());

      try {
        await _logInRepository.signInWithEmailAndPassword(
            event.email, event.password);

        emit(const LogInSuccess(message: "bhayo"));
      } catch (e) {
        emit(const LogInFailure(message: "Account not registered"));
      }
    });

    on<CheckLoggedInUser>((event, emit) async {
      emit(LogInLoadInProgress());
      try {
        final userCredential = await _logInRepository.getUserInfo();
        if (userCredential.user != null) {
          emit(Authenticated());
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(UnAuthenticated());
      } // bool isLoggedIn = await authenticationRepository.isUserLoggedIn();
    });

    on<LogOutRequested>((event, emit) async {
      emit(LogInLoadInProgress());

      await _logInRepository.signOut();
      emit(const LogoutSuccess(logoutSuccessMessage: "logoutSuccessMessage"));
    });
  }
  final ILogInRepository _logInRepository = getIt.get<ILogInRepository>();
}

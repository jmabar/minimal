import 'package:bloc/bloc.dart';
import 'package:conda_app/login/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

import '../data/clients/auth_client.dart';
import '../data/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authRepository;
  AuthenticationBloc(AuthenticationRepository? authRepository)
      : _authRepository = authRepository ?? AuthenticationRepository(),
        super(AuthenticationState(
            isShowingEmail: true,
            isShowingPassword: false,
            email: "",
            password: "",
            status: AuthenticationStatus.unauthenticated,
            user: User.empty(),
            errorMsg: "")) {
    on<OnChangeEmailVisibility>((event, emit) => emit(state.copyWith(isShowingEmail: event.showEmail)));
    on<OnChangePasswordVisibility>((event, emit) => emit(state.copyWith(isShowingPassword: event.showEmail)));
    on<OnEmailChanged>((event, emit) => emit(state.copyWith(email: event.email)));
    on<OnPasswordChange>((event, emit) => emit(state.copyWith(password: event.password)));
    on<OnLoginSubmitted>(_onSubmitted);
  }

  void _onSubmitted(OnLoginSubmitted event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(status: AuthenticationStatus.loading));
    try {
      final User user = await _authRepository.logIn(event.email, event.password);
      emit(state.copyWith(status: AuthenticationStatus.authenticanted, user: user));
    } on AuthenticationRequestException catch (e) {
      emit(state.copyWith(status: AuthenticationStatus.error, errorMsg: e.errorMessage, email: event.email, password: event.password));
    }
  }
}

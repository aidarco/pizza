import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../authRepo.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<EnterLoginEvent>((event, emit) async {
      try {
        await repo.login(email: event.email, password: event.password);
        emit(AuthSucces());
      } catch (e) {
        print(e);

        emit(AuthEror());
      }
    });
  }

  final LoginRepo repo;
}

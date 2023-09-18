import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../registrationRepo.dart';

part 'reg_event.dart';

part 'reg_state.dart';

class RegBloc extends Bloc<RegEvent, RegState> {
  RegBloc({required this.repo}) : super(RegInitial()) {
    on<SendDataEvent>((event, emit) {
      try {
        repo.registration(email: event.email, password: event.password);
        emit(RegSucces());
      } catch (e) {
        print(e);
        emit(RegEror());
      }
    });
  }

  final AuthRepo repo;
}

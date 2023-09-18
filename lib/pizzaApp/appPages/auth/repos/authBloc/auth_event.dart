part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}


class EnterLoginEvent extends AuthEvent {

  final String email;
  final String password;

  EnterLoginEvent({required this.email, required this.password});

}
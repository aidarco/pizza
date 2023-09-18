part of 'reg_bloc.dart';

@immutable
abstract class RegEvent {}


class SendDataEvent extends RegEvent{

  final String email;
  final String password;

  SendDataEvent({required this.email, required this.password});

}
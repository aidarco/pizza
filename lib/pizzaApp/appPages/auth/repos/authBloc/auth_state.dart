part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}



class AuthSucces extends AuthState {}

class AuthEror extends AuthState {}
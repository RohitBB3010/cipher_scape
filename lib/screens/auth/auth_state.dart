import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthErrorState extends AuthState {
  String error;

  AuthErrorState({required this.error});
}

class AuthLoadingState extends AuthState {}

class AuthAuthenticatedState extends AuthState {
  User? currentUser;

  AuthAuthenticatedState({this.currentUser});
}

class AuthUnauthenticatedState extends AuthState {}

class OtpSentState extends AuthState {}

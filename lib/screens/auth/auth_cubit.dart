import 'package:cipher_affair/consts/fb_player.dart';
import 'package:cipher_affair/screens/auth/auth_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthUnauthenticatedState()) {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      emit(AuthAuthenticatedState());
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get uid => _auth.currentUser!.uid;

  String? _verificationId;

  Future<void> getOtp(String phoneNumber) async {
    emit(AuthLoadingState());

    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          signInWithPhone(phoneAuthCredential);
        },
        verificationFailed: (error) {
          emit(AuthErrorState(error: error.message.toString()));
        },
        codeSent: (verificationId, forceResendingToken) {
          _verificationId = verificationId;
          emit(OtpSentState());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          verificationId = verificationId;
        });
  }

  Future<void> verifyOtp(String otp) async {
    emit(AuthLoadingState());

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);

    signInWithPhone(credential);
  }

  Future<void> signInWithPhone(PhoneAuthCredential phoneAuthCredential) async {
    try {
      UserCredential credential =
          await _auth.signInWithCredential(phoneAuthCredential);

      if (credential.user != null) {
        emit(AuthAuthenticatedState());
      }
    } on FirebaseAuthException catch (error) {
      emit(AuthErrorState(error: error.message.toString()));
    }
  }

  Future<bool> checkIfUserExists(String phoneNumber) async {
    await FirebaseFirestore.instance
        .collection(FirebasePlayer.fieldPlayers)
        .where(FirebasePlayer.fieldPhone, isEqualTo: phoneNumber)
        .get()
        .then((value) {});

    return false;
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    await FirebaseFirestore.instance.terminate();
    emit(AuthUnauthenticatedState());
  }
}

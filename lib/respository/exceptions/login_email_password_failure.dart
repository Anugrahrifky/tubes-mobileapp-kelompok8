import 'package:flutter/material.dart';

class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure([this.message = "An Unknown error."]);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'Password-invalid':
        return const LogInWithEmailAndPasswordFailure(
            'Please enter a correct password');
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure('email is not valid');
    }
    return const LogInWithEmailAndPasswordFailure();
  }
}

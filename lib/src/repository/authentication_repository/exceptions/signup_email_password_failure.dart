class SignUpWithEmailAndPasswordFailure{
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = "An Unknown error occurred."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure('Email is invalid.');
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure('User has been disabled');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure('Email is already in use');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure('Operation is not allowed');
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure('Password is too weak');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
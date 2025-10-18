class SignInWithEmailAndPasswordFailure{
  final String message;

  const SignInWithEmailAndPasswordFailure([this.message = "An Unknown error occurred."]);

  factory SignInWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'invalid-email':
        return SignInWithEmailAndPasswordFailure('Email is invalid.');
      case 'user-disabled':
        return SignInWithEmailAndPasswordFailure('User has been disabled');
      case 'user-not-found':
        return SignInWithEmailAndPasswordFailure('User not found with that email');
      case 'wrong-password':
        return SignInWithEmailAndPasswordFailure('Wrong password');
      case 'operation-not-allowed':
        return SignInWithEmailAndPasswordFailure('Operation is not allowed');
      case 'weak-password':
        return SignInWithEmailAndPasswordFailure('Password is too weak');
      default:
        return SignInWithEmailAndPasswordFailure();
    }
  }
}
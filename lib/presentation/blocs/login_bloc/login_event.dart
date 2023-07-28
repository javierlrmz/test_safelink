part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  final String email;
  const LoginEmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  const LoginPasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

class LoginFormSubmitted extends LoginEvent {
  final BuildContext context;

  const LoginFormSubmitted(this.context);
}

class LoginObscuredText extends LoginEvent {

}

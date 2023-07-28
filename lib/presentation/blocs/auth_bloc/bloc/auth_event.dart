part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GetAuthToken extends AuthEvent {}
class DeleteAuthToken extends AuthEvent {
  final BuildContext context;

  const DeleteAuthToken(this.context);
}
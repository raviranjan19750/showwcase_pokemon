

abstract class LoginEvent {}

class LoggingInEvent extends LoginEvent {
  final String username;
  final String password;
  LoggingInEvent({required this.username, required this.password});
}

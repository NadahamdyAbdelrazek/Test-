import 'package:equatable/equatable.dart';

class LoginParameterUC extends Equatable {
  final String email;
  final String password;

  const LoginParameterUC({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

part of 'login_bloc.dart';


sealed class LoginEvent extends Equatable {
  final bool validatePhoneNumber;
  final bool isChecked;

  const LoginEvent({
    this.validatePhoneNumber = false,
    this.isChecked = false,
  });

  @override
  List<Object?> get props => [ validatePhoneNumber, isChecked];
}

class FetchPhoneEvent extends LoginEvent {
  const FetchPhoneEvent({ super.validatePhoneNumber});
}

class TogglePasswordEvent extends LoginEvent {
  const TogglePasswordEvent();
}
class LoginSubmittedEvent extends LoginEvent {
  final VoidCallback? onSuccess;
  const LoginSubmittedEvent({this.onSuccess});
}










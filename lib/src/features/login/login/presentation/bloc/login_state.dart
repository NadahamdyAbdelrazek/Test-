part of 'login_bloc.dart';

class LoginState extends Equatable {
  final GlobalKey<FormState> formKey;
  final RequestState requestState;
  final bool validatePhoneNumber;
  final TextEditingController passwordController;
  final TextEditingController phoneControllerNew;
  final bool isPassword;
  final IconData suffixIcon;
  final bool? isFormValid;


  const LoginState( {
    required this.formKey,
    this.requestState = RequestState.idle,
    this.validatePhoneNumber = false,
    required this.passwordController,
    required this.phoneControllerNew,
    this.isPassword = true,
    this.suffixIcon = CupertinoIcons.eye,
    this.isFormValid,

  });

  LoginState copyWith({
    RequestState? requestState,
    bool? validatePhoneNumber,
    String? passwordText,
    String? phoneText,
    bool? isPassword,
    IconData? suffixIcon,
    bool? isFormValid,
    bool? isFoundAccount,
  }) {
    if (passwordText != null) {
      passwordController.text = passwordText;
    }
    if (phoneText != null) {
      phoneControllerNew.text = phoneText;
    }
    return LoginState(
      formKey: formKey,
      requestState: requestState ?? this.requestState,
      validatePhoneNumber: validatePhoneNumber ?? this.validatePhoneNumber,
      passwordController: passwordController,
      phoneControllerNew: phoneControllerNew,
      isPassword: isPassword ?? this.isPassword,
      suffixIcon: suffixIcon ?? this.suffixIcon,

      isFormValid: isFormValid ?? this.isFormValid,

    );
  }

  @override
  List<Object?> get props => [
    requestState,
    validatePhoneNumber,
    phoneControllerNew,
    passwordController,
    isPassword,
    suffixIcon,
    isFormValid,


  ];
}


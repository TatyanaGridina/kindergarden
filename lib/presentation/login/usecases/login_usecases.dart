import 'package:kindergarden/usecases/login/login_usecase.dart';
import 'package:kindergarden/usecases/login/send_email_usecase.dart';
import 'package:kindergarden/usecases/login/signup_usecase.dart';
import 'package:kindergarden/usecases/router/go_off_usecase.dart';

class LoginUsecases {
  final GoOffUsecase goOff;
  final SendEmailUsecase sendEmail;
  final SignupUsecase signup;
  final LoginUsecase login;

  LoginUsecases(
    this.goOff,
      this.sendEmail,
      this.signup,
      this.login,
  );
}

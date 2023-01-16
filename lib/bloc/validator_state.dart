part of 'validator_bloc.dart';

abstract class ValidatorState extends Equatable {
  const ValidatorState();
}

class ValidatorInitial extends ValidatorState {
  @override
  List<Object> get props => [];
}

class ValidatorLoaded extends ValidatorState {
  final Validator firstName;
  final Validator lastName;
  final Validator email;
  final Validator password;
  final Validator confirmPassword;
  final bool isValidate;
  final bool isHidePassword;
  final bool isHideConfirmPassword;

  const ValidatorLoaded(
      {this.firstName = const Validator(value: '', error: null),
        this.isValidate = false,
        this.isHidePassword = true,
        this.isHideConfirmPassword = true,
      this.confirmPassword = const Validator(value: '', error: null),
      this.email = const Validator(value: '', error: null),
      this.lastName = const Validator(value: '', error: null),
      this.password = const Validator(value: '', error: null)});

  @override
  List<Object> get props =>
      [firstName, lastName, email, password, confirmPassword, isValidate, isHidePassword, isHideConfirmPassword];
}

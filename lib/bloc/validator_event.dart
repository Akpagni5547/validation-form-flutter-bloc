part of 'validator_bloc.dart';

abstract class ValidatorEvent extends Equatable {
  const ValidatorEvent();
}

class ValidatorLoadedEvent extends ValidatorEvent {
  @override
  List<Object?> get props => [];

}

class ValidatorFirstNameEvent extends ValidatorEvent {
  final String name;

  const ValidatorFirstNameEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class ValidatorLastNameEvent extends ValidatorEvent {
  final String name;

  const ValidatorLastNameEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class ValidatorEmailEvent extends ValidatorEvent {
  final String name;

  const ValidatorEmailEvent({required this.name});

  @override
  List<Object?> get props => [name];
}


class ValidatorPasswordEvent extends ValidatorEvent {
  final String name;

  const ValidatorPasswordEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class ValidatorConfirmPasswordEvent extends ValidatorEvent {
  final String name;

  const ValidatorConfirmPasswordEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class ValidatorHideOrShowPasswordEvent extends ValidatorEvent {
  @override
  List<Object?> get props => [];
}

class ValidatorHideOrShowConfirmPasswordEvent extends ValidatorEvent {
  @override
  List<Object?> get props => [];
}
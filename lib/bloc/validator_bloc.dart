import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:validation/models/validator.dart';

part 'validator_event.dart';

part 'validator_state.dart';

class ValidatorBloc extends Bloc<ValidatorEvent, ValidatorState> {
  ValidatorBloc() : super(ValidatorInitial()) {
    on<ValidatorLoadedEvent>((event, emit) {
      emit(const ValidatorLoaded());
    });

    on<ValidatorFirstNameEvent>((event, emit) {
      final state = this.state as ValidatorLoaded;
      final valueName = event.name;
      final String? errorName;
      final bool isValidate;
      if (valueName.isEmpty) {
        errorName = 'Ce champs ne peut etre vide';
      } else if (valueName.length < 4) {
        errorName = 'Ce champs doit contenir au moins 4 caracteres';
      } else {
        errorName = null;
      }
      final bool conditionFirstName =
          event.name.isNotEmpty && errorName == null;
      final bool conditionLastName =
          state.lastName.value.isNotEmpty && state.lastName.error == null;
      final bool conditionEmailName =
          state.email.value.isNotEmpty && state.email.error == null;
      final bool conditionPasswordName =
          state.password.value.isNotEmpty && state.password.error == null;
      final bool conditionConfirnPasswordName =
          state.confirmPassword.value.isNotEmpty &&
              state.confirmPassword.error == null;
      if (conditionFirstName &&
          conditionLastName &&
          conditionEmailName &&
          conditionPasswordName &&
          conditionConfirnPasswordName) {
        isValidate = true;
      } else {
        isValidate = false;
      }

      emit(ValidatorLoaded(
          firstName: Validator(value: valueName, error: errorName),
          lastName: state.lastName,
          email: state.email,
          password: state.password,
          isHideConfirmPassword: state.isHideConfirmPassword,
          isHidePassword: state.isHidePassword,
          confirmPassword: state.confirmPassword,
          isValidate: isValidate));
    });

    on<ValidatorLastNameEvent>((event, emit) {
      final state = this.state as ValidatorLoaded;
      final valueName = event.name;
      final String? errorName;
      final bool isValidate;
      if (valueName.isEmpty) {
        errorName = 'Ce champs ne peut etre vide';
      } else if (valueName.length < 10) {
        errorName = 'Ce champs doit contenir au moins 10 caracteres';
      } else {
        errorName = null;
      }
      final bool conditionLastName =
          event.name.isNotEmpty && errorName == null;
      final bool conditionFirstName =
          state.firstName.value.isNotEmpty && state.firstName.error == null;
      final bool conditionEmailName =
          state.email.value.isNotEmpty && state.email.error == null;
      final bool conditionPasswordName =
          state.password.value.isNotEmpty && state.password.error == null;
      final bool conditionConfirnPasswordName =
          state.confirmPassword.value.isNotEmpty &&
              state.confirmPassword.error == null;
      if (conditionFirstName &&
          conditionLastName &&
          conditionEmailName &&
          conditionPasswordName &&
          conditionConfirnPasswordName) {
        isValidate = true;
      } else {
        isValidate = false;
      }

      emit(ValidatorLoaded(
          firstName: state.firstName,
          lastName: Validator(value: valueName, error: errorName),
          email: state.email,
          isHideConfirmPassword: state.isHideConfirmPassword,
          isHidePassword: state.isHidePassword,
          password: state.password,
          confirmPassword: state.confirmPassword,
          isValidate: isValidate));
    });

    on<ValidatorEmailEvent>((event, emit) {
      final state = this.state as ValidatorLoaded;
      final valueName = event.name;
      final String? errorName;
      final bool isValidate;
      if (valueName.isEmpty) {
        errorName = 'Ce champs ne peut etre vide';
      } else if (!valueName.contains('@')) {
        errorName = "Votre email n'est pas un email valide";
      } else {
        errorName = null;
      }
      final bool conditionEmailName =
          event.name.isNotEmpty && errorName == null;
      final bool conditionFirstName =
          state.firstName.value.isNotEmpty && state.firstName.error == null;
      final bool conditionLastName =
          state.lastName.value.isNotEmpty && state.lastName.error == null;
      final bool conditionPasswordName =
          state.password.value.isNotEmpty && state.password.error == null;
      final bool conditionConfirnPasswordName =
          state.confirmPassword.value.isNotEmpty &&
              state.confirmPassword.error == null;
      if (conditionFirstName &&
          conditionLastName &&
          conditionEmailName &&
          conditionPasswordName &&
          conditionConfirnPasswordName) {
        isValidate = true;
      } else {
        isValidate = false;
      }

      emit(ValidatorLoaded(
          firstName: state.firstName,
          lastName: state.firstName,
          email: Validator(value: valueName, error: errorName),
          isHideConfirmPassword: state.isHideConfirmPassword,
          isHidePassword: state.isHidePassword,
          password: state.password,
          confirmPassword: state.confirmPassword,
          isValidate: isValidate));
    });


    on<ValidatorPasswordEvent>((event, emit) {
      final state = this.state as ValidatorLoaded;
      final valueName = event.name;
      final String? errorName;
      final bool isValidate;
      if (valueName.isEmpty) {
        errorName = 'Ce champs ne peut etre vide';
      } else if (valueName.length < 8) {
        errorName = "Votre mot de passe doit contenir au moins 8 caractères";
      } else {
        errorName = null;
      }
      final bool conditionPasswordName =
          event.name.isNotEmpty && errorName == null;
      final bool conditionFirstName =
          state.firstName.value.isNotEmpty && state.firstName.error == null;
      final bool conditionLastName =
          state.lastName.value.isNotEmpty && state.lastName.error == null;
      final bool conditionEmailName =
          state.email.value.isNotEmpty && state.email.error == null;
      final bool conditionConfirnPasswordName =
          state.confirmPassword.value.isNotEmpty &&
              state.confirmPassword.error == null;
      if (conditionFirstName &&
          conditionLastName &&
          conditionEmailName &&
          conditionPasswordName &&
          conditionConfirnPasswordName) {
        isValidate = true;
      } else {
        isValidate = false;
      }

      emit(ValidatorLoaded(
          firstName: state.firstName,
          lastName: state.firstName,
          email: state.email,
          isHideConfirmPassword: state.isHideConfirmPassword,
          isHidePassword: state.isHidePassword,
          password: Validator(value: valueName, error: errorName),
          confirmPassword: state.confirmPassword,
          isValidate: isValidate));
    });

    on<ValidatorConfirmPasswordEvent>((event, emit) {
      final state = this.state as ValidatorLoaded;
      final valueName = event.name;
      final String? errorName;
      final bool isValidate;
      if (valueName.isEmpty) {
        errorName = 'Ce champs ne peut etre vide';
      } else if (valueName != state.password.value) {
        errorName = "Vos mots de passe ne correspondent pas";
      } else {
        errorName = null;
      }
      final bool conditionConfirnPasswordName =
          event.name.isNotEmpty && errorName == null;
      final bool conditionFirstName =
          state.firstName.value.isNotEmpty && state.firstName.error == null;
      final bool conditionLastName =
          state.lastName.value.isNotEmpty && state.lastName.error == null;
      final bool conditionEmailName =
          state.email.value.isNotEmpty && state.email.error == null;
      final bool conditionPasswordName =
          state.password.value.isNotEmpty &&
              state.password.error == null;
      if (conditionFirstName &&
          conditionLastName &&
          conditionEmailName &&
          conditionPasswordName &&
          conditionConfirnPasswordName) {
        isValidate = true;
      } else {
        isValidate = false;
      }

      emit(ValidatorLoaded(
          firstName: state.firstName,
          lastName: state.firstName,
          isHideConfirmPassword: state.isHideConfirmPassword,
          isHidePassword: state.isHidePassword,
          email: state.email,
          password: state.password,
          confirmPassword: Validator(value: valueName, error: errorName),
          isValidate: isValidate));
    });

    on<ValidatorHideOrShowPasswordEvent>((event, emit){
      final state = this.state as ValidatorLoaded;

      emit(ValidatorLoaded(
          firstName: state.firstName,
          lastName: state.firstName,
          email: state.email,
          isHideConfirmPassword: state.isHideConfirmPassword,
          isHidePassword: !state.isHidePassword,
          password: state.password,
          confirmPassword: state.confirmPassword,
          isValidate: state.isValidate
      ));
    });

    on<ValidatorHideOrShowConfirmPasswordEvent>((event, emit){
      final state = this.state as ValidatorLoaded;
      emit(ValidatorLoaded(
          firstName: state.firstName,
          lastName: state.firstName,
          email: state.email,
          isHideConfirmPassword: !state.isHideConfirmPassword,
          isHidePassword: state.isHidePassword,
          password: state.password,
          confirmPassword: state.confirmPassword,
          isValidate: state.isValidate
      ));
    });
  }


}

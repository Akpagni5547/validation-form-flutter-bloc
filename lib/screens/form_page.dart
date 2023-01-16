import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validation/bloc/validator_bloc.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form validation'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: BlocBuilder<ValidatorBloc, ValidatorState>(
            builder: (context, state) {
          if (state is ValidatorLoaded) {
            return Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  validator: (String? value) {
                    return state.firstName.error;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Entrez votre nom svp?',
                      labelText: 'Nom *',
                  ),
                  onChanged: (String? value) {
                    context
                        .read<ValidatorBloc>()
                        .add(ValidatorFirstNameEvent(name: value!));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Entrez votre prenoms svp?',
                        labelText: 'Prenoms *',
                        errorText: state.lastName.error),
                    onChanged: (String? value) {
                      context
                          .read<ValidatorBloc>()
                          .add(ValidatorLastNameEvent(name: value!));
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Entrez votre email svp?',
                      labelText: 'Email *',
                      errorText: state.email.error),
                  onChanged: (String? value) {
                    context
                        .read<ValidatorBloc>()
                        .add(ValidatorEmailEvent(name: value!));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    obscureText: state.isHidePassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: IconButton(
                            onPressed: () => context
                                .read<ValidatorBloc>()
                                .add(ValidatorHideOrShowPasswordEvent()),
                            icon: state.isHidePassword
                                ? const Icon(Icons.lock_open)
                                : const Icon(Icons.lock)),
                        hintText: 'Entrez votre mot de passe svp?',
                        labelText: 'Mot de passe *',
                        errorText: state.password.error),
                    onChanged: (String? value) {
                      context
                          .read<ValidatorBloc>()
                          .add(ValidatorPasswordEvent(name: value!));
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    obscureText: state.isHideConfirmPassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Confirmez votre mot de passe svp?',
                        suffixIcon: IconButton(
                            onPressed: () => context
                                .read<ValidatorBloc>()
                                .add(ValidatorHideOrShowConfirmPasswordEvent()),
                            icon: state.isHideConfirmPassword
                                ? const Icon(Icons.lock_open)
                                : const Icon(Icons.lock)),
                        labelText: 'Confirmation du mot de passe *',
                        errorText: state.confirmPassword.error),
                    onChanged: (String? value) {
                      context
                          .read<ValidatorBloc>()
                          .add(ValidatorConfirmPasswordEvent(name: value!));
                    }),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: state.isValidate
                          ? () => ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Le formulaire a été validé')),
                              )
                          : null,
                      child: const Text('Confirmez'),
                    )
                  ],
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}

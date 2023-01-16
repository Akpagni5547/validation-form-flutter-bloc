import 'package:equatable/equatable.dart';

class Validator extends Equatable {

  final String value;
  final String? error;

  const Validator({required this.value, required this.error});

  @override
  List<Object?> get props => [value, error];

}
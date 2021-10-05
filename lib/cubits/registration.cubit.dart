// Cubit:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationState());
}

// State:

class RegistrationState extends Equatable {
  final String? name;
  final String? dob;
  final String? phone;
  final String? address;
  final String? bloodGroup;

  const RegistrationState(
      {this.name, this.dob, this.phone, this.address, this.bloodGroup});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return props.toString();
  }
}

class RegistrationInitial extends RegistrationState {}

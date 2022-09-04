import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String password;
  final String name;
  final String no_telp;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.no_telp,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, password, name, no_telp];
}

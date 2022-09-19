import 'package:equatable/equatable.dart';

class AddModel extends Equatable {
  final String id;
  final DateTime date;
  final String keterangan;
  final String nominal;

  AddModel({
    required this.id,
    required this.date,
    required this.keterangan,
    required this.nominal,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, date, keterangan, nominal];
}

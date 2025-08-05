import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final int? id;
  final int? userID;
  final String? title;
  final String? body;


  const HomeEntity({
    this.id,
    this.title,
    this.body,
    this.userID,

  });

  @override
  List<Object?> get props => [id,title,body,userID];
}


import '../../domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  const HomeModel({
    required super.userID,
    required super.id,
    required  super.body,
    required super.title,
  });

  factory HomeModel.fromJson(Map<String,dynamic> json){
    return HomeModel(
      body: json['body'],
      id:  json['id'],
      title:json['title'],
      userID: json['userId'],
    );
  }


  @override
  List<Object?> get props => [id, title, userID,body];
}

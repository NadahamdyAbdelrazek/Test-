part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable{

  const HomeEvent();
}
class GetData extends HomeEvent {
  const GetData();

  @override
  List<Object?> get props => [];
}

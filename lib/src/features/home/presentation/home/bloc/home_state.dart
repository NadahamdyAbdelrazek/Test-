part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final RequestState requestState;
  final List<HomeModel>? homeEntity;

  const HomeState({
    this.requestState = RequestState.idle,
    this.homeEntity,
  });

  HomeState copyWith({
    RequestState? requestState,
    final List<HomeModel>? homeEntity,
  }) {
    return HomeState(
      requestState: requestState ?? this.requestState,
      homeEntity: homeEntity ?? this.homeEntity,
    );
  }

  @override
  List<Object?> get props => [requestState, homeEntity];
}

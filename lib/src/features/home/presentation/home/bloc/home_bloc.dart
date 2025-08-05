import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:revision/src/core/constants/enums.dart';
import 'package:revision/src/core/utils/methods.dart';
import 'package:revision/src/features/home/domain/entities/home_entity.dart';

import '../../../data/models/home_model.dart';
import '../../../domain/use_cases/home_use_cases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCases _homeUseCases;
  HomeBloc(this._homeUseCases) : super(const HomeState()) {
    on<GetData>((event, emit) async {
      Methods.printLog(" GetData ");

      emit(state.copyWith(requestState: RequestState.loading));

      final result = await _homeUseCases();

      result.fold(
            (failure) {
          emit(state.copyWith(requestState: RequestState.error));
        },
            (homeList) {
              Methods.printLog("Data received: ${homeList.length}");
              emit(state.copyWith(
            requestState: RequestState.success,
            homeEntity: homeList

          ));
        },
      );
    });
  }
}



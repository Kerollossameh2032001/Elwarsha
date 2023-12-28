import 'package:bloc/bloc.dart';
import 'package:elwarsha/car_wash/presetation/controller/car_wash_cubit/wash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/wash_usecase.dart';

class WashCubit extends Cubit<WashStates> {
  final WashUseCase winchUseCase;

  WashCubit(this.winchUseCase) : super(WashInitialState());

  static WashCubit get(context) => BlocProvider.of(context);

  void makeWashOrder({required WashParameter parameter}) async {
    emit(LoadingMakeWashOrderState());
    var result = await winchUseCase(parameter);
    result.fold(
          (l) => emit(ErrorMakeWashOrderState(errorMessage: l.message)),
          (r) => emit(SuccessMakeWashOrderState(makeWashOrderResponse: r)),
    );
  }
}

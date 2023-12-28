import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/fuel_usecase.dart';
import 'fuel_state.dart';


class FuelCubit extends Cubit<FuelStates> {
  final FuelUseCase winchUseCase;

  FuelCubit(this.winchUseCase) : super(FuelInitialState());

  static FuelCubit get(context) => BlocProvider.of(context);

  void makeFuelOrder({required FuelParameter parameter}) async {
    emit(LoadingMakeFuelOrderState());
    var result = await winchUseCase(parameter);
    result.fold(
          (l) => emit(ErrorMakeFuelOrderState(errorMessage: l.message)),
          (r) => emit(SuccessMakeFuelOrderState(makeFuelOrderResponse: r)),
    );
  }
}
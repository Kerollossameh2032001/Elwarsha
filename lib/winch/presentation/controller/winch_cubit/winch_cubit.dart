import 'package:bloc/bloc.dart';
import 'package:elwarsha/winch/domain/usecase/winch_usecase.dart';
import 'package:elwarsha/winch/presentation/controller/winch_cubit/winch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WinchCubit extends Cubit<WinchStates> {
  final WinchUseCase winchUseCase;

  WinchCubit(this.winchUseCase) : super(WinchInitialState());

  static WinchCubit get(context) => BlocProvider.of(context);

  void makeWinchOrder({required WinchParameter parameter}) async {
    emit(LoadingMakeWinchOrderState());
    var result = await winchUseCase(parameter);
    result.fold(
      (l) => emit(ErrorMakeWinchOrderState(errorMessage: l.message)),
      (r) => emit(SuccessMakeWinchOrderState(makeWinchOrderResponse: r)),
    );
  }
}

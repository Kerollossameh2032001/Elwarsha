import 'package:bloc/bloc.dart';
import 'package:elwarsha/repair/presentation/controllers/repair_cubit/repair_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/repair_usecase.dart';


class RepairCubit extends Cubit<RepairStates> {
  final RepairUseCase repairUseCase;

  RepairCubit(this.repairUseCase) : super(RepairInitialState());

  static RepairCubit get(context) => BlocProvider.of(context);

  void makeRepairOrder({required RepairParameter parameter}) async {
    emit(LoadingMakeRepairOrderState());
    var result = await repairUseCase(parameter);
    result.fold(
          (l) => emit(ErrorMakeRepairOrderState(errorMessage: l.message)),
          (r) => emit(SuccessMakeRepairOrderState(makeRepairOrderResponse: r)),
    );
  }
}

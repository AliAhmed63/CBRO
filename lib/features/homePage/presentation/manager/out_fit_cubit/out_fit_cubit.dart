import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../../../../../core/api/dio_exception_handler.dart';
import '../../../data/repo/out_fit_repo.dart';
import 'out_fit_state.dart';

class OutFitCubit extends Cubit<OutFitState> {
  final OutFitRepo outFitRepo;

  OutFitCubit(this.outFitRepo) : super(OutFitInitialState());

  Future<void> getOutFit() async {
    emit(OutFitLoadingState());

    try {
      final data = await outFitRepo.getOutFit();
      emit(OutFitSuccessState(data));
    } on DioException catch (ex) {
      throw dioExceptionHandler(ex);
    } catch (ex) {
      emit(
        OutFitFailureState(
          ex.toString(),
        ),
      );
      throw ex;
    }
  }
}

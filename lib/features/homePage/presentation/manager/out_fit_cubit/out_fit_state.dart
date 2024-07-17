
import '../../../data/model/out_fit_model.dart';

class OutFitState {}

class OutFitInitialState extends OutFitState {}

class OutFitLoadingState extends OutFitState {}

class OutFitSuccessState extends OutFitState {
  final OutFitModel model;

  OutFitSuccessState(this.model);
}

class OutFitFailureState extends OutFitState {
  final String errorMessage;

  OutFitFailureState(this.errorMessage);
}

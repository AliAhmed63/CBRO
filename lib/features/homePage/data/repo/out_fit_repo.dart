import '../model/out_fit_model.dart';
import '../wep_service/out_fit_wep_service.dart';

class OutFitRepo {
  final OutFitWebServices outFitWebServices;

  OutFitRepo(this.outFitWebServices);

  Future<OutFitModel> getOutFit() async {
    final Map<String, dynamic> OutFitInf =
    await outFitWebServices.getOutFit();

    return OutFitModel.fromJson(OutFitInf);
  }
}

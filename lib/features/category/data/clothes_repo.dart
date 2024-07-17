import 'clothes_model.dart';
import 'clothes_wep_serv.dart';

class ClothesRepo {
  final ClothesWebServices clothesWebServices;

  ClothesRepo(this.clothesWebServices);

  Future<List<ClothesData>> getAllClothes() async {
    final clothsInfo = await clothesWebServices.getAllClothes();

    return clothsInfo
        .map(
          (clothsInfo) => ClothesData.fromJson(clothsInfo),
        )
        .toList();
  }
}

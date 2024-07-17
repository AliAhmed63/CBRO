import '../../../data/clothes_model.dart';
import '../../../data/clothes_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_clothes_state.dart';

class MyClothesCubit extends Cubit<MyClothesState> {
  final ClothesRepo clothesRepo;
  late List<ClothesData> clothesInfo = [];

  MyClothesCubit({
    required this.clothesRepo,
  }) : super(MyClothesInitial());
  List<ClothesData> getAllClothes() {
    clothesRepo.getAllClothes().then(
      (clothesInfo) {
        emit(
          MyClothesLoaded(clothesInfo),
        );
        this.clothesInfo = clothesInfo;
      },
    );
    return clothesInfo;
  }
}

part of 'my_clothes_cubit.dart';

@immutable
abstract class MyClothesState {}

class MyClothesInitial extends MyClothesState {}

class MyClothesLoaded extends MyClothesState {
  final List<ClothesData> clothesInfo;

  MyClothesLoaded(this.clothesInfo);
}

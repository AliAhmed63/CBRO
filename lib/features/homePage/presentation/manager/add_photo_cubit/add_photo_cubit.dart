import '../../../data/model/add_photo_model.dart';
import '../../../data/repo/add_photo_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_photo_state.dart';

class AddPhotoCubit extends Cubit<AddPhotoState> {
  AddPhotoCubit(
    this.addPhotoRepo,
  ) : super(AddPhotoInitial());

  final AddPhotoRepo addPhotoRepo;

  void addPhoto(AddPhotoModel addPhotoModel) async {
    emit(AddPhotoLoading());
    try {
      var response = await addPhotoRepo.addPhoto(addPhotoModel);

      emit(
        AddPhotoSuccess(response),
      );
    } catch (e) {
      emit(
        AddPhotoError(
          e.toString(),
        ),
      );
    }
  }
}

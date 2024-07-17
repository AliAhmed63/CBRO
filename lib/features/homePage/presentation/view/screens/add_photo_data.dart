import '../../../../../core/recourses/color%20manager/color%20manager.dart';
import '../../manager/add_photo_cubit/add_photo_cubit.dart';
import '../widget/add_photo_response_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';

class AddPhotoDataView extends StatelessWidget {
  const AddPhotoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Recognition Photo".tr,
          style: getSemiBoldStyle(
              color: context.theme.canvasColor, fontSize: AppSize.s26),
        ),
      ),
      body: BlocBuilder<AddPhotoCubit, AddPhotoState>(
        builder: (context, state) {
          if (state is AddPhotoLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AddPhotoSuccess) {
            return Center(
                child: PhotoResponseCard(
              state: state,
            ));
          } else if (state is AddPhotoError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }
          return Center(child: Text('Undefined error!!'));
        },
      ),
    );
  }
}

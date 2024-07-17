import '../../../../../core/recourses/color%20manager/color%20manager.dart';
import '../../../data/clothes_model.dart';
import '../../../../../injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/recourses/value%20manger/value%20manager.dart';
import 'package:flutter/material.dart';
import '../../manger/cubit/my_clothes_cubit.dart';
import '../widget/my clothes card.dart';

class MyClothesView extends StatelessWidget {
  MyClothesView({super.key});

  @override
  Widget build(BuildContext context) {
    late List<ClothesData> allClothesInfo;

    return BlocProvider(
      create: (context) => MyClothesCubit(clothesRepo: sl())..getAllClothes(),
      child: BlocBuilder<MyClothesCubit, MyClothesState>(
        builder: (context, state) {
          if (state is MyClothesLoaded) {
            allClothesInfo = (state).clothesInfo;
            return Padding(
              padding: const EdgeInsets.all(PaddingSize.p16),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: allClothesInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyClothesCard(
                    clothesData: allClothesInfo[index],
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            );
          }
        },
      ),
    );
  }
}

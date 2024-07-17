import 'package:get/get.dart';
import '../../../../../core/recourses/color%20manager/color%20manager.dart';
import '../../../../../core/recourses/value%20manger/value%20manager.dart';
import '../../../data/model/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../manager/color_cubit/color_palette_cubit.dart';
import '../widget/matching_color_card.dart';

class MatchingColorView extends StatefulWidget {
  const MatchingColorView({super.key});

  @override
  State<MatchingColorView> createState() => _MatchingColorViewState();
}

class _MatchingColorViewState extends State<MatchingColorView> {
  late List<ColorInfo> allColorInfo;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ColorPaletteCubit>(context).getAllPalette();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: context.theme.primaryColor,
        ),
        title: Text(
          "Matchy Colors".tr,
          style: getSemiBoldStyle(
              color: context.theme.canvasColor, fontSize: AppSize.s26),
        ),
      ),
      body: BlocBuilder<ColorPaletteCubit, ColorPaletteState>(
        builder: (context, state) {
          if (state is ColorPaletteLoaded) {
            allColorInfo = (state).colorInfo;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(PaddingSize.p18),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.45 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: allColorInfo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MatchingColorCard(
                      colorInfo: allColorInfo[index],
                    );
                  },
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: ColorManager.primary),
            );
          }
        },
      ),
    );
  }
}

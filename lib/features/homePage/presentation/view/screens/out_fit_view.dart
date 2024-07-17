import 'package:get/get.dart';

import '../../../../../core/recourses/color%20manager/color%20manager.dart';
import '../../../../../core/recourses/styles%20manger/styles%20manager.dart';
import '../../../../../core/recourses/value%20manger/value%20manager.dart';
import '../widget/generate_out_fit_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../../../injection_container.dart';
import '../../manager/out_fit_cubit/out_fit_cubit.dart';
import '../../manager/out_fit_cubit/out_fit_state.dart';
import '../widget/generate_out_fit_card.dart';

class OutFitView extends StatelessWidget {
  const OutFitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OutFitCubit(sl())..getOutFit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Generate Out Fit",
            style: getSemiBoldStyle(
              fontSize: 25,
              color: context.theme.canvasColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorManager.primary,
            ),
          ),
        ),
        body: BlocBuilder<OutFitCubit, OutFitState>(
          builder: (context, state) {
            if (state is OutFitSuccessState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(AppSize.s16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GenerateOutFitCard(
                            height: MediaQuery.of(context).size.height * .30,
                            image: state.model.top[6],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              GenerateOutFitCard(
                                height:
                                    MediaQuery.of(context).size.height * .15,
                                image: state.model.bottom[6],
                              ),
                              verticalSpace(10),
                              GenerateOutFitCard(
                                height:
                                    MediaQuery.of(context).size.height * .15,
                                image: state.model.shoes[6],
                              ),
                            ],
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 22, vertical: 6),
                          decoration: BoxDecoration(
                            color: ColorManager.amber,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: ColorManager
                                  .amber, // Adjust border color if needed
                              width: 2,
                            ),
                          ),
                          child: Text(
                            '${state.model.top[4]} Outfit',
                            style: getMediumStyle(
                                color: Colors.white, fontSize: AppSize.s14),
                          ),
                        ),
                      ),
                      verticalSpace(5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'in this outfit',
                            style: getBoldStyle(
                                color: context.theme.canvasColor,
                                fontSize: AppSize.s18),
                          ),
                        ),
                      ),
                      GenerateOutFitRow(
                        image: state.model.top[6],
                        type: state.model.top[0],
                        color: state.model.top[2],
                        season: state.model.top[4],
                        gender: state.model.top[1],
                      ),
                      verticalSpace(10),
                      GenerateOutFitRow(
                        image: state.model.bottom[6],
                        type: state.model.bottom[0],
                        color: state.model.bottom[2],
                        season: state.model.bottom[4],
                        gender: state.model.bottom[1],
                      ),
                      verticalSpace(10),
                      GenerateOutFitRow(
                        image: state.model.shoes[6],
                        type: state.model.shoes[0],
                        color: state.model.shoes[2],
                        season: state.model.shoes[4],
                        gender: state.model.shoes[1],
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is OutFitFailureState) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

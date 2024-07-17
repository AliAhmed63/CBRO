import '../../../../../core/const.dart';
import '../../../../../core/recourses/color%20manager/color%20manager.dart';
import '../../../../../core/recourses/images%20manager/images%20manager.dart';
import '../../../../../core/recourses/styles%20manger/styles%20manager.dart';
import '../../../../../core/recourses/value%20manger/value%20manager.dart';
import '../../../../../core/widgets/image_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(right: 16.w, left: 16.w, top: 60.h, bottom: 25.h),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemCount: data.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => ImgeAndText(
                    image: data[index].image,
                    title: data[index].title,
                    supTitle: data[index].supTitle,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    data.length,
                    (index) => DotIndicator(isActive: index == _pageIndex),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      onPressed: () {
                        if (_pageIndex == data.length - 1) {
                          Navigator.pushReplacementNamed(context, login);
                        } else {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        }
                      },
                      child: Text(
                        'Next'.tr,
                        style: getBoldStyle(
                            fontSize: AppSize.s20,
                            color: context.theme.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 20.h : 10,
      width: 8.w,
      decoration: BoxDecoration(
        color: isActive ? ColorManager.primary : ColorManager.lightPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, supTitle;

  Onboard({required this.image, required this.title, required this.supTitle});
}

final List<Onboard> data = [
  Onboard(
    image: ImagesManager.onBoarding1Image,
    title: 'Your Colorful Journey\n Begins Here'.tr,
    supTitle:
        'Colorblindness is a challenge, but it\'s also an opportunity for a different perspective'
            .tr,
  ),
  Onboard(
    image: ImagesManager.onBoarding2Image,
    title: 'Enhance Your Vision'.tr,
    supTitle:
        "In a world of color, your vision is a unique masterpiece.Colorblindness is just one chapter of your story; let's create a colorful journey together."
            .tr,
  ),
  Onboard(
    image: ImagesManager.onBoarding3Image,
    title: 'Add Your Clothes'.tr,
    supTitle:
        'Please ensure to add at least two pieces of each clothing item to get the most accurate and diverse outfit suggestions'
            .tr,
  ),
  Onboard(
    image: ImagesManager.onBoarding4Image,
    title: 'Begin Your Scan Now'.tr,
    supTitle:
        'Transform Your Wardrobe: Begin Scanning Your Clothes for Personalized Outfit Suggestions!'
            .tr,
  ),
];

import 'package:aklk_3ndna/core/utils/app_assets.dart';

class OnBoardingModel {
  final String title;
  final String subTitle;
  final String pathImage;

  OnBoardingModel({
    required this.title,
    required this.subTitle,
    required this.pathImage,
  });
}

final List<OnBoardingModel> boardingListEnglish = [
  OnBoardingModel(
    title: 'All your favorites',
    subTitle: 'Order from the best meals with easy, on-demand delivery.',
    pathImage: Assets.imagesOnBoradingAllyourfavorites,
  ),
  OnBoardingModel(
    title: 'Free delivery offers',
    subTitle:
        'Free delivery for new customers via Apple Pay and others payment methods.',
    pathImage: Assets.imagesOnBoradingDeliveryOffers,
  ),
  OnBoardingModel(
    title: 'Choose your food',
    subTitle:
        'Easily find your type of food craving and you’ll get delivery in wide range.',
    pathImage: Assets.imagesOnBoradingChooseyourfood,
  ),
];

List<OnBoardingModel> boardingListArabic = [
  OnBoardingModel(
    pathImage: Assets.imagesOnBoradingAllyourfavorites,
    title: 'جميع المفضلة لديك',
    subTitle: 'اطلب من أفضل الوجبات مع خدمة التوصيل السهلة عند الطلب.',
  ),
  OnBoardingModel(
    pathImage: Assets.imagesOnBoradingDeliveryOffers,
    title: 'عروض التوصيل المجاني',
    subTitle: 'التوصيل مجاني للعملاء الجدد عبر Apple Pay وطرق الدفع الأخرى.',
  ),
  OnBoardingModel(
    pathImage: Assets.imagesOnBoradingChooseyourfood,
    title: 'اختر طعامك',
    subTitle:
        'يمكنك بسهولة العثور على نوع شغفك بالطعام وستحصل على خدمة التوصيل في نطاق واسع.',
  ),
];

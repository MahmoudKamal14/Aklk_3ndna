import 'package:aklk_3ndna/core/utils/app_assets.dart';

class OnBoradingModel {
  final String title;
  final String subTitle;
  final String pathImage;

  OnBoradingModel({
    required this.title,
    required this.subTitle,
    required this.pathImage,
  });
}

final List<OnBoradingModel> boardingListEnglish = [
  OnBoradingModel(
    title: 'All your favorites',
    subTitle:
        'Order from the best local restaurants with easy, on-demand delivery.',
    pathImage: Assets.imagesOnBoradingAllyourfavorites,
  ),
  OnBoradingModel(
    title: 'Free delivery offers',
    subTitle:
        'Free delivery for new customers via Apple Pay and others payment methods.',
    pathImage: Assets.imagesOnBoradingDeliveryOffers,
  ),
  OnBoradingModel(
    title: 'Choose your food',
    subTitle:
        'Easily find your type of food craving and you’ll get delivery in wide range.',
    pathImage: Assets.imagesOnBoradingChooseyourfood,
  ),
];

List<OnBoradingModel> boardingListArabic = [
  OnBoradingModel(
    pathImage: Assets.imagesOnBoradingAllyourfavorites,
    title: 'جميع المفضلة لديك',
    subTitle: 'اطلب من أفضل المطاعم المحلية مع خدمة التوصيل السهلة عند الطلب.',
  ),
  OnBoradingModel(
    pathImage: Assets.imagesOnBoradingDeliveryOffers,
    title: 'عروض التوصيل المجاني',
    subTitle: 'التوصيل مجاني للعملاء الجدد عبر Apple Pay وطرق الدفع الأخرى.',
  ),
  OnBoradingModel(
    pathImage: Assets.imagesOnBoradingChooseyourfood,
    title: 'اختر طعامك',
    subTitle:
        'يمكنك بسهولة العثور على نوع شغفك بالطعام وستحصل على خدمة التوصيل في نطاق واسع.',
  ),
];

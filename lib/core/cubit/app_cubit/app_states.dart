abstract class AppStates {}

class InitialState extends AppStates {}

class GetUserDataLoadingState extends AppStates {}

class GetUserDataSuccessState extends AppStates {}

class GetUserDataErrorState extends AppStates {
  final String error;
  GetUserDataErrorState(this.error);
}

class UpdateUserDataLoadingState extends AppStates {}

class UpdateUserDataSuccessState extends AppStates {}

class UpdateUserDataErrorState extends AppStates {
  late final String error;
  UpdateUserDataErrorState(this.error);
}

//get All Meals
class GetAllMealsLoadingState extends AppStates {}

class GetAllMealsSuccessState extends AppStates {}

class GetAllMealsErrorState extends AppStates {
  final String error;
  GetAllMealsErrorState(this.error);
}

//get All Favorite

class GetAllMealsFavoriteLoadingState extends AppStates {}

class GetAllMealsFavoriteSuccessState extends AppStates {}

class GetAllMealsFavoriteErrorState extends AppStates {
  final String error;
  GetAllMealsFavoriteErrorState(this.error);
}

class SocialLikePostsSuccessState extends AppStates {}

class LikeMealsErrorState extends AppStates {
  final String error;
  LikeMealsErrorState(this.error);
}

/////////////////////////////////////////////////////////////////////
//ProfileImagePicker
class ProfileImagePickerLoadingState extends AppStates {}

class ProfileImagePickerSuccessState extends AppStates {}

class ProfileImagePickerErrorState extends AppStates {}

//UpdateProfileImage
class UpdateProfileImageLoadingState extends AppStates {}

class UpdateProfileImageSuccessState extends AppStates {}

class UpdateProfileImageErrorState extends AppStates {}

// Search

class SearchMealLoadingState extends AppStates {}

class SearchMealSuccessState extends AppStates {}

class SearchMealErrorState extends AppStates {}

// // Category Of Most Popular

class GetMostPopularCategoriesLoadingState extends AppStates {}

class GetMostPopularCategoriesSuccessState extends AppStates {}

class GetMostPopularCategoriesErrorState extends AppStates {}

// Category Of Most Seller

class GetMostSellerCategoriesLoadingState extends AppStates {}

class GetMostSellerCategoriesSuccessState extends AppStates {}

class GetMostSellerCategoriesErrorState extends AppStates {}

//get All Favorite

class GetAllMealsCartLoadingState extends AppStates {}

class GetAllMealsCartSuccessState extends AppStates {}

class GetAllMealsCartErrorState extends AppStates {
  final String error;
  GetAllMealsCartErrorState(this.error);
}

//Add Meal to Favorite

class AddMealsFavoriteSuccessState extends AppStates {}

//Delete Meal from  Favorite

class DeleteMealsFavoriteSuccessState extends AppStates {}

//Change Color App

class ChangeColorAppSuccessState extends AppStates {}

class ChangeColorAppErrorState extends AppStates {}

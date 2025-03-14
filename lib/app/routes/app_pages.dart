import 'package:get/get.dart';

import '../modules/addrecipe/bindings/addrecipe_binding.dart';
import '../modules/addrecipe/views/addrecipe_view.dart';
import '../modules/chatbot/bindings/chatbot_binding.dart';
import '../modules/chatbot/views/chatbot_view.dart';
import '../modules/detailrecipe/bindings/detailrecipe_binding.dart';
import '../modules/detailrecipe/views/detailrecipe_view.dart';
import '../modules/editdeleterecipe/bindings/editdeleterecipe_binding.dart';
import '../modules/editdeleterecipe/views/editdeleterecipe_view.dart';
import '../modules/emailforgotpassword/bindings/emailforgotpassword_binding.dart';
import '../modules/emailforgotpassword/views/emailforgotpassword_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lauchapp/bindings/lauchapp_binding.dart';
import '../modules/lauchapp/views/lauchapp_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/loginorsignup/bindings/loginorsignup_binding.dart';
import '../modules/loginorsignup/views/loginorsignup_view.dart';
import '../modules/newpasswordforgotpassword/bindings/newpasswordforgotpassword_binding.dart';
import '../modules/newpasswordforgotpassword/views/newpasswordforgotpassword_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otpcode/bindings/otpcode_binding.dart';
import '../modules/otpcode/views/otpcode_view.dart';
import '../modules/otpforgotpassword/bindings/otpforgotpassword_binding.dart';
import '../modules/otpforgotpassword/views/otpforgotpassword_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/recipebasedonbudget/bindings/recipebasedonbudget_binding.dart';
import '../modules/recipebasedonbudget/views/recipebasedonbudget_view.dart';
import '../modules/recipebasedoncategories/bindings/recipebasedoncategories_binding.dart';
import '../modules/recipebasedoncategories/views/recipebasedoncategories_view.dart';
import '../modules/recipebasedonrecommendation/bindings/recipebasedonrecommendation_binding.dart';
import '../modules/recipebasedonrecommendation/views/recipebasedonrecommendation_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/welcomescreen/bindings/welcomescreen_binding.dart';
import '../modules/welcomescreen/views/welcomescreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PROFILE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LAUCHAPP,
      page: () => const LauchappView(),
      binding: LauchappBinding(),
    ),
    GetPage(
      name: _Paths.LOGINORSIGNUP,
      page: () => LoginorsignupView(),
      binding: LoginorsignupBinding(),
    ),
    GetPage(
      name: _Paths.DETAILRECIPE,
      page: () =>  DetailrecipeView(),
      binding: DetailrecipeBinding(),
    ),
    GetPage(
      name: _Paths.CHATBOT,
      page: () => const ChatbotView(),
      binding: ChatbotBinding(),
    ),
    GetPage(
      name: _Paths.EDITDELETERECIPE,
      page: () => const EditdeleterecipeView(),
      binding: EditdeleterecipeBinding(),
    ),
    GetPage(
      name: _Paths.ADDRECIPE,
      page: () => AddrecipeView(),
      binding: AddrecipeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () =>  ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.WELCOMESCREEN,
      page: () => const WelcomescreenView(),
      binding: WelcomescreenBinding(),
    ),
    GetPage(
      name: _Paths.EMAILFORGOTPASSWORD,
      page: () => EmailforgotpasswordView(),
      binding: EmailforgotpasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTPFORGOTPASSWORD,
      page: () => OtpforgotpasswordView(),
      binding: OtpforgotpasswordBinding(),
    ),
    GetPage(
      name: _Paths.NEWPASSWORDFORGOTPASSWORD,
      page: () => const NewpasswordforgotpasswordView(),
      binding: NewpasswordforgotpasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTPCODE,
      page: () => OtpcodeView(),
      binding: OtpcodeBinding(),
    ),
    GetPage(
      name: _Paths.RECIPEBASEDONCATEGORIES,
      page: () => RecipebasedoncategoriesView(),
      binding: RecipebasedoncategoriesBinding(),
    ),
    GetPage(
      name: _Paths.RECIPEBASEDONRECOMMENDATION,
      page: () => RecipebasedonrecommendationView(),
      binding: RecipebasedonrecommendationBinding(),
    ),
    GetPage(
      name: _Paths.RECIPEBASEDONBUDGET,
      page: () => RecipebasedonbudgetView(),
      binding: RecipebasedonbudgetBinding(),
    ),
  ];
}

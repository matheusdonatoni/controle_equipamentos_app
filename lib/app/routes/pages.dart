import 'package:controle_equipamentos/app/bindings/initial_bindings.dart';
import 'package:controle_equipamentos/app/bindings/category_bindings.dart';
import 'package:controle_equipamentos/app/bindings/items_list_bindings.dart';
import 'package:controle_equipamentos/app/bindings/manage_catalog_bindings.dart';
import 'package:controle_equipamentos/app/bindings/manage_category_bindings.dart';
import 'package:controle_equipamentos/app/bindings/manage_item_bindings.dart';
import 'package:controle_equipamentos/app/bindings/manage_machine_bindings.dart';
import 'package:controle_equipamentos/app/bindings/home_bindings.dart';
import 'package:controle_equipamentos/app/bindings/item_bindings.dart';
import 'package:controle_equipamentos/app/bindings/login_bindings.dart';
import 'package:controle_equipamentos/app/bindings/machine_bindings.dart';
import 'package:controle_equipamentos/app/bindings/picture_bindings.dart';
import 'package:controle_equipamentos/app/bindings/profile_bindings.dart';
import 'package:controle_equipamentos/app/bindings/register_bindings.dart';
import 'package:controle_equipamentos/app/bindings/server_pictures_bindings.dart';
import 'package:controle_equipamentos/app/bindings/settings_bindings.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/category/category.dart';
import 'package:controle_equipamentos/app/ui/android/item/item.dart';
import 'package:controle_equipamentos/app/ui/android/items_list/items_list.dart';
import 'package:controle_equipamentos/app/ui/android/machine/machine.dart';
import 'package:controle_equipamentos/app/ui/android/home/home.dart';
import 'package:controle_equipamentos/app/ui/android/login/login.dart';
import 'package:controle_equipamentos/app/ui/android/manage_catalog/manage_catalog.dart';
import 'package:controle_equipamentos/app/ui/android/manage_category/manage_category.dart';
import 'package:controle_equipamentos/app/ui/android/manage_item/manage_item.dart';
import 'package:controle_equipamentos/app/ui/android/manage_machine/manage_machine.dart';
import 'package:controle_equipamentos/app/ui/android/picture/picture.dart';
import 'package:controle_equipamentos/app/ui/android/profile/profile.dart';
import 'package:controle_equipamentos/app/ui/android/register/register.dart';
import 'package:controle_equipamentos/app/ui/android/server_pictures/server_pictures.dart';
import 'package:controle_equipamentos/app/ui/android/settings/settings.dart';
import 'package:controle_equipamentos/app/ui/android/splash/splash.dart';
import 'package:get/get.dart';

final List<GetPage> pages = [
  GetPage(
    name: Routes.SPLASH,
    page: () => SplashPage(),
  ),
  GetPage(
    name: Routes.LOGIN,
    page: () => LoginPage(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: Routes.REGISTER,
    page: () => RegisterPage(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: Routes.HOME,
    page: () => HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.MANAGE_CATALOG,
    page: () => ManageCatalogPage(),
    binding: ManageCatalogBinding(),
  ),
  GetPage(
    name: Routes.MACHINE,
    page: () => MachinePage(),
    binding: MachineBinding(),
  ),
  GetPage(
    name: Routes.MANAGE_MACHINE,
    page: () => ManageMachinePage(),
    binding: ManageMachineBinding(),
  ),
  GetPage(
    name: Routes.CATEGORY,
    page: () => CategoryPage(),
    binding: CategoryBinding(),
  ),
  GetPage(
    name: Routes.MANAGE_CATEGORY,
    page: () => ManageCategoryPage(),
    binding: ManageCategoryBinding(),
  ),
  GetPage(
    name: Routes.ITEM,
    page: () => ItemPage(),
    binding: ItemBinding(),
  ),
  GetPage(
    name: Routes.ITEMS_LIST,
    page: () => ItemsListPage(),
    binding: ItemsListBinding(),
  ),
  GetPage(
    name: Routes.MANAGE_ITEM,
    page: () => ManageItemPage(),
    binding: ManageItemBinding(),
  ),
  GetPage(
    name: Routes.PICTURE,
    page: () => PicturePage(),
    binding: PictureBinding(),
    opaque: false,
  ),
  GetPage(
    name: Routes.SERVER_PICTURES,
    page: () => ServerPicturesPage(),
    binding: ServerPicturesBinding(),
  ),
  GetPage(
    name: Routes.SETTINGS,
    page: () => SettingsPage(),
    binding: SettingsBinding(),
  ),
  GetPage(
    name: Routes.PROFILE,
    page: () => ProfilePage(),
    binding: ProfileBinding(),
  ),
];

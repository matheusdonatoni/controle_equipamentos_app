import 'dart:convert';
import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/data/models/unit.dart';
import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:controle_equipamentos/app/data/models/catalog.dart';
import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:controle_equipamentos/app/data/models/user.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

class Api extends GetConnect {
  @override
  String get baseUrl => 'http://192.168.0.141:3000/';

  AuthServices get _authServices => Get.find();

  Map<String, String> get authentication => {
        'authentication': _authServices.authentication.token,
      };

  //AUTH ROUTES
  Future<Response> loginUser(User user) => post(
        'user/login/',
        user.toJson(),
      );

  Future<Response> registerUser(User user) => post(
        'user/register/',
        jsonEncode(
          user.toMap()
            ..addAll({
              "unitId": user.unitId,
              "pictureId": user.picture?.id,
            }),
        ),
      );

  Future<Response> isEmailRegistered(String email) => post(
        'user/is-email-registered',
        jsonEncode(
          {
            "email": email,
          },
        ),
      );

  Future<Response> isPasswordCorrect(String email, String password) => post(
        'user/is-password-correct',
        jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
      );

  Future<Response> deleteUser(int id) => delete(
        'user/$id',
      );

  Future<Response> updateUser(User user) => put(
        'user/${user.id}',
        user.toMap()
          ..remove('unit')
          ..remove('password')
          ..addAll({
            "pictureId": user.picture?.id,
          }),
      );

  Future<Response> findUser(int id) => get(
        'user/$id',
      );

  Future<Response> findUsersSlice({int unitId, int from, int to}) => get(
        'user/$unitId/$from-$to',
      );

  //CATALOG ROUTES
  Future<Response> createCatalog(Catalog catalog, Unit unit) => post(
        'catalog/at/${unit?.id}',
        catalog.toMap(),
      );

  Future<Response> updateCatalog(Catalog catalog, int unitId) => put(
        'catalog/${catalog.id}',
        catalog.toMap(),
      );

  Future<Response> deleteCatalog(Catalog catalog) => delete(
        'catalog/${catalog?.id}',
      );

  Future<Response> findCatalogByUnit(int unitId) => get(
        'catalog/from/$unitId',
      );

  Future<Response> findCatalog(int id) => get(
        'catalog/$id',
      );

  Future<Response> findAllCatalogs() => get(
        'catalog/',
      );

  //UNITS ROUTES
  Future<Response> findAllUnits() => get('unit');

  //MACHINE ROUTES
  Future<Response> countMachines(Catalog catalog) => get(
        'machine/count/${catalog?.id}',
      );

  Future<Response> findMachinesSlice({int from, int to, Catalog catalog}) =>
      get(
        'machine/from/${catalog?.id}/$from-$to',
      );

  Future<Response> createMachine(Machine machine, Catalog catalog) => post(
        'machine',
        machine.toMap()
          ..addAll({
            "catalogId": catalog?.id,
            "sectorId": machine.sector.id,
            "pictureId": machine.picture?.id,
          }),
      );

  Future<Response> updateMachine(Machine machine) => put(
        'machine/${machine.id}',
        machine.toMap()
          ..addAll({
            "sectorId": machine.sector.id,
            "pictureId": machine.picture?.id,
          }),
      );

  Future<Response> deleteMachine(Machine machine) => delete(
        'machine/${machine.id}',
      );

  Future<Response> isMachineNameUnique(Machine machine, Catalog catalog) => get(
        'machine/from/${catalog?.id}/name/${machine?.name}/is-unique',
      );

  Future<Response> isMachineCodeUnique(Machine machine, Catalog catalog) => get(
        'machine/from/${catalog?.id}/code/${machine?.code}/is-unique',
      );

  Future<Response> findMachine(int id) => get(
        'machine/$id',
      );

  //CATEGORY ROUTES
  Future<Response> createCategory(
    Category category, {
    Machine machine,
    Category parent,
  }) =>
      post(
        'category',
        category.toMap()
          ..addAll(
            {
              'machineId': machine?.id,
              'categoryId': parent?.id,
            },
          ),
      );

  Future<Response> isCategoryNameUnique(
    Category category, {
    Machine machine,
    Category parent,
  }) =>
      get(
        'category/is/${category.name}/unique-at/${machine?.id}-${category?.id}',
      );

  Future<Response> countCategoryItems(Category category) => get(
        'category/${category?.id}/items/count',
      );

  Future<Response> findCategory(int id) => get(
        'category/$id',
      );

  Future<Response> findParentCategoryId(int id) => get(
        'category/find-parent-id/$id',
      );

  Future<Response> countCategoriesFrom(Category category) => get(
        'category/${category?.id}/count',
      );

  Future<Response> deleteCategory(Category category) => delete(
        'category/${category?.id}',
      );

  Future<Response> updateCategory(Category category) => put(
        'category/${category.id}',
        category.toMap(),
      );

  Future<Response> assignAllItemsToCategory(
    Category category,
    List<Item> items,
  ) =>
      put(
        'category/${category.id}/assign/all/items',
        {
          'itemsId': items.map((item) => item.id).toList(),
        },
      );

  Future<Response> findAllCategoriesFrom({
    Machine machine,
    Category category,
  }) =>
      get(
        'category/from/${machine?.id}/${category?.id}',
      );

  //ITEM ROUTES
  Future<Response> createItem(Item item) => post(
        'item/',
        item.toMap()
          ..addAll({
            'measurementId': item.measurementId,
            'pictureId': item.picture?.id
          }),
      );

  Future<Response> updateItem(Item item) => put(
        'item/${item.id}',
        item.toMap()
          ..addAll(
            {'measurementId': item.measurementId},
          ),
      );

  Future<Response> findAllItemsFromCategory(Category category) => get(
        'item/from/${category?.id}',
      );

  Future<Response> findItem(int id) => get(
        'item/$id',
      );

  Future<Response> findAllItems() => get(
        'item/',
      );

  Future<Response> deleteItem(Item item) => delete(
        'item/${item?.id}',
      );

  Future<Response> findItemsSlice({Category category, int from, int to}) => get(
        'item/from/${category?.id}/$from-$to',
      );

  Future<Response> countItems() => get(
        'item/count',
      );

  Future<Response> isItemNameUnique(Item item) => get(
        'item/name/${item?.name}/is-unique',
      );

  Future<Response> isItemCodeUnique(Item item) => get(
        'item/code/${item?.code}/is-unique',
      );

  Future<Response> addItemToCategory(Item item, Category category) => get(
        'item/${item?.id}/add/${category?.id}',
      );

  Future<Response> removeItemFromCategory(Item item, Category category) => get(
        'item/${item?.id}/remove/${category?.id}',
      );

  //MEASUREMENT ROUTES
  Future<Response> findAllMeasurements() => get(
        'measurement',
      );

  //SECTOR ROUTES
  Future<Response> findAllSectors() => get(
        'sector',
      );

  //PICTURE ROUTES
  Future<Response> findPicture(int id) => get(
        'picture/$id',
      );

  Future<Response> countPictures() => get(
        'picture/count',
      );

  Future<Response> findAllPictures() => get(
        'picture/',
      );

  Future<Response> findSlicePictures({int to, int from}) => get(
        'picture/$from-$to',
      );

  Future<Response> findPictureData(String path) => get(
        'picture/$path',
      );

  Future<Response> deletePicture(Picture picture) => delete(
        'picture/${picture?.id}',
      );

  Future<Response> updatePicture(Picture picture) => put(
        'picture/${picture.id}',
        FormData(
          {
            'file': MultipartFile(
              picture.file,
              filename: picture.name,
              contentType: 'image/${picture.type}',
            ),
          },
        ),
      );

  Future<Response> createPicture(Picture picture) async => post(
        'picture/',
        FormData(
          {
            'file': MultipartFile(
              picture.file,
              filename: picture.name,
              contentType: 'image/${picture.type}',
            ),
          },
        ),
      );

  @override
  void onInit() {
    super.onInit();

    httpClient.addRequestModifier(
      (request) {
        request.headers.addAll(authentication);

        return request;
      },
    );

    httpClient.addResponseModifier(
      (request, response) async {
        if (response.status.isUnauthorized) {
          _authServices.logout();

          ContextualSnackbar.info(
            title: 'Erro de autenticação',
            message: response.body['error'],
          );
        }
      },
    );
  }
}

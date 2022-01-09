import 'package:controle_equipamentos/app/data/models/helpers/api_exception.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/repositories/auth_repository_impl.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/repositories/picture_mixin.dart';
import 'package:controle_equipamentos/app/data/models/authentication.dart';
import 'package:controle_equipamentos/app/data/models/user.dart';

class AuthRepository extends AuthRepositoryImpl with PictureManagerMixin {
  @override
  Future<Authentication> login(User user) async {
    var res = await api.loginUser(user);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return Authentication.fromMap(res.body);
  }

  @override
  Future<Authentication> register(User user) async {
    user.picture = await createPicture(user.picture);

    var res = await api.registerUser(user);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return Authentication.fromMap(res.body);
  }

  @override
  Future<bool> delete(int id) async {
    var res = await api.deleteUser(id);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.isOk;
  }

  @override
  Future<User> update(User user) async {
    user.picture = await createPicture(user.picture);

    var res = await api.updateUser(user);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return User.fromMap(res.body).copyWith(
      unit: user.unit,
    );
  }

  @override
  Future<User> find(int id) async {
    var res = await api.findUser(id);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return User.fromMap(res.body);
  }

  @override
  Future<List<User>> findAllFromUnit(int unitId) async {
    var res = await api.findUsersSlice(unitId: unitId);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return List<User>.from(
      (res.body).map(
        (mappedUser) => User.fromMap(
          mappedUser,
        ),
      ),
    );
  }

  @override
  Future<List<User>> findSliceFromUnit(
    int unitId, {
    int from,
    int to,
  }) async {
    var res = await api.findUsersSlice(
      unitId: unitId,
      from: from,
      to: to,
    );

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return List<User>.from(
      (res.body).map(
        (mappedUser) => User.fromMap(
          mappedUser,
        ),
      ),
    );
  }

  @override
  Future<List<User>> findAll() async {
    var res = await api.findUsersSlice();

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return List<User>.from(
      (res.body).map(
        (mappedUser) => User.fromMap(
          mappedUser,
        ),
      ),
    );
  }

  @override
  Future<List<User>> findSlice({int from, int to}) async {
    var res = await api.findUsersSlice(
      from: from,
      to: to,
    );

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return List<User>.from(
      (res.body).map(
        (mappedUser) => User.fromMap(
          mappedUser,
        ),
      ),
    );
  }

  Future<bool> isEmailRegistered(String email) async {
    var res = await api.isEmailRegistered(email);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.body['result'];
  }

  Future<bool> isPasswordCorrect(String email, String password) async {
    var res = await api.isPasswordCorrect(email, password);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.body['result'];
  }

  // local

  Future<void> saveAuthentication(Authentication authentication) async =>
      await localStorage.saveAuthentication(authentication);

  Authentication findAuthentication() {
    var authentication = localStorage.findAuthentication();

    if (authentication.isValidLocally) return authentication;

    return Authentication();
  }

  Future<void> cleanAuthentication() async =>
      await localStorage.cleanAuthentication();

  User findLatestUser() => localStorage.findUser();

  Future<void> cleanPassword() async => await localStorage.cleanPassword();
}

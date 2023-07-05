import 'package:get_storage/get_storage.dart';
import 'package:team_project/src/data/models/user_model.dart';
import 'package:team_project/src/utils/app_constants.dart';

class LocalSource {
  LocalSource._();

  static LocalSource? _instance;

  factory LocalSource() => _instance ?? LocalSource._();

  final _localSource = GetStorage();

  static LocalSource getInstance() {
    if (_instance != null) {
      return _instance!;
    } else {
      return LocalSource._();
    }
  }

  Future<void> setIntroStatus(bool value) async {
    await _localSource.write(AppConstants.introStatus, value);
  }

  bool getIntroStatus() {
    return _localSource.read<bool>(AppConstants.introStatus) ?? false;
  }

  Future<void> setUserDetails(UserModel details) async {
    await _localSource.write(AppConstants.firstName, details.firstName);
    await _localSource.write(AppConstants.lastName, details.lastName);
    await _localSource.write(AppConstants.username, details.username);
    await _localSource.write(AppConstants.token, details.token);
    await _localSource.write(AppConstants.hasProfile, true);
  }

  UserModel getUserDetails() {
    String fName = _localSource.read<String>(AppConstants.firstName) ?? '';
    String lName = _localSource.read<String>(AppConstants.lastName) ?? '';
    String uName = _localSource.read<String>(AppConstants.username) ?? '';
    String token = _localSource.read<String>(AppConstants.token) ?? '';

    return UserModel(
      firstName: fName,
      lastName: lName,
      username: uName,
      token: token,
    );
  }

  bool hasProfile() {
    return _localSource.read<bool>(AppConstants.hasProfile) ?? false;
  }

  Future<void> logout() async {
    await _localSource.remove(AppConstants.hasProfile);
    await _localSource.remove(AppConstants.firstName);
    await _localSource.remove(AppConstants.lastName);
    await _localSource.remove(AppConstants.username);
    await _localSource.remove(AppConstants.userCoin);
    await _localSource.remove(AppConstants.enrolledSubjects);
  }

  Future<void> setUserCoin(int coin) async {
    await _localSource.write(AppConstants.userCoin, coin);
  }

  int getUserCoins() {
    return _localSource.read<int>(AppConstants.userCoin) ?? 0;
  }

  Future<void> enrollToSubject(String name) async {
    List<String> enrolledSubjects = getEnrolledSubjects();
    enrolledSubjects.add(name);
    await _localSource.write(
        AppConstants.enrolledSubjects, enrolledSubjects.join('_'));
  }

  List<String> getEnrolledSubjects() {
    String data =
        _localSource.read<String>(AppConstants.enrolledSubjects) ?? '';
    return data.isEmpty ? [] : data.split('_');
  }
}

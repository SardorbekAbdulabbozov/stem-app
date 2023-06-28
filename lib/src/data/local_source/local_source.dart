import 'package:get_storage/get_storage.dart';
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

  bool hasProfile() {
    return (_localSource.read<String>(AppConstants.profile) ?? '').isNotEmpty;
  }

  Future<void> logout() async {
    await _localSource.remove(AppConstants.profile);
    await _localSource.remove(AppConstants.introStatus);
  }
}

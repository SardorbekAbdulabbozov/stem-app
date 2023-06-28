

import 'package:team_project/src/core/provider/api_client.dart';
import 'package:team_project/src/core/provider/server_error.dart';
import 'package:team_project/src/data/local_source/local_source.dart';

abstract class BaseRepository {
  final ApiClient apiClient = ApiClient.getInstance();
  final LocalSource localSource = LocalSource();

  Future<String> getErrorMessage(String message) async {
    String errorMessage = '';
    switch (message) {
      case "Connection timeout":
        errorMessage = 'Время соединения вышло';
        break;
      default:
        errorMessage = 'Something went wrong! :(';
    }
    return errorMessage;
  }

  bool checkIsCancelled(ServerError? value) {
    return (value?.getErrorMessage() ?? '') != 'Canceled';
  }
}

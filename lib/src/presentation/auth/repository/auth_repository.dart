import 'package:team_project/src/core/provider/api_client.dart';
import 'package:team_project/src/core/provider/base_repository.dart';
import 'package:team_project/src/data/models/user_model.dart';
import 'package:team_project/src/data/network_models/auth_response.dart';
import 'package:team_project/src/data/network_models/register_request.dart';
import 'package:team_project/src/data/network_models/login_request.dart';

class AuthRepository extends BaseRepository {
  final ApiClient _apiClient = ApiClient.getInstance();

  Future<void> register(
    String firstName,
    String lastName,
    String username,
    String password,
  ) async {
    dynamic result;
    result = await _apiClient.register(
      RegisterRequest(
        firstName: firstName,
        lastName: lastName,
        username: username,
        password: password,
      ),
    );

    if (result is AuthResponse) {
      await localSource.setUserDetails(
        UserModel(
          firstName: firstName,
          lastName: lastName,
          username: username,
          token: result.token ?? '',
        ),
      );
    } else {}
  }

  Future<void> login(
    String username,
    String password,
  ) async {
    dynamic result;
    result = await _apiClient.login(
      LoginRequest(
        username: username,
        password: password,
      ),
    );

    if (result is AuthResponse) {
      await localSource.setUserDetails(
        UserModel(
          firstName: result.firstName ?? '',
          lastName: result.lastName ?? '',
          username: username,
          token: result.token ?? '',
        ),
      );
    } else {}
  }
}

import '../domain/auth_repository_interface.dart';

class AuthRepositoryImplements extends AuthRepositoryInterface {
  @override
  Future<bool> isAuthenticated() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}

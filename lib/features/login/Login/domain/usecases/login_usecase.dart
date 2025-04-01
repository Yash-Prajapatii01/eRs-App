import 'package:ers_app/features/login/Login/data/repositories/RemoteDataSource_Impl.dart';

class LoginUsecase {
  final RemotedatasourceImpl remotedatasourceImpl;
  LoginUsecase(this.remotedatasourceImpl);

  Future<String> login(String loginid, String password) async {
    return await remotedatasourceImpl.login(loginid, password);
  }
}
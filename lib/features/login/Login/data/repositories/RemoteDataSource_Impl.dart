import 'package:ers_app/features/login/Login/data/datasources/redis_remote_data_source.dart';

class RemotedatasourceImpl {
  final RedisRemoteDataSource redisRemoteDataSource;
  RemotedatasourceImpl(this.redisRemoteDataSource);

  Future<void> init() async {
    await redisRemoteDataSource.init();
  }

  // Future<bool> signup(String loginid, String password) async {
  //   return await redisRemoteDataSource.signup(loginid, password);
  // }
  //above is used for the signup feature.

  Future<bool> login(String loginid, String password) async {
    return await redisRemoteDataSource.login(loginid, password);
  }

  // Future<bool> updatePassword(String loginid, String newPassword) async {
  //   return await redisRemoteDataSource.updatePassword(loginid, newPassword);
  // }
  //above is used for the update password feature.
}

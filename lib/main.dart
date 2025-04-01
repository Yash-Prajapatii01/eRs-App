import 'package:ers_app/common/common_screens/success_screen.dart';
import 'package:ers_app/common/theme/themeData.dart';
import 'package:ers_app/features/login/Login/data/datasources/redis_remote_data_source.dart';
import 'package:ers_app/features/login/Login/data/repositories/RemoteDataSource_Impl.dart';
import 'package:ers_app/features/login/Login/domain/usecases/login_usecase.dart';
import 'package:ers_app/features/login/Login/presentation/bloc/login_auth_bloc.dart';
import 'package:ers_app/features/login/Login/presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final redisRemoteDataSource = RedisRemoteDataSource();
  await redisRemoteDataSource.init();
  final remotedatasourceImpl = RemotedatasourceImpl(redisRemoteDataSource);
  final loginUsecase = LoginUsecase(remotedatasourceImpl);
  runApp(MyApp(
    loginUsecase: loginUsecase,
  ));
}

class MyApp extends StatelessWidget {
  final LoginUsecase loginUsecase;
  const MyApp({super.key, required this.loginUsecase});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginAuthBloc(
            loginUsecase
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eResources Scheduler',
        theme: appTheme,
        home: LoginScreen(),
      ),
    );
  }
}

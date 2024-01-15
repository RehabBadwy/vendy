import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendy_station/data/repo/add_link_repo.dart';
import 'package:vendy_station/data/repo/client_repo.dart';
import 'package:vendy_station/data/repo/notification_repo.dart';
import 'package:vendy_station/data/repo/payment_repo.dart';
import 'package:vendy_station/data/repo/wallet_user_repo.dart';
import 'package:vendy_station/provider/add_link_provider.dart';
import 'package:vendy_station/provider/auth_provider.dart';
import 'package:vendy_station/provider/clints_provider.dart';
import 'package:vendy_station/provider/lang_provider.dart';
import 'package:vendy_station/provider/localization_provider.dart';
import 'package:vendy_station/provider/notification_provider.dart';
import 'package:vendy_station/provider/payment_provider.dart';
import 'package:vendy_station/provider/school_provider.dart';
import 'package:vendy_station/provider/wallet_provider.dart';
import 'package:vendy_station/util/constant.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repo/auth_repo.dart';
import 'data/repo/shool_repo.dart';

final sl = GetIt.instance;
void setupLocator() {
  print("registered");
}

Future<void> init() async {
  sl.registerLazySingleton(() => DioClient(AppConstants.baseurl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerFactory(() => AuthProvider(authRepo: sl()));

  sl.registerLazySingleton(() => ClientRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerFactory(() => ClientsProvider(clientRepo: sl()));

  sl.registerLazySingleton(() => WalletRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerFactory(() => WalletUserProvider(walletRepo: sl()));

  sl.registerLazySingleton(() => SchoolRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerFactory(() => AddSchoolUserProvider(schoolRepo: sl()));

  sl.registerLazySingleton(() => AddLinkRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerFactory(() => AddLinkProvider(addLinkRepo: sl()));

  sl.registerLazySingleton(() => NotificationRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerFactory(() => NotifiactionUserProvider(notificationRepo: sl()));

  //sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl(), dioClient: sl()));
  sl.registerFactory(() => LangProvider(sharedPreferences: sl(), dioClient: sl()));


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());

}
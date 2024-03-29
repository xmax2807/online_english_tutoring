import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/utils/global_constants/env_consts.dart';

import '../setting/settings.dart';

final dioProvider = Provider<Dio>((ctx) => Dio(BaseOptions(
      baseUrl: AppSetting.instance.dotEnv
          .get(EnvKeyConsts.serverRootAPIKey, fallback: ""),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )));

import 'package:code_base/core/localization/app_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/bloc/bloc_observer.dart';
import 'injection_container.dart' as di;
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.init();
  BlocOverrides.runZoned(
    () {
      runApp(const AppLocalization(child: MyApp()));
    },
    blocObserver: SimpleBlocObserver(),
  );
}

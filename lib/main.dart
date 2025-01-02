import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakshmi_setu/app_entrypoint.dart';
import 'package:lakshmi_setu/core/logging/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'firebase_options.dart';
// import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await FirebaseAppCheck.instance.activate();
  Bloc.observer = TalkerBlocObserver(talker: talker);
  runApp(AppEntrypoint());
}

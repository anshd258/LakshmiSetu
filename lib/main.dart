import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakshmi_setu/app_entrypoint.dart';
import 'package:lakshmi_setu/core/logging/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = TalkerBlocObserver(talker: talker);
  runApp(AppEntrypoint());
}

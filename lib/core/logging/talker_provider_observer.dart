// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:riverpod/riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Custom Riverpod Observer using Talker for logging
class TalkerRiverpodObserver extends ProviderObserver {
  final Talker talker;

  TalkerRiverpodObserver(this.talker);

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    talker.log(
      'Provider "${provider.name ?? provider.runtimeType}" updated. '
      'Previous value: $previousValue, New value: $newValue',
    );
  }

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    talker.log(
      'Provider "${provider.name ?? provider.runtimeType}" added with value: $value',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    talker.log('Provider "${provider.name ?? provider.runtimeType}" disposed.');
  }

  @override
  void onProviderError(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    talker.error(
      'Error in provider "${provider.name ?? provider.runtimeType}": $error',
      error,
      stackTrace,
    );
     FirebaseCrashlytics.instance.recordError(
      error,
      StackTrace.current,reason:  'Error in provider "${provider.name ?? provider.runtimeType}": $error',
    );
  }
}

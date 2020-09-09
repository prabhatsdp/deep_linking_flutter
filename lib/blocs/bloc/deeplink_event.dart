part of 'deeplink_bloc.dart';

@immutable
abstract class DeeplinkEvent {}

class GetInitialDeepLink extends DeeplinkEvent {
  @override
  String toString() {
    return "GetInitialDeepLink";
  }
}


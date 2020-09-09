part of 'deeplink_bloc.dart';

@immutable
abstract class DeeplinkState {}

class DeeplinkInitial extends DeeplinkState {}

class InitialDeepLinkFound extends DeeplinkState {
  final String link;
  InitialDeepLinkFound({@required this.link});
}

class DeepLinkError extends DeeplinkState {
  final Error error;
  DeepLinkError({this.error});
}

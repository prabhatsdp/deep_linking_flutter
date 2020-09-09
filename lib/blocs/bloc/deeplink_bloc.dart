import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deep_linking/main.dart';
import 'package:meta/meta.dart';
import 'package:uni_links/uni_links.dart';

part 'deeplink_event.dart';
part 'deeplink_state.dart';

class DeeplinkBloc extends Bloc<DeeplinkEvent, DeeplinkState> {
  DeeplinkBloc() : super(DeeplinkInitial());

  @override
  Stream<DeeplinkState> mapEventToState(
    DeeplinkEvent event,
  ) async* {
    if (event is GetInitialDeepLink) {
      yield* _mapGetInitialDeepLinkToState();
    }
  }

  Stream<DeeplinkState> _mapGetInitialDeepLinkToState() async* {
    try {
      String initialLink = await getInitialLink();
      print("Initial Link: $initialLink");
      if (initialLink != null) {
        yield InitialDeepLinkFound(link: initialLink);
      } else {

        print("Error is: Link Is Null");
        yield DeepLinkError(error: Error());
      }
    } catch (error) {
      print("Error is: $error");
      yield DeepLinkError(error: error);
    }
  }
}

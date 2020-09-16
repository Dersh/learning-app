import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'router_event.dart';

part 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc() : super(RouterHomeScreen());

  @override
  Stream<RouterState> mapEventToState(RouterEvent event) async* {
    if (event is RouterHomeSwitched)
      yield RouterHomeScreen();
    else if (event is RouterSearchSwitched)
      yield RouterSearchScreen();
    else if (event is RouterPhotoSwitched)
      yield RouterPhotoScreen();
    else if (event is RouterProfileSwitched) yield RouterProfileScreen();
  }
}

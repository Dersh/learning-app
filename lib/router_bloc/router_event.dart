part of 'router_bloc.dart';

@immutable
abstract class RouterEvent {}

class RouterHomeSwitched extends RouterEvent {}
class RouterSearchSwitched extends RouterEvent {}
class RouterPhotoSwitched extends RouterEvent {}
class RouterProfileSwitched extends RouterEvent {}


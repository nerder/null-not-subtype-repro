part of 'my_bloc.dart';

@freezed
class MyState with _$MyState {
  const factory MyState.initial() = _Initial;
  const factory MyState.loaded() = _Loaded;
}

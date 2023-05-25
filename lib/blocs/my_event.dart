part of 'my_bloc.dart';

@freezed
class MyEvent with _$MyEvent {
  const factory MyEvent.started() = _Started;
}

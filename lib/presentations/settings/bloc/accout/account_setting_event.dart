part of 'account_setting_bloc.dart';

@freezed
class AccountSettingEvent with _$AccountSettingEvent {
  const AccountSettingEvent._();

  const factory AccountSettingEvent.onStarted() = _OnStarted;
  const factory AccountSettingEvent.fetchUserData() = _FetchUserData;
  const factory AccountSettingEvent.updateUserData({
    required String password,
    required String newPassword,
    required String retypePassword,
  }) = _UpdateUserData;
}
part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}
class LoadUserProfile extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class UpdateProfile extends ProfileEvent {
  final UpdateProfile profile;

  UpdateProfile(this.profile);

  @override
  List<Object> get props => [profile];
}
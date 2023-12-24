part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoaded extends ProfileState {

}

class ProfileError extends ProfileState {
  final String error;

  ProfileError(this.error);

  @override
  List<Object> get props => [error];
}
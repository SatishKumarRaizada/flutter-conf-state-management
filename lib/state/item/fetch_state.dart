import 'package:equatable/equatable.dart';

abstract class FetchUserState extends Equatable {
  const FetchUserState();
}

class UserFetchInitial extends FetchUserState {
  const UserFetchInitial();
  @override
  List<Object> get props => [];
}

class UserFetched extends FetchUserState {
  const UserFetched();
  @override
  List<Object> get props => [];
}

class UserFetching extends FetchUserState {
  const UserFetching();
  @override
  List<Object> get props => [];
}

class UserFetchError extends FetchUserState {
  const UserFetchError();
  @override
  List<Object> get props => [];
}

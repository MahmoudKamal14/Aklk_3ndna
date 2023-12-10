sealed class InternetConnectionState {}

final class InternetConnectionInitial extends InternetConnectionState {}

final class InternetConnectedState extends InternetConnectionState {}

final class InternetNotConnectedState extends InternetConnectionState {}

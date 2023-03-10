part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class OnNewUserLocationEvent extends LocationEvent {
  final LatLng newLocation;

  OnNewUserLocationEvent(this.newLocation);

}

class onStartFollowingUserEvent extends LocationEvent
{

}
class onStopFollowingUserEvent extends LocationEvent
{

}
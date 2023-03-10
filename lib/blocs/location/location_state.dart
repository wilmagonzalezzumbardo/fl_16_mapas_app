part of 'location_bloc.dart';

// si le dejo el abstract, me marca error de que no puede ser instanciada....
class LocationState extends Equatable {
  //revisar si seguimos al usuario
  final bool followingUser;
  //ultima localización del usuario conocida
  final LatLng? lastKnowPosition;
  final List<LatLng> myLocationHistory;

  //historia de la geolocalizaciones del usaurio

  LocationState({
    this.followingUser = false,
    this.lastKnowPosition,
    myLocationHistory 
  }): myLocationHistory = myLocationHistory ??  [];
  //sino viene el parametro se inicializa la variable de historia

  LocationState copyWith({
    final bool? followingUser,
    final LatLng? lastKnowPosition,
    final List<LatLng>? myLocationHistory
  }) => LocationState(
    followingUser:  followingUser ?? this.followingUser,
    lastKnowPosition: lastKnowPosition ?? this.lastKnowPosition,
    myLocationHistory: myLocationHistory ?? this.myLocationHistory
  )
  
  ;


  //se pone lo que se quiere evaluar en el estado
  @override
  List<Object?> get props => [followingUser, lastKnowPosition, myLocationHistory];
  //se le pone ? ya que hay atributos que no son obligatorios
}

/*
se borra esta clase, ya que solo se tendra una clase para manejar el
class LocationInitial extends LocationState {}
*/
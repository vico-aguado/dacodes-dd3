part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetSectionsEvent extends DetailEvent {
  final int characterID;
  const GetSectionsEvent(this.characterID);
}

class GetComicsEvent extends DetailEvent {
  final int characterID;
  const GetComicsEvent(this.characterID);
}

class GetSeriesEvent extends DetailEvent {
  final int characterID;
  const GetSeriesEvent(this.characterID);
}

class GetEventsEvent extends DetailEvent {
  final int characterID;
  const GetEventsEvent(this.characterID);
}

class GetStoriesEvent extends DetailEvent {
  final int characterID;
  const GetStoriesEvent(this.characterID);
}

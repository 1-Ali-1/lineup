import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:lineup/modal/lineup_modal.dart';
import 'package:lineup/repository/lineup_repository.dart';

class LineupBloc extends Bloc<LineupEvent, LineupState> {
  LineupRepo lineupRepo;
  LineupBloc(this.lineupRepo) : super(Loading());

  @override
  Stream<LineupState> mapEventToState(
    LineupEvent event,
  ) async* {
    if (event is Started) {
      try {
        List<LineupModal> lineup = await lineupRepo.getLineup(event.id);
        yield Loaded(lineup: lineup);
      } catch (_) {
        yield Error();
      }
    } else if (event is Selected) {
      yield Loading();
      try {
        List<LineupModal> lineup = await lineupRepo.getLineup(event.id);
        yield Loaded(lineup: lineup);
      } catch (_) {
        yield Error();
      }
    }
  }
}

//--------- state
class LineupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends LineupState {}

class Loaded extends LineupState {
  final lineup;
  Loaded({@required this.lineup});

  List<LineupModal> get getLineup => lineup;
  @override
  List<Object?> get props => [lineup];
}

class Error extends LineupState {}

//--------- event
class LineupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Started extends LineupEvent {
  final id;
  Started({@required this.id});
  @override
  List<Object?> get props => [id];
}

class Selected extends LineupEvent {
  final id;
  Selected({@required this.id});
  @override
  List<Object?> get props => [id];
}

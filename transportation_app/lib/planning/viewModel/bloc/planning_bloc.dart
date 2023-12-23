import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'planning_event.dart';
part 'planning_state.dart';

class PlanningBloc extends Bloc<PlanningEvent, PlanningState> {
  PlanningBloc() : super(PlanningInitial()) {
    on<PlanningEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

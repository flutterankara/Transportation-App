import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'journey_status_event.dart';
part 'journey_status_state.dart';

class JourneyStatusBloc extends Bloc<JourneyStatusEvent, JourneyStatusState> {
  JourneyStatusBloc() : super(JourneyStatusInitial()) {
    on<JourneyStatusEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

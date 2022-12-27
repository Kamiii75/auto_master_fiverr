
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'system_event.dart';
part 'system_state.dart';

class SystemBloc extends HydratedBloc<SystemEvent, SystemState> {
  SystemBloc() : super(const SystemState()) {
    on<ChangeAdmin>((event, emit) {
      final state=this.state;
      final bool admin=event.admin;
      emit(SystemState(
        isAdmin: admin,
        docId: state.docId,
          tabIndex: state.tabIndex
      ));
    });
    on<ChangeDocId>((event, emit) {
      final state=this.state;
      final String docId=event.docid;
      emit(SystemState(
        isAdmin: state.isAdmin,
        docId: docId,
        tabIndex: state.tabIndex
      ));
    });
    on<ChangeTab>((event, emit) {
      final state=this.state;
      final int tab=event.tabIndex;
      emit(SystemState(
        isAdmin: state.isAdmin,
        docId: state.docId,
        tabIndex: tab
      ));
    });

  }

  @override
  SystemState? fromJson(Map<String, dynamic> json) {
    return SystemState.fromJson(json );
  }

  @override
  Map<String, dynamic>? toJson(SystemState state) {
    return state.toMap();
  }
}

part of 'system_bloc.dart';

abstract class SystemEvent extends Equatable {
  const SystemEvent();

}
class ChangeAdmin extends SystemEvent {
  final bool admin;

  const ChangeAdmin({required this.admin});

  @override
  // TODO: implement props
  List<Object?> get props => [admin];
}
class ChangeDocId extends SystemEvent {
  final String docid;

  const ChangeDocId({required this.docid});

  @override
  // TODO: implement props
  List<Object?> get props => [docid];
}
class ChangeTab extends SystemEvent {
  final int tabIndex;

  const ChangeTab({required this.tabIndex});

  @override
  // TODO: implement props
  List<Object?> get props => [tabIndex];
}
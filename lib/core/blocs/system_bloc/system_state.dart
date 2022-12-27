part of 'system_bloc.dart';

 class SystemState extends Equatable {
  final bool isAdmin;
  final String docId;
  final int tabIndex;

  const SystemState({
    this.isAdmin=false,
    this.docId='',
    this.tabIndex=0,
});


  @override
  // TODO: implement props
  List<Object?> get props => [isAdmin,docId,tabIndex];

  Map<String, dynamic> toMap() {
    return {
      'isAdmin': isAdmin,
      'docId': docId,
      'tabIndex': tabIndex,
    };
  }



  factory SystemState.fromJson(Map<String, dynamic> json) {
    return SystemState(
      docId: json['docId']??'',
      isAdmin: json['isAdmin']??false,
      tabIndex: json['tabIndex']??0,
    );
  }

}



import 'package:flutter/cupertino.dart';

class LineupModal {
  final name;
  final logo;
  final formation;
  final startXI;
  final substitutes;

  LineupModal({
    @required this.name,
    @required this.logo,
    @required this.formation,
    @required this.startXI,
    @required this.substitutes,
  });

  factory LineupModal.fromJson(Map<String, dynamic> json) {
    final name = json['team']['name'];
    final logo = json['team']['logo'];
    final formation = json['formation'];
    final startXI = json['startXI'];
    final substitutes = json['substitutes'];

    return LineupModal(
      name: name,
      logo: logo,
      formation: formation,
      startXI: startXI,
      substitutes: substitutes,
    );
  }
}

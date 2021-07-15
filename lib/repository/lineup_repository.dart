import 'dart:convert';

import 'package:lineup/constants/api_constants.dart';
import 'package:lineup/modal/lineup_modal.dart';
import 'package:http/http.dart' as http;

class LineupRepo {
  Future<List<LineupModal>> getLineup(id) async {
    var url = Uri.parse(
        "https://api-football-v1.p.rapidapi.com/v3/fixtures/lineups?fixture=${id}");
    var response = await http.get(url, headers: xhrHeader);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final lineup = data['response'];
      final returnList = lineup
          .map<LineupModal>((json) => LineupModal.fromJson(json))
          .toList();
      return returnList;
    } else {
      return [];
    }
  }
}

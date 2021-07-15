import 'package:flutter/material.dart';

int index = 0;

class Linehome extends StatelessWidget {
  final players;
  final formation;
  Linehome(this.players, this.formation);

  @override
  Widget build(BuildContext context) {
    List<int> teamFormation = convertFormationToList(formation);

    index = 1;
    Widget _team = Column(
      children: [
        for (var i = 0; i < teamFormation.length; i++)
          buildTeam(teamFormation, i),
      ],
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              child: Align(
                alignment: Alignment.center,
                child: _buildGK(),
              ),
            ),
          ],
        ),
        _team,
      ],
    );
  }

  Widget buildTeam(List<int> teamFormation, int i) {
    return Row(
      children: [
        for (var j = 0; j < teamFormation[i]; j++)
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: _buildPlayers(index++),
            ),
          ),
      ],
    );
  }

  List<int> convertFormationToList(formation) {
    List<String> result = formation.split("-");
    List<int> lint = result.map(int.parse).toList();
    return lint;
  }

  Widget _buildPlayers(index) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.black54,
            padding: const EdgeInsets.only(
              left: 3,
              right: 3,
              top: 1,
              bottom: 1,
            ),
            child: Text(
              players[index]['player']['name'] == null
                  ? ""
                  : players[index]['player']['name'].toString(),
              maxLines: 1,
              overflow: TextOverflow.clip,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ),
          Image.asset(
            "assets/images/player.png",
            width: 30,
          ),
          Text(
            players[index]['player']['number'] == null
                ? ""
                : players[index]['player']['number'].toString(),
          ),
        ],
      ),
    );
  }

  Widget _buildGK() {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.black54,
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: 3,
              bottom: 3,
            ),
            child: Text(
              players[0]['player']['name'] == null
                  ? ""
                  : players[0]['player']['name'].toString(),
              maxLines: 1,
              overflow: TextOverflow.clip,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ),
          Image.asset(
            "assets/images/player.png",
            width: 30,
          ),
          Text(
            players[0]['player']['number'] == null
                ? ""
                : players[0]['player']['number'].toString(),
          ),
        ],
      ),
    );
  }
}

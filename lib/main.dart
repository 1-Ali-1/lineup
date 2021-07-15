import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineup/bloc/lineup_bloc.dart';
import 'package:lineup/lineups/home/home.dart';
import 'package:lineup/modal/lineup_modal.dart';
import 'package:lineup/repository/lineup_repository.dart';

import 'lineups/away/away.dart';

int index = 1;
void main() => runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
    home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LineupBloc(LineupRepo())..add(Started(id: 592742)),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<LineupBloc, LineupState>(
            builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Loaded) {
                List<LineupModal> lineup = state.getLineup;

                return buildBody(lineup, context);
              } else if (state is Error) {
                return Center(
                  child: Text("Error"),
                );
              } else {
                return Text("");
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildBody(lineup, context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            child: Text(
              "Lineup",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 50,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    //592742
                    BlocProvider.of<LineupBloc>(context)
                      ..add(Selected(id: 592742));
                    index = 1;
                  },
                  child: Container(
                    child: Card(
                      color: index == 1 ? Colors.deepPurple : Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/ma.png",
                              width: 40,
                            ),
                            Text("-"),
                            Image.asset(
                              "assets/images/cast.png",
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //592141
                    BlocProvider.of<LineupBloc>(context)
                      ..add(Selected(id: 592141));
                    index = 2;
                  },
                  child: Container(
                    child: Card(
                      color: index == 2 ? Colors.deepPurple : Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/ma.png",
                              width: 40,
                            ),
                            Text("-"),
                            Image.asset(
                              "assets/images/burnley.png",
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //592211
                    BlocProvider.of<LineupBloc>(context)
                      ..add(Selected(id: 592211));
                    index = 3;
                  },
                  child: Container(
                    child: Card(
                      color: index == 3 ? Colors.deepPurple : Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/arsenal.png",
                              width: 40,
                            ),
                            Text("-"),
                            Image.asset(
                              "assets/images/avfc.png",
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // 592338
                    BlocProvider.of<LineupBloc>(context)
                      ..add(Selected(id: 592338));
                    index = 4;
                  },
                  child: Container(
                    child: Card(
                      color: index == 4 ? Colors.deepPurple : Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/south.png",
                              width: 40,
                            ),
                            Text("-"),
                            Image.asset(
                              "assets/images/arsenal.png",
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // 592836
                    BlocProvider.of<LineupBloc>(context)
                      ..add(Selected(id: 592836));
                    index = 5;
                  },
                  child: Container(
                    child: Card(
                      color: index == 5 ? Colors.deepPurple : Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/arsenal.png",
                              width: 40,
                            ),
                            Text("-"),
                            Image.asset(
                              "assets/images/west.png",
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 600,
            constraints: BoxConstraints(
              maxWidth: double.infinity,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/pitch.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 2,
                  child: Text(
                    lineup[0].formation,
                  ),
                ),
                /**
                 * Home
                 */
                Positioned(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height / 2,
                        child: BuildHome(
                          lineup: lineup[0],
                        ),
                      ),
                    ],
                  ),
                ),

                /**
               * Away
               */
                Positioned(
                  top: MediaQuery.of(context).size.height / 2.7,
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                          ),
                          width: MediaQuery.of(context).size.width - 20,
                          height: MediaQuery.of(context).size.height / 2,
                          child: BuildAway(lineup: lineup[1])),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Text(lineup[1].formation),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildHome extends StatelessWidget {
  final lineup;
  BuildHome({@required this.lineup});
  @override
  Widget build(BuildContext context) {
    return Linehome(
      lineup.startXI,
      lineup.formation,
    );
  }
}

class BuildAway extends StatelessWidget {
  final lineup;
  BuildAway({@required this.lineup});

  @override
  Widget build(BuildContext context) {
    return Lineaway(
      lineup.startXI,
      lineup.formation,
    );
  }
}

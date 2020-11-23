import 'package:flutter/material.dart';
import 'package:widget_testing/src/tapbox.dart';
import 'package:widget_testing/src/bouncingball.dart';
import 'tile.dart';
import 'words.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _routes = [Tapbox(), RandomWords(), Tile(), BouncingBall()];
  final _names = <String>['Tapbox', 'RandomWords', 'Tile', 'BouncingBall'];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing Widgets"),
      ),
      body: _buildRoutes(),
    );
  }

  Widget _buildRoutes() {
    return ListView.separated(
      itemCount: _routes.length,
      itemBuilder: (BuildContext _context, int index) {
        return _buildRow(index);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _buildRow(int index) {
    final text = _names[index];
    return ListTile(
      title: Text(
        '$text',
        style: _biggerFont,
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => _routes[index]));
      },
    );
  }
}

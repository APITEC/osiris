import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'user.dart';

//Routes
import 'piece.dart';

// Packages
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Pieces extends StatefulWidget {
  @override
  _PiecesState createState() => _PiecesState();
}

class _PiecesState extends State<Pieces> {
  List pieces = [1];

// Widgets
  GestureDetector buildPiece(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://picsum.photos/seed/${index + 1}/${(index % 3) * 100 + 200}/${(index % 2) * 50 + 150}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: pieces.length > 0
          ? CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 200,
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage:
                            NetworkImage('https://i.pravatar.cc/200?img=69'),
                      ),
                    )
                  ],
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'こんにちわ,',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'エンリケ',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  sliver: SliverStaggeredGrid.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    itemBuilder: (context, index) {
                      return buildPiece(context, index);
                    },
                    staggeredTileBuilder: (item) {
                      return StaggeredTile.fit(1);
                    },
                  ),
                ),
              ],
            )
          : EmptyState(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Provider.of<UserData>(context, listen: false).setUser({
            'id': 10,
            'email': 'monica@gmail.com',
            'first_name': 'Monica',
            'last_name': 'Garcia',
            'image': null,
            'government_id': '3746782364782346',
            'stamp': '1bc2783cn482b64n71cb6347n1cb'
          });
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => Piece()));
          setState(() {});
        },
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.add,
          size: 25,
        ),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Loading artwork...',
        style: TextStyle(
          color: Colors.grey[900],
          fontSize: 16,
        ),
      ),
    );
  }
}

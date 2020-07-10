import 'package:flutter/material.dart';

class Piece extends StatefulWidget {
  @override
  _PieceState createState() => _PieceState();
}

class _PieceState extends State<Piece> {
  TextEditingController title = TextEditingController();
  TextEditingController artist = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();

  bool image = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.redAccent),
            title: Text(
              'ぬぴつ',
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: false,
            flexibleSpace: FlexibleSpaceBar(
              title: !image
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            image = !image;
                          });
                        },
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.redAccent,
                        ),
                      ),
                    )
                  : Container(),
              background: image
                  ? ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20)),
                      child: Image.network(
                        'https://picsum.photos/seed/bla/400/300',
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  TextField(
                    controller: title,
                    cursorColor: Colors.grey[500],
                    cursorWidth: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'おなめわですか',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: null,
                  ),
                  TextField(
                    controller: artist,
                    cursorColor: Colors.grey[900],
                    cursorWidth: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'おピンつわだめか',
                      hintStyle: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                  TextField(
                    controller: description,
                    cursorColor: Colors.grey[900],
                    cursorWidth: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '葉樹めまして:',
                      hintStyle: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                  TextField(
                    controller: price,
                    cursorColor: Colors.grey[900],
                    cursorWidth: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '猫イギリスおはよう',
                      hintStyle: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.save,
          size: 25,
        ),
      ),
    );
  }
}

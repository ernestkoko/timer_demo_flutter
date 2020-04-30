import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack',
      home: Scaffold(
          backgroundColor: Colors.indigo[100],
          appBar: AppBar(
            title: Text('Stack'),
          ),
          body: Home()),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: Stack(
        fit: StackFit.expand,
        textDirection: TextDirection.ltr,
        children: showPizzaLayout(sizeX, sizeY),
      ),
    );
  }
}

List<Widget> showPizzaLayout(double sizeX, double sizeY) {
  List<Widget> layoutChildren = List<Widget>();
  Container background = Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('https://www.freeimages.com/download/file/e85a8ef612fd17400dd35b401a3a1a87/1600x1200') ,
            fit: BoxFit.fitHeight)    ),
  );
  layoutChildren.add(background);
  Positioned pizzaCard = Positioned(
      top: sizeY / 20,
      left: sizeX / 20,
      width: sizeX - sizeX/10,
      child: Card(
        elevation: 12,
        color: Colors.white70,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
            children: [
              Text('Margherita Pizza',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange[800]
                ),),
              Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('This delicious pizza is made of Tomato, Mozzarella and Basil. \n\nSerioulsly, you can\'t miss it!',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[800]
                    ),
                  )),

            ]

        ),
      ));
  layoutChildren.add(pizzaCard);
  Positioned buttonOrder = Positioned(
    bottom: sizeY / 20,
    left: sizeX / 20,
    width: sizeX - sizeX/10,
    child: RaisedButton(
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.orange[900],
      child: Text('Order Now!',
        style: TextStyle(fontSize: 20,
            color: Colors.white),
      ),
      onPressed: () {},
    ),
  );
  layoutChildren.add(buttonOrder);
  return layoutChildren;
}

List<Widget> createSquares(int numSquares) {
  int i = 0;
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];
  List<Widget> squares = List<Widget>();
  //squares.add(Container(color: Colors.black,));
  Widget square;
  while (i < numSquares) {
    square = Positioned(
        top: 100 + i.toDouble() * 100,
        left: 25 + i.toDouble() * 25,
        child: Container(
          color: colors[i],
          width: 60 * (numSquares.toDouble() - i),
          height: 60 * (numSquares.toDouble() - i),
          child: Text(i.toString()),
        ));
    i++;
    squares.add(square);
  }

  return squares;
}

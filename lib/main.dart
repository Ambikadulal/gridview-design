import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class BodyPage extends StatefulWidget {
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  final List<Map> myGroups =
  List.generate(50, (index) => {"id": index, "name": " $index","text":"Groups Two",})
      .toList();
  Color normalColor=Colors.amber;
  Color selectedColor=Colors.greenAccent;
  @override
    Widget build(BuildContext context) {
      return Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new GridView.builder(
                  controller: ScrollController(),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:40,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    if ((index + 1) % 21==50/2)//please complete this logic to adding second text "Groups Two"
                    {
                      //myGroups.add(Text(''));
                      return Container(
                      );
                    }
                    return Card(
                      child: InkResponse(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(myGroups[index]["name"],),
                        ),
                        onTap: (){
                          setState(() {
                            print(index);
                          });
                        },
                      ),
                        color: normalColor,
                    );
                  }),
            ],
          ),
        ),
        //),
        // ],
        // ),
      );
      }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: SingleChildScrollView(
              child: Container(
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,verticalDirection: VerticalDirection.down,
                  children:<Widget> [
                    Card(
                      child: Column(  mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          SizedBox(
                            child:Center(
                              child: Text('Grid View Group One',style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,fontSize: 16,letterSpacing: 1),),
                            ) ,height: 50,width: 200,),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: BodyPage(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

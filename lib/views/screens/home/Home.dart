import 'package:flutter/material.dart';
import 'package:shopx/controllers/channel.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/instance_manager.dart';
import 'package:shopx/constants.dart';
import 'package:shopx/views/screens/dashboard_details/Dashboard_details.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final ChannelController channelController = Get.put(ChannelController());
  @override
  Widget build(BuildContext context) {
    List<String> channe = [
      'A Tab',
      'B Tab',
      'C Tab',
      'D Tab',
      'E Tab',
      'F Tab',
      'G Tab',
      'H Tab',
      'I Tab',
      'J Tab',
      'K Tab',
      'L Tab',
      'M Tab',
      'N Tab',
      'O Tab'
    ];
    //   channelController.channelList(); // ['A Tab', 'B Tab', 'C Tab'];
    // channelController.channelList();

    return Scaffold(
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DefaultTabController(
                  length: 3, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: kPrimaryColor,
                            unselectedLabelColor: Colors.black,
                            indicatorWeight: 5,
                            indicatorColor: kPrimaryColor,
                            tabs: [
                              Tab(text: 'Summary'),
                              Tab(text: 'Channel'),
                              Tab(text: 'Channel Head'),
                              // Tab(text: 'Tab 4'),
                            ],
                          ),
                        ),
                        Container(
                            height: 500, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              Container(
                                height: 400,
                                child: Center(
                                  child: GridView.count(
                                    primary: false,
                                    padding: const EdgeInsets.all(1),
                                    crossAxisCount: 3,
                                    // mainAxisSpacing: 5,
                                    children: <Widget>[
                                      for (var i in channe)
                                        presentCard(context, i.toString(), 'B',
                                            Icons.card_giftcard)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: GridView.count(
                                    primary: false,
                                    padding: const EdgeInsets.all(1),
                                    crossAxisCount: 3,
                                    children: <Widget>[
                                      for (var i in channe)
                                        presentCard(context, i.toString(), 'N',
                                            Icons.label)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: GridView.count(
                                    primary: false,
                                    padding: const EdgeInsets.all(1),
                                    crossAxisCount: 3,
                                    children: <Widget>[
                                      for (var i in channe)
                                        presentCard(context, i.toString(), 'B',
                                            Icons.change_circle)
                                    ],
                                  ),
                                ),
                              ),
                            ]))
                      ])),
            ]),
      ),
    );

    // return Scaffold(
    //     backgroundColor: Colors.white,
    //     body: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: GridView.count(
    //         primary: false,
    //         padding: const EdgeInsets.all(1),
    //         crossAxisCount: 2,
    //         children: <Widget>[
    //           for (var i in channe)
    //             presentCard(context, i.toString(), 'Dashboard', Icons.light)
    //         ],
    //       ),

    //     ));
  }

  Container presentCard(
      BuildContext context, String title, String count, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(2),
      // height: 100,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    Colors.teal.shade300,
                    Colors.teal.shade600,
                    Colors.teal.shade900,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                      child: Text(
                        count,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Dashboard_details(),
                        ));
                        // Navigate back to first route when tapped.
                      }),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
          Container(
            alignment: FractionalOffset.topRight,
            margin: EdgeInsets.only(top: 75, right: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                // BoxShadow(color: Colors.black, offset: Offset(0, 3)),
              ],
            ),
            //padding: EdgeInsets.all(1),
            child: Icon(
              icon,
              color: Colors.teal[100],
              size: 45,
            ),
          )
        ],
      ),
    );
  }
}

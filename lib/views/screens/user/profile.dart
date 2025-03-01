import 'package:shopx/constants.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isOpen = false;
  PanelController _panelController = PanelController();
  var _imageList = [
    'assets/images/light-1.png',
    'assets/images/one.jpg',
    'assets/images/two.jpg',
    'assets/images/three.jpg',
    'assets/images/four.jpg',
    'assets/images/five.jpg',
  ];

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://scontent.fdac45-1.fna.fbcdn.net/v/t1.6435-9/174758568_1876822559146829_974792907856265948_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeFkfYth7hjnD2OXf7RjQcX5kuTxU0dt8MKS5PFTR23wwtdZe4bvrZUrU0oLjvklqTwMOEa4yAOPDmttjVLAO1v7&_nc_ohc=-1GoQtsrJvgAX81LUfy&_nc_ht=scontent.fdac45-1.fna&oh=00_AT95s9BHCPR-i02g7y3-g9QcfXhH_EjCyhkHSGpDIVzDBA&oe=61F802A2"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              color: Colors.white,
            ),
          ),

          /// Sliding Panel
          SlidingUpPanel(
            controller: _panelController,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            minHeight: MediaQuery.of(context).size.height * 0.35,
            maxHeight: MediaQuery.of(context).size.height * 0.85,
            body: GestureDetector(
              onTap: () => _panelController.close(),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            panelBuilder: (ScrollController controller) =>
                _panelBody(controller),
            onPanelSlide: (value) {
              if (value >= 0.2) {
                if (!_isOpen) {
                  setState(() {
                    _isOpen = true;
                  });
                }
              }
            },
            onPanelClosed: () {
              setState(() {
                _isOpen = false;
              });
            },
          ),
        ],
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// Panel Body
  SingleChildScrollView _panelBody(ScrollController controller) {
    double hPadding = 40;

    return SingleChildScrollView(
      controller: controller,
      physics: ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.teal,
                  Colors.white
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
                top: hPadding, bottom: 0, left: hPadding, right: hPadding),
            height: _isOpen
                ? MediaQuery.of(context).size.height * 0.205 + hPadding
                : MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _titleSection(),
                _actionSection(hPadding: hPadding),
              ],
            ),
          ),
          _moreDtl(),
        ],
      ),
    );
  }

  Container _moreDtl() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: <Widget>[
              Icon(Icons.badge_outlined,
                  size: 30, color: CustomeTheme.primaryLight),
              SizedBox(
                width: 8,
              ),
              Text(
                '01829282161',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.badge_outlined,
                  size: 30, color: CustomeTheme.primaryLight),
              SizedBox(
                width: 8,
              ),
              Text(
                'sayed@ssgbd.com',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.badge_outlined,
                  size: 30, color: CustomeTheme.primaryLight),
              SizedBox(
                width: 8,
              ),
              Text(
                'Dhaka, Bangladesh',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.badge_outlined,
                  size: 30, color: CustomeTheme.primaryLight),
              SizedBox(
                width: 8,
              ),
              Text(
                'Blood Group: O+',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.badge_outlined,
                  size: 30, color: CustomeTheme.primaryLight),
              SizedBox(
                width: 8,
              ),
              Text(
                'Employee ID : 8065',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Action Section
  Row _actionSection({double  hPadding}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Visibility(
          visible: !_isOpen,
          child: Expanded(
            child: OutlineButton(
              onPressed: () => _panelController.open(),
              borderSide: BorderSide(color: CustomeTheme.primaryLight),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'View More',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Title Section
  Column _titleSection() {
    return Column(
      children: <Widget>[
        Text(
          'Abu Sayed (SAYEM)',
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.badge_outlined,
                size: 30, color: CustomeTheme.primaryLight),
            SizedBox(
              width: 8,
            ),
            Text(
              '8065',
              style: TextStyle(
                fontFamily: 'NimbusSanL',
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Mobile & Web App Developer (Sr. Executive)',
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
        Text(
          'Information Technology',
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontStyle: FontStyle.italic,
            fontSize: 16,
            
          ),
        ),
        Text(
          'Super Star Group',
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

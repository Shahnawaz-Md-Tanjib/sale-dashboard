import 'package:shopx/views/screens/tabs/tabs.dart';
import 'package:shopx/views/page/people_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shopx/constants.dart';
//import 'package:shopx/api/my_api.dart';

class Body extends StatelessWidget {
  @override
  // void initState(){
  //   var respone = CallApi().getData('kra-kpi-mos-weightage?employee_id=60514&year=2021');

  // }

  Widget build(BuildContext context) {
    //print("hello word");
    // var respone = CallApi().getData('wastege_relations');
    // print("hello ");
    // print(respone);
    //  print("hello ");

    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    TextEditingController emailController = new TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/light-1.png'))),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/light-1.png'))),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        width: 80,
                        top: 40,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/light-1.png'))),
                        ),
                      ),
                      Positioned(
                          child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              // width: size.width * 0.9,
                              decoration: BoxDecoration(
                                  //borderRadius: BorderRadius.circular(29),
                                  //color:  kPrimaryLightColor,
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.person,
                                      color: kPrimaryColor,
                                    ),
                                    hintText: "Email or Phone number",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.lock,
                                      color: kPrimaryColor,
                                    ),
                                    suffixIcon: Icon(Icons.remove_red_eye,
                                        color: kPrimaryColor),
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          // var respone = CallApi().postData({ "username" : "dashboard" , "password" : "SNssgbd@2010"}, 'login.php');
                          //var respone = CallApi().getLoginData('login.php?username=dashboard&password=SNssgbd@2010');
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Tabs(),
                          ));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                kPrimaryLightColor,
                                kPrimaryColor,
                              ])),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: kPrimaryColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

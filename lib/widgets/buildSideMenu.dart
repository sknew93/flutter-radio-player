import 'package:flutter/material.dart';
import 'package:radiostring/blocs/config.dart';
import 'package:radiostring/blocs/station_bloc.dart';
import 'package:radiostring/utils/utils.dart';

class BuildSideMenu extends StatefulWidget {

  @override
  _BuildSideMenuState createState() => _BuildSideMenuState();
}

class _BuildSideMenuState extends State<BuildSideMenu> {

  @override
  Widget build(BuildContext context ) {
    var screenSize = MediaQuery.of(context).size;
    // bool isSwitched = false;

    return Container(
      color: Theme.of(context).backgroundColor,
      child: Container(
        margin: EdgeInsets.only(top: screenSize.height * 0.05),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: screenSize.height * 0.06,
              child: ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Icon(Icons.home, ),
                    ),
                    Text('Home',
                        style: TextStyle(
                          fontFamily: 'Jost-Medium',
                        )),
                  ],
                ),
                onTap: (){
                  if (currentPage != 'Radio String'){
                    currentPage = 'Radio String';
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }else {
                    Navigator.pop(context);
                  }

                },
              ),
            ),
            Container(
              height: screenSize.height * 0.06,
              child: ListTile(
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: Icon(Icons.info_outline,),
                      ),
                      Text('About Us',
                          style: TextStyle(
                              fontFamily: 'Jost-Medium'
                          )),
                    ],
                  ),
                  onTap: (){
                    if (currentPage != 'About Us'){
                      if (currentPage == 'Radio String'){
                        currentPage = 'About Us';
                        Navigator.popAndPushNamed(context, '/about');}
                      else{
                        currentPage = 'About Us';
                        Navigator.pushReplacementNamed(context, '/about');
                      }
                      }
                    else {
                      Navigator.pop(context);
                    }
                  }
              ),
            ),
            Container(
              height: screenSize.height * 0.06,
              child: ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Icon(Icons.accessibility,),
                    ),
                    Text('Privacy Policy',
                        style: TextStyle(
                            fontFamily: 'Jost-Medium'
                        )),
                  ],
                ),
                onTap: (){
                  if (currentPage != 'Privacy Policy'){
                    if (currentPage == 'Radio String'){
                      currentPage = 'Privacy Policy';
                      Navigator.popAndPushNamed(context, '/privacy_policy');}
                    else{
                      currentPage = 'Privacy Policy';
                      Navigator.pushReplacementNamed(context, '/privacy_policy');}
                  }else {
                    Navigator.pop(context);
                  }
                }
              ),
            ),
            Container(
              height: screenSize.height * 0.06,
              child: ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Icon(Icons.announcement,),
                    ),
                    Text('Terms & Conditions',
                        style: TextStyle(
                            fontFamily: 'Jost-Medium'
                        )),
                  ],
                ),
                onTap: (){
                  if (currentPage != 'Terms and Conditions'){
                    if (currentPage == 'Radio String'){
                      currentPage = 'Terms and Conditions';
                      Navigator.popAndPushNamed(context, '/terms_conditions');}
                    else {
                      currentPage = 'Terms and Conditions';
                      Navigator.pushReplacementNamed(context, '/terms_conditions');}
                  }else {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
            Container(
              height: screenSize.height * 0.06,
              margin: EdgeInsets.only(bottom: 10.0),
              child: ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Icon(Icons.contacts,),
                    ),
                    Text('Contact Us',
                        style: TextStyle(
                            fontFamily: 'Jost-Medium'
                        )),
                  ],
                ),
                onTap: (){
                  if (currentPage != 'Contact Us'){
                    if (currentPage == 'Radio String'){
                      currentPage = 'Contact Us';
                      Navigator.popAndPushNamed(context, '/contact_us');}
                    else{
                      currentPage = 'Contact Us';
                      Navigator.pushReplacementNamed(context, '/contact_us');}
                  }else {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
            Container(
              height: screenSize.height * 0.07,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color.fromRGBO(59, 89, 152, 1),
                  radius: screenSize.height / 40,
                  child: Image.asset('assets/images/facebook.png',
                      color: Colors.white, height: screenSize.height / 45),
                ),
                title: Text('Facebook',
                    style: TextStyle(
                        fontFamily: 'Jost-Medium',
                        color: Color.fromRGBO(59, 89, 152, 1)
                    )),
                onTap: (){
                },
              ),
            ),
            Container(
              height: screenSize.height * 0.07,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color.fromRGBO(29, 161, 242, 1),
                  radius: screenSize.height / 40,
                  child: Image.asset('assets/images/twitter.png',
                      color: Colors.white, height: screenSize.height / 45),
                ),
                title: Text('Twitter',
                    style: TextStyle(
                        fontFamily: 'Jost-Medium',
                        color: Color.fromRGBO(29, 161, 242, 1)
                    )),
                onTap: (){

                },
              ),
            ),
            Container(
              height: screenSize.height * 0.07,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color.fromRGBO(244, 67, 54, 1),
                  radius: screenSize.height / 40,
                  child: Image.asset('assets/images/google.png',
                      color: Colors.white, height: screenSize.height / 45),
                ),
                title: Text('Google',
                    style: TextStyle(
                        fontFamily: 'Jost-Medium',
                        color: Color.fromRGBO(244, 67, 54, 1)
                    )),
                onTap: (){

                },
              ),
            ),
            Container(
              height: screenSize.height * 0.07,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Day',style: TextStyle(fontFamily: 'Jost-Medium',) ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value){
                        setState(() {
                          StationsBloc().updateThemeSwitch(value);

                        });
                      },
                      // inactiveThumbColor: Theme.of(context).canvasColor,
                      inactiveTrackColor: Theme.of(context).canvasColor,
                      // activeTrackColor: Colors.lightGreenAccent,
                      // activeColor: Colors.green,
                    ),
                    Text('Night',style: TextStyle(fontFamily: 'Jost-Medium',) )
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}


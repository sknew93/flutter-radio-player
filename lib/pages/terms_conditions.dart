import 'package:flutter/material.dart';
import 'package:radiostring/utils/utils.dart';

import 'package:radiostring/widgets/buildSideMenu.dart';
import 'package:radiostring/widgets/myAppBar.dart';


class TermsConditions extends StatefulWidget {
  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<bool> _willPopCallback() async {
    currentPage = 'Radio String';
    return Future.value(true);
    // await showDialog or Show add banners or whatever
    // then
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: _willPopCallback,
        child: Scaffold(
          drawer: Container(
            width: screenSize.width * 0.75,
            child: Drawer(
              child: BuildSideMenu(),
            ),
          ),
          key: scaffoldKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Container(
            child: Column(
              children: [
                MyAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText1
                                  .merge(TextStyle(
                                fontFamily: 'Jost-Medium',
                              )),
                              children: <TextSpan>[
                                TextSpan(text: 'Please read the below Terms & condition to use Radiostring.com.\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''Radiostring.com is online radio stations aggregator. None of the stations owned by us. This is a free service to discover your favourite digital radio stations and access those easily. This agreement is a legal document between you(User/Customer) and Radiostring. User should read & agree upon our terms & conditions to use Radiostring.com website. May be the agreement will change from time to time. Please don’t use the website, if you are not agree with the given terms & conditions.
                                \n'''),
                                TextSpan(text: 'Registration\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''Registration is not a mandatory to use few of our services. But to use all our services you should create an account with us. Like in few websites, you don’t need to specify all your personal information to create an account. You can create your account by using your own social networking connections such as Facebook, Google by giving your username & password. We may use your personal information : Email id, Name for communication purpose in accordance with our privacy policy.
                        
        By creating account using social connections, you can share your activity(which station you are listening, you can share your favourite stations with your friends & family members) by your timeline. We have the right to terminate your account if you abuse our terms & conditions or if your details are not genuine.
                                \n'''),
                                TextSpan(text: 'Security\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''You are responsible to not share your account details with anyone. If you are aware of any unauthorized person is using your account, you can notify us at support@radiostring.com.
                                \n'''),
                                TextSpan(text: 'Content\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''All the content, stations, logo, images, trade names available in the website regarding radio stations are not our property and we don’t have any rights on them. We may update or delete the content, images etc from time to time.
                                \n'''),
                                TextSpan(text: 'Availability\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''This application is available in all the devices like Desktop, Tablet, Mobile. You can listen to any station over 10 languages with the internet facility in any of your device only. We are providing High-Quality stations for the users. But the quality is purely depends upon your internet connection and the streaming station.
                                \n'''),
                                TextSpan(text: 'Termination of your services\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''If you violate any conditions in this agreement, we have the right to terminate your account immediately without giving any notice.

And in the same way you’ve the right to stop using the Radiostring services by contacting us at support@radiostring.com By terminating your account, you don’t have access to user our services and we will remove the content updated by you(if any).
                                \n'''),
                                TextSpan(text: 'Payments\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''This is a completely free service. You can listen to Hundreds of radio stations without any payments or without buying any packages.
                                \n'''),
                                TextSpan(text: 'Other Sites Links\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''The website may contain third party links and Radiostring is not responsible for those website contents or any other information provided in their websites.
                                \n''')
                              ],
                            )),
                      )),
                )
              ],
            ),
          ),
        )
    );
  }


}

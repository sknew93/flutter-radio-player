import 'package:flutter/material.dart';
import 'package:radiostring/utils/utils.dart';

import 'package:radiostring/widgets/buildSideMenu.dart';
import 'package:radiostring/widgets/myAppBar.dart';


class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                            text: TextSpan(
                              text: '''This Privacy Policy is applicable for Radiostring.com application which is available on all the devices like Desktop, Tablet, Mobile.

This document is all about what information we will collect, how we use that information, how we secure your data. We may change this document from time to time.
\n''',
                              style: Theme.of(context).textTheme.bodyText1
                                  .merge(TextStyle(
                                fontFamily: 'Jost-Medium',
                              )),
                              children: <TextSpan>[
                                TextSpan(text: 'Users Information\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''We may collect your personal information such as Email-ID, Username, Mobile Number, Location, Date of Birth, Gender and other information from your social account or from your profile update in Radiostring.com.
                                \n'''),
                                TextSpan(text: 'Cookies Information\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''While you are using our website, we use cookies to store your data related to our website for easy navigation. It will generate a unique ID for the user to improve the user experience. Usually there are 2 types of cookies. One is session and other one is persistent. Session cookie is temporary cookie and it will be removed once the user closes the browser and Persistent cookie will remain in your browser even if you close the browser.
                                \n'''),
                                TextSpan(text: 'Data Security\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''We use data protection procedures to secure your data, that we collected from you. We won’t use your personal information for any marketing purposes without your approval.
                                \n'''),
                                TextSpan(text: 'Third Party Links\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''We may use Third Party websites in our website. Upon connecting to those websites, user should check their website Terms & conditions, Privacy Policy before sharing your personal information. We are not responsible for your data in accordance with the Third Party websites. Because we won’t share your personal information with any third party links.
                                \n''')
                              ],
                            ))
                      ),
                    ))
              ],
            ),
          ),
        )
    );
  }


}

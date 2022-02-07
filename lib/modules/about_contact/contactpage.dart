import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';


class ContacPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.teal[400],
   body: SafeArea(
      
        child: ContactUs(
          
              cardColor: Colors.white,
              textColor: Colors.teal.shade900,
              logo:const AssetImage('assets/images/drawer.jpg'),
              email: 'sweid888@gmail.com',
              companyName: "your pharmacy",
              companyColor: Colors.teal.shade100,
              dividerThickness: 2,
              phoneNumber: '+917818044311',
              website: 'https://abhishekdoshi.godaddysites.com',
              githubUserName: 'AbhishekDoshi26',
              linkedinURL:
                  'https://www.linkedin.com/in/abhishek-doshi-520983199/',
              tagLine: 'Flutter Developer',
              taglineColor: Colors.teal.shade100,
              twitterHandle: 'AbhishekDoshi26',
              instagram: '_abhishek_doshi',
              facebookHandle: '_abhishek_doshi'),
      )
    );
  }
}

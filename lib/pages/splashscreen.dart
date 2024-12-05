import 'package:flutter/material.dart';


class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2d495d),
      body: Center(
        child: CircleAvatar(
          radius: 100,
          child: ClipOval(
            child: Image.network("https://scontent.fblr20-1.fna.fbcdn.net/v/t39.30808-6/352391503_744853274055142_7065257342426680266_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=nNKK30YaSKkQ7kNvgHKbtmj&_nc_zt=23&_nc_ht=scontent.fblr20-1.fna&_nc_gid=AtEp490xihr1UsD-kNuoCu8&oh=00_AYAqAcPWIj3vAwfgfH2HB_O8Ep81lc4m9AWnFg2Nx7x2rQ&oe=67564EFA"),
          ),
        ),
      ),
    );
  }
}

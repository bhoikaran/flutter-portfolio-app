import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final Shader headerGradient = LinearGradient(colors: <Color>[
    Color.fromARGB(255, 1, 242, 255),
    Color.fromARGB(255, 33, 170, 97)
  ]).createShader(Rect.fromLTWH(0, 0, 200.0, 70.0));

  final Shader highlightGradient = LinearGradient(colors: <Color>[
    Color.fromARGB(255, 43, 255, 1),
    Color.fromARGB(255, 255, 255, 0)
  ]).createShader(Rect.fromLTWH(0, 0, 200.0, 70.0));

  final Shader overallTextGradient = LinearGradient(colors: <Color>[
    Color.fromARGB(255, 19, 17, 179),
    Color.fromARGB(255, 110, 193, 204),
    Color.fromARGB(255, 238, 87, 205),
    Color.fromARGB(255, 71, 231, 111),
    Color.fromARGB(255, 248, 202, 74),
  ]).createShader(Rect.fromLTWH(0, 0, 200.0, 70.0));

  mySkills(num, type) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            num,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = overallTextGradient),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(type),
          ),
        ],
      ),
    );
  }

  mySpcialization(icon, text) {
    return Container(
      width: 105,
      height: 115,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color.fromARGB(255, 30, 31, 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: TextStyle(
                    foreground: Paint()..shader = highlightGradient,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PopupMenuButton(
            onSelected: (result) {
              if (result == 2) {
                Navigator.pushNamed(context, "about");
              }
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            color: Colors.black,
            itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Projects",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "about");
                        },
                        child: Text(
                          "About",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ]),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 19, 16, 16),
                Color.fromARGB(255, 0, 0, 0),
              ]),
        ),
        child: SlidingSheet(
          elevation: 8,
          cornerRadius: 16,
          snapSpec: const SnapSpec(
            // Enable snapping. This is true by default.
            snap: true,
            // Set custom snapping points.
            snappings: [0.35, 0.7, 1.0],
            // Define to what the snappings relate to. In this case,
            // the total available space that the sheet can expand to.
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          // The body widget will be displayed under the SlidingSheet
          // and a parallax effect can be applied to it.
          body: Container(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(40),
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.transparent])
                          .createShader(
                              Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      'assets/profile_7.png',
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.49,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Karan Bhoi',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = headerGradient),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Android Developer',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = highlightGradient),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          builder: (context, state) {
            // This is the content of the sheet that will get
            // scrolled, if the content is bigger than the available
            // height of the sheet.
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
             
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      mySkills('40+', 'Projects'),
                      mySkills('11k', 'Students'),
                      mySkills('155', 'Sessions'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Spacialized In',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpcialization(FontAwesomeIcons.android, 'Android'),
                          mySpcialization(FontAwesomeIcons.github, 'GitHub'),
                          mySpcialization(FontAwesomeIcons.java, 'Java'),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpcialization(FontAwesomeIcons.flutter, 'Flutter'),
                          mySpcialization(FontAwesomeIcons.html5, 'HTML'),
                          mySpcialization(FontAwesomeIcons.css3, 'CSS'),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpcialization(FontAwesomeIcons.php, 'PHP'),
                          mySpcialization(
                              FontAwesomeIcons.database, 'Database'),
                          mySpcialization(FontAwesomeIcons.python, 'Python'),
                        ],
                      ), SizedBox(
                        height: 15,
                      ),
                     
                    ],
                  )
                ],
              ),
            );
          },

      
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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



_launchURL(urlLink) async {
   final Uri url = Uri.parse(urlLink);
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(163, 0, 0, 0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back arrow
        ),
      ),
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
                top: MediaQuery.of(context).size.height * 0.55,
              ),
              child: Column(
                children: [
                  Text(
                    'Hello I am',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
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
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 120,
                    child: TextButton(
                      onPressed: (() {
                        Navigator.pushNamed(context, "home");
                      }),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black),
                      child: Text('My Skills'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: (() {
                          _launchURL('https://www.linkedin.com/in/bhoikaran/');
                          }),
                          icon: FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.white,
                          )), IconButton(
                          onPressed: (() {
                              _launchURL('https://www.instagram.com/karan_bhoi_/');
                          }),
                          icon: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                          )), IconButton(
                          onPressed: (() {
                               _launchURL('https://github.com/bhoikaran');

                          }),
                          icon: FaIcon(
                            FontAwesomeIcons.github,
                            color: Colors.white,
                          )), 
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

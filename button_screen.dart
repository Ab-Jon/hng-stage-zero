import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {

  // The links to Github and HNG backlink
  final Uri _url = Uri.parse('https://github.com/Ab-Jon/hng-stage-zero');
  final Uri _urlH = Uri.parse('https://hng.tech/hire/flutter-developers');

  //Launching Github repo
  Future<void> _launchURLGit() async{
    if(!await launchUrl(_url)){
      throw Exception('Could not launch');
    }
  }

  //launching HNG backlink
  Future<void> _launchURLBack() async{
    if(!await launchUrl(_urlH)){
      throw Exception('Could not Launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HNG Stage Zero'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('CLICK THE RED BUTTON BELOW', style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25
            ),),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
          onPressed: (){
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context){
                  return Wrap(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.link),
                        title: Text('HNG Backlink'),
                        onTap: _launchURLBack,
                      ),
                      ListTile(
                        leading: const Icon(Icons.link),
                        title: Text('Github Repository'),
                        onTap: _launchURLGit,
                      )
                    ],
                  );
                });
          },
      child: Icon(Icons.menu),),
    );
  }
}


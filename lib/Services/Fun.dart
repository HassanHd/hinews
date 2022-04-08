import 'package:clipboard/clipboard.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Fun{
 static Future<void>openLink(String link)async{
    var urllink=link;
    if(await canLaunch(urllink)){
      await launch(urllink);
    }else{
      await launch(urllink);
    }

 }
 static Future<void>ShareLink(String link)async {
   Share.share("$link");
 }
 static Future<void>copyLink(String link)async {
   FlutterClipboard.copy('$link');
 }


}
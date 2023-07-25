import 'package:spotify/models/music.dart';

class MusicOperetions{
  MusicOperetions._();
  static List<Music> getMusic(){
      return<Music>[
        Music(
          'J Cole Mix','https://seed-mix-image.spotifycdn.com/v6/img/artist/6l3HvQ5sa6mXTsMTB19rO5/en/default','J cole, Travis Scott, Drake and more'),
        Music(
          'This Is Travis Scott','https://styles.redditmedia.com/t5_22fc6w/styles/communityIcon_e6r1kylae8g61.png','This Is Travis Scott. The essential tracks'),
        Music(
          'This Is Khalid','https://b.thumbs.redditmedia.com/2BD_qMu_F-CRoQPEHpks2pFvnmqGQg4m_JsKo4xlupE.png','This Is Khalid. The essential tracks'),
        Music(
          'AP Dhillon Mix','https://i.scdn.co/image/ab67616d00001e028471bff5344bd04f60ac834a','AP Dhillon, Shubh, Mitraz and more'),
        Music(
          'Chill Mix','https://i.scdn.co/image/ab67616d00001e028471bff5344bd04f60ac834a','Pop Smoke, Lil Uzi Vert, Khalid and more')
      ];
  }
  
}
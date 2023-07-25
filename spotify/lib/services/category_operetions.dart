import 'package:spotify/models/category.dart';

class categoryOperetions {
  categoryOperetions._();
  static List<Category> getCategories() {
    return <Category>[
      Category('Liked Songs',
          'https://i1.sndcdn.com/artworks-y6qitUuZoS6y8LQo-5s2pPA-t500x500.jpg'),
      Category('Emotional Songs',
          'https://i.scdn.co/image/ab67616d0000b273f047039273f69d31b3208fa4'),
      Category('Chill Mix',
          'https://i.scdn.co/image/ab67706f00000002ccd0d6170bb5d56a78ff8d3e'),
      Category('Origins/Deluxe',
          'https://i.scdn.co/image/ab67616d00001e02da6f73a25f4c79d0e6b4a8bd'),
      Category('A Place We Knew',
          'https://merchbar.imgix.net/product/337/9912/mcm-cd7509551/M1Wjs-9MMCM_CD7509551.jpg?quality=60&auto=compress,format&w=256'),
      Category('1000 Forms Of Fear',
          'https://merchbar.imgix.net/product/4/1616/26444604/888430740419.jpg?quality=60&auto=compress,format&w=256')
    ];
  }
}

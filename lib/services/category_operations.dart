import 'package:bonk_music/models/category.dart';

class CategoryOperations{
  CategoryOperations._(){}
  static List <Categorye> getCategories(){
    return <Categorye>[
      Categorye(name: 'Top Songs',imageURL:  'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
      Categorye(name: 'MJ Hits', imageURL: 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bXVzaWN8ZW58MHx8MHx8fDA%3D'),
      Categorye(name: 'Top Songs', imageURL: 'https://images.unsplash.com/photo-1445985543470-41fba5c3144a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bXVzaWN8ZW58MHx8MHx8fDA%3D'),
      Categorye(name: 'MJ Hits',imageURL:  'https://media.istockphoto.com/id/1297013252/photo/music-player-on-mobile-phone-with-earphones.jpg?s=2048x2048&w=is&k=20&c=Xf9893o2mFyVjPPvnhEE0wQb60y_g6TQbPIZwOwunjo='),
    ];
  }
}
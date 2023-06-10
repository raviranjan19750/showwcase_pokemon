import 'package:equatable/equatable.dart';


/// pokemon detail list model to map the api response


class PokemonListDetail extends Equatable {
  final String name;
  final String url;

  const PokemonListDetail({required this.url, required this.name});

  int get id {
    List<String> paths = url.split('/');

    paths.removeLast();

    return int.parse(paths.last);
  }

  factory PokemonListDetail.fromJson(Map<String, dynamic> json) {
    return PokemonListDetail(url: json['url'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "url": url, "name": name};
  }

  @override
  List<Object?> get props => [name, id];
}

class WebtoonModel {
  String id, title, thumb;

  WebtoonModel({required this.id, required this.title, required this.thumb});

  WebtoonModel.fromJson(Map<String, dynamic> map)
  :id = map['id'],
  title = map['title'],
  thumb = map['thumb'];

}
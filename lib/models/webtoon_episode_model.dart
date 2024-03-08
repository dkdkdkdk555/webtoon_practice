class EpisodeModel{
  String id, title;

  EpisodeModel.fromJson(Map<String, dynamic> json):
  id = json['id'],
  title = json['title'];
  
}
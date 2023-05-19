class Quiz {
  int? id;
  String? name;
  int? parentId;
  int? index;

  Quiz({this.id, this.name, this.parentId, required this.index});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // parentId = json['category_id'];
    index = index;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = parentId;
    return data;
  }
}

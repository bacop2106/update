class Category {
  int? id;
  String? name;
  int? order;
  int? parentId;
  Category({
    this.id,
    this.name,
    this.order,
    this.parentId,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['category_id'];
    name = json['name'];
    order = json['order'];
    parentId = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    return data;
  }
}

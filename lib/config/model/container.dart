class ItemListModel {
  String? name;
  String? image;
  String? age;
  String? condition;
  String? loadability;
  String? description;

  ItemListModel({
    this.name,
    this.image,
    this.age,
    this.condition,
    this.loadability,
    this.description,
  });

  ItemListModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    age = json['age'];
    condition = json['condition'];
    loadability = json['loadability'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['age'] = age;
    data['condition'] = condition;
    data['loadability'] = loadability;
    data['description'] = description;
    return data;
  }
}

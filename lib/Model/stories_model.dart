class StoryDataModel {
  String? image;
  String? title;
  int? id;

  StoryDataModel({this.id, this.image, this.title});
}

List<StoryDataModel> stories = [
  StoryDataModel(title: "Martin", id: 0, image: 'assets/person1.png'),
  StoryDataModel(title: "Andrew", id: 1, image: 'assets/person2.png'),
  StoryDataModel(title: "Karen", id: 2, image: 'assets/person3.png'),
  StoryDataModel(title: "Maisy", id: 3, image: 'assets/person4.png'),
  StoryDataModel(title: "Joshua", id: 4, image: 'assets/person5.png'),
  StoryDataModel(title: "Karen", id: 2, image: 'assets/person3.png'),
  StoryDataModel(title: "Maisy", id: 3, image: 'assets/person4.png'),
];

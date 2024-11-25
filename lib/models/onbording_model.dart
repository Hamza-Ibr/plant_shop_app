class PlantOnBording {
  String title;
  String image;
  PlantOnBording({
    required this.image,
    required this.title,
  });
}

List<PlantOnBording> pOnBording = [
  PlantOnBording(
    image: "assets/image1.png",
    title: "Enjoy your life with",
  ),
  PlantOnBording(
    image: "assets/image2.png",
    title: "Embrace the beauty of",
  ),
  PlantOnBording(
    image: "assets/image3.png",
    title: "Breathe in the serenity of",
  )
];

class Level {
  int level;
  String title;
  Function(void)? onPressed;
  String? image;

  Level({required this.title, required this.level, this.image, this.onPressed});
}

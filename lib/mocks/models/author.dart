class Author {
  String name;
  String imgUrl;
  Author(this.name, this.imgUrl);
}

List<String> categories = ["Paperback", "Hardcover", "Kindlebook"];

List<Author> authors = [
  Author("Song Kang", "https://dbk.vn/uploads/news/images/song-kang-1.jpg"),
  Author("Lâm Nhất",
      "https://kenh14cdn.com/2019/4/29/photo-1-1556515492908274470798.jpg"),
  Author("Dew Jirawat",
      "https://photo-cms-anninhthudo.zadn.vn/w600/Uploaded/2022/lcjlcanwm/2022_03_12/anh-14-3011.jpg"),
  Author("Bright",
      "https://ss-images.saostar.vn/wp700/2020/04/09/7310137/90001498_900482147052245_6436830738775015424_o.jpg")
];

class HomeModel{
  final String? name;
  final String? profileImg;
  final String? location;
  final String? img;
  final bool? isFav;
  final int? numFav;
  final List<String>? comments;
  final int? numComments;
  final bool? isSave;
  final String? desc;

  HomeModel({this.name, this.profileImg, this.location, this.img, this.isFav,
    this.numFav, this.comments, this.numComments, this.isSave, this.desc});
}

List<HomeModel> homeData=[
  HomeModel(name: "نور احمد ",profileImg: "assets/images/Ellipse 44.png",location: "القاهرة",
  img: "assets/images/pyramids.jpg",isFav: false, isSave: false,numComments: 4, numFav: 5,desc: "تعد أهرامات الجزيرة من أبرز المعالم  واهم اماكن سياحية في مصر. وتوجد فى القاهرة بمحافظة الجيزة تقع على هضبة الجيزة على الضفة الغربية لنهر النيل بنيت قبل حوالى 25 قرن قبل الميلاد وتشتمل على ثلاث أهرامات هما خوفو وخفرع ومنقرع"),
  HomeModel(name: " ميرنا عبدالله",profileImg: "assets/images/prof1.jpg",location: "إسكندرية",
      img: "assets/images/musem.jpg",isFav: true, isSave: false,numComments: 110, numFav: 8,desc: "المتحف المصري هو أحد أكبر وأشهر المتاحف العالمية يقع فى قلب العاصمة المصرية فى القاهرة من الجهة الشمالية لميدان التحرير"),
  HomeModel(name: "احمد محمد",profileImg: "assets/images/Pexels Photo by Burst.png",location: "اسوان",
      img: "assets/images/mosque.jpg",isFav: false, isSave: true,numComments: 60, numFav: 190,desc: "جامع الازهرهو من أهم المساجد فى مصر وأشهرها فى العالم الإسلامى وهو يضم جامعة وجامع منذ أكثر من ألف سنة"),
  HomeModel(name: "يوسف صلاح",profileImg: "assets/images/prof1.jpg",location: "المنصورة",
      img: "assets/images/khan.jpg",isFav: true, isSave: true,numComments: 88, numFav: 5,desc:"خان الخليلي أحد أحياء القاهرة القديمة والتى تجذب السياح بشكل كبير حيث يوجد فية العديد من البازارات ومحلات المطاعم الشعبية وعدد كبير من المقاهى ومن أشهرها مقهى الفيشاوى والتى يرجع تأسيسها إلى عام 1796"),
  HomeModel(name: "دنيا سعد",profileImg: "assets/images/prof2.jpg",location: "دمياط",
      img: "assets/images/salah.jpg",isFav: false, isSave: false,numComments: 49, numFav: 52,desc: "قلعه صلاح الدين الايوبي تم تشيدها فوق جبل المقطم وكان أول من سكنها هو الملك الكامل بن العادل وأتخذها دار للملك للقلعة أكثر من باب باب المقطم وباب الجديد والباب الوسطانى وباب القلعة"),
  HomeModel(name: "خلود فتحي",profileImg: "assets/images/prof3.jpg",location: "الدقهلية",
      img: "assets/images/mosq1.jpg",isFav: false, isSave: false,numComments: 0, numFav: 0,desc: "جامع السلطان حسن أنشئ على يد السلطان حسن بن قلاوون فى الفترة مابين 1356و1363 م خلال حقبة حكم المماليك "),
  HomeModel(name: "ساره عمرو",profileImg: "assets/images/prof4.jpg",location: "الاقصر",
      img: "assets/images/door.jpg",isFav: false, isSave: false,numComments: 60, numFav: 190,desc:"باب زويلة يعد باب زويلة أحد أبواب القاهرة القديمة وترجع شهرتة إلى أنة كان البوابة التى علقت عليها رؤس رسل هولاكو قائد التتار حينما أتوا مهددين مصر وأعدم علية أيضآ السلطان طومان باى"),
  HomeModel(name: "منه احمد",profileImg: "assets/images/prof5.jpg",location: "المنصورة",
      img: "assets/images/lake.jpg",isFav: false, isSave: false,numComments: 88, numFav: 5,desc:"جزيرة الروضة أحد ثلاث جزر فى نهر النيل يربطها بالقاهرة 5كبارى وبالجزيرة كوبريان كان فيها مقياس النيل وكان بها أيضآ منتزة جميل لأهالى الفسطاط"),

];
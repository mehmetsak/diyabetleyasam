import 'package:flutter/material.dart';
class DiyabetOneriler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          // backgroundColor: Colors.blueGrey.shade50,
          expandedHeight: 300,
          floating: false,
          pinned: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Diyabetle Yaşam"),
            centerTitle: false,
            background: Image.asset(
              "images/onerilericin.JPG",
              fit: BoxFit.cover,
            ),
          ),

        ),
        SliverPadding(
            padding: EdgeInsets.all(4),
            sliver:
            SliverList(delegate: SliverChildListDelegate(EkolanMethot()))),

      ],

    );
  }List<Widget> EkolanMethot() {
    return [

      Container(
        color: Colors.white,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          "EGZERSİZ "
            ,
          style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false),
          textAlign: TextAlign.center,
        ),
      ),

         Text(
          "Diyabette kan şekeri kontrolünün sağlanmasında genellikle beslenme tedavisi "
    "ile ilaç ve insülin tedavisi ön plana çıkarılırken, egzersiz göz ardı edilmektedir. "
    "Oysaki egzersiz de en az beslenme tedavisi ve medikal tedavi kadar diyabet tedavisinin önemli bir ögesidir.",
          style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false,backgroundColor: Colors.white),
          textAlign: TextAlign.center,
        ),

      Container(
        color: Colors.white,
        height: 100,
        alignment: Alignment.center,
        child: Text(
          "Egzersiz Neden Önemlidir?",
          style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false,),
          textAlign: TextAlign.center,
        ),
      ),

        Text(
          "Egzersiz yani fiziksel aktivitenin artması yiyeceklerin parçalanması sonucu oluşan şekerin,"
              " kas dokuları tarafından kullanılmasını hızlandırarak kan şekerini düşürür."
              "Özellikle, şişman diyabetlilerde egzersiz ile harcanan enerjinin artması vücut ağırlığını "
              "azalmasına yardımcı olur. Ayrıca egzersiz fiziksel zindelik sağlar.",
          style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false,backgroundColor: Colors.white),
          textAlign: TextAlign.center,
        ),

      Container(
        color: Colors.white,
        height: 100,
        alignment: Alignment.center,
        child: Text(
          "Egzersiz Ne Zaman Hangi Sıklıkta Yapılmalıdır? ",
          style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false),
          textAlign: TextAlign.center,
        ),
      ),

        Text(
          "Çoğu diyabetli en faydalı egzersizin sabah aç karnına yapılan "
              "egzersiz olduğuna inanır. Ancak aç karnına yapılan egzersiz "
              "kan şekerinin yükselmesine neden olabilir. Bu sebeple diyabetlilerin "
              "aç karnına egzersiz yapmaları doğru değildir. Egzersiz için en uygun zaman,"
              " yemek yenildikten sonraki 1-2 saattir. Böylelikle, yiyeceklerle kana geçen "
              "şeker vücut tarafından kolaylıkla kullanılır ve kan şekeri düzeylerinin kontrolü sağlanır."
              "Yemeklerden 3 saat sonra veya öğünlerden önce yapılan egzersizin hipoglisemi oluşturma riski vardır."
              " Egzersiz planlı olarak en az haftada 3-4 kez yapılmalıdır. Ancak bu haftanın 3 günü üst üste egzersiz "
              "yapıp diğer günler egzersiz yapmamak anlamına gelmemelidir. En uygunu, egzersizin her gün, düzenli olarak"
              " yapılmasıdır. Eğer şişmansanız ve kilo vermeyi hedefliyorsanız planlı olarak mutlaka her gün yapınız. ",
          style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false,backgroundColor: Colors.white,),
          textAlign: TextAlign.center,
        ),


      Container(
        color: Colors.white,
        height: 150,
        alignment: Alignment.center,
        child: Text(
          "Yapılacak Egzersizin Süresi ve Tipi Ne Olmalıdır? ",
          style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false),
          textAlign: TextAlign.center,
        ),
      ),
      Text(
        "Kısa süren (1-5 dak.) egzersiz programlarında kaslar glukozu kullanmazlar. "
            "Bu nedenle egzersiz programı 5 dakika ile başlanmalı ve giderek süresi arttırılmalıdır. "
            "Etkin bir egzersiz programı için 20-30 dakika zaman harcanmalıdır. "
            "Bu süre zamanla artırılarak 60 dakikaya çıkarılabilir.Bir egzersiz programı mutlaka 5 dakikalık ısınma,"
            " 5-10 dakikalık gerdirme, 20-30 dakikalık fiziksel aktivite ve 5 dakikalık soğuma kısımlarını kapsamalıdır. "
            "Vücudun belirli bir bölgesini çalıştırmaya yönelik egzersizler yerine tüm vücudu çalıştıran egzersiz tipleri "
            "tercih edilmelidir (vücut geliştirme yerine yürüme, koşma, yüzme tercihi gibi.) "
           ,
        style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false,backgroundColor: Colors.white,),
        textAlign: TextAlign.center,
      ),
      Container(
        color: Colors.white,
        height: 150,
        alignment: Alignment.center,
        child: Text(
          "Beslenme Tedavisi",
          style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false),
          textAlign: TextAlign.center,
        ),
      ),
      Text(
        "Diyabet tedavisinde kan şekeri kontrolünü sağlamak için sağlıklı beslenme alışkanlıklarının kazanılması önemlidir."
            " Diyabeti olmayan bireylerde olduğu gibi diyabetli bireylerinde yeterli ve dengeli beslenmeyi öğrenmesi ve"
            " öğrendiklerini günlük yaşamda uygulaması sağlıklı bir yaşamın temelini oluşturur.  "

        ,
        style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false,backgroundColor: Colors.white,),
        textAlign: TextAlign.center,
      ),
      Container(
        color: Colors.white,
        height: 150,
        alignment: Alignment.center,
        child: Text(
          "Bir Diyetisyenle Görüşene Kadar Ne Yapmalısınız?",
          style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false),
          textAlign: TextAlign.center,
        ),
      ),
      Text(
        "Diyabeti olsun veya olmasın tüm insanların sağlıklı bir yaşam için yemeleri gereken yiyecekler aynıdır."
            " Diyabetli olmanız diğer insanlardan farklı bir yiyeceği yemeniz veya yememeniz anlamına gelmez."
            " Burada önemli olan vücudun ihtiyacı olan besinlerin çeşitli yiyeceklerden karşılanmasıdır."
            " Ancak genellikle kişiler diyabetli olduklarını öğreninceye kadar, sağlıklı beslenmek amacı "
            "ile değil de karın doyurmak amacı ile canının istediğini veya kendisine sunulan yemeği yedikleri"
            " için beslenme alışkanlıklarını değiştirmekte güçlük çekerler. Bunun için aceleci ve çok fazla kuralcı"
            " olmamakta fayda vardır.Beslenme alışkanlıklarınızda yapmanız gereken değişikliklere sizin için en"
            " önemli olanlardandan başlayabilirsiniz.·  Öncelikle kan şekerinizin hızlı bir şekilde yükselmesine "
            "neden olan şeker ve şeker içeren yiyecekler ile kilo almanıza neden olacak yağ ve yağlı yiyecekleri "
            "azaltın.·  Bir veya iki öğün yemek yerine günde en azından üç öğün yemeye çalışın. Öğünler arasında ve"
            " gece yatmadan önce küçük bir ara öğün almanız da gerekebilir.·  Alkolün tedavinize etkisini öğrenmeden ,"
            " alkollü içki içmeyin.·  Diyetisyeninizle görüşmeye gitmeden önceki üç veya beş gün süre boyunca içtiğiniz"
            " ve yediğiniz herşeyi not alın. Bu kayıtlar , diyetisyeninizin sizin beslenme alışkanlıklarınızı ve günlük"
            " yaşam tarzınızı öğrenmesine fırsat verir ve böylece alışkanlıklarınıza uygun bireysel bir plan "
            "oluşturmasına yardımcı olur"


        ,
        style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false,backgroundColor: Colors.white,),
        textAlign: TextAlign.center,
      ),
      Container(
        color: Colors.white,
        height: 150,
        alignment: Alignment.center,
        child: Text(
          "Kaynak:www.turkdiab.org \n"
              "www.gidahatti.com ",
          style: TextStyle(fontSize: 18,color: Colors.blueGrey,inherit: false),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }
}
/*
SliverGrid(
            delegate: SliverChildListDelegate(EkolanMethot()),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
 */
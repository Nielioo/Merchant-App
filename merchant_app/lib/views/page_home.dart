part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.item});

  final Item item;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Item Details",
          style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        backgroundColor: primaryColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF93FBF6),
                Color(0xFFE9FDFC),
              ]),
        ),
        child: Column(
          children: [
            // Text("Font Test",style: TextStyle(fontFamily: "Nunito", fontStyle: FontStyle.italic),),
            //Item Image Banner
            Flexible(
              flex: 3,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(widget.item.imageBannerPath),
                      fit: BoxFit.cover,
                    )),
                  ),
                  // Image(
                  //   image: AssetImage(widget.item.imageBannerPath),
                  //   fit: BoxFit.cover,
                  // ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 16, 0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(25),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _isFavorite = !(_isFavorite);
                            });
                          },
                          icon: _isFavorite
                              ? Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.grey,
                                ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //Item Image Preview
            Flexible(
              flex: 1,
              child: ListView.separated(
                padding: EdgeInsets.only(left: 8, right: 8),
                // physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.item.imagePreviewPathList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardItemPreview(
                    imagePath: widget.item.imagePreviewPathList[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
              ),
            ),
            //Item Description
            Flexible(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      "Mondstadt Vision Keychain",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      // physics: BouncingScrollPhysics(),
                      child: SafeArea(
                        child: Text(
                          "Produk hand made, kondisi sesuai foto."
                          "\nDibuat per pesanan masuk, silahkan langsung order ^_^. Pengerjaan 1-3 hari."
                          "\nVision hanya 1 sisi, jika ingin dibuat bolak-balik, silahkan order 2 pcs, kemudian tambahkan keterangan saat checkout, atau via chat."
                          "\n"
                          "\n● BAHAN ●"
                          "\nGem terbuat dari resin, logonya 3D print. Frame hasil 3D print, bukan cetakan pabrik, harap maklum pasti ada bekas garis-garis di pinggir dan area-area miring."
                          "\n"
                          "\n● UKURAN ●"
                          "\nMondstadt : frame 5.5 x 5.5 cm, gem diameter 3 cm"
                          "\nLiyue: frame 4.7 x 4.7 cm, gem diagonal 3.5 cm"
                          "\nSnezhnaya: frame 5.5 x 5.5 cm, gem diameter 3 cm"
                          "\nInazuma: frame 5x6 cm, gem diameter 3 cm"
                          "\n"
                          "\n● NOTE ●"
                          "\nFoto diambil di bawah sinar matahari dan tidak diedit, namun tetap mungkin ada sedikit perbedaan warna dengan aslinya. Preorder dicantumkan 10 hari agar bisa digabung dengan barang lain. Waktu pengerjaan 1-3 hari, jika lebih awal selesai akan langsung dikirim."
                          "\n\n(Source: Qianxi1128)",
                          style: TextStyle(fontFamily: "Nunito", fontSize: 14),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

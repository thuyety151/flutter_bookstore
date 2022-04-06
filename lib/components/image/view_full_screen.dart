import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/screens/book_detail/detail/components/book_list_image.dart';
import 'package:flutter_folder/screens/book_detail/review/components/list_images_review.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:photo_view/photo_view.dart';

class ViewImageFullScreen extends StatefulWidget {
  const ViewImageFullScreen({Key? key}) : super(key: key);

  @override
  _ViewImageFullScreenState createState() => _ViewImageFullScreenState();
}

class _ViewImageFullScreenState extends State<ViewImageFullScreen> {
  late int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void _onClose() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            PhotoViewGallery.builder(
                itemCount: sampleData.length,
                onPageChanged: (value) => setState(() {
                      currentIndex = value;
                    }),
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(sampleData[index]),
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 2,
                  );
                },
                scrollPhysics: BouncingScrollPhysics(),
                backgroundDecoration: BoxDecoration(
                  color: Colors.black,
                )),
            Positioned(
                bottom: 8,
                right: 16,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.black26,
                  ),
                  child: Text(
                    (currentIndex + 1).toString() + "/${imgUrls.length}",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                )),
            Positioned(
                top: 58,
                right: 8,
                child: GestureDetector(
                  onTap: _onClose,
                  child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 22,
                      )),
                )),
          ],
        ));
  }
}

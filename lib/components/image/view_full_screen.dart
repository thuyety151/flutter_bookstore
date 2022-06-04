import 'package:flutter/material.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

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
    final args = ModalRoute.of(context)!.settings.arguments as ListImgArgs;

    return Container(
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            PhotoViewGallery.builder(
                itemCount: args.urls.length,
                onPageChanged: (value) => setState(() {
                      currentIndex = value;
                    }),
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(args.urls.elementAt(index)),
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 2,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.black,
                )),
            Positioned(
                bottom: 8,
                right: 16,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.black26,
                  ),
                  child: Text(
                    (currentIndex + 1).toString() + "/${args.urls.length}",
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                )),
            Positioned(
                top: 58,
                right: 8,
                child: GestureDetector(
                  onTap: _onClose,
                  child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 22,
                      )),
                )),
          ],
        ));
  }
}

class ListImgArgs {
  List<String> urls;
  ListImgArgs({required this.urls});
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/provider/book_model.dart';
import 'package:flutter_folder/screens/book_detail/review/components/item_review.dart';
import 'package:flutter_folder/screens/book_detail/review/components/session_title.dart';
import 'package:provider/provider.dart';

class ReviewContainer extends StatefulWidget {
  const ReviewContainer({Key? key}) : super(key: key);

  @override
  _ReviewContainerState createState() => _ReviewContainerState();
}

class _ReviewContainerState extends State<ReviewContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SessionTitle(
        title: "Reviews",
        padding: EdgeInsets.only(bottom: 16),
      ),
      Consumer<BookModel>(
          builder: (context, value, child) => value.detail != null
              ? Wrap(
                  direction: Axis.vertical,
                  spacing: 20,
                  children: List.generate(
                    value.detail?.reviews?.length ?? 0,
                    (index) => ItemReview(
                      value: value.detail!.reviews!.elementAt(index),
                    ),
                  ))
              : const SizedBox())
    ]);
  }
}

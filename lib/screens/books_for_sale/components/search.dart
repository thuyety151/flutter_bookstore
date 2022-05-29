import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/configs/constants.dart';
import 'package:flutter_folder/configs/storage.dart';

class Search extends StatefulWidget {
  const Search(
      {Key? key,
      this.keywords,
      required this.setKeywords,
      required this.btnFilter})
      : super(key: key);
  final String? keywords;
  final Function(String) setKeywords;
  final Widget btnFilter;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final Storage storage = Storage();
  late List<String> keywords = [];
  late bool isSearching = false;

  Future<List<String>> getKeywords() async {
    if (keywords.isNotEmpty) {
      return keywords;
    }
    var data = await storage.getKeywords;
    if (data.isNotEmpty) {
      setState(() {
        keywords = data;
      });
    }

    return data;
  }

  OutlineInputBorder searchBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.transparent, width: 1),
    );
  }

  void removeKeyword(String? keyword) {
    storage.removeKeyword(keyword);
    if (keyword == null) {
      setState(() {
        keywords = [];
      });
      return;
    }
    setState(() {
      keywords = keywords.where((element) => element != keyword).toList();
    });
  }

  Widget contents(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: getKeywords(),
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            return Positioned(
                child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.white,
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("History", style: AppTextStyles.caption),
                      GestureDetector(
                        onTap: () => removeKeyword(null),
                        child: const Text("Remove", style: AppTextStyles.price),
                      ),
                    ],
                  ),
                ),
                ...List.generate(
                    keywords.length,
                    (index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => submit(keywords.elementAt(index)),
                              child: Text(keywords.elementAt(index)),
                            ),
                            IconButton(
                                onPressed: () =>
                                    removeKeyword(keywords.elementAt(index)),
                                icon: const Icon(Icons.close))
                          ],
                        ))
              ]),
            ));
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  void submit(String value) {
    if (value.isEmpty) {
      return;
    }
    storage.setKeywords(value);
    widget.setKeywords(value);
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    if (args != null) {
      setState(() {
        isSearching = args.isSeaching ?? false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            color: AppColors.kPrimary,
            child: Wrap(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 80 / 100,
                    child: FocusScope(
                        child: Focus(
                      onFocusChange: (focus) => setState(() {
                        isSearching = focus;
                      }),
                      child: TextField(
                          onSubmitted: submit,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              border: searchBorder(),
                              focusedBorder: searchBorder(),
                              enabledBorder: searchBorder(),
                              hintText: "Search book",
                              hintStyle: const TextStyle(
                                  color: AppColors.kTextGrey, fontSize: 14),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: AppColors.kTextGrey,
                              ))),
                    ))),
                const SizedBox(
                  width: 8,
                ),
                widget.btnFilter
              ],
            ),
          ),
          if (isSearching == true) ...[contents(context)]
        ],
      )
    ]);
  }
}

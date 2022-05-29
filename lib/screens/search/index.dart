// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_folder/provider/category_model.dart';
// import 'package:provider/provider.dart';

// class SearchScreen extends StatelessWidget {
//   const SearchScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Provider.of<CategoryModel>(context, listen: false)
//         .getCategoriesHomescreen();

//     return Container(
//       decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(16),
//             bottomRight: Radius.circular(16),
//           ),
//           color: Colors.white),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Positioned(
//                 top: 16,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _search(),
//                     _isLoading
//                         ? const Center(
//                             child: CircularProgressIndicator(),
//                           )
//                         : Consumer<Cart>(
//                             builder: (_, cart, ch) => Badge(
//                               child: ch!,
//                               value: cart.itemCount.toString(),
//                               textColor: Colors.white,
//                             ),
//                             child: FlatButton(
//                               onPressed: () {
//                                 _isLogin
//                                     ? Navigator.of(context)
//                                         .pushNamed(RouteManager.ROUTE_CART)
//                                     : Navigator.of(context)
//                                         .pushNamed(RouteManager.ROUTE_LOGIN);
//                               },
//                               color: Colors.white,
//                               height: 38,
//                               minWidth: 38,
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 0),
//                               shape: const RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(8))),
//                               child: const Image(
//                                 image: AssetImage(
//                                   "assets/icons/o-icon-cart.png",
//                                 ),
//                                 height: 24,
//                                 width: 24,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 100,
//             child: SizedBox(child: _listCategory()),
//           ),
//           const SizedBox(
//             height: 8,
//           )
//         ],
//       ),
//     );
//   }
// }

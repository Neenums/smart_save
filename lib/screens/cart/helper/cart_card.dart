// import 'package:flutter/material.dart';
// import 'package:smart_save/screens/cart/helper/plus_minus_button.dart';
//
// import '../../products/helper/rating.dart';
//
// class CartCard extends StatelessWidget {
//   const CartCard({
//     Key? key,
//     // required this
//   }) : super(key: key);
//
//  // final String name;
//  // final String image;
//  // final String rate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 88,
//           child: AspectRatio(
//             aspectRatio: 0.88,
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF5F6F9),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Image.asset('assets/images/twitter.png'),
//             ),
//           ),
//         ),
//         const SizedBox(width: 20),
//         Expanded(
//           child: Stack(
//             children: [
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     //
//                     'Cart title',
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                     maxLines: 2,
//                   ),
//                   SizedBox(height: 8),
//                   ProductRating(),
//                   SizedBox(height: 8),
//                   Text.rich(
//                     TextSpan(
//                       // text: "\$${cart.product.price}",
//                       text: "\$18.00",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600, color: Colors.grey),
//
//                     ),
//                   ),
//                   SizedBox(height: 30,)
//
//                 ],
//               ),
//               Positioned(bottom:-1,right:15,child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: PlusMinusButtons(text: '3',addQuantity: (){},deleteQuantity: (){},),
//               ))
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
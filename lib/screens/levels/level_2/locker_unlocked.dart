import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/consts/assets_consts.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/level_strings.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:flutter/material.dart';

// class LockerUnlocked extends StatelessWidget {
//   const LockerUnlocked({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: primary_3,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.amber,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10))),
//           centerTitle: true,
//           title: CustomButton(
//             buttonText: 'Home',
//             buttonHeight: 0.06,
//             buttonWidth: 0.2,
//             onPressed: () {
//               Navigator.pushReplacementNamed(context, '/');
//             },
//           ),
//         ),
//         body: Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width * 0.05,
//           ),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//             SpacingConsts().mediumHeightBetweenFields(context),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.88,
//               padding: EdgeInsets.symmetric(
//                   horizontal: MediaQuery.of(context).size.width * 0.05,
//                   vertical: MediaQuery.of(context).size.height * 0.01),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10), color: Colors.white),
//               child: AutoSizeText(
//                 LevelStrings().level2After.first,
//                 maxLines: 3,
//                 style: const TextStyle(
//                     fontFamily: 'Kod', color: Colors.black, fontSize: 25.0),
//               ),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.7,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: DecorationImage(
//                       image: AssetImage(AssetConsts().level2AfterAssets.first),
//                       fit: BoxFit.contain)),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

class LockerUnlocked extends StatelessWidget {
  const LockerUnlocked({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary_3,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          centerTitle: true,
          title: CustomButton(
            buttonText: 'Home',
            buttonHeight: 0.06,
            buttonWidth: 0.2,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SpacingConsts().mediumHeightBetweenFields(context),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: LevelStrings().level1After.map((stringItem) {
                      return AutoSizeText(
                        LevelStrings().level2After.first,
                        style:
                            const TextStyle(fontSize: 15.0, fontFamily: 'Kod'),
                      );
                    }).toList(),
                  ),
                ),
                SpacingConsts().smallHeightBetweenFields(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Image.asset(
                    AssetConsts().level2AfterAssets.first,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

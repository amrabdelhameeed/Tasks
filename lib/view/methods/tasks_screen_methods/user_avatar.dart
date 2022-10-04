import 'package:flutter/material.dart';
import '../../../core/utils/size_config.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: SizeConfig.defaultSize! * 3,
        top: SizeConfig.defaultSize! * 2.1,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: SizeConfig.defaultSize! * 2.7,
          child: const Icon(Icons.person),
        ));
  }
}

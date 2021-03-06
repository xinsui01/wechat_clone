import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../constants.dart' show AppColors, AppStyles;
import '../mine_data.dart' show me;

class Header extends StatelessWidget {
  static const double AVATAR_SIZE = 72.0;
  static const double VERTICAL_PADDING = 16.0;
  static const double HORIZONTAL_PADDING = 10.0;
  static const double QR_CODE_PREV_SIZE = 20.0;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      color: AppColors.HeaderCardBg,
      padding: EdgeInsets.fromLTRB(
          HORIZONTAL_PADDING, 0.0, HORIZONTAL_PADDING, VERTICAL_PADDING * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: VERTICAL_PADDING),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(
                imageUrl: me.avatar,
                width: AVATAR_SIZE,
                height: AVATAR_SIZE,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    me.name,
                    style: AppStyles.HeaderCardTitleTextStyle,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    '微信号：${me.account}',
                    style: AppStyles.HeaderCardDescTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Image.asset(
              'assets/images/ic_qrcode_preview_tiny.png',
              width: QR_CODE_PREV_SIZE,
              height: QR_CODE_PREV_SIZE,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black38,
          )
        ],
      ),
    );
  }
}

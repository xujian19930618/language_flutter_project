import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../pages/detail_page.dart';
import '../pages/profile_page.dart';
import '../pages/search_page.dart';
import '../pages/settings_page.dart';

/// 路由配置页面
class AppRoutes {
  /// 路由名称数组
  static const routes = [
    '/home',      // 首页
    '/detail',    // 详情页
    '/profile',   // 个人中心页
    '/settings',  // 设置页
    '/search',    // 搜索页
  ];

  /// 获取路由名称
  static String getRouteName(dynamic page) {
    if (page is String) {
      return page;
    }
    return page.toString();
  }

  /// 获取页面组件
  static Widget getPageWidget(dynamic page) {
    if (page is String) {
      switch (page) {
        case '/detail':
          return const DetailPage();
        case '/profile':
          return const ProfilePage();
        case '/settings':
          return const SettingsPage();
        case '/search':
          return const SearchPage();
        default:
          return const SizedBox();
      }
    }
    return const SizedBox();
  }
}

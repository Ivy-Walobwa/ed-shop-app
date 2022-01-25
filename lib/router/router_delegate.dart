import 'package:flutter/material.dart';

import 'routes_config.dart';
import '../models/shop_item.dart';
import '../presentation/item_list_screen.dart';
import '../presentation/item_details_screen.dart';
import '../presentation/error_page.dart';

class ShopListRouterDelegate extends RouterDelegate<ShopListRouteConfig> with ChangeNotifier, PopNavigatorRouterDelegateMixin<ShopListRouteConfig> {

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  ShopListRouterDelegate():  navigatorKey = GlobalKey<NavigatorState>();

  ShopItem? _selectedItem;
  bool show404 = false;
  final List<ShopItem> _items = shopItem;

  // get current route based on the show404 flag and _selectedItem value
  @override
  ShopListRouteConfig get currentConfiguration {
    if (show404) {
      return ShopListRouteConfig.error();
    }
    return _selectedItem == null
        ? ShopListRouteConfig.list()
        : ShopListRouteConfig.details(_items.indexOf(_selectedItem!));
  }

  // code same as before except it uses notify listeners instead of setState and adds Navigator Key
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('ItemListScreen'),
          child: ItemListScreen(
            items: _items,
            onTapped: _handleItemTapped,
          ),
        ),
        if (show404)
          const MaterialPage(
            key: ValueKey('Error Page'),
            child: ErrorPage(),
          )
        else if (_selectedItem != null)
          MaterialPage(

            key: ValueKey(_selectedItem!.name),
            child: ItemDetailsScreen(
              item: _selectedItem,
            ),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _selectedItem = null;
        show404 = false;
        notifyListeners();
        return true;
      },
    );
  }


  // update app state to set new route based on configuration set
  @override
  Future<void> setNewRoutePath(ShopListRouteConfig configuration) async{
    if (configuration.isError) {
      _selectedItem = null;
      show404 = true;
      return;
    }

    if (configuration.isDetailsPage) {
      if (configuration.id! < 0 || configuration.id! > _items.length -1) {
        show404 = true;
        return;
      }
      _selectedItem = _items[configuration.id!];
    } else {
      _selectedItem = null;
    }

    show404 = false;
  }

  void _handleItemTapped(ShopItem item) {
      _selectedItem = item;
    notifyListeners();
  }
}


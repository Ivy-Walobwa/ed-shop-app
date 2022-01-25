import 'package:flutter/material.dart';

import 'routes_config.dart';

class ShopListRouterInformationParser extends RouteInformationParser<ShopListRouteConfig> {

  @override
  Future<ShopListRouteConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    // Handle '/'

    if (uri.pathSegments.isEmpty) {
      return ShopListRouteConfig.list();
    }

    // Handle '/items/:itemName'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'items') return ShopListRouteConfig.error();
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      if (id == null) return ShopListRouteConfig.error();
      return ShopListRouteConfig.details(id);
    }

    // Handle /404
    return ShopListRouteConfig.error();
  }

  @override
  RouteInformation? restoreRouteInformation(ShopListRouteConfig configuration) {
    if (configuration.isError) {
      return const RouteInformation(location: '/404');
    }
    if (configuration.isListPage) {
      return const RouteInformation(location: '/');
    }
    if (configuration.isDetailsPage) {
      return RouteInformation(location: '/items/${configuration.id}');
    }
    return null;
  }
}
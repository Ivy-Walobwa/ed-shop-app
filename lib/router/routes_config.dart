class ShopListRouteConfig{
  final int? id;
  final bool isError;

  ShopListRouteConfig.list()
      : id = null,
        isError = false;

  ShopListRouteConfig.details(this.id) : isError = false;

  ShopListRouteConfig.error()
      : id = null,
        isError = true;

  bool get isListPage => id == null;

  bool get isDetailsPage => id != null;
}
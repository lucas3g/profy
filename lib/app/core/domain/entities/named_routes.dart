enum NamedRoutes {
  splash('/'),
  login('/login'),
  home('/home'),
  comandas('/comandas'),
  products('/products');

  final String route;
  const NamedRoutes(this.route);
}

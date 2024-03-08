enum AppEndpoints {
  license('/licenca'),
  appConfig('/licenca/config'),
  login('/login'),
  comanda('/comanda'),
  products('/produtos'),
  stock('/conferencia_estoque'),
  imageProduct('https://cdn-cosmos.bluesoft.com.br/products');

  final String path;

  const AppEndpoints(this.path);
}

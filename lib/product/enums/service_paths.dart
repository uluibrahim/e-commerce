enum ServicePaths {
  allproducts("/products"),
  searchproduct("/products/search?q="),
  getSingleProduct("https://dummyjson.com/products/"),
  getAllCarts("https://dummyjson.com/carts/user/");
  final String path;
  const ServicePaths(this.path);
}

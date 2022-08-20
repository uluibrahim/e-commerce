abstract class ICartsService {
  Future getAllCarts(int userId);
  Future getSingleProduct(int productId);
}
class Urls {
  static const String _baseUrl = 'https://ecom-api.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String getHomeSliders = '$_baseUrl/ListProductSlider';

  static String getCategories = '$_baseUrl/CategoryList';

  static String getProductByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String getProductsByRemarks(String remarks) =>
      '$_baseUrl/ListProductByRemark/$remarks';

  static String getProductDetails(int productId) => '$_baseUrl/ProductDetailsById/$productId';
  static const String addToCart = '$_baseUrl/CreateCartList';
  static const String getCartList = '$_baseUrl/CartList';
  static String removeFromCart(int id) => '$_baseUrl/DeleteCartList/$id';
  static const  String VerifyCreateProfile = '$_baseUrl/CreateProfile';
  static const String getReadProfile = '$_baseUrl/ReadProfile';
  static  String CreateWishList(int productId) => '$_baseUrl/CreateWishList/$productId';
  static const String getWishList = '$_baseUrl/ProductWishList';
  static const String createInvoice = '$_baseUrl/InvoiceCreate';
  static  String ReviewList(int productId) => '$_baseUrl/ListReviewByProduct/$productId';
  static const String CreateProductReview = '$_baseUrl/CreateProductReview';
}


class Queries {
  static final String getProductsQuery = '''
      query MyQuery {
        product {
          name
          price
          product_category {
            description
          }
          product_type {
            description
          }
        }
      }
    ''';

    static final String getProductsCategories = '''
      query productsCategory {
        product_category {
          id
          description
        }
      }
    ''';

    final String getProductsTypes = '''
      query productsType {
        product_type {
          id
          description
        }
      }
    ''';
}


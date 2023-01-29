import './models/item.dart';

import './models/category.dart';

GenderCategory men = GenderCategory(id: 0, name: 'men', categoryIds: [
  1,2,3,4,5,6,7,8,9,10,
]);

GenderCategory women = GenderCategory(id: 1, name: 'women', categoryIds: [
  11,12,13,14,15,16,17,18,19,20,
]);

List<Category> categories = [
  Category(id: 1, name: 'Topwear', itemIds: [1,2,3,4,5,6]),
  Category(id: 2, name: 'Bottomwear', itemIds: [7,8,9,10]),
  Category(id: 3, name: 'Footwear', itemIds: []), 
  Category(id: 4, name: 'Sports & Active Wear', itemIds: []),
  Category(id: 5, name: 'Fashion Accessories', itemIds: []),
  Category(id: 6, name: 'Gadgets', itemIds: []),
  Category(id: 8, name: 'Personal Care', itemIds: []),
  Category(id: 7, name: 'Innerwear & Sleepwear', itemIds: []),
  Category(id: 9, name: 'Indian & Festive Wear', itemIds: []),
  Category(id: 10, name: 'Watches', itemIds: []),
  Category(id: 11, name: 'Indian & Fusion Wear(women)', itemIds: []),
  Category(id: 12, name: 'Topwear(Western)(women)', itemIds: []),
  Category(id: 13, name: 'Bottomwear(Western)(women)', itemIds: []),
  Category(id: 14, name: 'Footwear(women)', itemIds: []),
  Category(id: 15, name: 'Lingerie & Sleepwear(women)', itemIds: []),
  Category(id: 16, name: 'Gadgets(women)', itemIds: []),
  Category(id: 17, name: 'Watches & Wearables(women)', itemIds: []),
  Category(id: 18, name: 'Sports & Active Wear(women)', itemIds: []),
  Category(id: 19, name: 'Beauty & Personal Care(women)', itemIds: []),
  Category(id: 20, name: 'Jewellery(women)', itemIds: []),
];

List<Item> items = [
  Item('Huetrap T-Shirt', 'Topwear', 1),
  Item('Sleveless T-Shirt', 'Topwear', 2),
  Item('Roadster Casual Shirt', 'Topwear', 3),
  Item('Slimfit Casual Shirt', 'Topwear', 4),
  Item('H&M Sweatshirt', 'Topwear', 5),
  Item('Highlander Hoodie', 'Topwear', 6),
  Item('Blue Jeans', 'Bottomwear', 7),
  Item('Black Jeans', 'Bottomwear', 8),
  Item('Slim Fit Cargos', 'Bottomwear', 9),
  Item('Tapered Fit Chinos', 'Bottomwear', 10),

];

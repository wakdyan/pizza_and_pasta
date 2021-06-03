import '../models/food.dart';

const foodSizes = ['S', 'M', 'L'];
const deliveryFee = 16000;

final favoriteFoods = [
  Food(
    id: 11,
    imageUrl: 'assets/meat_lovers.png',
    name: 'Meat Lovers',
    tag: 'Pizza',
    description: '4 slices',
    price: 58000,
    rating: 4.6,
  ),
  Food(
    id: 12,
    imageUrl: 'assets/super_supreme_chicken.png',
    name: 'Super Supreme Chicken',
    tag: 'Pizza',
    description: '8 slices',
    price: 158000,
    rating: 4.2,
  ),
  Food(
    id: 13,
    imageUrl: 'assets/tuna_melt.png',
    name: 'Tuna Melt',
    tag: 'Pizza',
    description: '6-8 slices',
    price: 111000,
    rating: 4.2,
  ),
];

final businessLunches = [
  Food(
    id: 21,
    imageUrl: 'assets/beef_spaghetti.png',
    name: 'Beef Spaghetti',
    tag: 'Pasta',
    description:
        'Pasta Spaghetti, Daging Sapi Cincang, Saus Tomat dan Keju Cheddar',
    price: 50900,
    rating: 4.2,
  ),
  Food(
    id: 22,
    imageUrl: 'assets/oriental.png',
    name: 'Oriental Chicken Spaghetti',
    tag: 'Pasta',
    description:
        'Spaghetti dengan potongan ayam panggang, disiram saus oriental yang pas manisnya',
    price: 56000,
    rating: 4.1,
  ),
  Food(
    id: 23,
    imageUrl: 'assets/blackpepper.png',
    name: 'Black Pepper Chicken Fettucine',
    tag: 'Pasta',
    description:
        'Pasta Fettuccine, Bawang Bombay, Parika Merah, Paprika Hijau dan Saus Lada Hitam.',
    price: 56000,
    rating: 4.5,
  ),
];

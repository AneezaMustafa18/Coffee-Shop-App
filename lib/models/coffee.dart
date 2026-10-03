class Coffee {
  final String name;
  final String description;
  final String price;
  final String image;

  const Coffee({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

// Cappuccino coffees
const List<Coffee> cappuccinoCoffees = [
  Coffee(
    name: 'Classic Cappuccino',
    description: 'With Chocolate',
    price: '4.20',
    image:
    'https://images.unsplash.com/photo-1572442388796-11668a67e53d?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Oat Cappuccino',
    description: 'With Oat Milk',
    price: '4.50',
    image:
    'https://images.unsplash.com/photo-1534778101976-62847782c213?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Caramel Cappuccino',
    description: 'With Caramel',
    price: '4.80',
    image:
    'https://images.unsplash.com/photo-1570968915860-54d5c301fa9f?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Vanilla Cappuccino',
    description: 'With Vanilla',
    price: '4.60',
    image:
    'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Creamy Cappuccino',
    description: 'Extra Creamy',
    price: '5.00',
    image:
    'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=600&q=80',
  ),
];

// Espresso coffees
const List<Coffee> espressoCoffees = [
  Coffee(
    name: 'Classic Espresso',
    description: 'Strong & Rich',
    price: '3.80',
    image:
    'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Double Espresso',
    description: 'Extra Strong',
    price: '4.30',
    image:
    'https://images.unsplash.com/photo-1610889556528-9a770e32642f?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Dark Espresso',
    description: 'Deep & Bold',
    price: '4.00',
    image:
    'https://images.unsplash.com/photo-1551030173-122aabc4489c?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Italian Espresso',
    description: 'Traditional Style',
    price: '4.20',
    image:
    'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Rich Espresso',
    description: 'Smooth & Rich',
    price: '4.50',
    image:
    'https://images.unsplash.com/photo-1447933601403-0c6688de566e?auto=format&fit=crop&w=600&q=80',
  ),
];

// Latte coffees
const List<Coffee> latteCoffees = [
  Coffee(
    name: 'Classic Latte',
    description: 'Smooth & Creamy',
    price: '4.00',
    image:
    'https://images.unsplash.com/photo-1570968915860-54d5c301fa9f?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Vanilla Latte',
    description: 'Sweet & Smooth',
    price: '4.60',
    image:
    'https://images.unsplash.com/photo-1561882468-9110e03e0f78?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Caramel Latte',
    description: 'With Caramel',
    price: '4.80',
    image:
    'https://images.unsplash.com/photo-1572442388796-11668a67e53d?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Iced Latte',
    description: 'Cold & Refreshing',
    price: '4.50',
    image:
    'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Hazelnut Latte',
    description: 'Nutty & Creamy',
    price: '5.00',
    image:
    'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=600&q=80',
  ),
];

// Flat White coffees
const List<Coffee> flatWhiteCoffees = [
  Coffee(
    name: 'Classic Flat White',
    description: 'Smooth & Strong',
    price: '4.20',
    image:
    'https://images.unsplash.com/photo-1512568400610-62da28bc8a13?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Creamy Flat White',
    description: 'Rich & Creamy',
    price: '4.50',
    image:
    'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Oat Flat White',
    description: 'With Oat Milk',
    price: '4.70',
    image:
    'https://images.unsplash.com/photo-1534778101976-62847782c213?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Caramel Flat White',
    description: 'With Caramel',
    price: '4.90',
    image:
    'https://images.unsplash.com/photo-1572442388796-11668a67e53d?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Classic Strong',
    description: 'Bold & Smooth',
    price: '4.40',
    image:
    'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?auto=format&fit=crop&w=600&q=80',
  ),
];

// Keep this list for the Home Screen
const List<Coffee> coffees = [
  Coffee(
    name: 'Cappuccino',
    description: 'With Chocolate',
    price: '4.20',
    image:
    'https://images.unsplash.com/photo-1572442388796-11668a67e53d?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Cappuccino',
    description: 'With Oat Milk',
    price: '3.14',
    image:
    'https://images.unsplash.com/photo-1534778101976-62847782c213?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Espresso',
    description: 'Strong & Rich',
    price: '3.80',
    image:
    'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?auto=format&fit=crop&w=600&q=80',
  ),
  Coffee(
    name: 'Latte',
    description: 'Smooth & Creamy',
    price: '4.00',
    image:
    'https://images.unsplash.com/photo-1570968915860-54d5c301fa9f?auto=format&fit=crop&w=600&q=80',
  ),
];
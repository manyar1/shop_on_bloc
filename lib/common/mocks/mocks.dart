
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';

abstract class Mocks {
   static final List<FoodEntity> listFoodEntity = [
    const FoodEntity(
      id: 1,
      description:
          'Начинка: капуста белокочанная Лаваш тонкий 3 шт.ук репчатый, морковь по - корейский, огурцы маринованные, перец сладкий, шашлык и говядины 200 г ',
      title: 'Шашлык-шаверма',
      price: 155,
    gram: 300,
      imgUrl: 'common/assets/images/kebab.png',
      imgUrl2: 'common/assets/images/Frame_3.png',
    ),
    const FoodEntity(
      id: 2,
      description:
          'ИНГРЕДИЕНТЫ: курица, помидор, огурец, лаваш, петрушка, укроп, йогурт, листовой салат, паприка, чеснок, сыр-фета, хмели, сунели, соль',
      title: 'Доннер-кебаб',
      price: 225,
     gram: 350,
      imgUrl: 'common/assets/images/donner.png',
      imgUrl2:'common/assets/images/Group_5.png',
    ),
     const FoodEntity(
      id: 3,
      description:
          'ИНГРЕДИЕНТЫ: лаваш армянский, помидор свежий 1 шт, салат айсберг 1/2 шт, куриная грудка 350 г, сыр Гауда 150 г, майонез, горчица 1 ч. л, чеснок 2 шт, соль по вкусу, специи по вкусу',
      title: 'Шаверма-цезарь',
      price: 210,
gram: 250,
      imgUrl: 'common/ssets/images/сze.png',
      imgUrl2: 'common/assets/images/Group_4.png',
    ),
     const FoodEntity(
      id: 4,
      description:
          'ИНГРЕДИЕНТЫ: курица, помидор, огурец, лаваш, петрушка, укроп, йогурт, листовой салат, паприка, чеснок, сыр-фета, хмели, сунели, соль',
      title: 'Классическая шаурма',
      price: 150,
     gram: 250,
      imgUrl: 'common/assets/images/shaurma.png',
      imgUrl2:'common/assets/images/Group_6.png'
    ),
    const FoodEntity(
      id: 5,
      description:
          'Тортилья, курица, лук, перец болгарский, чеснок, баклажаны, пекинская капуста, кабачки, сыр моцарелла, соус сирача, соус шашлычный, специи',
      title: 'Бурито',
      price: 200,
     gram: 200,
      imgUrl: 'common/assets/images/burito2.png',
      imgUrl2:'common/assets/images/burito.png'
    ),
    const FoodEntity(
      id: 6,
      description:
          'Пита, болгарский перец, салат айсберг, огурец свежий, куриное филе, соевый соус, оливковое масло, соль, перец черный молотый, паприка молотая, йогурт, лимонный сок, чеснок, соль и перец, карри порошок.',
      title: 'Пита с курицей',
      price: 350,
     gram: 300,
      imgUrl: 'common/assets/images/pita2.png',
      imgUrl2:'common/assets/images/pita.png'
    ),
    const FoodEntity(
      id: 7,
      description: '',
      title: 'Фанта',
      price: 100,
      gram: 0.5,
      imgUrl: 'common/ssets/images/phanta.png',
      imgUrl2:'common/assets/images/phanta.png'
    ),
    const FoodEntity(
      id: 8,
      description: '',
      title: 'Спрайт',
      price: 100,
      gram: 0.5,
      imgUrl: 'common/assets/images/sprite.png',
      imgUrl2:'common/assets/images/sprite.png'
    ),
    const FoodEntity(
      id: 9,
      description: '',
      title: 'Кока-кола',
      price: 100,
      gram: 0.5,
      imgUrl: 'common/assets/images/cola.png',
      imgUrl2:'common/assets/images/cola.png'
    ),
     const FoodEntity(
      id: 10,
      description: '',
      title: 'Сок-яблочный',
      price: 120,
      gram: 1,
      imgUrl: 'common/assets/images/apple.png',
      imgUrl2:'common/assets/images/apple.png'
    ),
    const FoodEntity(
      id: 11,
      description: '',
      title: 'Red Bull',
      price: 130,
      gram: 0.25,
      imgUrl: 'common/assets/images/redbull.png',
      imgUrl2:'common/assets/images/redbull.png'
    ),
    const FoodEntity(
      id: 12,
      description: '',
      title: 'Святой источник негаз',
      price: 90,
      gram: 0.5,
      imgUrl: 'common/assets/images/nogaz.png',
      imgUrl2:'common/assets/images/nogaz.png'
    ),
    const FoodEntity(
      id: 13,
      description: '',
      title: 'Святой источник газ',
      price: 90,
      gram: 0.5,
      imgUrl: 'common/assets/images/gaz.png',
      imgUrl2:'common/assets/images/gaz.png'
    ),
    const FoodEntity(
      id: 14,
      description: 'Большая порция. Запеченный картофель + Кетчуп в подарок',
      title: 'Картошка-фри',
      price: 180,
      gram: 130,
      imgUrl: 'common/assets/images/kartoshkafri.png',
      imgUrl2:'common/assets/images/kartoshkafri.png'
    ),
    const FoodEntity(
      id: 15,
      description: 'Большая порция. Запеченный картофель по-деревенски + Кетчуп в подарок',
      title: 'Картошка по-деревенски',
      price: 120,
      gram: 150,
      imgUrl: 'common/assets/images/kartoshkaderev.png',
      imgUrl2:'common/assets/images/kartoshkaderev.png'
    ),
     const FoodEntity(
      id: 16,
      description: 'Куриные нагетсы с хрустящей корочкой 9 штук + Кетчуп в подарок',
      title: 'Нагетсы куриные',
      price: 130,
      gram: 150,
      imgUrl: 'common/assets/images/nagi.png',
      imgUrl2:'common/assets/images/nagi.png'
    ),
     const FoodEntity(
      id: 7,
      description: 'Большая порция. Куринные крылышки на сковородке 6 штук + Кетчуп в подарок',
      title: 'Куриные крылашки',
      price: 200,
      gram: 180,
      imgUrl: 'common/assets/images/krilo.png',
      imgUrl2:'common/assets/images/krilo.png'
    ),
    const FoodEntity(
      id: 18,
      description: 'Куриные стрипсы с хрустящей корочкой 9 штук + Кетчуп в подарок',
      title: 'Куриные стрипсы',
      price: 120,
      gram: 130,
      imgUrl: 'common/assets/images/strips.png',
      imgUrl2:'common/assets/images/strips.png'
    ),
    const FoodEntity(
      id: 19,
      description: 'Свининый шашлык на мангале, очень нежное мясо с фирменным вкусом + Кетчуп в подарок',
      title: 'Свининый шашлык',
      price: 200,
      gram: 100,
      imgUrl: 'common/assets/images/svininashashlik.png',
      imgUrl2:'common/assets/images/svininashashlik.png'
    ),
    const FoodEntity(
      id: 20,
      description: 'Куриные шашлык на мангале, очень нежное мясо с фирменным вкусом + Кетчуп в подарок',
      title: 'Куриный шашлык',
      price: 180,
      gram: 100,
      imgUrl: 'common/assets/images/kurinshashlik.png',
      imgUrl2:'common/assets/images/kurinshashlik.png'
    ),
     const FoodEntity(
      id: 21,
      description: 'Люлякебаб из баранины на мангале, очень нежное мясо с фирменным вкусом + Кетчуп в подарок',
      title: 'Люлякебаб из баранины',
      price: 150,
      gram: 100,
      imgUrl: 'common/assets/images/kebablula.png',
      imgUrl2:'common/assets/images/kebablula.png'
    ),
    const FoodEntity(
      id: 22,
      description: 'Хлебобулочное изделие, мягкое внутри, с хрустящей корочкой, часто припудренное мукой.',
      title: 'Багет Французкий',
      price: 50,
      gram: 40,
      imgUrl: 'common/assets/images/baget.png',
      imgUrl2:'common/assets/images/baget.png'
    ),
    const FoodEntity(
      id: 23,
      description: 'Крендель из дрожжевого теста',
      title: 'Брецель',
      price: 150,
      gram: 60,
      imgUrl: 'common/assets/images/brechel.png',
      imgUrl2:'common/assets/images/brechel.png'
    ),
    const FoodEntity(
      id: 24,
      description: 'Плюшка с сахарной корочкой, мягкая внутри',
      title: 'Плюшка московская',
      price: 70,
      gram: 50,
      imgUrl: 'common/assets/images/bylochka.png',
      imgUrl2:'common/assets/images/bylochka.png'
    ),
    const FoodEntity(
      id: 25,
      description: 'Татарский пирожок треугольной формы с мясной начинкой',
      title: 'Эчпочмак',
      price: 60,
      gram: 30,
      imgUrl: 'common/assets/images/echpochmak.png',
      imgUrl2:'common/assets/images/echpochmak.png'
    ),
    const FoodEntity(
      id: 26,
      description: 'Рулет из теста с вишневой начинкой',
      title: 'Вишневый штрудель',
      price: 180,
      gram: 80,
      imgUrl: 'common/assets/images/vishnya.png',
      imgUrl2:'common/assets/images/vishnya.png'
    ),
    const FoodEntity(
      id: 27,
      description: 'Грибы на гриле',
      title: 'Шашлык из грибов',
      price: 100,
      gram: 100,
      imgUrl: 'common/assets/images/gribi.png',
      imgUrl2:'common/assets/images/gribi.png'
    ),
    const FoodEntity(
      id: 28,
      description: 'Картофель на гриле',
      title: 'Картофель люля',
      price: 100,
      gram: 100,
      imgUrl: 'common/assets/images/lula.png',
      imgUrl2:'common/assets/images/lula.png'
    ),
    const FoodEntity(
      id: 29,
      description: 'Перец на гриле',
      title: 'Шашлык перец',
      price: 60,
      gram: 20,
      imgUrl: 'common/assets/images/perec.png',
      imgUrl2:'common/assets/images/perec.png'
    ),
  ];
}


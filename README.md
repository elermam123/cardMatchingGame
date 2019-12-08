# Steam Statistics Generalizing App for FunCorp Code Challenge

В приложении реализованы все основные пункты.
Из дополнительных:
- Сравнение статистики с другом
- Экран новостей по игре
- Дополнительная информация в профиле пользователя: 
  - статус онлайн, 
  - уровень стима,
  - тип профиля, 
  - логаут :)

## Архитектура

Используемая архитектура приложения - VIPER

Структура проекта:

- Constants: папка, где содержатся UI костанты и общие константы 
- Extensions: соотвественно здесь находятся extension-ы
- Utils: вспомогательные статические классы
- NetworkServices: сервисы, схожие по именам с сервисами Steam API, через которые осуществляются сетевое взаимодействие со Steam API
- NetworkModels: содержит подгруппы Request и Response со структурами, описывающими параметры запроса и ответа
- DataProvider: DataProvider для синхронизации статистики из Steam API c локальной БД
- DBEntities: классы сущностей CoreData
- BaseComponents: здесь находятся базовые компоненты приложения для модулей, для View и базовые адаптеры для работы с делегатами и датасорсами UITableView, UICollectionView

- Modules: основные VIPER модули приложения. 

Структура модуля содержит компоненты VIPER(файл {ModuleName}Protocols, в нем описаны протоколы компонентов, View, Presenter, Interactor и Router)

при наличии на экранах таблиц содержит подгруппу Adapter для работы с датасорсом и делегатом таблицы, 

также может находится подгруппа View, в которой описаны наследники UIView 

подгруппа ViewModel - здесь содержатся структуры с данными для отображения на View компоненте.


## Сторонние библиотеки

- Alamofire, RxAlamofire: 

мастхев(по мнению части сообщества:) работы с сетью, решил использовать еще и 
зависимость с Rx, которая по моему мнению хорошо вписывается в особенность работы со Steam API, учитывая взаимосвязь некоторых методов API. Есть правда несовсем приятные issues у Alamofire, но писать свою обертку над NSURLSession энергозатратно в этой ситуации.
- Kingfisher: 

отличная библиотека для асинхронной загрузки изображений по url и их кэширования. Широко используется сообществом(опять-таки кто-то считает мастхэвом:)
- PinLayout: 

удобная библиотека для емкой декларативной верстки, мало issues на github, хорошие оценки, достаточно высокая производительность, поддерживает старые версии iOS
- Charts: 

вот здесь весьма неоднозначно:) Большое количество issues, средний порог вхождения для правильной кастомизации :( Но поскольку имел опыт работы с ней, сократила время на реализацию..
- SwintLinkPreview: 

одна из немногих библиотек для парсинг контента urla(изображение, тайтл, описание ..) с достаточно большим количеством звезд

## Используемые методы Steam API

Сервисы:
- ISteamUser

  Методы:
  - GetPlayerSummaries
  - GetFriendList
  - ResolveVanityUrl
  
- IPlayerService

  Методы:
  - GetRecentlyPlayedGames
  - GetOwnedGames
  - GetBadges
  
- ISteamUserStats

  Методы:
  - GetUserStatsForGame
  
- ISteamNews

  Методы:
  - GetNewsForApp


## Предложения по улучшению кода проекта

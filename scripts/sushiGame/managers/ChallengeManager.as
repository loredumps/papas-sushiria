package sushiGame.managers
{
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.Challenge;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   import sushiGame.data.SpecialItem;
   import sushiGame.data.StickerData;
   import sushiGame.data.UserData;
   
   public class ChallengeManager
   {
       
      
      public var gameObj:class_5;
      
      public var badges:Array;
      
      public var stickers:Array;
      
      public var badgeDropdown:MovieClip = null;
      
      public var badgeQueue:Array;
      
      public var badgeQueueType:Array;
      
      public var badgeDropdownBitmap:Bitmap = null;
      
      public var badgeDropdownSticker:MovieClip = null;
      
      public var dropdownX:Number = 158;
      
      public var dropdownStartY:Number = 0;
      
      public var dropdownHeight:Number = 48;
      
      public var dropdownSpeed:Number = 4;
      
      public var dropdownOnScreenWait:Number = 120;
      
      public var dropdownOnScreenTimer:Number = 0;
      
      public var dropdownDisabled:Boolean = false;
      
      public function ChallengeManager(param1:class_5)
      {
         this.badges = [new Challenge(Challenge.UNLOCKSEASON,{
            "targetAmount":1,
            "tagName":"summer",
            "title":"Summer Vacation",
            "description":"Reach Summer",
            "sticker":"hotdog"
         }),new Challenge(Challenge.UNLOCKSEASON,{
            "targetAmount":1,
            "tagName":"fall",
            "title":"Fall Harvest",
            "description":"Reach Autumn",
            "sticker":"turkeys"
         }),new Challenge(Challenge.UNLOCKSEASON,{
            "targetAmount":1,
            "tagName":"winter",
            "title":"Winter Wonderland",
            "description":"Reach Winter",
            "sticker":"sundaesaurus"
         }),new Challenge(Challenge.UNLOCKSEASON,{
            "targetAmount":1,
            "tagName":"spring",
            "title":"Spring Has Sprung",
            "description":"Reach Spring",
            "sticker":"strawbuzzy"
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":6,
            "toppings":[FoodData.PAPER_SHIROI,FoodData.FILLING_NARUTOMAKI,FoodData.FILLING_KAMPACHI,FoodData.TEA_HAKUTO,FoodData.SAUCE_SWEETSAKURA,FoodData.SHAKER_WAKAME],
            "title":"Springtime Sushi",
            "description":"Unlock all Cherry Blossom Festival toppings",
            "sticker":"cherryblossom",
            "showTally":true
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":6,
            "toppings":[FoodData.PAPER_TORTILLA,FoodData.FILLING_CHORIZO,FoodData.FILLING_CHIPOTLECHEDDAR,FoodData.TEA_HORCHATA,FoodData.SAUCE_NACHOCHEESE,FoodData.SHAKER_RECADOROJO],
            "title":"Cinco Celebration",
            "description":"Unlock all Cinco de Mayo toppings",
            "sticker":"maracas",
            "showTally":true
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":6,
            "toppings":[FoodData.PAPER_MIZUIRO,FoodData.FILLING_PINEAPPLE,FoodData.FILLING_CANNEDHAM,FoodData.TEA_LUAUPUNCH,FoodData.SAUCE_CALYPSO,FoodData.SHAKER_LEMONHERB],
            "title":"Summer Fun",
            "description":"Unlock all Summer Luau toppings",
            "sticker":"sandbucket",
            "showTally":true
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":6,
            "toppings":[FoodData.PAPER_DELI,FoodData.FILLING_BRISKET,FoodData.FILLING_ONIONSTRINGS,FoodData.TEA_POWSICLE,FoodData.SAUCE_LONESTARPIT,FoodData.SHAKER_BBQRUB],
            "title":"Patriotic",
            "description":"Unlock all Starlight BBQ toppings",
            "sticker":"firework",
            "showTally":true
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":6,
            "toppings":[FoodData.PAPER_RAUTENFLAGGE,FoodData.FILLING_BREZN,FoodData.FILLING_BRATWURST,FoodData.TEA_BLACKFOREST,FoodData.SAUCE_MUSTARD,FoodData.SHAKER_SAUERKRAUT],
            "title":"Folk Festival",
            "description":"Unlock all BavariaFest toppings",
            "sticker":"pretzel",
            "showTally":true
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":6,
            "toppings":[FoodData.PAPER_KIIROI,FoodData.FILLING_BACON,FoodData.FILLING_HASHBROWN,FoodData.TEA_BREAKFAST,FoodData.SAUCE_MAPLE,FoodData.SHAKER_CINNAMON],
            "title":"Rise and Shine",
            "description":"Unlock all Maple Mornings toppings",
            "sticker":"flapjacks",
            "showTally":true
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":6,
            "toppings":[FoodData.PAPER_TARANTULA,FoodData.FILLING_UNI,FoodData.FILLING_TORIGAI,FoodData.TEA_WITCHSBREW,FoodData.SAUCE_SQUID,FoodData.SHAKER_IKURA],
            "title":"Trick or Treat",
            "description":"Unlock all Halloween toppings",
            "sticker":"skull",
            "showTally":true
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":6,
            "toppings":[FoodData.PAPER_CHAIRO,FoodData.FILLING_SWEETPOTATOES,FoodData.FILLING_TURKEY,FoodData.TEA_PUMPKINSPICE,FoodData.SAUCE_GRAVY,FoodData.SHAKER_PUMPKINSEEDS],
            "title":"Thankful",
            "description":"Unlock all Thanksgiving toppings",
            "sticker":"leaf",
            "showTally":true
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":6,
            "toppings":[FoodData.PAPER_ELF,FoodData.FILLING_TAI,FoodData.FILLING_SPRUCETIPS,FoodData.TEA_PEPPERMINT,FoodData.SAUCE_CRANBERRY,FoodData.SHAKER_YULEMASAGO],
            "title":"Holiday Sushi",
            "description":"Unlock all Christmas toppings",
            "sticker":"xmastree",
            "showTally":true
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":6,
            "toppings":[FoodData.PAPER_RAINBOW,FoodData.FILLING_RAINBOWYOKAN,FoodData.FILLING_EGGPLANT,FoodData.TEA_TUTTIFRUTTI,FoodData.SAUCE_FLAVORX,FoodData.SHAKER_RAINBOW],
            "title":"Happy New Year",
            "description":"Unlock all New Year toppings",
            "sticker":"newyear",
            "showTally":true
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":6,
            "toppings":[FoodData.PAPER_AKAI,FoodData.FILLING_STRAWBERRY,FoodData.FILLING_HOKKIGAI,FoodData.TEA_RASPBERRY,FoodData.SAUCE_AZUKI,FoodData.SHAKER_POMEGRANATE],
            "title":"Playing Cupid",
            "description":"Unlock all Valentine\'s Day toppings",
            "sticker":"heart",
            "showTally":true
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":6,
            "toppings":[FoodData.PAPER_LUCKY,FoodData.FILLING_DATEMAKI,FoodData.FILLING_KANPYO,FoodData.TEA_IYOKAN,FoodData.SAUCE_KURIKINTON,FoodData.SHAKER_LUCKYDUST],
            "title":"Lots of Luck",
            "description":"Unlock all Lucky Lucky Matsuri toppings",
            "sticker":"daruma",
            "showTally":true
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"firstlast",
            "title":"Make \'Em Wait",
            "description":"Serve the first customer last",
            "sticker":"awesomesaucer"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"readyquinn",
            "title":"Hot and Ready",
            "description":"Have Quinn\'s order ready when she arrives and serve immediately",
            "sticker":"checkpoint"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"readywhiff",
            "title":"Preferential Treatment",
            "description":"Have Whiff\'s order ready when he arrives and serve immediately",
            "sticker":"woollies"
         }),new Challenge(Challenge.SEALS,{
            "targetAmount":5,
            "sealType":"bronze",
            "title":"Bronze Beginning",
            "description":"Earn 5 Bronze Customer Awards",
            "showTally":true,
            "sticker":"pizza"
         }),new Challenge(Challenge.SEALS,{
            "targetAmount":15,
            "sealType":"bronze",
            "title":"Repeat Customers",
            "description":"Earn 15 Bronze Customer Awards",
            "showTally":true,
            "sticker":"lepunch"
         }),new Challenge(Challenge.SEALS,{
            "targetAmount":10,
            "sealType":"silver",
            "title":"Silver Medal",
            "description":"Earn 10 Silver Customer Awards",
            "showTally":true,
            "sticker":"grilledcheese"
         }),new Challenge(Challenge.SEALS,{
            "targetAmount":15,
            "sealType":"gold",
            "title":"Restaurant Regulars",
            "description":"Earn 15 Gold Customer Awards",
            "showTally":true,
            "sticker":"warpcoin"
         }),new Challenge(Challenge.SCORE,{
            "targetAmount":20,
            "customer":"any",
            "score":100,
            "scoreType":"Waiting",
            "title":"Order Expert",
            "description":"Get a 100% Waiting Score on 20 orders",
            "showTally":true,
            "sticker":"tomato"
         }),new Challenge(Challenge.SCORE,{
            "targetAmount":20,
            "customer":"any",
            "score":100,
            "scoreType":"Build",
            "title":"Build Expert",
            "description":"Get a 100% Build Score on 20 orders",
            "showTally":true,
            "sticker":"peachbuzzy"
         }),new Challenge(Challenge.SCORE,{
            "targetAmount":20,
            "customer":"any",
            "score":100,
            "scoreType":"Cook",
            "title":"Rice Expert",
            "description":"Get a 100% Cooking Score on 20 orders",
            "showTally":true,
            "sticker":"cupcake"
         }),new Challenge(Challenge.SCORE,{
            "targetAmount":20,
            "customer":"any",
            "score":100,
            "scoreType":"Tea",
            "title":"Tea Expert",
            "description":"Get a 100% Tea Score on 20 orders",
            "showTally":true,
            "sticker":"dillwheel"
         }),new Challenge(Challenge.SCORE,{
            "targetAmount":30,
            "customer":"any",
            "score":100,
            "scoreType":"Overall",
            "title":"Perfect!",
            "description":"Get a Perfect Score on 30 orders",
            "showTally":true,
            "sticker":"burgerzilla"
         }),new Challenge(Challenge.RIBBON,{
            "targetAmount":5,
            "title":"Award-Winning Restaurant",
            "description":"Get 5 Blue Ribbons from Jojo the Food Critic",
            "showTally":true,
            "sticker":"blueribbon"
         }),new Challenge(Challenge.PAYDAY,{
            "targetAmount":4,
            "title":"Month\'s Pay",
            "description":"Receive your wages on four Pay Days",
            "showTally":true,
            "sticker":"donut"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":7,
            "isQuest":true,
            "tagName":"piggybank",
            "title":"Piggy Bank",
            "description":"Don\'t spend any money in the Shop for 7 days",
            "showTally":true,
            "sticker":"discoplumm"
         }),new Challenge(Challenge.PURCHASES,{
            "targetAmount":50,
            "isQuest":true,
            "upgrades":"any",
            "title":"One-Stop Shopping",
            "description":"Buy any 50 items from the Shop",
            "showTally":true,
            "sticker":"partysubs"
         }),new Challenge(Challenge.PURCHASES,{
            "targetAmount":8,
            "isQuest":true,
            "upgrades":"poster",
            "title":"Advertiser",
            "description":"Buy any 8 Posters from the Shop",
            "showTally":true,
            "sticker":"sizzlers"
         }),new Challenge(Challenge.PURCHASES,{
            "targetAmount":8,
            "isQuest":true,
            "upgrades":"furni",
            "title":"Interior Decorator",
            "description":"Buy any 8 Furniture items from the Shop",
            "showTally":true,
            "sticker":"radish"
         }),new Challenge(Challenge.PURCHASES,{
            "targetAmount":8,
            "isQuest":true,
            "upgrades":"clothing",
            "title":"Updated Wardrobe",
            "description":"Buy any 8 Clothing items from the Shop",
            "showTally":true,
            "sticker":"onion"
         }),new Challenge(Challenge.PURCHASES,{
            "targetAmount":4,
            "isQuest":true,
            "upgrades":"wallfloor",
            "title":"New Coat of Paint",
            "description":"Buy any 4 Flooring or Wallpaper from the Shop",
            "showTally":true,
            "sticker":"jillberry"
         }),new Challenge(Challenge.UPGRADES,{
            "targetAmount":10,
            "isQuest":true,
            "upgrades":["booster0","booster1","booster2","doorbell","alarm0","alarm1","alarm2","specialsign","cutguide","automilk"],
            "title":"Upgrade Master",
            "description":"Buy all of the Upgrades in the Shop",
            "showTally":true,
            "sticker":"derps"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"changeclothes",
            "title":"New Threads",
            "description":"Change your worker\'s shirt, pants, hat, and shoes.",
            "sticker":"fizzo"
         }),new Challenge(Challenge.SERVECUSTOMERS,{
            "targetAmount":4,
            "customers":["Bruna Romano","Gino Romano","Carlo Romano","Little Edoardo"],
            "title":"Romano Family",
            "description":"Serve everyone in the Romano Family Quartet",
            "showTally":true,
            "sticker":"tomatoes"
         }),new Challenge(Challenge.SERVECUSTOMERS,{
            "targetAmount":3,
            "customers":["Scarlett","Rudy","Marty"],
            "title":"Scarlett and the Shakers",
            "description":"Serve (the rest of) Scarlett and the Shakers",
            "showTally":true,
            "sticker":"honeydew"
         }),new Challenge(Challenge.SERVECUSTOMERS,{
            "targetAmount":5,
            "customers":["Elle","Emmlette","Wylan B","Vincent","Koilee"],
            "title":"New Faces",
            "description":"Serve all of the new customers",
            "showTally":true,
            "sticker":"pie"
         }),new Challenge(Challenge.SERVECUSTOMERS,{
            "targetAmount":106,
            "customers":"all",
            "title":"The Gang\'s All Here",
            "description":"Serve all of the customers!",
            "showTally":true,
            "sticker":"papalouie"
         }),new Challenge(Challenge.SERVECUSTOMERSINMONTH,{
            "targetAmount":7,
            "month":10,
            "customers":["Xolo","Emmlette","Deano","Quinn","Whiff","Akari","Jojo"],
            "title":"Costumed Closers",
            "description":"Serve all of the Costumed Closers during Halloween",
            "showTally":true,
            "sticker":"radley"
         }),new Challenge(Challenge.MULTIPRIZE,{
            "targetAmount":7,
            "title":"Game Show Contestant",
            "description":"Earn a Prize in each of Foodini\'s Mini-Games",
            "showTally":true,
            "sticker":"gameticket"
         }),new Challenge(Challenge.MULTIPRIZE,{
            "targetAmount":35,
            "title":"Grand Prize Winner",
            "description":"Earn 5 Prizes or more in each of Foodini\'s Mini-Games",
            "showTally":true,
            "sticker":"mangoby"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "tagName":"rareprize",
            "title":"Rare Reward",
            "description":"Win a Rare Bonus Prize in a Mini-Game by earning a Star Medal",
            "sticker":"jellyback"
         }),new Challenge(Challenge.SPECIALS,{
            "targetAmount":15,
            "title":"Recipe Collection",
            "description":"Earn 15 Special Recipes from customers",
            "showTally":true,
            "sticker":"sundae"
         }),new Challenge(Challenge.SPECIALS,{
            "targetAmount":40,
            "title":"Complete Cookbook",
            "description":"Earn 40 Special Recipes from customers",
            "showTally":true,
            "sticker":"pepperjack"
         }),new Challenge(Challenge.SPECIALSTAR,{
            "targetAmount":3,
            "title":"Successful Specials",
            "description":"Earn 3 Special Stars when serving Today\'s Special",
            "showTally":true,
            "sticker":"dillworm"
         }),new Challenge(Challenge.SPECIALPRIZE,{
            "targetAmount":1,
            "title":"Recipe Master",
            "description":"Master a Special Recipe by earning 5 Special Stars",
            "sticker":"cheesecake"
         }),new Challenge(Challenge.SPECIALPRIZE,{
            "targetAmount":10,
            "title":"Super Special",
            "description":"Master 10 Special Recipes by earning 5 Stars on each",
            "showTally":true,
            "sticker":"barryblue"
         }),new Challenge(Challenge.SPECIALPRIZE,{
            "targetAmount":20,
            "title":"Cookbook Mastery",
            "description":"Master 20 Special Recipes by earning 5 Stars on each",
            "showTally":true,
            "sticker":"flipline"
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":7,
            "toppings":[FoodData.PAPER_NORI,FoodData.PAPER_UKONIRO,FoodData.PAPER_MOMOIRO,FoodData.RICE_WHITE,FoodData.RICE_BROWN,FoodData.RICE_SHISO,FoodData.RICE_BLACK],
            "title":"Rice and Wrappers",
            "description":"Unlock all of the Standard Rice and Papers",
            "showTally":true,
            "sticker":"pasta"
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":22,
            "toppings":[FoodData.FILLING_ASAPARAGUS,FoodData.FILLING_UNAGI,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_CARROTS,FoodData.FILLING_CUCUMBER,FoodData.FILLING_TAMAGO,FoodData.FILLING_TUNA,FoodData.FILLING_SALMON,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_JALAPENO,FoodData.FILLING_OCTOPUS,FoodData.FILLING_AVOCADO,FoodData.FILLING_CRABSTICK,FoodData.FILLING_LOBSTER,FoodData.FILLING_GREENONIONS,FoodData.FILLING_RADISHSPROUTS,FoodData.FILLING_YELLOWTAIL,FoodData.FILLING_TOFU,FoodData.FILLING_WAGYU,FoodData.FILLING_SHRIMP,FoodData.FILLING_SHIITAKE,FoodData.FILLING_CALAMARI],
            "title":"Flavorful Fillings",
            "description":"Unlock all of the Standard Fillings",
            "showTally":true,
            "sticker":"stache"
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":10,
            "toppings":[FoodData.DROP_TUNA,FoodData.DROP_SALMON,FoodData.DROP_MANGO,FoodData.DROP_SAYORI,FoodData.DROP_AVOCADO,FoodData.DROP_PRAWN,FoodData.DROP_KIWI,FoodData.DROP_YELLOWTAIL,FoodData.DROP_SABA,FoodData.DROP_WAGYU],
            "title":"Sushi Toppers",
            "description":"Unlock all of the Standard Placeable Toppings",
            "showTally":true,
            "sticker":"armyonion"
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":16,
            "toppings":[FoodData.SAUCE_PONZU,FoodData.SAUCE_SRIRACHA,FoodData.SAUCE_HIBACHI,FoodData.SAUCE_TONKATSU,FoodData.SAUCE_YUZAKOSHO,FoodData.SAUCE_DUCK,FoodData.SAUCE_TERIYAKI,FoodData.SAUCE_WASABIMAYO,FoodData.SAUCE_GENERALTSO,FoodData.SAUCE_GINGERMISO,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SHAKER_SESAMESEEDS,FoodData.SHAKER_TOBIKO,FoodData.SHAKER_FURIKAKE,FoodData.SHAKER_BONITOFLAKES],
            "title":"Finishing Touches",
            "description":"Unlock all of the Standard Sauces and Shakers",
            "showTally":true,
            "sticker":"chipmcmint"
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":11,
            "toppings":[FoodData.TEA_CHAI,FoodData.TEA_MATCHA,FoodData.TEA_ALMOND,FoodData.TEA_PINACOLADA,FoodData.TEA_TARO,FoodData.TEA_HONEYDEW,FoodData.TEA_STRAWBERRY,FoodData.TEA_MOCHA,FoodData.TEA_BLUEBERRY,FoodData.TEA_CHOCOLATE,FoodData.TEA_TANGERINE],
            "title":"Tea Time",
            "description":"Unlock all of the Standard Tea Flavors",
            "showTally":true,
            "sticker":"musicnote"
         }),new Challenge(Challenge.UNLOCKTOPPING,{
            "targetAmount":12,
            "toppings":[FoodData.BUBBLE_CUCUMBER,FoodData.BUBBLE_LYCHEE,FoodData.BUBBLE_TAPIOCA,FoodData.BUBBLE_CHERRY,FoodData.BUBBLE_SUGARPLUM,FoodData.BUBBLE_KIWI,FoodData.BUBBLE_MANGO,FoodData.BUBBLE_BUTTERSCOTCH,FoodData.BUBBLE_WATERMELON,FoodData.BUBBLE_HUCKLEBERRY,FoodData.BUBBLE_COTTONCANDY,FoodData.BUBBLE_PAWPAW],
            "title":"Bubble Buddy",
            "description":"Unlock all of the Tea Bubbles",
            "showTally":true,
            "sticker":"pancakes"
         }),new Challenge(Challenge.SERVESECRETSPECIAL,{
            "targetAmount":1,
            "isQuest":true,
            "customers":["Foodini"],
            "title":"Philly Foodini",
            "description":"Serve a Philly Roll Special to Foodini",
            "sticker":"mallowmen"
         }),new Challenge(Challenge.SERVESECRETSPECIAL,{
            "targetAmount":1,
            "isQuest":true,
            "customers":["Mayor Mallow"],
            "title":"Momo Mallow",
            "description":"Serve a Momo Mango Special to Mayor Mallow",
            "sticker":"rocky"
         }),new Challenge(Challenge.SERVESECRETSPECIAL,{
            "targetAmount":1,
            "isQuest":true,
            "customers":["Kahuna"],
            "title":"Tuna Tuna Kahuna",
            "description":"Serve a Tuna Tuna Tempura Special to Kahuna",
            "sticker":"sarge"
         }),new Challenge(Challenge.SERVESECRETSPECIAL,{
            "targetAmount":1,
            "isQuest":true,
            "customers":["Peggy"],
            "title":"Peggy Hamachi",
            "description":"Serve a Negi Hamachi Special to Peggy",
            "sticker":"coolada"
         }),new Challenge(Challenge.SERVESECRETSPECIAL,{
            "targetAmount":1,
            "isQuest":true,
            "customers":["Taylor"],
            "title":"Taylor Tonkatsu",
            "description":"Serve a Tofu BBQ Special to Taylor",
            "sticker":"flipper"
         }),new Challenge(Challenge.SERVESECRETSPECIAL,{
            "targetAmount":1,
            "isQuest":true,
            "customers":["Robby"],
            "title":"Robby Lobster",
            "description":"Serve a Lava Lobster Special to Robby",
            "sticker":"hardshells"
         }),new Challenge(Challenge.SERVESECRETSPECIAL,{
            "targetAmount":1,
            "isQuest":true,
            "customers":["Bruna Romano"],
            "title":"Roly Romano",
            "description":"Serve a Roly Mackerel Special to Bruna Romano",
            "sticker":"slider"
         }),new Challenge(Challenge.SERVESECRETSPECIAL,{
            "targetAmount":1,
            "isQuest":true,
            "customers":["Xolo"],
            "title":"Xolo Kosho",
            "description":"Serve a Kiwi Kosho Special to Xolo",
            "sticker":"sslouie"
         }),new Challenge(Challenge.SERVESECRETSPECIAL,{
            "targetAmount":1,
            "isQuest":true,
            "customers":["Utah"],
            "title":"State Swap",
            "description":"Serve a California Roll Special to Utah",
            "sticker":"nuttybutter"
         }),new Challenge(Challenge.SERVESECRETSPECIAL,{
            "targetAmount":1,
            "isQuest":true,
            "customers":["Janana"],
            "title":"The Amberjanana",
            "description":"Serve The Amberjack Special to Janana",
            "sticker":"bananapants"
         }),new Challenge(Challenge.EXTRAINGREDIENTS,{
            "targetAmount":1,
            "isQuest":true,
            "customer":"Professor Fitz",
            "toppings":[FoodData.SHAKER_FURIKAKE,FoodData.SAUCE_WASABIMAYO],
            "title":"Go Green",
            "description":"Add Furikake and Wasabi Mayo to Professor Fitz\'s sushi",
            "sticker":"anchovy"
         }),new Challenge(Challenge.EXTRAINGREDIENTS,{
            "targetAmount":1,
            "isQuest":true,
            "customer":"Timm",
            "toppings":[FoodData.FILLING_SHRIMP,FoodData.SHAKER_TEMPURACRUNCH],
            "title":"Timmpura",
            "description":"Add Shrimp Tempura and Tempura Crunch to Timm\'s sushi",
            "sticker":"cordialbomb"
         }),new Challenge(Challenge.EXTRAINGREDIENTS,{
            "targetAmount":1,
            "isQuest":true,
            "customer":"Iggy",
            "toppings":[FoodData.FILLING_UNAGI],
            "title":"Iggy Unagi",
            "description":"Add Unagi to Iggy\'s sushi",
            "sticker":"blondie"
         }),new Challenge(Challenge.EXTRAINGREDIENTS,{
            "targetAmount":1,
            "isQuest":true,
            "customer":"Sasha",
            "toppings":[FoodData.SAUCE_GINGERMISO,FoodData.RICE_SHISO],
            "title":"Miso Sasha Shiso",
            "description":"Use Shiso Rice and Ginger Miso Sauce on Sasha\'s sushi",
            "sticker":"lettucelark"
         }),new Challenge(Challenge.SERVECLOTHINGTHEME,{
            "targetAmount":20,
            "isQuest":true,
            "theme":"H",
            "month":GameData.MONTH_OCTOBER,
            "reqMonth":GameData.MONTH_OCTOBER,
            "customers":"any",
            "title":"Spooktacular",
            "description":"Serve 20 customers during Halloween wearing any Halloween clothing",
            "showTally":true,
            "sticker":"chickenwing"
         }),new Challenge(Challenge.SERVECLOTHINGTHEME,{
            "targetAmount":100,
            "isQuest":true,
            "theme":"any",
            "customers":"any",
            "title":"Holiday Spirit",
            "description":"Serve 100 customers while wearing clothing that matches the season",
            "showTally":true,
            "sticker":"gondoliers"
         }),new Challenge(Challenge.SERVECLOTHING,{
            "targetAmount":20,
            "isQuest":true,
            "clothing":["tint_furcoat","tint_santahat"],
            "month":12,
            "reqMonth":GameData.MONTH_DECEMBER,
            "customers":"any",
            "title":"Santa\'s Helper",
            "description":"Serve 20 customers during Christmas wearing a Christmas Hat and Fur Parka",
            "showTally":true,
            "sticker":"buffaloes"
         }),new Challenge(Challenge.SERVECLOTHING,{
            "targetAmount":1,
            "isQuest":true,
            "clothing":["tint_boomerhelmet","tint_cape"],
            "reqCustomer":"Boomer",
            "customers":["Boomer"],
            "title":"Daredevil",
            "description":"Serve Boomer while wearing a Stunt Helmet and Cape",
            "sticker":"burger"
         }),new Challenge(Challenge.SERVECLOTHING,{
            "targetAmount":1,
            "isQuest":true,
            "clothing":["tint_jersey_1","tint_logocap"],
            "reqCustomer":"Pinch Hitwell",
            "customers":["Pinch Hitwell"],
            "title":"Team Player",
            "description":"Serve Pinch Hitwell while wearing a Logo Cap and Baseball Jersey",
            "sticker":"blackbirds"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"holidayclothes",
            "title":"Holiday Outfit",
            "description":"Wear a shirt, pants, belt, jacket, shoes, and hat to match the current holiday",
            "sticker":"bacobites"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"coordinated",
            "title":"Color Coordinated",
            "description":"Dress your chef and server in the exact same outfit but with different colors",
            "sticker":"batters"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"xmasjuly",
            "reqMonth":GameData.MONTH_JULY,
            "title":"Christmas in July",
            "description":"Use only Christmas decorations (3 or more items) in your lobby during July",
            "sticker":"powseeker"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"bubblegum",
            "title":"Bubble Gum Bonanza",
            "description":"Have 10 different kinds of bubble gum in the lobby at once",
            "sticker":"crushers"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"danceparty",
            "title":"Dance Party",
            "description":"Use lots of musical furniture so 3 or more customers are dancing in the lobby",
            "sticker":"cheddarmac"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"getthetables",
            "title":"Get the Tables!",
            "description":"Fill your lobby with 12 large tables",
            "sticker":"peppermintflower"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":250,
            "isQuest":true,
            "tagName":"kartcoin",
            "title":"Loose Change",
            "description":"Grab 250 coins while playing Papa\'s Raceway",
            "showTally":true,
            "sticker":"coin"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":20,
            "isQuest":true,
            "tagName":"redpipes",
            "title":"Stubborn Plumber",
            "description":"Try to click 20 different red pipes in Rico\'s Chiliworks",
            "showTally":true,
            "sticker":"chilifeather"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"cookieclicker",
            "title":"Cookie Clickin\'",
            "description":"Strike out in Mitch\'s Mess by clicking 3 different cookies",
            "sticker":"taco"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":10,
            "isQuest":true,
            "tagName":"coupon",
            "title":"Coupon Clipper",
            "description":"Send 10 Customer Coupons to your customers",
            "showTally":true,
            "sticker":"shrooms"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"wasteful",
            "title":"Wasteful",
            "description":"Throw away 5 fully-sliced sushi rolls in one day",
            "sticker":"coconuts"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"friendlyfillup",
            "title":"Friendly Fill-up",
            "description":"When dining in, fill the customer\'s sushi with their friend\'s favorite fillings instead",
            "sticker":"samurais"
         }),new Challenge(Challenge.TAGGED,{
            "targetAmount":1,
            "isQuest":true,
            "tagName":"teaparty",
            "title":"Tea Party",
            "description":"When dining in, make the Bubble Tea for their friend\'s order instead",
            "sticker":"habanero"
         })];
         this.stickers = [new StickerData("anchovy",224,246),new StickerData("armyonion",343,997),new StickerData("awesomesaucer",328,358),new StickerData("bacobites",201,1310),new StickerData("bananapants",294,227),new StickerData("barryblue",268,1288),new StickerData("batters",46,1322),new StickerData("blackbirds",333,642),new StickerData("blondie",51,817),new StickerData("blueribbon",351,202),new StickerData("buffaloes",258,421),new StickerData("burger",336,1313),new StickerData("burgerzilla",260,598),new StickerData("checkpoint",347,498),new StickerData("cheddarmac",186,784),new StickerData("cheesecake",278,1204),new StickerData("cherryblossom",100,1054),new StickerData("chickenwing",247,360),new StickerData("chilifeather",123,1319),new StickerData("chipmcmint",119,345),new StickerData("coconuts",122,759),new StickerData("coin",125,834),new StickerData("pretzel",47,397),new StickerData("coolada",341,1229),new StickerData("cordialbomb",34,1025),new StickerData("crushers",266,285),new StickerData("cupcake",114,586),new StickerData("derps",342,129),new StickerData("dillwheel",48,1180),new StickerData("dillworm",185,1007),new StickerData("discoplumm",39,209),new StickerData("donut",87,271),new StickerData("daruma",34,130),new StickerData("firework",253,1064),new StickerData("fizzo",263,896),new StickerData("flapjacks",45,958),new StickerData("flipline",194,605),new StickerData("flipper",50,540),new StickerData("gameticket",194,193),new StickerData("gondoliers",45,467),new StickerData("grilledcheese",47,1252),new StickerData("habanero",272,1127),new StickerData("hardshells",269,991),new StickerData("heart",337,1071),new StickerData("honeydew",46,610),new StickerData("hotdog",329,779),new StickerData("jellyback",161,126),new StickerData("jillberry",234,492),new StickerData("leaf",123,510),new StickerData("lepunch",195,856),new StickerData("lettucelark",334,424),new StickerData("mallowmen",86,691),new StickerData("mangoby",128,1260),new StickerData("musicnote",282,163),new StickerData("newyear",237,126),new StickerData("nuttybutter",147,667),new StickerData("onion",304,522),new StickerData("pancakes",205,1157),new StickerData("papalouie",338,711),new StickerData("partysubs",96,904),new StickerData("pasta",163,462),new StickerData("peachbuzzy",39,750),new StickerData("pepperjack",346,855),new StickerData("peppermintflower",282,700),new StickerData("pie",186,718),new StickerData("pizza",93,121),new StickerData("powseeker",334,586),new StickerData("radish",342,281),new StickerData("radley",41,327),new StickerData("rocky",120,981),new StickerData("samurais",130,1201),new StickerData("sandbucket",30,671),new StickerData("sarge",251,751),new StickerData("maracas",223,668),new StickerData("shrooms",108,430),new StickerData("sizzlers",114,187),new StickerData("skull",173,924),new StickerData("slider",177,1083),new StickerData("sslouie",190,316),new StickerData("stache",243,952),new StickerData("strawbuzzy",154,255),new StickerData("sundae",33,882),new StickerData("sundaesaurus",43,1109),new StickerData("taco",333,929),new StickerData("tomato",173,393),new StickerData("tomatoes",276,825),new StickerData("turkeys",197,543),new StickerData("warpcoin",207,1230),new StickerData("woollies",340,1145),new StickerData("xmastree",120,1131)];
         this.badgeQueue = [];
         this.badgeQueueType = [];
         super();
         this.gameObj = param1;
      }
      
      public function destroy() : void
      {
      }
      
      public function getChallengeTitle(param1:Number = -1) : String
      {
         var _loc4_:Number = NaN;
         var _loc5_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:String = "";
         if(param1 > -1)
         {
            if(param1 < _loc2_.badges.length)
            {
               _loc3_ = (_loc5_ = _loc2_.badges[param1]).title;
            }
         }
         return _loc3_;
      }
      
      public function getChallengeDescription(param1:Number = -1) : String
      {
         var _loc4_:Number = NaN;
         var _loc5_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:String = "";
         if(param1 > -1)
         {
            if(param1 < _loc2_.badges.length)
            {
               _loc3_ = (_loc5_ = _loc2_.badges[param1]).description;
            }
         }
         return _loc3_;
      }
      
      public function getChallengeRewardAmount(param1:Number = -1) : Number
      {
         var _loc4_:Number = NaN;
         var _loc5_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:Number = 0;
         if(param1 > -1)
         {
            if(param1 < _loc2_.badges.length)
            {
               _loc3_ = (_loc5_ = _loc2_.badges[param1]).rewardMoney;
            }
         }
         return _loc3_;
      }
      
      public function getChallengeTicketAmount(param1:Number = -1) : Number
      {
         var _loc4_:Number = NaN;
         var _loc5_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:Number = 0;
         if(param1 > -1)
         {
            if(param1 < _loc2_.badges.length)
            {
               _loc3_ = (_loc5_ = _loc2_.badges[param1]).tickets;
            }
         }
         return _loc3_;
      }
      
      public function getBadgeTallyString(param1:Number) : String
      {
         var _loc4_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:String = "";
         if(param1 < _loc2_.badges.length)
         {
            if((_loc4_ = _loc2_.badges[param1]).showTally)
            {
               if(_loc4_.tally < _loc4_.targetAmount)
               {
                  _loc3_ = _loc4_.tally + "/" + _loc4_.targetAmount;
               }
            }
         }
         return _loc3_;
      }
      
      public function getBadgePercentCompletion(param1:Number) : Number
      {
         var _loc4_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:Number = 0;
         if(param1 < _loc2_.badges.length)
         {
            _loc4_ = _loc2_.badges[param1];
            if(_loc2_.gameObj.var_127.hasBadge(param1))
            {
               _loc3_ = 1;
            }
            else if(_loc4_.showTally)
            {
               if(_loc4_.tally < _loc4_.targetAmount)
               {
                  _loc3_ = _loc4_.tally / _loc4_.targetAmount;
               }
               else
               {
                  _loc3_ = 1;
               }
            }
            else
            {
               _loc3_ = 0;
            }
         }
         return _loc3_;
      }
      
      public function getBadgeIsQuest(param1:Number) : Boolean
      {
         var _loc4_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:Boolean = false;
         if(param1 < _loc2_.badges.length)
         {
            _loc3_ = (_loc4_ = _loc2_.badges[param1]).isQuest;
         }
         return _loc3_;
      }
      
      public function getBadgeTally(param1:Number) : Number
      {
         var _loc4_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:Number = 0;
         if(param1 < _loc2_.badges.length)
         {
            _loc3_ = (_loc4_ = _loc2_.badges[param1]).tally;
         }
         return _loc3_;
      }
      
      public function getNumberOfBadges() : Number
      {
         var _loc1_:ChallengeManager = this;
         return _loc1_.badges.length;
      }
      
      public function shouldLockBadge(param1:Number) : Boolean
      {
         var _loc4_:Challenge = null;
         var _loc5_:String = null;
         var _loc6_:Number = NaN;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc2_:ChallengeManager = this;
         var _loc3_:Boolean = false;
         if(param1 < _loc2_.badges.length)
         {
            if((_loc4_ = _loc2_.badges[param1]).challengeType == Challenge.USETOPPING)
            {
               if(_loc2_.gameObj.var_127.hasTopping(_loc4_.topping) == false && _loc4_.topping != "any")
               {
                  _loc3_ = true;
               }
            }
            else if(_loc4_.challengeType == Challenge.SERVESECRETSPECIAL)
            {
               _loc5_ = null;
               if(_loc4_.customers is Array)
               {
                  _loc5_ = String(_loc4_.customers[0]);
               }
               else
               {
                  _loc5_ = _loc4_.customers;
               }
               if(_loc5_ != null)
               {
                  if((_loc6_ = _loc2_.gameObj.var_131.getCustomerSecretSpecialIndex(_loc2_.gameObj.var_131.getCustomerIndex(_loc5_))) > -1)
                  {
                     if(_loc2_.gameObj.var_127.hasSpecial(_loc6_) == false)
                     {
                        _loc3_ = true;
                     }
                     else if(_loc2_.gameObj.var_127.customersUnlocked[_loc2_.gameObj.var_131.getCustomerIndex(_loc5_)] == 0)
                     {
                        _loc3_ = true;
                     }
                  }
               }
            }
            else if(_loc4_.challengeType == Challenge.EXTRAINGREDIENTS)
            {
               _loc7_ = _loc4_.customer;
               if(_loc2_.gameObj.var_127.customersUnlocked[_loc2_.gameObj.var_131.getCustomerIndex(_loc7_)] == 0)
               {
                  _loc3_ = true;
               }
               else
               {
                  _loc8_ = 0;
                  while(_loc8_ < _loc4_.toppings.length)
                  {
                     if(_loc2_.gameObj.var_127.hasTopping(_loc4_.toppings[_loc8_]) == false)
                     {
                        _loc3_ = true;
                        break;
                     }
                     _loc8_++;
                  }
               }
            }
            if(_loc4_.reqMonth > 0)
            {
               if((_loc9_ = (_loc9_ = _loc4_.reqMonth) - (GameData.STARTER_MONTH - 1)) < 1)
               {
                  _loc9_ += 12;
               }
               else if(_loc9_ == 1)
               {
                  _loc9_ += 12;
               }
               _loc10_ = 1 + (_loc9_ - 1) * 5;
               if(_loc2_.gameObj.var_127.getRank() < _loc10_)
               {
                  _loc3_ = true;
               }
            }
            if(_loc4_.reqCustomer != null)
            {
               if(_loc2_.gameObj.var_127.customersUnlocked[_loc2_.gameObj.var_131.getCustomerIndex(_loc4_.reqCustomer)] == 0)
               {
                  _loc3_ = true;
               }
            }
            if(_loc4_.reqToppings != null)
            {
               _loc11_ = 0;
               while(_loc11_ < _loc4_.reqToppings.length)
               {
                  if(_loc2_.gameObj.var_127.hasTopping(_loc4_.reqToppings[_loc11_]) == false)
                  {
                     _loc3_ = true;
                     break;
                  }
                  _loc11_++;
               }
            }
         }
         return _loc3_;
      }
      
      public function recordRank(param1:Number) : void
      {
         var _loc5_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.badges.length)
         {
            if((_loc5_ = _loc2_.badges[_loc4_]).challengeType == Challenge.RANK)
            {
               if(_loc5_.targetAmount <= param1 && !_loc3_.hasBadge(_loc4_))
               {
                  _loc3_.earnBadge(_loc4_,_loc5_.title,_loc5_.rewardMoney,_loc5_.tickets);
                  _loc3_.saveAfterBadge();
                  _loc2_.showEarningBadge(_loc4_);
               }
            }
            _loc4_++;
         }
      }
      
      public function recordServeSecretSpecial(param1:String) : void
      {
         var _loc6_:Challenge = null;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:Number = NaN;
         var _loc10_:Boolean = false;
         var _loc2_:ChallengeManager = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:Number = _loc2_.gameObj.var_131.getCustomerIndex(param1);
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.badges.length)
         {
            if((_loc6_ = _loc2_.badges[_loc5_]).challengeType == Challenge.SERVESECRETSPECIAL)
            {
               _loc8_ = [];
               _loc9_ = 0;
               if(_loc6_.customers == "any")
               {
                  _loc7_ = 1;
                  while(_loc7_ <= _loc2_.gameObj.var_131.getCustomerTotal())
                  {
                     _loc8_.push(_loc7_);
                     _loc7_++;
                  }
               }
               else if(_loc6_.customers is Array)
               {
                  _loc7_ = 0;
                  while(_loc7_ < _loc6_.customers.length)
                  {
                     _loc8_.push(_loc2_.gameObj.var_131.getCustomerIndex(_loc6_.customers[_loc7_]));
                     _loc7_++;
                  }
               }
               else
               {
                  _loc8_.push(_loc2_.gameObj.var_131.getCustomerIndex(_loc6_.customers));
               }
               if(_loc8_.indexOf(_loc4_) > -1)
               {
                  if((_loc10_ = _loc6_.addToTally()) && !_loc3_.hasBadge(_loc5_))
                  {
                     _loc3_.earnBadge(_loc5_,_loc6_.title,_loc6_.rewardMoney,_loc6_.tickets);
                     _loc3_.saveAfterBadge();
                     _loc2_.showEarningBadge(_loc5_);
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function recordUnlockCustomer(param1:String) : void
      {
         var _loc6_:Challenge = null;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:Number = NaN;
         var _loc10_:Boolean = false;
         var _loc2_:ChallengeManager = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:Number = _loc2_.gameObj.var_131.getCustomerIndex(param1);
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.badges.length)
         {
            if((_loc6_ = _loc2_.badges[_loc5_]).challengeType == Challenge.UNLOCKCUSTOMER)
            {
               _loc8_ = [];
               _loc9_ = 0;
               if(_loc6_.customers == "all")
               {
                  _loc7_ = 1;
                  while(_loc7_ <= _loc2_.gameObj.var_131.getCustomerTotal())
                  {
                     _loc8_.push(_loc7_);
                     _loc7_++;
                  }
               }
               else
               {
                  _loc7_ = 0;
                  while(_loc7_ < _loc6_.customers.length)
                  {
                     _loc8_.push(_loc2_.gameObj.var_131.getCustomerIndex(_loc6_.customers[_loc7_]));
                     _loc7_++;
                  }
               }
               if(_loc8_.indexOf(_loc4_) > -1)
               {
                  if((_loc10_ = _loc6_.addToTally()) && !_loc3_.hasBadge(_loc5_))
                  {
                     _loc3_.earnBadge(_loc5_,_loc6_.title,_loc6_.rewardMoney,_loc6_.tickets);
                     _loc3_.saveAfterBadge();
                     _loc2_.showEarningBadge(_loc5_);
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function recordUnlockSeason(param1:String) : void
      {
         var _loc5_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.badges.length)
         {
            if((_loc5_ = _loc2_.badges[_loc4_]).challengeType == Challenge.UNLOCKSEASON)
            {
               if(_loc5_.tagName == param1 && !_loc3_.hasBadge(_loc4_))
               {
                  _loc3_.earnBadge(_loc4_,_loc5_.title,_loc5_.rewardMoney,_loc5_.tickets);
                  _loc3_.saveAfterBadge();
                  _loc2_.showEarningBadge(_loc4_);
               }
            }
            _loc4_++;
         }
      }
      
      public function recordUnlockHoliday(param1:Number) : void
      {
         var _loc5_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.badges.length)
         {
            if((_loc5_ = _loc2_.badges[_loc4_]).challengeType == Challenge.UNLOCKHOLIDAY)
            {
               if(_loc5_.targetAmount == param1 && !_loc3_.hasBadge(_loc4_))
               {
                  _loc3_.earnBadge(_loc4_,_loc5_.title,_loc5_.rewardMoney,_loc5_.tickets);
                  _loc3_.saveAfterBadge();
                  _loc2_.showEarningBadge(_loc4_);
               }
            }
            _loc4_++;
         }
      }
      
      public function recordUnlockTopping() : void
      {
         var _loc3_:Number = NaN;
         var _loc5_:Challenge = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc1_:ChallengeManager = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.badges.length)
         {
            if((_loc5_ = _loc1_.badges[_loc4_]).challengeType == Challenge.UNLOCKTOPPING)
            {
               _loc6_ = 0;
               _loc7_ = 0;
               if(_loc5_.toppings == "all")
               {
                  _loc6_ = _loc2_.toppingIndexes.length;
                  _loc3_ = 0;
                  while(_loc3_ < _loc2_.toppingIndexes.length)
                  {
                     if(_loc2_.hasTopping(_loc2_.toppingIndexes[_loc3_]))
                     {
                        _loc7_++;
                     }
                     _loc3_++;
                  }
               }
               else
               {
                  _loc6_ = Number(_loc5_.toppings.length);
                  _loc3_ = 0;
                  while(_loc3_ < _loc5_.toppings.length)
                  {
                     if(_loc2_.hasTopping(_loc5_.toppings[_loc3_]))
                     {
                        _loc7_++;
                     }
                     _loc3_++;
                  }
               }
               _loc5_.setTally(_loc7_);
               if(_loc7_ >= _loc6_ && !_loc2_.hasBadge(_loc4_))
               {
                  _loc2_.earnBadge(_loc4_,_loc5_.title,_loc5_.rewardMoney,_loc5_.tickets);
                  _loc2_.saveAfterBadge();
                  _loc1_.showEarningBadge(_loc4_);
               }
            }
            _loc4_++;
         }
      }
      
      public function recordPlayingMinigame() : void
      {
         var _loc6_:Challenge = null;
         var _loc7_:Boolean = false;
         var _loc1_:ChallengeManager = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.minigamesPlayed.length)
         {
            if(_loc2_.minigamesPlayed[_loc4_] > 0)
            {
               _loc3_++;
            }
            _loc4_++;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc1_.badges.length)
         {
            if((_loc6_ = _loc1_.badges[_loc5_]).challengeType == Challenge.MINIGAME)
            {
               if((_loc7_ = _loc6_.setTally(_loc3_)) && !_loc2_.hasBadge(_loc5_))
               {
                  _loc2_.earnBadge(_loc5_,_loc6_.title,_loc6_.rewardMoney,_loc6_.tickets);
                  _loc2_.saveAfterBadge();
                  _loc1_.showEarningBadge(_loc5_);
               }
            }
            _loc5_++;
         }
      }
      
      public function recordEarningPrize() : void
      {
         var _loc4_:Challenge = null;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc1_:ChallengeManager = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.badges.length)
         {
            if((_loc4_ = _loc1_.badges[_loc3_]).challengeType == Challenge.PRIZE)
            {
               if((_loc5_ = _loc4_.addToTally()) && !_loc2_.hasBadge(_loc3_))
               {
                  _loc2_.earnBadge(_loc3_,_loc4_.title,_loc4_.rewardMoney,_loc4_.tickets);
                  _loc2_.saveAfterBadge();
                  _loc1_.showEarningBadge(_loc3_);
               }
            }
            else if(_loc4_.challengeType == Challenge.MULTIPRIZE)
            {
               _loc6_ = Math.round(_loc4_.targetAmount / _loc2_.numberOfMinigames);
               _loc7_ = 0;
               _loc8_ = 0;
               while(_loc8_ < _loc2_.minigamePrizes.length)
               {
                  _loc7_ += Math.min(_loc6_,_loc2_.minigamePrizes[_loc8_]);
                  _loc8_++;
               }
               if((_loc9_ = _loc4_.setTally(_loc7_)) && !_loc2_.hasBadge(_loc3_))
               {
                  _loc2_.earnBadge(_loc3_,_loc4_.title,_loc4_.rewardMoney,_loc4_.tickets);
                  _loc2_.saveAfterBadge();
                  _loc1_.showEarningBadge(_loc3_);
               }
            }
            _loc3_++;
         }
      }
      
      public function recordEarningSpecialPrize() : void
      {
         var _loc4_:Challenge = null;
         var _loc5_:Boolean = false;
         var _loc1_:ChallengeManager = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.badges.length)
         {
            if((_loc4_ = _loc1_.badges[_loc3_]).challengeType == Challenge.SPECIALPRIZE)
            {
               if((_loc5_ = _loc4_.addToTally()) && !_loc2_.hasBadge(_loc3_))
               {
                  _loc2_.earnBadge(_loc3_,_loc4_.title,_loc4_.rewardMoney,_loc4_.tickets);
                  _loc2_.saveAfterBadge();
                  _loc1_.showEarningBadge(_loc3_);
               }
            }
            _loc3_++;
         }
      }
      
      public function recordEarningSpecialRecipe() : void
      {
         var _loc4_:Challenge = null;
         var _loc5_:Boolean = false;
         var _loc1_:ChallengeManager = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.badges.length)
         {
            if((_loc4_ = _loc1_.badges[_loc3_]).challengeType == Challenge.SPECIALS)
            {
               if((_loc5_ = _loc4_.addToTally()) && !_loc2_.hasBadge(_loc3_))
               {
                  _loc2_.earnBadge(_loc3_,_loc4_.title,_loc4_.rewardMoney,_loc4_.tickets);
                  _loc2_.saveAfterBadge();
                  _loc1_.showEarningBadge(_loc3_);
               }
            }
            _loc3_++;
         }
      }
      
      public function recordEarningSpecialRecipeAmount(param1:Number) : Boolean
      {
         var _loc6_:Challenge = null;
         var _loc7_:Boolean = false;
         var _loc2_:ChallengeManager = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.badges.length)
         {
            if((_loc6_ = _loc2_.badges[_loc5_]).challengeType == Challenge.SPECIALS)
            {
               if((_loc7_ = _loc6_.setTally(param1)) && !_loc3_.hasBadge(_loc5_))
               {
                  _loc3_.earnBadge(_loc5_,_loc6_.title,_loc6_.rewardMoney,_loc6_.tickets);
                  _loc3_.saveAfterBadge();
                  _loc4_ = true;
                  _loc2_.showEarningBadge(_loc5_);
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function recordUpgrade(param1:String) : void
      {
         var _loc5_:Challenge = null;
         var _loc6_:Boolean = false;
         var _loc2_:ChallengeManager = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.badges.length)
         {
            if((_loc5_ = _loc2_.badges[_loc4_]).challengeType == Challenge.UPGRADES)
            {
               if(_loc5_.upgrades == "any" || _loc5_.upgrades.indexOf(param1) > -1)
               {
                  if((_loc6_ = _loc5_.addToTally()) && !_loc3_.hasBadge(_loc4_))
                  {
                     _loc3_.earnBadge(_loc4_,_loc5_.title,_loc5_.rewardMoney,_loc5_.tickets);
                     _loc3_.saveAfterBadge();
                     _loc2_.showEarningBadge(_loc4_);
                  }
               }
            }
            _loc4_++;
         }
      }
      
      public function recordTagged(param1:String, param2:Number = 1) : Boolean
      {
         var _loc7_:Challenge = null;
         var _loc8_:Boolean = false;
         var _loc3_:ChallengeManager = this;
         var _loc4_:UserData = _loc3_.gameObj.var_127;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.badges.length)
         {
            if((_loc7_ = _loc3_.badges[_loc6_]).challengeType == Challenge.TAGGED)
            {
               if(_loc7_.tagName == param1)
               {
                  if((_loc8_ = _loc7_.addToTally(param2)) && !_loc4_.hasBadge(_loc6_))
                  {
                     _loc4_.earnBadge(_loc6_,_loc7_.title,_loc7_.rewardMoney,_loc7_.tickets);
                     _loc4_.saveAfterBadge();
                     _loc3_.showEarningBadge(_loc6_);
                     _loc5_ = true;
                  }
               }
            }
            _loc6_++;
         }
         return _loc5_;
      }
      
      public function setTagged(param1:String, param2:Number = 0) : void
      {
         var _loc6_:Challenge = null;
         var _loc3_:ChallengeManager = this;
         var _loc4_:UserData = _loc3_.gameObj.var_127;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.badges.length)
         {
            if((_loc6_ = _loc3_.badges[_loc5_]).challengeType == Challenge.TAGGED)
            {
               if(_loc6_.tagName == param1)
               {
                  if(!_loc4_.hasBadge(_loc5_))
                  {
                     _loc6_.setTally(param2);
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function recordPurchase(param1:String = "furniture") : void
      {
         var _loc5_:Challenge = null;
         var _loc6_:Boolean = false;
         var _loc2_:ChallengeManager = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         _loc2_.setTagged("piggybank",0);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.badges.length)
         {
            if((_loc5_ = _loc2_.badges[_loc4_]).challengeType == Challenge.PURCHASES)
            {
               if(_loc5_.upgrades == "any" || _loc5_.upgrades == param1)
               {
                  if((_loc6_ = _loc5_.addToTally()) && !_loc3_.hasBadge(_loc4_))
                  {
                     _loc3_.earnBadge(_loc4_,_loc5_.title,_loc5_.rewardMoney,_loc5_.tickets);
                     _loc3_.saveAfterBadge();
                     _loc2_.showEarningBadge(_loc4_);
                  }
               }
            }
            _loc4_++;
         }
      }
      
      public function recordFurniture(param1:String, param2:String = "furniture", param3:Boolean = false) : void
      {
         var _loc7_:Challenge = null;
         var _loc8_:Boolean = false;
         var _loc4_:ChallengeManager;
         var _loc5_:UserData = (_loc4_ = this).gameObj.var_127;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.badges.length)
         {
            if((_loc7_ = _loc4_.badges[_loc6_]).challengeType == Challenge.FURNITURE && param3 == false || (_loc7_.challengeType == Challenge.REWARDFURNI || _loc7_.challengeType == Challenge.REWARDANY) && param3 == true)
            {
               if(_loc7_.upgrades == "any" || _loc7_.upgrades.indexOf(param1) > -1 || _loc7_.upgrades == param2)
               {
                  if((_loc8_ = _loc7_.addToTally()) && !_loc5_.hasBadge(_loc6_))
                  {
                     _loc5_.earnBadge(_loc6_,_loc7_.title,_loc7_.rewardMoney,_loc7_.tickets);
                     _loc5_.saveAfterBadge();
                     _loc4_.showEarningBadge(_loc6_);
                  }
               }
            }
            _loc6_++;
         }
      }
      
      public function recordClothing(param1:String, param2:String = "furniture", param3:Boolean = false) : void
      {
         var _loc7_:Challenge = null;
         var _loc8_:Boolean = false;
         var _loc4_:ChallengeManager;
         var _loc5_:UserData = (_loc4_ = this).gameObj.var_127;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.badges.length)
         {
            if((_loc7_ = _loc4_.badges[_loc6_]).challengeType == Challenge.CLOTHING && param3 == false || (_loc7_.challengeType == Challenge.REWARDCLOTHING || _loc7_.challengeType == Challenge.REWARDANY) && param3 == true)
            {
               if(_loc7_.upgrades == "any" || _loc7_.upgrades.indexOf(param1) > -1 || _loc7_.upgrades == param2)
               {
                  if((_loc8_ = _loc7_.addToTally()) && !_loc5_.hasBadge(_loc6_))
                  {
                     _loc5_.earnBadge(_loc6_,_loc7_.title,_loc7_.rewardMoney,_loc7_.tickets);
                     _loc5_.saveAfterBadge();
                     _loc4_.showEarningBadge(_loc6_);
                  }
               }
            }
            _loc6_++;
         }
      }
      
      public function recordCustomerSeal(param1:Number = 0, param2:String = "") : void
      {
         var _loc7_:Challenge = null;
         var _loc8_:Boolean = false;
         var _loc3_:ChallengeManager = this;
         var _loc4_:UserData = _loc3_.gameObj.var_127;
         var _loc5_:String = "";
         if(param1 == 1)
         {
            _loc5_ = "bronze";
         }
         else if(param1 == 2)
         {
            _loc5_ = "silver";
         }
         else if(param1 == 3)
         {
            _loc5_ = "gold";
         }
         else
         {
            _loc5_ = param2;
         }
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.badges.length)
         {
            if((_loc7_ = _loc3_.badges[_loc6_]).challengeType == Challenge.SEALS && _loc7_.sealType == _loc5_)
            {
               if((_loc8_ = _loc7_.addToTally()) && !_loc4_.hasBadge(_loc6_))
               {
                  _loc4_.earnBadge(_loc6_,_loc7_.title,_loc7_.rewardMoney,_loc7_.tickets);
                  _loc4_.saveAfterBadge();
                  _loc3_.showEarningBadge(_loc6_);
               }
            }
            _loc6_++;
         }
      }
      
      public function recordCustomerOutfit(param1:String) : void
      {
         this;
      }
      
      public function recordRibbon() : void
      {
         var _loc4_:Challenge = null;
         var _loc5_:Boolean = false;
         var _loc1_:ChallengeManager = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.badges.length)
         {
            if((_loc4_ = _loc1_.badges[_loc3_]).challengeType == Challenge.RIBBON)
            {
               if((_loc5_ = _loc4_.addToTally()) && !_loc2_.hasBadge(_loc3_))
               {
                  _loc2_.earnBadge(_loc3_,_loc4_.title,_loc4_.rewardMoney,_loc4_.tickets);
                  _loc2_.saveAfterBadge();
                  _loc1_.showEarningBadge(_loc3_);
               }
            }
            _loc3_++;
         }
      }
      
      public function recordSpecialStar() : void
      {
         var _loc4_:Challenge = null;
         var _loc5_:Boolean = false;
         var _loc1_:ChallengeManager = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.badges.length)
         {
            if((_loc4_ = _loc1_.badges[_loc3_]).challengeType == Challenge.SPECIALSTAR)
            {
               if((_loc5_ = _loc4_.addToTally()) && !_loc2_.hasBadge(_loc3_))
               {
                  _loc2_.earnBadge(_loc3_,_loc4_.title,_loc4_.rewardMoney,_loc4_.tickets);
                  _loc2_.saveAfterBadge();
                  _loc1_.showEarningBadge(_loc3_);
               }
            }
            _loc3_++;
         }
      }
      
      public function recordPayDay() : void
      {
         var _loc4_:Challenge = null;
         var _loc5_:Boolean = false;
         var _loc1_:ChallengeManager = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.badges.length)
         {
            if((_loc4_ = _loc1_.badges[_loc3_]).challengeType == Challenge.PAYDAY)
            {
               if((_loc5_ = _loc4_.addToTally()) && !_loc2_.hasBadge(_loc3_))
               {
                  _loc2_.earnBadge(_loc3_,_loc4_.title,_loc4_.rewardMoney,_loc4_.tickets);
                  _loc2_.saveAfterBadge();
                  _loc1_.showEarningBadge(_loc3_);
               }
            }
            _loc3_++;
         }
      }
      
      public function recordMeterAward(param1:String, param2:String) : void
      {
         var _loc6_:Challenge = null;
         var _loc7_:Boolean = false;
         var _loc3_:ChallengeManager = this;
         var _loc4_:UserData = _loc3_.gameObj.var_127;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.badges.length)
         {
            if((_loc6_ = _loc3_.badges[_loc5_]).challengeType == Challenge.METER)
            {
               if((_loc6_.scoreType == "any" || _loc6_.scoreType.indexOf(param2) > -1) && (_loc6_.machine == "any" || _loc6_.machine == param1))
               {
                  if((_loc7_ = _loc6_.addToTally()) && !_loc4_.hasBadge(_loc5_))
                  {
                     _loc4_.earnBadge(_loc5_,_loc6_.title,_loc6_.rewardMoney,_loc6_.tickets);
                     _loc4_.saveAfterBadge();
                     _loc3_.showEarningBadge(_loc5_);
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function recordServiceQuality(param1:Number = 100) : void
      {
         var _loc5_:Challenge = null;
         var _loc6_:Boolean = false;
         var _loc2_:ChallengeManager = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.badges.length)
         {
            if((_loc5_ = _loc2_.badges[_loc4_]).challengeType == Challenge.SERVICEQUALITY && _loc5_.percentQuality <= param1)
            {
               if((_loc6_ = _loc5_.addToTally()) && !_loc3_.hasBadge(_loc4_))
               {
                  _loc3_.earnBadge(_loc4_,_loc5_.title,_loc5_.rewardMoney,_loc5_.tickets);
                  _loc3_.saveAfterBadge();
                  _loc2_.showEarningBadge(_loc4_);
               }
            }
            _loc4_++;
         }
      }
      
      public function recordServeOrder(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Array, param8:Array, param9:Array) : void
      {
         var _loc16_:Challenge = null;
         var _loc17_:Boolean = false;
         var _loc18_:Array = null;
         var _loc19_:Number = NaN;
         var _loc20_:int = 0;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Array = null;
         var _loc24_:Number = NaN;
         var _loc25_:String = null;
         var _loc26_:int = 0;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Array = null;
         var _loc30_:Boolean = false;
         var _loc31_:Boolean = false;
         var _loc32_:Number = NaN;
         var _loc33_:int = 0;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Array = null;
         var _loc37_:Boolean = false;
         var _loc38_:Boolean = false;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:Array = null;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc46_:Array = null;
         var _loc10_:ChallengeManager;
         var _loc11_:UserData = (_loc10_ = this).gameObj.var_127;
         var _loc12_:Number = Math.floor((param2 + param3 + param4 + param5) / 4);
         var _loc13_:Array = param7.concat();
         var _loc14_:Boolean = false;
         var _loc15_:int = 0;
         while(_loc15_ < _loc10_.badges.length)
         {
            _loc16_ = _loc10_.badges[_loc15_];
            _loc17_ = false;
            if(_loc13_.indexOf(_loc16_.topping) > -1)
            {
               _loc17_ = true;
            }
            else if(_loc16_.topping == "any")
            {
               _loc17_ = true;
            }
            if(_loc16_.challengeType == Challenge.USETOPPING && _loc17_)
            {
               if((_loc14_ = _loc16_.addToTally()) && !_loc11_.hasBadge(_loc15_))
               {
                  _loc11_.earnBadge(_loc15_,_loc16_.title,_loc16_.rewardMoney,_loc16_.tickets);
                  _loc11_.saveAfterBadge();
                  _loc10_.showEarningBadge(_loc15_);
               }
            }
            else if(_loc16_.challengeType == Challenge.EXTRAINGREDIENTS)
            {
               _loc18_ = _loc16_.toppings.concat();
               _loc19_ = 0;
               if(Boolean(param8) && param8.length > 0)
               {
                  _loc20_ = 0;
                  while(_loc20_ < param8.length)
                  {
                     if(_loc18_.indexOf(param8[_loc20_]) > -1)
                     {
                        _loc19_++;
                     }
                     _loc20_++;
                  }
               }
               if(_loc19_ >= _loc18_.length)
               {
                  _loc21_ = _loc10_.gameObj.var_131.getCustomerIndex(_loc16_.customer);
                  _loc22_ = _loc10_.gameObj.var_131.getCustomerIndex(param1);
                  if(_loc21_ == _loc22_)
                  {
                     if((_loc14_ = _loc16_.addToTally()) && !_loc11_.hasBadge(_loc15_))
                     {
                        _loc11_.earnBadge(_loc15_,_loc16_.title,_loc16_.rewardMoney,_loc16_.tickets);
                        _loc11_.saveAfterBadge();
                        _loc10_.showEarningBadge(_loc15_);
                     }
                  }
               }
            }
            else if(_loc16_.challengeType == Challenge.SERVECLOTHING)
            {
               _loc23_ = _loc16_.clothing.concat();
               _loc24_ = 0;
               if(Boolean(param9) && param9.length > 0)
               {
                  _loc26_ = 0;
                  while(_loc26_ < param9.length)
                  {
                     _loc25_ = _loc10_.gameObj.var_134.getBaseSKU(param9[_loc26_]);
                     if(_loc23_.indexOf(_loc25_) > -1)
                     {
                        _loc24_++;
                     }
                     _loc26_++;
                  }
                  if(_loc24_ >= _loc23_.length && (_loc16_.month == -1 || _loc16_.month == _loc11_.getHolidayMonth()))
                  {
                     _loc28_ = _loc10_.gameObj.var_131.getCustomerIndex(param1);
                     _loc29_ = [];
                     if(_loc16_.customers != "any")
                     {
                        _loc27_ = 0;
                        while(_loc27_ < _loc16_.customers.length)
                        {
                           _loc29_.push(_loc10_.gameObj.var_131.getCustomerIndex(_loc16_.customers[_loc27_]));
                           _loc27_++;
                        }
                     }
                     if(_loc16_.customers == "any" || _loc29_.indexOf(_loc28_) > -1)
                     {
                        if((_loc30_ = _loc16_.addToTally()) && !_loc11_.hasBadge(_loc15_))
                        {
                           _loc11_.earnBadge(_loc15_,_loc16_.title,_loc16_.rewardMoney,_loc16_.tickets);
                           _loc11_.saveAfterBadge();
                           _loc10_.showEarningBadge(_loc15_);
                        }
                     }
                  }
               }
            }
            else if(_loc16_.challengeType == Challenge.SERVECLOTHINGTHEME)
            {
               _loc31_ = false;
               if((_loc32_ = _loc16_.month) == -1)
               {
                  _loc32_ = _loc11_.getHolidayMonth();
               }
               if(_loc32_ > 0 && param9 && param9.length > 0 && _loc11_.getHolidayMonth() == _loc32_)
               {
                  _loc33_ = 0;
                  while(_loc33_ < param9.length)
                  {
                     if(this.gameObj.var_134.getClothingMatchingTheme(param9[_loc33_],_loc32_) == _loc32_)
                     {
                        _loc31_ = true;
                        break;
                     }
                     _loc33_++;
                  }
                  if(_loc31_)
                  {
                     class_6.method_1("Outfit matched challenge theme (" + _loc32_ + ")");
                     _loc35_ = _loc10_.gameObj.var_131.getCustomerIndex(param1);
                     _loc36_ = [];
                     if(_loc16_.customers != "any")
                     {
                        _loc34_ = 0;
                        while(_loc34_ < _loc16_.customers.length)
                        {
                           _loc36_.push(_loc10_.gameObj.var_131.getCustomerIndex(_loc16_.customers[_loc34_]));
                           _loc34_++;
                        }
                     }
                     if(_loc16_.customers == "any" || _loc36_.indexOf(_loc35_) > -1)
                     {
                        if((_loc37_ = _loc16_.addToTally()) && !_loc11_.hasBadge(_loc15_))
                        {
                           _loc11_.earnBadge(_loc15_,_loc16_.title,_loc16_.rewardMoney,_loc16_.tickets);
                           _loc11_.saveAfterBadge();
                           _loc10_.showEarningBadge(_loc15_);
                        }
                     }
                  }
               }
            }
            else if(_loc16_.challengeType == Challenge.SCORE)
            {
               _loc38_ = false;
               if(_loc16_.scoreType == "Waiting" && param2 >= _loc16_.score && (_loc16_.customer == "any" || _loc16_.customer == param1))
               {
                  _loc38_ = true;
               }
               else if(_loc16_.scoreType == "Tea" && param5 >= _loc16_.score && (_loc16_.customer == "any" || _loc16_.customer == param1))
               {
                  _loc38_ = true;
               }
               else if(_loc16_.scoreType == "Cook" && param3 >= _loc16_.score && (_loc16_.customer == "any" || _loc16_.customer == param1))
               {
                  _loc38_ = true;
               }
               else if(_loc16_.scoreType == "Build" && param4 >= _loc16_.score && (_loc16_.customer == "any" || _loc16_.customer == param1))
               {
                  _loc38_ = true;
               }
               else if(_loc16_.scoreType == "Overall" && _loc12_ >= _loc16_.score && (_loc16_.customer == "any" || _loc16_.customer == param1))
               {
                  _loc38_ = true;
               }
               else if(_loc16_.scoreType == "Points" && param6 >= _loc16_.score && (_loc16_.customer == "any" || _loc16_.customer == param1))
               {
                  _loc38_ = true;
               }
               if(_loc38_)
               {
                  if((_loc14_ = _loc16_.addToTally()) && !_loc11_.hasBadge(_loc15_))
                  {
                     _loc11_.earnBadge(_loc15_,_loc16_.title,_loc16_.rewardMoney,_loc16_.tickets);
                     _loc11_.saveAfterBadge();
                     _loc10_.showEarningBadge(_loc15_);
                  }
               }
            }
            else if(_loc16_.challengeType == Challenge.SERVECUSTOMERS)
            {
               _loc40_ = _loc10_.gameObj.var_131.getCustomerIndex(param1);
               _loc41_ = [];
               _loc42_ = 0;
               if(_loc16_.customers == "all")
               {
                  _loc39_ = 1;
                  while(_loc39_ <= _loc10_.gameObj.var_131.getCustomerTotal())
                  {
                     _loc41_.push(_loc39_);
                     _loc39_++;
                  }
               }
               else
               {
                  _loc39_ = 0;
                  while(_loc39_ < _loc16_.customers.length)
                  {
                     _loc41_.push(_loc10_.gameObj.var_131.getCustomerIndex(_loc16_.customers[_loc39_]));
                     _loc39_++;
                  }
               }
               _loc39_ = 0;
               while(_loc39_ < _loc41_.length)
               {
                  if(_loc11_.customerVisits[_loc41_[_loc39_]] > 0)
                  {
                     _loc42_++;
                  }
                  _loc39_++;
               }
               if(_loc41_.indexOf(_loc40_) > -1)
               {
                  _loc16_.setTally(_loc42_);
                  if(_loc42_ >= _loc41_.length && !_loc11_.hasBadge(_loc15_))
                  {
                     _loc11_.earnBadge(_loc15_,_loc16_.title,_loc16_.rewardMoney,_loc16_.tickets);
                     _loc11_.saveAfterBadge();
                     _loc10_.showEarningBadge(_loc15_);
                  }
               }
            }
            else if(_loc16_.challengeType == Challenge.SERVECUSTOMERSINMONTH)
            {
               if((_loc43_ = _loc10_.gameObj.var_127.getMonth()) == GameData.STARTER_MONTH && _loc10_.gameObj.var_127.isNewYear() == false)
               {
                  _loc43_ = 0;
               }
               _loc45_ = _loc10_.gameObj.var_131.getCustomerIndex(param1);
               _loc46_ = [];
               _loc44_ = 0;
               while(_loc44_ < _loc16_.customers.length)
               {
                  _loc46_.push(_loc10_.gameObj.var_131.getCustomerIndex(_loc16_.customers[_loc44_]));
                  _loc44_++;
               }
               if(_loc16_.month == _loc43_ && _loc46_.indexOf(_loc45_) > -1)
               {
                  if((_loc14_ = _loc16_.addToTally()) && !_loc11_.hasBadge(_loc15_))
                  {
                     _loc11_.earnBadge(_loc15_,_loc16_.title,_loc16_.rewardMoney,_loc16_.tickets);
                     _loc11_.saveAfterBadge();
                     _loc10_.showEarningBadge(_loc15_);
                  }
               }
            }
            _loc15_++;
         }
      }
      
      public function getMedalProgressArray() : Array
      {
         var _loc4_:Challenge = null;
         var _loc1_:ChallengeManager = this;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.badges.length)
         {
            _loc4_ = _loc1_.badges[_loc3_];
            _loc2_[_loc3_] = _loc4_.tally;
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function populateMedalProgress(param1:Array) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = 0;
            if(param1[_loc3_])
            {
               _loc4_ = Number(param1[_loc3_]);
            }
            if(_loc2_.badges.length > _loc3_)
            {
               (_loc5_ = _loc2_.badges[_loc3_]).setTally(_loc4_);
            }
            _loc3_++;
         }
      }
      
      public function resetAllTallies() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Challenge = null;
         var _loc1_:ChallengeManager = this;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.badges.length)
         {
            _loc3_ = _loc1_.badges[_loc2_];
            _loc3_.clearTally(true);
            _loc2_++;
         }
      }
      
      public function showSpecialProgress(param1:Number) : void
      {
         var _loc2_:ChallengeManager = this;
         class_6.method_1("SHOW PROGRESS ON TODAY\'S SPECIAL");
         _loc2_.badgeQueue.push(param1);
         _loc2_.badgeQueueType.push("special");
         _loc2_.checkForDisplayingBadges();
      }
      
      public function showEarningBadge(param1:Number) : void
      {
         var _loc2_:ChallengeManager = this;
         class_6.method_1("EARN BADGE #" + param1 + ". ADD TO QUEUE!");
         _loc2_.badgeQueue.push(param1);
         _loc2_.badgeQueueType.push("badge");
         _loc2_.checkForDisplayingBadges();
      }
      
      public function checkForDisplayingBadges() : void
      {
         var which:Number = NaN;
         var whichType:String = null;
         var badgeNumber:String = null;
         var special:SpecialItem = null;
         var numStars:Number = NaN;
         var s:int = 0;
         var manager:ChallengeManager = this;
         if(this.dropdownDisabled == false && manager.badgeDropdown == null && manager.badgeQueue.length > 0)
         {
            which = Number(manager.badgeQueue[0]);
            whichType = String(manager.badgeQueueType[0]);
            manager.badgeDropdown = new badgeDropdownMC();
            manager.badgeDropdown.buttonMode = true;
            manager.badgeDropdown.mouseEnabled = true;
            manager.badgeDropdown.mouseChildren = false;
            manager.badgeDropdown.tabEnabled = false;
            manager.badgeDropdown.x = manager.dropdownX;
            if(whichType == "badge")
            {
               manager.badgeDropdown.special.visible = false;
               badgeNumber = "" + (which + 1);
               if(which + 1 < 10)
               {
                  badgeNumber = "00" + badgeNumber;
               }
               else if(which + 1 < 100)
               {
                  badgeNumber = "0" + badgeNumber;
               }
               manager.badgeDropdown.panel.title_txt.text = badgeNumber;
               manager.badgeDropdown.panel.description_txt.text = manager.getChallengeDescription(which);
               try
               {
                  if(manager.badgeDropdownSticker != null)
                  {
                     if(manager.badgeDropdownSticker.parent)
                     {
                        manager.badgeDropdownSticker.parent.removeChild(manager.badgeDropdownSticker);
                     }
                     manager.badgeDropdownSticker = null;
                  }
                  manager.badgeDropdownSticker = class_14.method_103("stix_" + manager.getStickerForChallenge(which),false,false);
                  manager.badgeDropdownSticker.scaleX = 0.6;
                  manager.badgeDropdownSticker.scaleY = 0.6;
                  manager.badgeDropdownSticker.x = 23;
                  manager.badgeDropdownSticker.y = 23;
                  manager.badgeDropdownSticker.lines.visible = false;
                  manager.badgeDropdownSticker.gotoAndStop(1);
                  manager.badgeDropdownSticker.cacheAsBitmap = true;
                  manager.badgeDropdown.panel.addChild(manager.badgeDropdownSticker);
               }
               catch(err:Error)
               {
                  class_6.error("Error setting up sticker for dropdown: " + err.message);
               }
               manager.gameObj.var_128.playSound("getstar.wav");
            }
            else if(whichType == "special")
            {
               manager.badgeDropdown.panel.visible = false;
               special = manager.gameObj.var_132.getSpecial(which);
               if(special != null)
               {
                  manager.badgeDropdown.special.title_txt.text = special.title;
                  manager.badgeDropdown.special.bonus_txt.text = special.getBonusString();
                  numStars = manager.gameObj.var_127.getSpecialStars(which);
                  s = 1;
                  while(s <= 5)
                  {
                     if(numStars >= s)
                     {
                        manager.badgeDropdown.special["star" + s].visible = true;
                     }
                     else
                     {
                        manager.badgeDropdown.special["star" + s].visible = false;
                     }
                     s++;
                  }
                  try
                  {
                     manager.badgeDropdownBitmap = new Bitmap(manager.gameObj.var_133.specialBMP,"auto",true);
                     manager.badgeDropdownBitmap.scaleX = 0.3;
                     manager.badgeDropdownBitmap.scaleY = 0.3;
                     manager.badgeDropdownBitmap.x = 5;
                     manager.badgeDropdownBitmap.y = 0;
                     manager.badgeDropdown.special.addChild(manager.badgeDropdownBitmap);
                  }
                  catch(err:Error)
                  {
                     class_6.error("Error adding special icon: " + err.message);
                  }
               }
               else
               {
                  class_6.error("Error with special dropdown.");
               }
               manager.gameObj.var_128.playSound("getstar.wav");
            }
            manager.dropdownOnScreenTimer = 0;
            manager.dropdownStartY = 0 - manager.dropdownHeight;
            if(manager.gameObj.var_130.api.var_141.length == 0)
            {
               manager.badgeDropdown.y = this.dropdownStartY;
               manager.gameObj.addChild(manager.badgeDropdown);
            }
            else
            {
               manager.badgeDropdown.y = this.dropdownStartY;
               manager.gameObj.addChild(manager.badgeDropdown);
            }
            manager.badgeDropdown.addEventListener(Event.ENTER_FRAME,manager.animateBadgeDropdown);
            manager.badgeDropdown.addEventListener(MouseEvent.CLICK,manager.clickBadgeDropdown);
         }
      }
      
      public function clickBadgeDropdown(param1:MouseEvent) : void
      {
         var _loc2_:ChallengeManager = this;
         _loc2_.dropdownOnScreenTimer = _loc2_.dropdownOnScreenWait - 1;
      }
      
      public function animateBadgeDropdown(param1:Event) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:ChallengeManager = this;
         if(_loc2_.badgeDropdown != null)
         {
            if(_loc2_.dropdownOnScreenTimer == 0)
            {
               if(_loc2_.badgeDropdown.y < _loc2_.dropdownStartY + _loc2_.dropdownHeight)
               {
                  _loc3_ = _loc2_.dropdownStartY + _loc2_.dropdownHeight - _loc2_.badgeDropdown.y;
                  _loc2_.badgeDropdown.y += _loc3_ / _loc2_.dropdownSpeed;
                  if(_loc3_ >= -1 && _loc3_ <= 1)
                  {
                     _loc2_.badgeDropdown.y = _loc2_.dropdownStartY + _loc2_.dropdownHeight;
                     ++_loc2_.dropdownOnScreenTimer;
                  }
               }
            }
            else if(_loc2_.dropdownOnScreenTimer == _loc2_.dropdownOnScreenWait)
            {
               if(_loc2_.badgeDropdown.y > _loc2_.dropdownStartY)
               {
                  _loc3_ = _loc2_.dropdownStartY - _loc2_.badgeDropdown.y;
                  _loc2_.badgeDropdown.y += _loc3_ / _loc2_.dropdownSpeed;
                  if(_loc3_ >= -1 && _loc3_ <= 1)
                  {
                     if(_loc2_.badgeDropdownBitmap != null)
                     {
                        _loc2_.badgeDropdownBitmap.bitmapData = null;
                        if(_loc2_.badgeDropdownBitmap.parent)
                        {
                           _loc2_.badgeDropdownBitmap.parent.removeChild(_loc2_.badgeDropdownBitmap);
                        }
                        _loc2_.badgeDropdownBitmap = null;
                     }
                     if(_loc2_.badgeDropdownSticker != null)
                     {
                        if(_loc2_.badgeDropdownSticker.parent)
                        {
                           _loc2_.badgeDropdownSticker.parent.removeChild(_loc2_.badgeDropdownSticker);
                        }
                        _loc2_.badgeDropdownSticker = null;
                     }
                     _loc2_.badgeDropdown.removeEventListener(Event.ENTER_FRAME,_loc2_.animateBadgeDropdown);
                     _loc2_.badgeDropdown.removeEventListener(MouseEvent.CLICK,_loc2_.clickBadgeDropdown);
                     _loc2_.badgeDropdown.parent.removeChild(_loc2_.badgeDropdown);
                     _loc2_.badgeDropdown = null;
                     _loc2_.badgeQueue.shift();
                     _loc2_.badgeQueueType.shift();
                     _loc2_.checkForDisplayingBadges();
                  }
               }
            }
            else
            {
               ++_loc2_.dropdownOnScreenTimer;
            }
         }
      }
      
      public function getStickerData(param1:String) : StickerData
      {
         var _loc2_:ChallengeManager = this;
         var _loc3_:StickerData = null;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.stickers.length)
         {
            if(_loc2_.stickers[_loc4_].sku == param1)
            {
               _loc3_ = _loc2_.stickers[_loc4_];
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getStickerX(param1:String) : Number
      {
         var _loc2_:ChallengeManager = this;
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.stickers.length)
         {
            if(_loc2_.stickers[_loc4_].sku == param1)
            {
               _loc3_ = Number(_loc2_.stickers[_loc4_].x);
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getStickerY(param1:String) : Number
      {
         var _loc2_:ChallengeManager = this;
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.stickers.length)
         {
            if(_loc2_.stickers[_loc4_].sku == param1)
            {
               _loc3_ = Number(_loc2_.stickers[_loc4_].y);
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getChallengeIndexForSticker(param1:String) : Number
      {
         var _loc2_:ChallengeManager = this;
         var _loc3_:Number = -1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.badges.length)
         {
            if(_loc2_.badges[_loc4_].stickerSKU == param1)
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getStickerForChallenge(param1:Number) : String
      {
         var _loc4_:Number = NaN;
         var _loc5_:Challenge = null;
         var _loc2_:ChallengeManager = this;
         var _loc3_:String = "";
         if(param1 > -1)
         {
            if(param1 < _loc2_.badges.length)
            {
               _loc3_ = (_loc5_ = _loc2_.badges[param1]).stickerSKU;
            }
         }
         return _loc3_;
      }
      
      public function verifyStickers() : void
      {
         var _loc2_:int = 0;
         var _loc4_:Challenge = null;
         var _loc5_:Number = NaN;
         var _loc1_:ChallengeManager = this;
         class_6.error("DEBUG - VERIFYING STICKERS.....");
         var _loc3_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < _loc1_.stickers.length)
         {
            _loc3_.push(_loc1_.stickers[_loc2_].sku);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.badges.length)
         {
            if((_loc4_ = _loc1_.badges[_loc2_]).stickerSKU != null)
            {
               if((_loc5_ = _loc3_.indexOf(_loc4_.stickerSKU)) > -1)
               {
                  _loc3_.splice(_loc5_,1);
               }
               else
               {
                  class_6.error(" >> Unknown Sticker: " + _loc4_.stickerSKU);
               }
            }
            else
            {
               class_6.error(" >> Sticker Not Set: " + _loc2_ + ": " + _loc4_.title);
            }
            _loc2_++;
         }
         if(_loc3_.length > 0)
         {
            class_6.error(" >> >> Unused Stickers: " + _loc3_.toString());
         }
      }
   }
}

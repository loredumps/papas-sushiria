package sushiGame.data
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.*;
   
   public class GameData
   {
      
      public static const DAY_TO_HIRE:Number = 5;
      
      public static const DELAY_BETWEEN_BRINGING_SPECIALS:Number = 3;
      
      public static const MONTH_NAMES:Array = ["Month 0","January","February","March","April","May","June","July","August","September","October","November","December"];
      
      public static const MONTH_JANUARY:Number = 1;
      
      public static const MONTH_FEBRUARY:Number = 2;
      
      public static const MONTH_MARCH:Number = 3;
      
      public static const MONTH_APRIL:Number = 4;
      
      public static const MONTH_MAY:Number = 5;
      
      public static const MONTH_JUNE:Number = 6;
      
      public static const MONTH_JULY:Number = 7;
      
      public static const MONTH_AUGUST:Number = 8;
      
      public static const MONTH_SEPTEMBER:Number = 9;
      
      public static const MONTH_OCTOBER:Number = 10;
      
      public static const MONTH_NOVEMBER:Number = 11;
      
      public static const MONTH_DECEMBER:Number = 12;
      
      public static const STARTER_MONTH:Number = 3;
       
      
      public var gameObj:class_5;
      
      public var shopItems:Array;
      
      public var boomboxTag:String = "";
      
      public var jukeboxTag:String = "";
      
      public var phonographTag:String = "";
      
      public var themeTagsPerMonth:Array;
      
      public var themeTagNames:Array;
      
      public var furniItems:Array;
      
      public var minigamePrizes:Array;
      
      public var unlockArray:Array;
      
      public var specials:Array;
      
      public function GameData(param1:class_5)
      {
         this.shopItems = [new Upgrade("doorbell","Doorbell",450,"","You\'ll hear when new customers enter, no matter where you are.",0),new Upgrade("booster0","Cook Booster 1",12000,"","Hold down the booster to cook rice faster.",0),new Upgrade("booster1","Cook Booster 2",12000,"","Hold down the booster to cook rice faster.",0),new Upgrade("booster2","Cook Booster 3",12000,"","Hold down the booster to cook rice faster.",0),new Upgrade("alarm0","Rice Alarm 1",9000,"","Alerts you when rice has finished cooking.",0),new Upgrade("alarm1","Rice Alarm 2",9000,"","Alerts you when rice has finished cooking.",0),new Upgrade("alarm2","Rice Alarm 3",9000,"","Alerts you when rice has finished cooking.",0),new Upgrade("cutguide","Cutting Guide",15000,"","Helps you slice sushi at the correct size.",0),new Upgrade("automilk","Milk Auto-Pour",25000,"","Automatically pours the perfect amount of milk for bubble tea.",0),new Upgrade("coupon","Customer Coupon",2500,"","Send one to a specific customer to get them to visit again!",0),new Upgrade("specialsign","Special Sign",25000,"","More customers will order Today\'s Special!",0)];
         this.themeTagsPerMonth = ["","N","V","L","C","D","S","Q","B","M","H","T","X"];
         this.themeTagNames = ["","New Year","Valentine\'s Day","Lucky Lucky Matsuri","Cherry Blossom Fest","Cinco de Mayo","Summer Luau","Starlight BBQ","BavariaFest","Maple Mornings","Halloween","Thanksgiving","Christmas"];
         this.furniItems = [new FurniData("g","poster_window","Large Window",7500,"Waiting","Get a view of the outside.",FurniData.TYPE_POSTER,3,3,3),new FurniData("g","poster_window2","Thin Window",4500,"Waiting","Get a (smaller) view of the outside.",FurniData.TYPE_POSTER,3,1,2),new FurniData("g","poster_window3","Tall Window",7500,"Waiting","Let some light in.",FurniData.TYPE_POSTER,2,4,3),new FurniData("g","poster_window4","Round Window",5500,"Waiting","Peek out the porthole.",FurniData.TYPE_POSTER,2,2,2,"none","none","none"),new FurniData("g","wall1","Starter Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,1,"none","none","none",false),new FurniData("g","floor1","Starter Floor",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,1,"none","none","none",false),new FurniData("C","furni_cherryblossom_table_small","Sm. Blossom Table",3500,"Waiting","",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("C","furni_cherryblossom_table_medium","Md. Blossom Table",5500,"Waiting","",FurniData.TYPE_FURNI,3,1,2,"none","none","none",true),new FurniData("C","furni_cherryblossom_table_large","Lg. Blossom Table",7500,"Waiting","",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("C","furni_cherryblossom_fence","Blossom Fence",6500,"Waiting","",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("C","furni_cherryblossom_bonsai","Sakura Bonsai",7500,"Waiting","",FurniData.TYPE_FURNI,2,1,3,"none","none","none",true),new FurniData("C","furni_cherryblossom_lamp","Paper Lantern",8000,"Waiting","",FurniData.TYPE_FURNI,2,1,3,"none","none","none",true),new FurniData("C","furni_cherryblossom_gumball_sakura","Sakura Gum",8500,"Sweet Sakura Sauce","",FurniData.TYPE_FURNI,2,1,2,FurniData.SPECIAL_SCOREBUBBLEGUM,"build",FoodData.SAUCE_SWEETSAKURA),new FurniData("C","poster_cherryblossomfestival","Blossom Poster",4500,"Waiting","",FurniData.TYPE_POSTER,3,2,2),new FurniData("C","poster_honeydewtea","Honeydew Poster",4000,"Honeydew Tea","",FurniData.TYPE_POSTER,2,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.TEA_HONEYDEW,true),new FurniData("C","poster_cottoncandybubbles","Cotton Candy Poster",4500,"Cotton Candy Bubbles","",FurniData.TYPE_POSTER,3,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.BUBBLE_COTTONCANDY,true),new FurniData("C","poster_momoiro","Momoiro Poster",3500,"Momoiro Soy Paper","",FurniData.TYPE_POSTER,1,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.PAPER_MOMOIRO,true),new FurniData("C","wall8","Shoji Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none"),new FurniData("C","wall9","Sakura Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("C","wall10","Blossom Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("C","floor6","Gray Cobblestone",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,2,"none","none","none"),new FurniData("C","floor7","Pink Planks",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,2,"none","none","none",true),new FurniData("D","furni_cincodemayo_table_small","Sm. Cinco Table",3500,"Waiting","",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("D","furni_cincodemayo_table_medium","Md. Cinco Table",5500,"Waiting","",FurniData.TYPE_FURNI,3,1,2,"none","none","none",true),new FurniData("D","furni_cincodemayo_table_large","Lg. Cinco Table",7500,"Waiting","",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("D","furni_cincodemayo_fence","Cinco Fence",6500,"Waiting","",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("D","furni_cincodemayo_cactus","Cactus",7500,"Waiting","",FurniData.TYPE_FURNI,3,1,3,"none","none","none",true),new FurniData("D","furni_cincodemayo_jukebox","Jukebox",45000,"Waiting","Put on some tunes for your guests.",FurniData.TYPE_FURNI,3,1,6,FurniData.SPECIAL_MUSIC,"jukebox","none",true),new FurniData("D","furni_cincodemayo_gumball_mango","Mango Gum",8500,"Mango Slices + Bubbles","",FurniData.TYPE_FURNI,2,1,2,FurniData.SPECIAL_SCOREBUBBLEGUM,"build",FoodData.DROP_MANGO),new FurniData("D","poster_cincodemayo","Cinco Poster",4500,"Waiting","",FurniData.TYPE_POSTER,3,2,2,"none","none","none"),new FurniData("D","poster_avocado","Avocado Poster",4000,"Avocado","",FurniData.TYPE_POSTER,2,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.FILLING_AVOCADO,true),new FurniData("D","poster_kiwi","Kiwi Poster",4500,"Kiwi Slices + Bubbles","",FurniData.TYPE_POSTER,2,3,2,FurniData.SPECIAL_SCORE,"build",FoodData.DROP_KIWI,true),new FurniData("D","poster_shisorice","Shiso Poster",3500,"Shiso Rice","",FurniData.TYPE_POSTER,2,1,2,FurniData.SPECIAL_SCORE,"build",FoodData.RICE_SHISO,true),new FurniData("D","wall11","Cinco Festival Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("D","wall12","Cinco Stripe Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("D","wall13","Cinco Dot Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none"),new FurniData("D","floor8","Tan Cobblestone",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,2,"none","none","none",true),new FurniData("D","floor9","Colorful Planks",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,2,"none","none","none"),new FurniData("S","furni_luau_table_small","Sm. Luau Table",3500,"Waiting","A small Luau table.",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("S","furni_luau_table_medium","Luau Boombox",6500,"Waiting","Table with a Boombox!",FurniData.TYPE_FURNI,3,1,2,FurniData.SPECIAL_MUSIC,"boombox","none",true),new FurniData("S","furni_luau_table_large","Luau Punch Table",7500,"Waiting","A table with tropical punch.",FurniData.TYPE_FURNI,4,1,3,FurniData.SPECIAL_PUNCH,"none","none",true),new FurniData("S","furni_luau_umbrella","Luau Umbrella",8500,"Waiting","Stay in the shade.",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("S","furni_luau_surfboard","Surfboard",15000,"Waiting","Straight from the Surf Shack!",FurniData.TYPE_FURNI,2,1,3,"none","none","none",true),new FurniData("S","furni_luau_plants","Planter Box",4000,"Waiting","A bit of flowers to spruce up the place.",FurniData.TYPE_FURNI,4,1,2,"none","none","none"),new FurniData("S","furni_luau_gumball_banana","Banana Gum",8500,"Waiting","",FurniData.TYPE_FURNI,2,1,2,FurniData.SPECIAL_BUBBLEGUM),new FurniData("S","poster_summerluau","Luau Poster",4500,"Waiting","",FurniData.TYPE_POSTER,3,2,2,"none","none","none"),new FurniData("S","poster_pinacolada","Coolada Poster",4500,"Piña Colada Tea","",FurniData.TYPE_POSTER,2,3,2,FurniData.SPECIAL_SCORE,"build",FoodData.TEA_PINACOLADA,true),new FurniData("S","poster_tuna","Tuna Poster",4000,"Tuna","",FurniData.TYPE_POSTER,1,3,2,FurniData.SPECIAL_SCORE,"build",FoodData.DROP_TUNA,true),new FurniData("S","poster_huckleberrybubbles","Huckleberry Poster",4500,"Huckleberry Bubbles","",FurniData.TYPE_POSTER,3,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.BUBBLE_HUCKLEBERRY,true),new FurniData("S","wall14","Yellow Lattice",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none"),new FurniData("S","wall15","Sunset Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("S","wall16","Teal Stripe Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("S","floor10","Teal Zigzag Floor",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,2,"none","none","none"),new FurniData("S","floor11","White Sand Floor",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,2,"none","none","none",true),new FurniData("Q","furni_jubilee_table_small","Sm. Starlight Table",3500,"Waiting","A small patriotic table.",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("Q","furni_jubilee_table_medium","Md. Starlight Table",5500,"Waiting","A medium Jubilee table.",FurniData.TYPE_FURNI,3,1,2,"none","none","none",true),new FurniData("Q","furni_jubilee_table_large","Lg. Starlight Table",7500,"Waiting","A large Jubilee table.",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("Q","furni_jubilee_fence","Starry Fence",3000,"Waiting","Show your pride on your fence!",FurniData.TYPE_FURNI,4,1,3,"none","none","none"),new FurniData("Q","furni_jubilee_flag2","Red Flag",2500,"Waiting","Fly the flag of tastiness.",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("Q","furni_jubilee_flag1","Blue Flag",5000,"Waiting","A large Jubilee flag.",FurniData.TYPE_FURNI,2,1,2,"none","none","none",true),new FurniData("Q","furni_jubilee_gumball_powsicle","Powsicle Gum",8500,"Powsicle Tea","",FurniData.TYPE_FURNI,2,1,2,FurniData.SPECIAL_SCOREBUBBLEGUM,"build",FoodData.TEA_POWSICLE),new FurniData("Q","poster_starlightbbq","Starlight Poster",4500,"Waiting","",FurniData.TYPE_POSTER,3,2,2),new FurniData("Q","poster_yellowtail","Yellowtail Poster",4000,"Yellowtail","",FurniData.TYPE_POSTER,1,3,2,FurniData.SPECIAL_SCORE,"build",FoodData.DROP_YELLOWTAIL,true),new FurniData("Q","poster_blueberrytea","Blueberry Poster",5000,"Blueberry Tea","",FurniData.TYPE_POSTER,3,3,3,FurniData.SPECIAL_SCORE,"build",FoodData.TEA_BLUEBERRY,true),new FurniData("Q","poster_lycheebubbles","Lychee Poster",4000,"Lychee Bubbles","",FurniData.TYPE_POSTER,2,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.BUBBLE_LYCHEE,true),new FurniData("Q","wall17","Blue Brick Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none"),new FurniData("Q","wall18","Patriotic Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("Q","wall19","Starstripe Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("Q","floor12","Dark Star Carpet",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,2,"none","none","none",true),new FurniData("Q","floor13","Blue Plaid Floor",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,2,"none","none","none"),new FurniData("B","furni_bavariafest_table_small","Sm. Bavarian Table",3500,"Waiting","A small Comet-Con table.",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("B","furni_bavariafest_table_medium","Md. Bavarian Table",5500,"Waiting","A medium Comet-Con table",FurniData.TYPE_FURNI,3,1,2,"none","none","none",true),new FurniData("B","furni_bavariafest_table_large","Lg. Bavarian Table",7500,"Waiting","A large Comet-Con table.",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("B","furni_bavariafest_chandelier","Chandelier",11000,"Waiting","",FurniData.TYPE_FURNI,3,1,4,"none","none","none",true),new FurniData("B","furni_bavariafest_dunklefizzo","Dunkle Fizzo",7500,"Waiting","",FurniData.TYPE_FURNI,3,1,3,"none","none","none",true),new FurniData("B","furni_bavariafest_pretzels","Pretzels",9500,"Waiting","",FurniData.TYPE_FURNI,3,1,4,"none","none","none",true),new FurniData("B","furni_bavariafest_gumball_blockmalz","Blockmalz Candy",8500,"Waiting","",FurniData.TYPE_FURNI,2,1,2,FurniData.SPECIAL_BUBBLEGUM),new FurniData("B","poster_bavariafest","BavariaFest Poster",4500,"Waiting","",FurniData.TYPE_POSTER,3,2,2),new FurniData("B","poster_chaitea","Tea Time Poster",4500,"Chai Tea","",FurniData.TYPE_POSTER,2,3,2,FurniData.SPECIAL_SCORE,"build",FoodData.TEA_CHAI,true),new FurniData("B","poster_nori","Nori Poster",3500,"Nori","",FurniData.TYPE_POSTER,1,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.PAPER_NORI,true),new FurniData("B","poster_sauerkraut","Kraut Poster",4000,"Sauerkraut","",FurniData.TYPE_POSTER,3,1,2,FurniData.SPECIAL_SCORE,"build",FoodData.SHAKER_SAUERKRAUT,true),new FurniData("B","wall20","Rautenflagge Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("B","wall21","White Crate Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("B","wall22","Forest Green Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none"),new FurniData("B","floor14","Tan Zigzag Floor",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,2,"none","none","none",true),new FurniData("B","floor15","Bavarian Blue Carpet",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,2,"none","none","none"),new FurniData("M","furni_maple_table_small","Sm. Maple Table",3500,"Waiting","",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("M","furni_maple_table_medium","Md. Maple Table",5500,"Waiting","",FurniData.TYPE_FURNI,3,1,2,"none","none","none",true),new FurniData("M","furni_maple_waffletable","Waffle Table",7500,"Waiting","",FurniData.TYPE_FURNI,4,1,4,"none","none","none",true),new FurniData("M","furni_maple_fence","Log Fence",5000,"Waiting","",FurniData.TYPE_FURNI,4,1,3,"none","none","none"),new FurniData("M","furni_maple_log","Lumberjack Log",6000,"Waiting","",FurniData.TYPE_FURNI,3,1,3),new FurniData("M","furni_maple_pinetree","Pine Tree",5500,"Waiting","",FurniData.TYPE_FURNI,3,1,3,"none","none","none",true),new FurniData("M","furni_maple_gumball_chocolate","Chocolate Gum",8500,"Chocolate Tea","",FurniData.TYPE_FURNI,2,1,2,FurniData.SPECIAL_SCOREBUBBLEGUM,"build",FoodData.TEA_CHOCOLATE),new FurniData("M","poster_maplemornings","Mornings Poster",4500,"Waiting","",FurniData.TYPE_POSTER,3,2,2),new FurniData("M","poster_pawpaw","Paw Paw Poster",4500,"Paw Paw Bubbles","",FurniData.TYPE_POSTER,2,3,2,FurniData.SPECIAL_SCORE,"build",FoodData.BUBBLE_PAWPAW,true),new FurniData("M","poster_mochatea","Wake Up Poster",4000,"Mocha Tea","",FurniData.TYPE_POSTER,2,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.TEA_MOCHA,true),new FurniData("M","poster_cinnamonsugar","Combo Poster",4500,"Cinnamon Sugar","",FurniData.TYPE_POSTER,3,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.SHAKER_CINNAMON,true),new FurniData("M","wall23","Log Cabin Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("M","wall24","Wood Grain Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("M","wall25","Flatware Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none"),new FurniData("M","floor16","Wood Planks",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,2,"none","none","none",true),new FurniData("M","floor17","Green Shag Carpet",6000,"Waiting","",FurniData.TYPE_FLOORING,1,1,2,"none","none","none"),new FurniData("H","furni_halloween_table_small","Sm. Halloween Table",3500,"Waiting","A small Halloween table.",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("H","furni_halloween_table_medium","Md. Halloween Table",5500,"Waiting","A medium Ghoul table.",FurniData.TYPE_FURNI,3,1,2,"none","none","none",true),new FurniData("H","furni_halloween_table_large","Lg. Halloween Table",7500,"Waiting","A large Jack O\' Lantern table.",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("H","furni_halloween_belltower_ghost","Belltower Ghost",6000,"Waiting","Boooooo!",FurniData.TYPE_FURNI,2,1,2,"none","none","none",true),new FurniData("H","furni_halloween_spider","Spindly Spider",8500,"Waiting","A fuzzy monster for the shop.",FurniData.TYPE_FURNI,3,1,3,"none","none","none"),new FurniData("H","furni_halloween_bats","Hanging Bats",10000,"Waiting","A swarm of hanging bats.",FurniData.TYPE_FURNI,4,1,4,"none","none","none",true),new FurniData("H","furni_halloween_gumball_licorice","Licorice Gum",8500,"Waiting","A Halloween favorite.",FurniData.TYPE_FURNI,2,1,2,FurniData.SPECIAL_BUBBLEGUM),new FurniData("H","poster_halloween","Halloween Poster",4500,"Waiting","",FurniData.TYPE_POSTER,3,2,2),new FurniData("H","poster_carrotsticks","Veggies Poster",4500,"Carrot Sticks","",FurniData.TYPE_POSTER,2,3,2,FurniData.SPECIAL_SCORE,"build",FoodData.FILLING_CARROTS),new FurniData("H","poster_blackrice","Black Rice Poster",3500,"Black Rice","",FurniData.TYPE_POSTER,2,1,2,FurniData.SPECIAL_SCORE,"build",FoodData.RICE_BLACK,true),new FurniData("H","poster_tarotea","Taro Poster",4000,"Taro Tea","",FurniData.TYPE_POSTER,2,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.TEA_TARO,true),new FurniData("H","wall26","Orange Stripe Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("H","wall27","Purple Plaid Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("H","wall28","Halloween Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none"),new FurniData("H","floor18","Dark Wood Floor",6000,"Waiting","Dark wood flooring for the shop.",FurniData.TYPE_FLOORING,1,1,2,"none","none","none",true),new FurniData("H","floor19","Spooky Tile",6000,"Waiting","Puple and black tile floor.",FurniData.TYPE_FLOORING,1,1,2,"none","none","none"),new FurniData("T","furni_thanksgiving_table_small","Sm. Harvest Table",3500,"Waiting","A small harvest table.",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("T","furni_thanksgiving_table_medium","Md. Harvest Table",5500,"Waiting","A medium harvest table.",FurniData.TYPE_FURNI,3,1,2,"none","none","none",true),new FurniData("T","furni_thanksgiving_table_large","Lg. Harvest Table",7500,"Waiting","A large harvest table.",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("T","furni_thanksgiving_newspapers","Newspaper Stand",8000,"Waiting","Set out some reading material.",FurniData.TYPE_FURNI,3,1,4,FurniData.SPECIAL_NEWSPAPER,"none","none",true),new FurniData("T","furni_thanksgiving_cornstalks","Corn Stalks",7000,"Waiting","A box of corn stalks.",FurniData.TYPE_FURNI,4,1,3,"none","none","none"),new FurniData("T","furni_thanksgiving_tree","Autumn Tree",13000,"Waiting","Bring the trees inside!",FurniData.TYPE_FURNI,4,1,4,"none","none","none",true),new FurniData("T","furni_thanksgiving_gumball_cloudberry","Pumpkin Pie Gum",8500,"Waiting","",FurniData.TYPE_FURNI,2,1,2,FurniData.SPECIAL_BUBBLEGUM),new FurniData("T","poster_thanksgiving","Thanks Poster",4500,"Waiting","",FurniData.TYPE_POSTER,3,2,2),new FurniData("T","poster_ukoniro","Ukoniro Poster",4000,"Ukoniro Soy Paper","",FurniData.TYPE_POSTER,1,3,2,FurniData.SPECIAL_SCORE,"build",FoodData.PAPER_UKONIRO,true),new FurniData("T","poster_butterscotch","Butterscotch Poster",4500,"Butterscotch","",FurniData.TYPE_POSTER,3,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.BUBBLE_BUTTERSCOTCH,true),new FurniData("T","poster_brownrice","Brown Rice Poster",3500,"Brown Rice","",FurniData.TYPE_POSTER,2,1,2,FurniData.SPECIAL_SCORE,"build",FoodData.RICE_BROWN,true),new FurniData("T","wall29","Multigrain Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("T","wall30","Harvest Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("T","wall31","Autumn Leaves Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none"),new FurniData("T","floor20","Multigrain Floor",6000,"Waiting","Multigrain flooring for the shop.",FurniData.TYPE_FLOORING,1,1,2,"none","none","none"),new FurniData("T","floor21","Walnut Floor",6000,"Waiting","A deep walnut wood floor.",FurniData.TYPE_FLOORING,1,1,2,"none","none","none",true),new FurniData("X","furni_christmas_table_small","Sm. Holiday Table",3500,"Waiting","A small Christmas table.",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("X","furni_christmas_table_medium","Festive Phonograph",5500,"Waiting","A Christmas table with a Phonograph.",FurniData.TYPE_FURNI,3,1,2,FurniData.SPECIAL_MUSIC,"phonograph","none",true),new FurniData("X","furni_christmas_table_large","Lg. Holiday Table",7500,"Waiting","A large holiday coffee table.",FurniData.TYPE_FURNI,4,1,3,FurniData.SPECIAL_COFFEE,"none","none",true),new FurniData("X","furni_christmas_tree","Christmas Tree",9500,"Waiting","A festive decorated tree for the shop!",FurniData.TYPE_FURNI,4,1,4,"none","none","none",true),new FurniData("X","furni_christmas_fireplace","Fireplace",12000,"Waiting","Stockings included!",FurniData.TYPE_FURNI,5,1,4,"none","none","none",true),new FurniData("X","furni_christmas_poinsettia","Poinsettia Box",7500,"Waiting","Some winter flowers for the shop.",FurniData.TYPE_FURNI,4,1,2,"none","none","none"),new FurniData("X","furni_christmas_gumball_candycane","Candy Cane Gum",8500,"Peppermint Tea","",FurniData.TYPE_FURNI,2,1,2,FurniData.SPECIAL_SCOREBUBBLEGUM,"build",FoodData.TEA_PEPPERMINT),new FurniData("X","poster_christmas","Wreath Poster",4500,"Waiting","",FurniData.TYPE_POSTER,3,2,2),new FurniData("X","poster_matchatea","Matcha Poster",5000,"Matcha Tea","",FurniData.TYPE_POSTER,3,3,3,FurniData.SPECIAL_SCORE,"build",FoodData.TEA_MATCHA),new FurniData("X","poster_cherrybubbles","Dr Cherry Poster",4000,"Cherry Bubbles","",FurniData.TYPE_POSTER,2,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.BUBBLE_CHERRY,true),new FurniData("X","poster_whiterice","White Rice Poster",3500,"White Rice","",FurniData.TYPE_POSTER,2,1,2,FurniData.SPECIAL_SCORE,"build",FoodData.RICE_WHITE,true),new FurniData("X","wall32","Forest Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("X","wall33","Christmas Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none"),new FurniData("X","wall34","Candy Stripe Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("X","floor22","Red Floor",6000,"Waiting","A red brick floor for the shop.",FurniData.TYPE_FLOORING,1,1,2,"none","none","none",true),new FurniData("X","floor23","Snow Floor",6000,"Waiting","Snow flooring.",FurniData.TYPE_FLOORING,1,1,2,"none","none","none"),new FurniData("N","furni_newyear_table_small","Sm. Rainbow Table",3500,"Waiting","A small rainbow table.",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("N","furni_newyear_table_medium","Md. Rainbow Table",5500,"Waiting","A medium rainbow table.",FurniData.TYPE_FURNI,3,1,2,"none","none","none",true),new FurniData("N","furni_newyear_table_large","Lg. Rainbow Table",7500,"Waiting","A large rainbow table.",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("N","furni_newyear_streetlamp","Stache Lamp",10000,"Waiting","Bring the street inside!",FurniData.TYPE_FURNI,2,1,3,"none","none","none",true),new FurniData("N","furni_newyear_fence","New Year Fence",3000,"Waiting","A rainbow fence for the New Year.",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("N","furni_newyear_comicbooks","Comic Books",15000,"Waiting","Flip through some comics while you wait!",FurniData.TYPE_FURNI,2,1,3,FurniData.SPECIAL_COMICS,"none","none"),new FurniData("N","furni_newyear_gumball_rainblow","Rainblow Gum",8500,"Waiting","",FurniData.TYPE_FURNI,2,1,2,FurniData.SPECIAL_BUBBLEGUM),new FurniData("N","poster_newyear","New Year Poster",4500,"Waiting","",FurniData.TYPE_POSTER,3,2,2),new FurniData("N","poster_flavorx","Flavor X Poster",4500,"Flavor X","",FurniData.TYPE_POSTER,2,3,3,FurniData.SPECIAL_SCORE,"build",FoodData.SAUCE_FLAVORX,true),new FurniData("N","poster_cucumber","Cucumber Poster",4000,"Cucumber Slices + Bubbles","",FurniData.TYPE_POSTER,2,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.FILLING_CUCUMBER,true),new FurniData("N","poster_sugarplumbubbles","Plumazing Poster",4000,"Sugarplum Bubbles","",FurniData.TYPE_POSTER,3,1,2,FurniData.SPECIAL_SCORE,"build",FoodData.BUBBLE_SUGARPLUM,true),new FurniData("N","wall35","Prism Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("N","wall36","Rainbow Stripe Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("N","wall37","Color Swirl Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none"),new FurniData("N","floor24","Lattice Floor",6000,"Waiting","Rainbow lattice flooring for the shop.",FurniData.TYPE_FLOORING,1,1,2,"none","none","none",true),new FurniData("N","floor25","Circle Floor",6000,"Waiting","A colored circle floor.",FurniData.TYPE_FLOORING,1,1,2,"none","none","none"),new FurniData("V","furni_valentine_table_small","Sm. Valentine Table",3500,"Waiting","A small Valentine table.",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("V","furni_valentine_table_medium","Md. Valentine Table",5500,"Waiting","A medium Valentine table",FurniData.TYPE_FURNI,3,1,2,"none","none","none",true),new FurniData("V","furni_valentine_table_large","Lg. Valentine Table",7500,"Waiting","A large Valentine table.",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("V","furni_valentine_balloons","Valentine Balloons",4000,"Waiting","Some balloons for the holiday.",FurniData.TYPE_FURNI,3,1,3,"none","none","none"),new FurniData("V","furni_valentine_heart","Valentine Heart",6500,"Waiting","A large Valentine heart.",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("V","furni_valentine_roses","Vase of Roses",8000,"Waiting","",FurniData.TYPE_FURNI,2,1,3,"none","none","none",true),new FurniData("V","furni_valentine_gumball_strawberry","Strawberry Gum",8500,"Strawberry Tea","Very berry gum!",FurniData.TYPE_FURNI,2,1,2,FurniData.SPECIAL_SCOREBUBBLEGUM,"build",FoodData.TEA_STRAWBERRY),new FurniData("V","poster_valentinesday","Valentine\'s Poster",4500,"Waiting","",FurniData.TYPE_POSTER,3,2,2,"none","none","none"),new FurniData("V","poster_watermelonbubbles","Watermelon Poster",5000,"Watermelon Bubbles","",FurniData.TYPE_POSTER,3,3,3,FurniData.SPECIAL_SCORE,"build",FoodData.BUBBLE_WATERMELON,true),new FurniData("V","poster_wagyu","Steak Poster",4500,"Wagyu","",FurniData.TYPE_POSTER,3,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.DROP_WAGYU,true),new FurniData("V","poster_almondtea","Almond Poster",3500,"Almond Tea","",FurniData.TYPE_POSTER,2,1,2,FurniData.SPECIAL_SCORE,"build",FoodData.TEA_ALMOND,true),new FurniData("V","wall2","Pink Zag Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none"),new FurniData("V","wall3","Valentine Block Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("V","wall4","Heart Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("V","floor2","Pink Carpet",6000,"Waiting","Pink carpeting for the shop.",FurniData.TYPE_FLOORING,1,1,2,"none","none","none",true),new FurniData("V","floor3","White Tile",6000,"Waiting","White tile floor.",FurniData.TYPE_FLOORING,1,1,2,"none","none","none"),new FurniData("L","furni_luckyluckymatsuri_table_small","Sm. Lucky Table",3500,"Waiting","A small Shamrock table.",FurniData.TYPE_FURNI,2,1,1,"none","none","none",true),new FurniData("L","furni_luckyluckymatsuri_table_medium","Md. Lucky Table",5500,"Waiting","A medium Shamrock table",FurniData.TYPE_FURNI,3,1,2,"none","none","none",true),new FurniData("L","furni_luckyluckymatsuri_table_large","Lg. Lucky Table",7500,"Waiting","A large Shamrock table.",FurniData.TYPE_FURNI,4,1,3,"none","none","none",true),new FurniData("L","furni_luckyluckymatsuri_daruma","Daruma",8500,"Waiting","A daruma statue.",FurniData.TYPE_FURNI,3,1,3,"none","none","none",true),new FurniData("L","furni_luckyluckymatsuri_lantern","Large Lantern",9500,"Waiting","A large lucky lantern.",FurniData.TYPE_FURNI,3,1,3,"none","none","none",true),new FurniData("L","furni_luckyluckymatsuri_flag","Lucky Flag",7500,"Waiting","A lucky flag.",FurniData.TYPE_FURNI,2,1,3,"none","none","none"),new FurniData("L","furni_luckyluckymatsuri_gumball_iyokan","Iyokan Gum",8500,"Iyokan Tea","Tart and tangy!",FurniData.TYPE_FURNI,2,1,2,FurniData.SPECIAL_SCOREBUBBLEGUM,"build",FoodData.TEA_IYOKAN),new FurniData("L","poster_luckyluckymatsuri","Lucky Poster",4500,"Waiting","",FurniData.TYPE_POSTER,3,2,2,"none","none","none"),new FurniData("L","poster_tangerinetea","Tangerine Poster",4000,"Tangerine Tea","",FurniData.TYPE_POSTER,2,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.TEA_TANGERINE,true),new FurniData("L","poster_tapiocabubbles","Tapioca Poster",4500,"Tapioca Pearls","",FurniData.TYPE_POSTER,3,2,2,FurniData.SPECIAL_SCORE,"build",FoodData.BUBBLE_TAPIOCA,true),new FurniData("L","poster_salmon","Salmon Poster",4000,"Salmon","",FurniData.TYPE_POSTER,1,3,2,FurniData.SPECIAL_SCORE,"build",FoodData.DROP_SALMON,true),new FurniData("L","wall5","Golden Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none"),new FurniData("L","wall6","Daruma Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("L","wall7","Shoji Screen Wall",6000,"Waiting","",FurniData.TYPE_WALLPAPER,1,1,2,"none","none","none",true),new FurniData("L","floor4","Black Carpet",6000,"Waiting","Green carpeting for the shop.",FurniData.TYPE_FLOORING,1,1,2,"none","none","none",true),new FurniData("L","floor5","Golden Tile",6000,"Waiting","Golden tile floor.",FurniData.TYPE_FLOORING,1,1,2,"none","none","none"),new FurniData("mgb","furni_bronze_arcade_papalouie","Papa Arcade Game",50000,"Waiting","",FurniData.TYPE_FURNI,5,1,12,FurniData.SPECIAL_ARCADE,"none","none",true),new FurniData("mgb","furni_bronze_table_small","Sm. Groov Trunk",3500,"Waiting","",FurniData.TYPE_FURNI,2,1,5,"none","none","none",true),new FurniData("mgb","furni_bronze_table_medium","Md. Groov Trunk",5500,"Waiting","",FurniData.TYPE_FURNI,3,1,6,"none","none","none",true),new FurniData("mgb","furni_bronze_table_large","Lg. Groov Trunk",7500,"Waiting","",FurniData.TYPE_FURNI,4,1,8,"none","none","none",true),new FurniData("mgb","furni_bronze_drums","Drum Set",40000,"Waiting","",FurniData.TYPE_FURNI,5,1,12,"none","none","none"),new FurniData("mgb","furni_bronze_guitar","Electric Guitar",10000,"Waiting","",FurniData.TYPE_FURNI,2,1,8,"none","none","none",true),new FurniData("mgb","furni_bronze_gumball_chaireverb","Chai Reverb Gum",8500,"Waiting","",FurniData.TYPE_FURNI,2,1,6,FurniData.SPECIAL_BUBBLEGUM),new FurniData("mgs","furni_silver_arcade_rico","Rowdy Rico Game",50000,"Waiting","",FurniData.TYPE_FURNI,5,1,12,FurniData.SPECIAL_ARCADE,"none","none",true),new FurniData("mgs","furni_silver_flag","Jolly Roger Flag",5000,"Waiting","",FurniData.TYPE_FURNI,2,1,6,"none","none","none",true),new FurniData("mgs","furni_silver_chainlink","Chain Link Fence",10000,"Waiting","",FurniData.TYPE_FURNI,5,1,6,"none","none","none",true),new FurniData("mgs","furni_silver_cannon","Pirate Cannon",12000,"Waiting","",FurniData.TYPE_FURNI,4,1,8,"none","none","none",true),new FurniData("mgs","furni_silver_tires","Pile of Tires",13000,"Waiting","",FurniData.TYPE_FURNI,5,1,8,"none","none","none",true),new FurniData("mgs","furni_silver_fencewings","Wing Sign",8500,"Waiting","",FurniData.TYPE_FURNI,4,1,6,"none","none","none",true),new FurniData("mgs","furni_silver_gumball_anchovy","Anchovy Gum",8500,"Waiting","",FurniData.TYPE_FURNI,2,1,6,FurniData.SPECIAL_BUBBLEGUM),new FurniData("mgg","furni_gold_arcade_jacksmith","Jacksmith Arcade",50000,"Waiting","",FurniData.TYPE_FURNI,5,1,12,FurniData.SPECIAL_ARCADE,"none","none",true),new FurniData("mgg","furni_gold_popmachine","Pop Machine",20000,"Waiting","",FurniData.TYPE_FURNI,4,1,10,FurniData.SPECIAL_SODA,"none","none",true),new FurniData("mgg","furni_gold_rope","Theater Velvet Rope",8500,"Waiting","",FurniData.TYPE_FURNI,5,1,6,"none","none","none",true),new FurniData("mgg","furni_gold_table_medium","Md. Theater Table",5500,"Waiting","",FurniData.TYPE_FURNI,3,1,6,"none","none","none",true),new FurniData("mgg","furni_gold_table_large","Lg. Theater Table",7500,"Waiting","",FurniData.TYPE_FURNI,4,1,8,"none","none","none",true),new FurniData("mgg","furni_gold_popcorn","Popcorn Cart",12000,"Waiting","",FurniData.TYPE_FURNI,3,1,8,"none","none","none",true),new FurniData("mgg","furni_gold_gumball_drcherry","Dr. Cherry Gum",8500,"Waiting","",FurniData.TYPE_FURNI,2,1,6,FurniData.SPECIAL_BUBBLEGUM,"none","none",true)];
         this.minigamePrizes = [["tint_sunglasses04:K-NG","furni_valentine_balloons","tint_trackjacket:K-M","floor15","furni_newyear_table_small","tint_pants_3:Y-W","tint_luauvisor:K-M","wall5","tint_polo_3:MO-KH","poster_valentinesday","furni_halloween_bats","tint_shoes3:PBB-GR-PB","furni_christmas_fireplace","furni_bronze_arcade_papalouie","furni_silver_flag","furni_gold_rope"],["wall24","tint_buttondown_7:R-K","furni_thanksgiving_tree","tint_sunglasses01:R","poster_newyear","tint_trenchcoat:LW-BZ","floor4","tint_shoes6:O-MO-LO","furni_halloween_table_medium","tint_pants_1:LB","furni_valentine_roses","tint_bucket2:A-LW","furni_luckyluckymatsuri_lantern","furni_bronze_table_medium","furni_silver_chainlink","furni_gold_table_medium"],["tint_polo_5:FG-K-K","furni_cherryblossom_table_medium","poster_whiterice","tint_shoes4:K-DG-GR","wall10","furni_jubilee_flag1","tint_gloves4:K","floor8","tint_pants_6:G-BG","furni_thanksgiving_gumball_cloudberry","tint_pulloverhoodie2:R-K-BG","poster_momoiro","tint_tallknit2:K-M-V","furni_bronze_table_large","furni_silver_cannon","furni_gold_popmachine"],["poster_almondtea","tint_beanie:A","furni_luau_plants","tint_pants_2:A-LM","floor13","tint_sweater_3:W-LMG","furni_newyear_comicbooks","tint_windbreaker_1:PBB-W","furni_cincodemayo_table_small","tint_shoes2:R-GR-W","wall16","tint_backbag2:K-DU","furni_luau_gumball_banana","furni_bronze_drums","furni_silver_tires","furni_gold_table_large"],["floor21","tint_puffyvest:O","poster_thanksgiving","tint_backpack:LW-MO","furni_cherryblossom_bonsai","tint_vneck_bigstripe:R-BG","wall21","tint_pants_5:S-T","furni_luau_umbrella","tint_shoes_wingtips:LW-MO-KH","furni_luau_table_large","tint_bucketcadet:R","furni_halloween_gumball_licorice","furni_bronze_guitar","furni_silver_fencewings","furni_gold_popcorn"],["tint_panel_1:T-S-W","furni_maple_table_small","tint_ballhat:FG-K-K","wall32","tint_pants_6:W-R","furni_bavariafest_pretzels","tint_wintercoat:D-KH-C","floor25","furni_cincodemayo_cactus","tint_shoes_twotonemocs:R-W-LP","poster_blueberrytea","tint_hooligan_2:M-K","furni_cincodemayo_fence","furni_bronze_table_small","furni_silver_gumball_anchovy","furni_gold_arcade_jacksmith"],["tint_tshirt_fruit:V-K","poster_summerluau","furni_maple_fence","tint_shoes8:MG-K-W","wall3","tint_pants_8:K-BG","furni_thanksgiving_table_medium","tint_normaljacket:K-DG","furni_maple_log","floor3","tint_headphones:B-W-PBB","furni_christmas_poinsettia","tint_guestpass:SA-FG-SA","furni_bronze_gumball_chaireverb","furni_silver_arcade_rico","furni_gold_gumball_drcherry"]];
         this.unlockArray = [new UnlockData(0,"topping",FoodData.PAPER_NORI,"Nori"),new UnlockData(5,"topping",FoodData.PAPER_MOMOIRO,"Momoiro Soy Paper"),new UnlockData(14,"topping",FoodData.PAPER_UKONIRO,"Ukoniro Soy Paper"),new UnlockData(6,"toppingfiller",FoodData.PAPER_SHIROI,"Shiroi Soy Paper",7),new UnlockData(11,"toppingfiller",FoodData.PAPER_TORTILLA,"Tortilla",12),new UnlockData(16,"toppingfiller",FoodData.PAPER_MIZUIRO,"Mizuiro Soy Paper",17),new UnlockData(21,"toppingfiller",FoodData.PAPER_DELI,"Deli Soy Paper",22),new UnlockData(26,"toppingfiller",FoodData.PAPER_RAUTENFLAGGE,"Rautenflagge Soy Paper",27),new UnlockData(31,"toppingfiller",FoodData.PAPER_KIIROI,"Kiiroi Soy Paper",32),new UnlockData(36,"toppingfiller",FoodData.PAPER_TARANTULA,"Tarantula Soy Paper",37),new UnlockData(41,"toppingfiller",FoodData.PAPER_CHAIRO,"Chairo Soy Paper",42),new UnlockData(46,"toppingfiller",FoodData.PAPER_ELF,"Elf Soy Paper",47),new UnlockData(51,"toppingfiller",FoodData.PAPER_RAINBOW,"Rainbow Soy Paper",52),new UnlockData(56,"toppingfiller",FoodData.PAPER_AKAI,"Akai Soy Paper",57),new UnlockData(61,"toppingfiller",FoodData.PAPER_LUCKY,"Lucky Soy Paper",62),new UnlockData(0,"topping",FoodData.RICE_WHITE,"White Rice"),new UnlockData(0,"topping",FoodData.RICE_BROWN,"Brown Rice"),new UnlockData(36,"topping",FoodData.RICE_SHISO,"Shiso Rice"),new UnlockData(51,"topping",FoodData.RICE_BLACK,"Black Rice"),new UnlockData(0,"topping",FoodData.FILLING_TUNA,"Tuna"),new UnlockData(0,"topping",FoodData.FILLING_SALMON,"Salmon"),new UnlockData(0,"topping",FoodData.FILLING_AVOCADO,"Avocado"),new UnlockData(0,"topping",FoodData.FILLING_SNOWPEAS,"Snow Peas"),new UnlockData(0,"topping",FoodData.FILLING_CUCUMBER,"Cucumber Slices"),new UnlockData(0,"topping",FoodData.FILLING_CARROTS,"Carrots"),new UnlockData(0,"topping",FoodData.FILLING_CRABSTICK,"Crab Stick"),new UnlockData(0,"topping",FoodData.FILLING_CREAMCHEESE,"Cream Cheese"),new UnlockData(1,"topping",FoodData.FILLING_LOBSTER,"Lobster"),new UnlockData(4,"topping",FoodData.FILLING_TOFU,"Tofu"),new UnlockData(6,"topping",FoodData.FILLING_UNAGI,"Unagi"),new UnlockData(11,"topping",FoodData.FILLING_JALAPENO,"Jalapeños"),new UnlockData(15,"topping",FoodData.FILLING_GREENONIONS,"Green Onions"),new UnlockData(24,"topping",FoodData.FILLING_WAGYU,"Wagyu"),new UnlockData(26,"topping",FoodData.FILLING_SHIITAKE,"Shiitake Mushrooms"),new UnlockData(30,"topping",FoodData.FILLING_SHRIMP,"Shrimp Tempura"),new UnlockData(31,"topping",FoodData.FILLING_TAMAGO,"Tamago"),new UnlockData(39,"topping",FoodData.FILLING_OCTOPUS,"Octopus"),new UnlockData(41,"topping",FoodData.FILLING_YELLOWTAIL,"Yellowtail"),new UnlockData(45,"topping",FoodData.FILLING_RADISHSPROUTS,"Radish Sprouts"),new UnlockData(49,"topping",FoodData.FILLING_ASAPARAGUS,"Asparagus"),new UnlockData(64,"topping",FoodData.FILLING_CALAMARI,"Fried Calamari"),new UnlockData(0,"topping",FoodData.DROP_MANGO,"Mango Slices"),new UnlockData(0,"topping",FoodData.DROP_PRAWN,"Prawn"),new UnlockData(0,"topping",FoodData.DROP_SABA,"Saba"),new UnlockData(19,"topping",FoodData.DROP_KIWI,"Kiwi Slices"),new UnlockData(54,"topping",FoodData.DROP_SAYORI,"Sayori"),new UnlockData(6,"topping",FoodData.DROP_NARUTOMAKI,"Narutomaki"),new UnlockData(11,"topping",FoodData.DROP_CHORIZO,"Chorizo"),new UnlockData(16,"topping",FoodData.DROP_PINEAPPLE,"Pineapple"),new UnlockData(21,"topping",FoodData.DROP_BRISKET,"Beef Brisket"),new UnlockData(26,"topping",FoodData.DROP_BREZN,"Brezn"),new UnlockData(31,"topping",FoodData.DROP_BACON,"Bacon"),new UnlockData(36,"topping",FoodData.DROP_UNI,"Uni"),new UnlockData(41,"topping",FoodData.DROP_SWEETPOTATOES,"Sweet Potatoes"),new UnlockData(46,"topping",FoodData.DROP_TAI,"Tai"),new UnlockData(51,"topping",FoodData.DROP_RAINBOWYOKAN,"Rainbow Yokan"),new UnlockData(56,"topping",FoodData.DROP_STRAWBERRY,"Strawberry Slices"),new UnlockData(61,"topping",FoodData.DROP_DATEMAKI,"Datemaki"),new UnlockData(7,"toppingfiller",FoodData.FILLING_KAMPACHI,"Kampachi",8),new UnlockData(12,"toppingfiller",FoodData.FILLING_CHIPOTLECHEDDAR,"Chipotle Cheddar",13),new UnlockData(17,"toppingfiller",FoodData.FILLING_CANNEDHAM,"Canned Ham",18),new UnlockData(22,"toppingfiller",FoodData.FILLING_ONIONSTRINGS,"Fried Onion Strings",23),new UnlockData(27,"toppingfiller",FoodData.FILLING_BRATWURST,"Bratwurst",28),new UnlockData(32,"toppingfiller",FoodData.FILLING_HASHBROWN,"Hashbrown Patties",33),new UnlockData(37,"toppingfiller",FoodData.FILLING_TORIGAI,"Torigai",38),new UnlockData(42,"toppingfiller",FoodData.FILLING_TURKEY,"Roasted Turkey",43),new UnlockData(47,"toppingfiller",FoodData.FILLING_SPRUCETIPS,"Spruce Tips",48),new UnlockData(52,"toppingfiller",FoodData.FILLING_EGGPLANT,"Eggplant",53),new UnlockData(57,"toppingfiller",FoodData.FILLING_HOKKIGAI,"Hokkigai",58),new UnlockData(62,"toppingfiller",FoodData.FILLING_KANPYO,"Kanpyo",63),new UnlockData(0,"topping",FoodData.SHAKER_TOBIKO,"Tobiko"),new UnlockData(0,"topping",FoodData.SHAKER_SESAMESEEDS,"Sesame Seeds"),new UnlockData(0,"topping",FoodData.SHAKER_BONITOFLAKES,"Bonito Flakes"),new UnlockData(20,"topping",FoodData.SHAKER_TEMPURACRUNCH,"Tempura Crunch"),new UnlockData(46,"topping",FoodData.SHAKER_FURIKAKE,"Furikake"),new UnlockData(8,"toppingfiller",FoodData.SHAKER_WAKAME,"Wakame",9),new UnlockData(13,"toppingfiller",FoodData.SHAKER_RECADOROJO,"Recado Rojo",14),new UnlockData(18,"toppingfiller",FoodData.SHAKER_LEMONHERB,"Lemon Herb",19),new UnlockData(23,"toppingfiller",FoodData.SHAKER_BBQRUB,"BBQ Rub",24),new UnlockData(28,"toppingfiller",FoodData.SHAKER_SAUERKRAUT,"Sauerkraut",29),new UnlockData(33,"toppingfiller",FoodData.SHAKER_CINNAMON,"Cinnamon Sugar",34),new UnlockData(38,"toppingfiller",FoodData.SHAKER_IKURA,"Ikura",39),new UnlockData(43,"toppingfiller",FoodData.SHAKER_PUMPKINSEEDS,"Roasted Pumpkin Seeds",44),new UnlockData(48,"toppingfiller",FoodData.SHAKER_YULEMASAGO,"Merry Masago",49),new UnlockData(53,"toppingfiller",FoodData.SHAKER_RAINBOW,"Rainbow Peppercorns",54),new UnlockData(58,"toppingfiller",FoodData.SHAKER_POMEGRANATE,"Pomegranate",59),new UnlockData(63,"toppingfiller",FoodData.SHAKER_LUCKYDUST,"Lucky Dust",64),new UnlockData(0,"topping",FoodData.SAUCE_DUCK,"Duck Sauce"),new UnlockData(0,"topping",FoodData.SAUCE_WASABIMAYO,"Wasabi Mayo"),new UnlockData(0,"topping",FoodData.SAUCE_TERIYAKI,"Teriyaki Sauce"),new UnlockData(0,"topping",FoodData.SAUCE_GENERALTSO,"General Tso Sauce"),new UnlockData(0,"topping",FoodData.SAUCE_GINGERMISO,"Ginger Miso Sauce"),new UnlockData(2,"topping",FoodData.SAUCE_YUMYUM,"Yum Yum Sauce"),new UnlockData(10,"topping",FoodData.SAUCE_YUZAKOSHO,"Yuzu Kosho"),new UnlockData(21,"topping",FoodData.SAUCE_TONKATSU,"Tonkatsu Sauce"),new UnlockData(29,"topping",FoodData.SAUCE_HIBACHI,"Hibachi Sauce"),new UnlockData(35,"topping",FoodData.SAUCE_SRIRACHA,"Sriracha"),new UnlockData(50,"topping",FoodData.SAUCE_PONZU,"Ponzu"),new UnlockData(7,"topping",FoodData.SAUCE_SWEETSAKURA,"Sweet Sakura Sauce"),new UnlockData(12,"topping",FoodData.SAUCE_NACHOCHEESE,"Nacho Cheese"),new UnlockData(17,"topping",FoodData.SAUCE_CALYPSO,"Calypso Sauce"),new UnlockData(22,"topping",FoodData.SAUCE_LONESTARPIT,"Lone Star Pit Sauce"),new UnlockData(27,"topping",FoodData.SAUCE_MUSTARD,"Marzen Mustard"),new UnlockData(32,"topping",FoodData.SAUCE_MAPLE,"Maple Syrup"),new UnlockData(37,"topping",FoodData.SAUCE_SQUID,"Squid Sauce"),new UnlockData(42,"topping",FoodData.SAUCE_GRAVY,"Gravy"),new UnlockData(47,"topping",FoodData.SAUCE_CRANBERRY,"Cranberry Sauce"),new UnlockData(52,"topping",FoodData.SAUCE_FLAVORX,"Flavor X Sauce"),new UnlockData(57,"topping",FoodData.SAUCE_AZUKI,"Azuki Sauce"),new UnlockData(62,"topping",FoodData.SAUCE_KURIKINTON,"Kuri Kinton"),new UnlockData(0,"topping",FoodData.TEA_ALMOND,"Almond Tea"),new UnlockData(0,"topping",FoodData.TEA_CHAI,"Chai Tea"),new UnlockData(0,"topping",FoodData.TEA_MOCHA,"Mocha Tea"),new UnlockData(0,"topping",FoodData.TEA_STRAWBERRY,"Strawberry Tea"),new UnlockData(0,"topping",FoodData.TEA_MATCHA,"Matcha Tea"),new UnlockData(3,"topping",FoodData.TEA_BLUEBERRY,"Blueberry Tea"),new UnlockData(16,"topping",FoodData.TEA_PINACOLADA,"Piña Colada Tea"),new UnlockData(34,"topping",FoodData.TEA_TANGERINE,"Tangerine Tea"),new UnlockData(40,"topping",FoodData.TEA_TARO,"Taro Tea"),new UnlockData(56,"topping",FoodData.TEA_HONEYDEW,"Honeydew Tea"),new UnlockData(59,"topping",FoodData.TEA_CHOCOLATE,"Chocolate Tea"),new UnlockData(8,"topping",FoodData.TEA_HAKUTO,"Hakuto Tea"),new UnlockData(13,"topping",FoodData.TEA_HORCHATA,"Horchata Tea"),new UnlockData(18,"topping",FoodData.TEA_LUAUPUNCH,"Luau Punch Tea"),new UnlockData(23,"topping",FoodData.TEA_POWSICLE,"Powsicle Tea"),new UnlockData(28,"topping",FoodData.TEA_BLACKFOREST,"Black Forest Tea"),new UnlockData(33,"topping",FoodData.TEA_BREAKFAST,"English Breakfast Tea"),new UnlockData(38,"topping",FoodData.TEA_WITCHSBREW,"Witch\'s Brew Tea"),new UnlockData(43,"topping",FoodData.TEA_PUMPKINSPICE,"Pumpkin Spice Tea"),new UnlockData(48,"topping",FoodData.TEA_PEPPERMINT,"Peppermint Tea"),new UnlockData(53,"topping",FoodData.TEA_TUTTIFRUTTI,"Tutti Frutti Tea"),new UnlockData(58,"topping",FoodData.TEA_RASPBERRY,"Raspberry Tea"),new UnlockData(63,"topping",FoodData.TEA_IYOKAN,"Iyokan Tea"),new UnlockData(0,"topping",FoodData.BUBBLE_TAPIOCA,"Tapioca Pearls"),new UnlockData(0,"topping",FoodData.BUBBLE_LYCHEE,"Lychee Bubbles"),new UnlockData(0,"topping",FoodData.BUBBLE_BUTTERSCOTCH,"Butterscotch Bubbles"),new UnlockData(0,"topping",FoodData.BUBBLE_MANGO,"Mango Bubbles"),new UnlockData(0,"topping",FoodData.BUBBLE_CUCUMBER,"Cucumber Bubbles"),new UnlockData(9,"topping",FoodData.BUBBLE_WATERMELON,"Watermelon Bubbles"),new UnlockData(25,"topping",FoodData.BUBBLE_CHERRY,"Cherry Bubbles"),new UnlockData(44,"topping",FoodData.BUBBLE_PAWPAW,"Pawpaw Bubbles"),new UnlockData(55,"topping",FoodData.BUBBLE_SUGARPLUM,"Sugarplum Bubbles"),new UnlockData(60,"topping",FoodData.BUBBLE_COTTONCANDY,"Cotton Candy Bubbles"),new UnlockData(61,"topping",FoodData.BUBBLE_KIWI,"Kiwi Bubbles"),new UnlockData(65,"topping",FoodData.BUBBLE_HUCKLEBERRY,"Huckleberry Bubbles"),new UnlockData(0,"topping",FoodData.SUSHI_VINEGAR,"Sushi Vinegar"),new UnlockData(0,"customer","Jojo"),new UnlockData(0,"customer","Emmlette"),new UnlockData(0,"customer","Whiff"),new UnlockData(0,"customer","Akari"),new UnlockData(0,"customer","Deano"),new UnlockData(0,"customer","Quinn"),new UnlockData(0,"customer","Xolo"),new UnlockData(0,"customer","Chuck"),new UnlockData(0,"customer","Wally"),new UnlockData(0,"customer","Hacky Zak"),new UnlockData(0,"customer","Lisa"),new UnlockData(0,"customer","Yui"),new UnlockData(0,"customer","Bruna Romano"),new UnlockData(0,"filler","Elle"),new UnlockData(0,"filler","Kingsley"),new UnlockData(0,"filler","Rhonda"),new UnlockData(0,"filler","Connor"),new UnlockData(0,"filler","Vicky"),new UnlockData(0,"filler","Perri"),new UnlockData(0,"filler","Chester"),new UnlockData(0,"filler","Rudy"),new UnlockData(0,"filler","Janana"),new UnlockData(0,"filler","Olga"),new UnlockData(0,"filler","Gino Romano"),new UnlockData(0,"filler","Shannon"),new UnlockData(0,"filler","Brody"),new UnlockData(0,"filler","Duke Gotcha"),new UnlockData(36,"filler","Vincent"),new UnlockData(36,"filler","Hope"),new UnlockData(36,"filler","Iggy"),new UnlockData(36,"filler","Bertha"),new UnlockData(36,"filler","Steven"),new UnlockData(36,"filler","Tony"),new UnlockData(36,"filler","Allan"),new UnlockData(36,"filler","Mary"),new UnlockData(36,"filler","Foodini"),new UnlockData(36,"filler","Sue"),new UnlockData(36,"filler","Clair"),new UnlockData(36,"filler","Carlo Romano"),new UnlockData(36,"filler","Skyler"),new UnlockData(36,"filler","Peggy"),new UnlockData(1,"customer","Gremmie"),new UnlockData(2,"customer","Hugo"),new UnlockData(3,"customer","Zoe"),new UnlockData(4,"customer","Olivia"),new UnlockData(5,"customer","Joy"),new UnlockData(6,"customer","Tohru"),new UnlockData(7,"customer","Mandi"),new UnlockData(8,"customer","Austin"),new UnlockData(9,"customer","Kayla"),new UnlockData(10,"customer","Koilee"),new UnlockData(11,"customer","Maggie"),new UnlockData(12,"customer","Sasha"),new UnlockData(13,"customer","Kenji"),new UnlockData(14,"customer","Franco"),new UnlockData(15,"customer","Cletus"),new UnlockData(16,"customer","Utah"),new UnlockData(17,"customer","Alberto"),new UnlockData(18,"customer","Nevada"),new UnlockData(19,"customer","Robby"),new UnlockData(20,"customer","Kahuna"),new UnlockData(21,"customer","Marty"),new UnlockData(22,"customer","Rico"),new UnlockData(23,"customer","Boomer"),new UnlockData(24,"customer","Ember"),new UnlockData(25,"customer","Scooter"),new UnlockData(26,"customer","Prudence"),new UnlockData(27,"customer","Penny"),new UnlockData(28,"customer","Cecilia"),new UnlockData(29,"customer","Timm"),new UnlockData(30,"customer","Nick"),new UnlockData(31,"customer","Johnny"),new UnlockData(32,"customer","Hank"),new UnlockData(33,"customer","Cooper"),new UnlockData(34,"customer","Trishna"),new UnlockData(35,"customer","James"),new UnlockData(36,"customer","Willow"),new UnlockData(37,"customer","Wendy"),new UnlockData(38,"customer","Professor Fitz"),new UnlockData(39,"customer","Georgito"),new UnlockData(40,"customer","Sarge Fan"),new UnlockData(41,"customer","Sienna"),new UnlockData(42,"customer","Taylor"),new UnlockData(43,"customer","Pinch Hitwell"),new UnlockData(44,"customer","Edna"),new UnlockData(45,"customer","Radlynn"),new UnlockData(46,"customer","Santa"),new UnlockData(47,"customer","Cherissa"),new UnlockData(48,"customer","Rita"),new UnlockData(49,"customer","Julep"),new UnlockData(50,"customer","Mitch"),new UnlockData(51,"customer","Xandra"),new UnlockData(52,"customer","Ivy"),new UnlockData(53,"customer","Big Pauly"),new UnlockData(54,"customer","Little Edoardo"),new UnlockData(55,"customer","Wylan B"),new UnlockData(56,"customer","Scarlett"),new UnlockData(57,"customer","Greg"),new UnlockData(58,"customer","Roy"),new UnlockData(59,"customer","Yippy"),new UnlockData(60,"customer","Mindy"),new UnlockData(61,"customer","Crystal"),new UnlockData(62,"customer","Mayor Mallow"),new UnlockData(63,"customer","Doan"),new UnlockData(64,"customer","Captain Cori"),new UnlockData(65,"customer","Papa Louie")];
         this.specials = [new SpecialItem(0,"California Roll","californiaroll","tips",1.5,1,[FoodData.PAPER_NORI,FoodData.RICE_WHITE,true,[FoodData.FILLING_AVOCADO,true],[FoodData.FILLING_CRABSTICK,true],[FoodData.FILLING_CUCUMBER,true],FoodData.SHAKER_SESAMESEEDS],[FoodData.FILLING_AVOCADO,FoodData.FILLING_CRABSTICK],"hat12",true),new SpecialItem(1,"Orange Roll","orangeroll","points",140,1,[FoodData.PAPER_NORI,FoodData.RICE_BROWN,true,[FoodData.FILLING_LOBSTER,true],[FoodData.FILLING_CARROTS,true],FoodData.DROP_PRAWN,FoodData.SAUCE_DUCK],[FoodData.SAUCE_DUCK,FoodData.DROP_PRAWN,FoodData.FILLING_CARROTS],"tint_vneck_ring:MG-FG",true),new SpecialItem(2,"Philly Roll","phillyroll","tickets",2,2,[FoodData.PAPER_NORI,FoodData.RICE_WHITE,true,[FoodData.FILLING_SALMON,true],[FoodData.FILLING_CREAMCHEESE,true],[FoodData.FILLING_AVOCADO,true],FoodData.SAUCE_YUMYUM],[FoodData.FILLING_SALMON,FoodData.FILLING_CREAMCHEESE],"tint_fedora:K-SA",true),new SpecialItem(3,"Momo Mango","momomango","points",150,5,[FoodData.PAPER_MOMOIRO,FoodData.RICE_WHITE,false,[FoodData.FILLING_CARROTS,true],[FoodData.FILLING_CREAMCHEESE,true],FoodData.DROP_MANGO,FoodData.SAUCE_GINGERMISO],[FoodData.PAPER_MOMOIRO,FoodData.DROP_MANGO],"hat16",true),new SpecialItem(4,"Unagi Maki","unagimaki","tips",2,6,[FoodData.PAPER_NORI,FoodData.RICE_BROWN,false,[FoodData.FILLING_UNAGI,true],[FoodData.FILLING_SNOWPEAS,true],FoodData.SHAKER_BONITOFLAKES],[FoodData.FILLING_UNAGI],"tint_pants_3:MG-LMG",true),new SpecialItem(5,"Grumpy Eel","crabbyunagi","tickets",1,6,[FoodData.PAPER_NORI,FoodData.RICE_WHITE,true,[FoodData.FILLING_UNAGI,true],[FoodData.FILLING_CRABSTICK,true],FoodData.SAUCE_TERIYAKI],[FoodData.FILLING_CRABSTICK,FoodData.FILLING_UNAGI,FoodData.SAUCE_TERIYAKI],"tint_paddyjacket:G-W-K-LG",true),new SpecialItem(6,"Lava Lobster","hotlobster","points",155,11,[FoodData.PAPER_NORI,FoodData.RICE_WHITE,false,[FoodData.FILLING_JALAPENO,true],[FoodData.FILLING_LOBSTER,true],FoodData.SAUCE_YUZAKOSHO],[FoodData.FILLING_JALAPENO,FoodData.FILLING_LOBSTER],"tint_tank_flames:K-S-0-S",true),new SpecialItem(7,"Flying Tofu","tofutobiko","stars",1,15,[FoodData.PAPER_MOMOIRO,FoodData.RICE_BROWN,true,[FoodData.FILLING_GREENONIONS,true],[FoodData.FILLING_TOFU,true],FoodData.SHAKER_TOBIKO],[FoodData.FILLING_TOFU,FoodData.SHAKER_TOBIKO],"tint_belt_6:LB-W-C",true),new SpecialItem(8,"Yummy Onion","yummyonion","tips",2.5,15,[FoodData.PAPER_MOMOIRO,FoodData.RICE_WHITE,true,[FoodData.FILLING_TUNA,true],[FoodData.FILLING_GREENONIONS,true],FoodData.SAUCE_YUMYUM],[FoodData.SAUCE_YUMYUM,FoodData.FILLING_GREENONIONS],"tint_polo_2:LB-W",true),new SpecialItem(9,"Kiwi Kosho","kiwikosho","points",160,19,[FoodData.PAPER_UKONIRO,FoodData.RICE_BROWN,true,[FoodData.FILLING_SNOWPEAS,true],[FoodData.FILLING_TOFU,true],FoodData.DROP_KIWI,FoodData.SAUCE_YUZAKOSHO],[FoodData.SAUCE_YUZAKOSHO,FoodData.DROP_KIWI],"body_bronzeaward",true),new SpecialItem(10,"Crunchy Crab","crunchycrab","stars",1,20,[FoodData.PAPER_UKONIRO,FoodData.RICE_WHITE,true,[FoodData.FILLING_CRABSTICK,true],[FoodData.FILLING_CUCUMBER,true],FoodData.SHAKER_TEMPURACRUNCH],[FoodData.FILLING_CRABSTICK,FoodData.SHAKER_TEMPURACRUNCH],"tint_polo_3:FG-K",true),new SpecialItem(11,"Tofu BBQ","tofutonkatsu","tips",2,21,[FoodData.PAPER_NORI,FoodData.RICE_BROWN,false,[FoodData.FILLING_TOFU,true],[FoodData.FILLING_SALMON,true],FoodData.SAUCE_TONKATSU],[FoodData.FILLING_TOFU,FoodData.SAUCE_TONKATSU],"helmet02",true),new SpecialItem(12,"Surf and Turf","surfandturf","points",160,24,[FoodData.PAPER_UKONIRO,FoodData.RICE_WHITE,true,[FoodData.FILLING_LOBSTER,true],[FoodData.FILLING_WAGYU,true],FoodData.SAUCE_GENERALTSO],[FoodData.FILLING_LOBSTER,FoodData.FILLING_WAGYU],"tint_shortthermal:DU",true),new SpecialItem(13,"Wasabi Wagyu","wasabiwagyu","stars",1,24,[FoodData.PAPER_NORI,FoodData.RICE_BROWN,true,[FoodData.FILLING_SNOWPEAS,true],[FoodData.FILLING_WAGYU,true],FoodData.SAUCE_WASABIMAYO],[FoodData.SAUCE_WASABIMAYO,FoodData.FILLING_WAGYU],"tint_pants_9:K-V",true),new SpecialItem(14,"Smothered Beef","smotheredbeef","tickets",2,26,[FoodData.PAPER_NORI,FoodData.RICE_BROWN,false,[FoodData.FILLING_WAGYU,true],[FoodData.FILLING_SHIITAKE,true],FoodData.DROP_WAGYU,FoodData.SHAKER_TOBIKO],[FoodData.FILLING_WAGYU,FoodData.FILLING_SHIITAKE],"tint_knapsack:M-K",true),new SpecialItem(15,"Ginger Shrimp","gingershrimp","points",155,30,[FoodData.PAPER_UKONIRO,FoodData.RICE_BROWN,false,[FoodData.FILLING_TOFU,true],[FoodData.FILLING_SHRIMP,true],FoodData.SAUCE_GINGERMISO],[FoodData.SAUCE_GINGERMISO,FoodData.FILLING_SHRIMP],"tint_buttondown_4:DG-K-K",true),new SpecialItem(16,"Tempura Teriyaki","tempurateriyaki","stars",1,30,[FoodData.PAPER_UKONIRO,FoodData.RICE_BROWN,false,[FoodData.FILLING_SHRIMP,true],[FoodData.FILLING_SNOWPEAS,true],FoodData.SAUCE_TERIYAKI],[FoodData.SAUCE_TERIYAKI,FoodData.FILLING_SHRIMP],"tint_hockey_2:B-K-W",true),new SpecialItem(17,"Roly Mackerel","tunatamago","tips",2,31,[FoodData.PAPER_NORI,FoodData.RICE_BROWN,true,[FoodData.FILLING_TAMAGO,true],[FoodData.FILLING_TUNA,true],FoodData.SAUCE_GENERALTSO],[FoodData.FILLING_TUNA,FoodData.FILLING_TAMAGO],"tint_leatherjacket:M",true),new SpecialItem(18,"Sunrise Roll","sunriseroll","tickets",1,31,[FoodData.PAPER_UKONIRO,FoodData.RICE_WHITE,false,[FoodData.FILLING_TAMAGO,true],[FoodData.FILLING_UNAGI,true],FoodData.DROP_SABA,FoodData.SAUCE_TONKATSU],[FoodData.FILLING_TAMAGO,FoodData.PAPER_UKONIRO],"tint_belt_3:K-S-C",true),new SpecialItem(19,"Steak and Eggs","steakandeggs","points",170,36,[FoodData.PAPER_MOMOIRO,FoodData.RICE_SHISO,true,[FoodData.FILLING_WAGYU,true],[FoodData.FILLING_TAMAGO,true],FoodData.SAUCE_SRIRACHA],[FoodData.FILLING_WAGYU,FoodData.FILLING_TAMAGO],"helmet03",true),new SpecialItem(20,"Salmon Sampler","salmonsampler","tips",2,36,[FoodData.PAPER_MOMOIRO,FoodData.RICE_SHISO,false,[FoodData.FILLING_SALMON,true],[FoodData.FILLING_SHIITAKE,true],FoodData.DROP_SALMON,FoodData.SAUCE_WASABIMAYO],[FoodData.FILLING_SALMON],"tint_pants_4:O-BG",true),new SpecialItem(21,"Caterpillar Roll","caterpillarroll","stars",1,36,[FoodData.PAPER_NORI,FoodData.RICE_SHISO,true,[FoodData.FILLING_CUCUMBER,true],[FoodData.FILLING_UNAGI,true],FoodData.DROP_AVOCADO,FoodData.SHAKER_SESAMESEEDS],[FoodData.FILLING_CUCUMBER,FoodData.DROP_AVOCADO],"tint_camppack:FG-K-DG",true),new SpecialItem(22,"Sesame Cephalopod","sesamecephalopod","tickets",1,39,[FoodData.PAPER_UKONIRO,FoodData.RICE_SHISO,false,[FoodData.FILLING_CARROTS,true],[FoodData.FILLING_OCTOPUS,true],FoodData.SHAKER_SESAMESEEDS],[FoodData.SHAKER_SESAMESEEDS,FoodData.FILLING_OCTOPUS],"hat07",true),new SpecialItem(23,"Yum Yum Yellowtail","yumyumyellowtail","tips",2.3,41,[FoodData.PAPER_MOMOIRO,FoodData.RICE_SHISO,false,[FoodData.FILLING_YELLOWTAIL,true],[FoodData.FILLING_CREAMCHEESE,true],FoodData.SAUCE_YUMYUM],[FoodData.FILLING_YELLOWTAIL,FoodData.SAUCE_YUMYUM],"tint_hanten:V-K-K",true),new SpecialItem(24,"Radley Roll","radleyroll","points",180,45,[FoodData.PAPER_UKONIRO,FoodData.RICE_SHISO,false,[FoodData.FILLING_RADISHSPROUTS,true],[FoodData.FILLING_TUNA,true],FoodData.SHAKER_TOBIKO],[FoodData.FILLING_RADISHSPROUTS],"hat26",true),new SpecialItem(25,"Tako Maki","takomaki","tips",2,45,[FoodData.PAPER_UKONIRO,FoodData.RICE_SHISO,true,[FoodData.FILLING_OCTOPUS,true],[FoodData.FILLING_RADISHSPROUTS,true],FoodData.SHAKER_BONITOFLAKES],[FoodData.FILLING_OCTOPUS],"tint_wristband:Y",true),new SpecialItem(26,"Shrimpy Sprout","shrimpandsprouts","stars",1,45,[FoodData.PAPER_MOMOIRO,FoodData.RICE_WHITE,false,[FoodData.FILLING_RADISHSPROUTS,true],[FoodData.FILLING_SHRIMP,true],FoodData.SAUCE_YUZAKOSHO],[FoodData.FILLING_SHRIMP,FoodData.FILLING_RADISHSPROUTS],"tint_buttondown_8:LB-DU-DU",true),new SpecialItem(27,"Negi Hamachi","negihamachi","tips",2,46,[FoodData.PAPER_NORI,FoodData.RICE_WHITE,false,[FoodData.FILLING_YELLOWTAIL,true],[FoodData.FILLING_GREENONIONS,true],FoodData.DROP_YELLOWTAIL,FoodData.SHAKER_FURIKAKE],[FoodData.DROP_YELLOWTAIL,FoodData.FILLING_GREENONIONS],"easter_hat_1",true),new SpecialItem(28,"Searing Salmon","searingsalmon","points",190,46,[FoodData.PAPER_UKONIRO,FoodData.RICE_SHISO,true,[FoodData.FILLING_JALAPENO,true],[FoodData.FILLING_SALMON,true],FoodData.SHAKER_FURIKAKE],[FoodData.FILLING_SALMON,FoodData.FILLING_JALAPENO],"tint_buttondown_dots:M-P-W",true),new SpecialItem(29,"Kiwi Daikon","kiwidaikon","tickets",2,49,[FoodData.PAPER_MOMOIRO,FoodData.RICE_BROWN,true,[FoodData.FILLING_ASAPARAGUS,true],[FoodData.FILLING_RADISHSPROUTS,true],FoodData.DROP_KIWI,FoodData.SAUCE_HIBACHI],[FoodData.DROP_KIWI,FoodData.FILLING_RADISHSPROUTS],"body_silveraward",true),new SpecialItem(30,"Tuna Tuna Tempura","tunatunatempura","points",185,49,[FoodData.PAPER_NORI,FoodData.RICE_WHITE,false,[FoodData.FILLING_TUNA,true],[FoodData.FILLING_ASAPARAGUS,true],FoodData.DROP_TUNA,FoodData.SHAKER_TEMPURACRUNCH],[FoodData.SHAKER_TEMPURACRUNCH,FoodData.FILLING_TUNA],"tint_flaredshirt_3:T-B",true),new SpecialItem(31,"Crazy Crustacean","crazycrustacean","tips",2.1,50,[FoodData.PAPER_NORI,FoodData.RICE_SHISO,true,[FoodData.FILLING_CRABSTICK,true],[FoodData.FILLING_LOBSTER,true],FoodData.SAUCE_PONZU],[FoodData.FILLING_LOBSTER,FoodData.FILLING_CRABSTICK],"tint_patternbeanie:V-M-P",true),new SpecialItem(32,"Crunchy Roll","crunchyroll","stars",1,51,[FoodData.PAPER_NORI,FoodData.RICE_BLACK,false,[FoodData.FILLING_SHRIMP,true],[FoodData.FILLING_YELLOWTAIL,true],FoodData.SHAKER_TEMPURACRUNCH],[FoodData.SHAKER_TEMPURACRUNCH],"tint_furcoat:DB-KH",true),new SpecialItem(33,"Sesame Shrooms","sesameshrooms","points",190,51,[FoodData.PAPER_MOMOIRO,FoodData.RICE_BLACK,false,[FoodData.FILLING_SHIITAKE,true],[FoodData.FILLING_TUNA,true],FoodData.SHAKER_SESAMESEEDS],[FoodData.SHAKER_SESAMESEEDS,FoodData.FILLING_SHIITAKE],"hat20",true),new SpecialItem(34,"Phoenix Roll","phoenixroll","tips",2,51,[FoodData.PAPER_UKONIRO,FoodData.RICE_BLACK,false,[FoodData.FILLING_UNAGI,true],[FoodData.FILLING_CRABSTICK,true],FoodData.DROP_PRAWN,FoodData.SHAKER_TOBIKO,FoodData.SAUCE_HIBACHI],[FoodData.DROP_PRAWN,FoodData.FILLING_UNAGI],"tint_spacehelmet:K-V-NG",true),new SpecialItem(35,"Veggie Roll","veggieroll","tickets",1,51,[FoodData.PAPER_MOMOIRO,FoodData.RICE_BLACK,false,[FoodData.FILLING_CREAMCHEESE,true],[FoodData.FILLING_ASAPARAGUS,true],[FoodData.FILLING_CUCUMBER,true],FoodData.SHAKER_FURIKAKE,FoodData.SAUCE_PONZU],[FoodData.FILLING_ASAPARAGUS,FoodData.FILLING_CUCUMBER],"tint_belt_11:LW-GR-BZ",true),new SpecialItem(36,"The Amberjack","theamberjack","tips",2.2,51,[FoodData.PAPER_MOMOIRO,FoodData.RICE_BLACK,true,[FoodData.FILLING_AVOCADO,true],[FoodData.FILLING_YELLOWTAIL,true],FoodData.SHAKER_BONITOFLAKES],[FoodData.FILLING_YELLOWTAIL],"tint_powerglove:DG-K-GR",true),new SpecialItem(37,"Kraken Roll","krakenroll","stars",1,54,[FoodData.PAPER_MOMOIRO,FoodData.RICE_WHITE,true,[FoodData.FILLING_OCTOPUS,true],[FoodData.FILLING_TOFU,true],FoodData.DROP_SAYORI,FoodData.SAUCE_YUMYUM],[FoodData.FILLING_OCTOPUS,FoodData.DROP_SAYORI],"helmet_01",true),new SpecialItem(38,"Cool Calamari","coolcalamari","tips",2.3,64,[FoodData.PAPER_UKONIRO,FoodData.RICE_BLACK,true,[FoodData.FILLING_CUCUMBER,true],[FoodData.FILLING_CALAMARI,true],FoodData.SAUCE_DUCK],[FoodData.FILLING_CALAMARI,FoodData.FILLING_CUCUMBER],"hat13",true),new SpecialItem(39,"Spicy Squid","spicysquid","points",200,64,[FoodData.PAPER_MOMOIRO,FoodData.RICE_BROWN,false,[FoodData.FILLING_JALAPENO,true],[FoodData.FILLING_CALAMARI,true],FoodData.SAUCE_SRIRACHA],[FoodData.FILLING_JALAPENO,FoodData.FILLING_CALAMARI],"body_goldaward",true)];
         super();
         var _loc2_:GameData = this;
         _loc2_.gameObj = param1;
         _loc2_.setMusicTags();
         _loc2_.checkFurniTags();
      }
      
      public function getSpecial(param1:Number) : SpecialItem
      {
         var _loc2_:GameData = this;
         var _loc3_:SpecialItem = null;
         if(param1 >= 0 && param1 < _loc2_.specials.length)
         {
            _loc3_ = _loc2_.specials[param1];
         }
         return _loc3_;
      }
      
      public function getSpecials(param1:String) : Array
      {
         var _loc2_:GameData = this;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.specials.length)
         {
            if(_loc2_.gameObj.var_127.hasSpecial(_loc5_))
            {
               _loc3_.push(_loc2_.specials[_loc5_]);
            }
            else
            {
               _loc4_.push(_loc2_.specials[_loc5_]);
            }
            _loc5_++;
         }
         if(param1 == "abc")
         {
            _loc3_.sortOn("title");
         }
         else if(param1 == "new")
         {
            _loc3_.sort(this.specialSortFunction);
         }
         else if(param1 == "holiday")
         {
            _loc3_.sortOn("title");
         }
         return _loc3_.concat(_loc4_);
      }
      
      public function getPossibleSpecialsToEarn() : Array
      {
         var _loc1_:GameData = this;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.specials.length)
         {
            if(_loc1_.gameObj.var_127.hasSpecial(_loc3_) == false && _loc1_.gameObj.var_127.hasAllSpecialToppings(_loc3_))
            {
               _loc2_.push(_loc3_);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function specialSortFunction(param1:SpecialItem, param2:SpecialItem) : int
      {
         var _loc3_:GameData = this;
         var _loc4_:UserData;
         if((_loc4_ = _loc3_.gameObj.var_127).isSpecialViewed(param1.index) && !_loc4_.isSpecialViewed(param2.index))
         {
            return 1;
         }
         if(!_loc4_.isSpecialViewed(param1.index) && _loc4_.isSpecialViewed(param2.index))
         {
            return -1;
         }
         if(param1.index < param2.index)
         {
            return 1;
         }
         if(param1.index > param2.index)
         {
            return -1;
         }
         return 0;
      }
      
      public function getSpecialLogo(param1:Number) : BitmapData
      {
         var logo:MovieClip = null;
         var specialIndex:Number = param1;
         var ob:GameData = this;
         var returnBMP:BitmapData = null;
         var special:SpecialItem = ob.getSpecial(specialIndex);
         try
         {
            if(special != null)
            {
               logo = class_14.method_103("specials_" + special.tag + "_logo",false,false);
               returnBMP = new BitmapData(Math.max(157,Math.round(logo.width)),Math.max(157,Math.round(logo.height)),true,0);
               returnBMP.draw(logo,null,null,null,null,true);
               class_6.method_1("Special Logo w/h: " + returnBMP.width + ", " + returnBMP.height);
               logo = null;
            }
         }
         catch(err:Error)
         {
            class_6.error("Error getting special logo:" + err.message + ". Special " + specialIndex);
            returnBMP = null;
         }
         return returnBMP;
      }
      
      public function getIngredients(param1:String) : Array
      {
         var _loc6_:Object = null;
         var _loc2_:GameData = this;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.unlockArray.length)
         {
            if(_loc2_.unlockArray[_loc5_].type == "topping" || _loc2_.unlockArray[_loc5_].type == "toppingfiller")
            {
               (_loc6_ = new Object()).title = _loc2_.unlockArray[_loc5_].title;
               _loc6_.tag = _loc2_.unlockArray[_loc5_].tag;
               _loc6_.rank = _loc2_.unlockArray[_loc5_].rank;
               _loc6_.holiday = FoodData.getHolidayForItem(_loc2_.unlockArray[_loc5_].tag);
               if(_loc6_.holiday == 0)
               {
                  _loc6_.holiday = 13;
               }
               if(_loc2_.gameObj.var_127.hasTopping(_loc6_.tag) == false)
               {
                  _loc6_.title = "ZZZZZZ???";
                  _loc4_.push(_loc6_);
               }
               else
               {
                  _loc3_.push(_loc6_);
               }
            }
            _loc5_++;
         }
         if(param1 == "abc")
         {
            _loc3_.sortOn("title");
         }
         else if(param1 == "new")
         {
            _loc3_.sortOn("rank",Array.NUMERIC | Array.DESCENDING);
         }
         else if(param1 == "holiday")
         {
            _loc3_.sortOn("holiday",Array.NUMERIC);
         }
         return _loc3_.concat(_loc4_);
      }
      
      public function getUnlocksAtRank(param1:Number, param2:Boolean = false) : Vector.<UnlockData>
      {
         var _loc3_:GameData = this;
         var _loc4_:Vector.<UnlockData> = new Vector.<UnlockData>();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.unlockArray.length)
         {
            if(_loc3_.unlockArray[_loc5_].type != "filler" && param2 == false || _loc3_.unlockArray[_loc5_].type == "filler" && param2 == true)
            {
               if(_loc3_.unlockArray[_loc5_].rank == param1 || _loc3_.unlockArray[_loc5_].rank <= param1 && param2 == true)
               {
                  _loc4_.push(_loc3_.unlockArray[_loc5_]);
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function getFillerToppingsAtRank(param1:Number, param2:Boolean = false) : Vector.<UnlockData>
      {
         var _loc3_:GameData = this;
         var _loc4_:Vector.<UnlockData> = new Vector.<UnlockData>();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.unlockArray.length)
         {
            if(_loc3_.unlockArray[_loc5_].type == "toppingfiller")
            {
               if(param1 <= _loc3_.unlockArray[_loc5_].maxRank && (param1 > _loc3_.unlockArray[_loc5_].rank || param1 == _loc3_.unlockArray[_loc5_].rank && !param2))
               {
                  _loc4_.push(_loc3_.unlockArray[_loc5_]);
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function getUnlockByTag(param1:String) : UnlockData
      {
         var _loc2_:GameData = this;
         var _loc3_:UnlockData = null;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.unlockArray.length)
         {
            if(_loc2_.unlockArray[_loc4_].tag == param1)
            {
               _loc3_ = _loc2_.unlockArray[_loc4_];
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getUpgradeFromTag(param1:String) : Upgrade
      {
         var _loc2_:Upgrade = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.shopItems.length)
         {
            if(Upgrade(this.shopItems[_loc3_]).tag == param1)
            {
               _loc2_ = this.shopItems[_loc3_];
               _loc2_.index = _loc3_ + 1;
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function setMusicTags() : void
      {
         var _loc1_:GameData = this;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.furniItems.length)
         {
            if(_loc1_.furniItems[_loc2_].special == FurniData.SPECIAL_MUSIC)
            {
               if(_loc1_.furniItems[_loc2_].scoreType == "boombox")
               {
                  _loc1_.boomboxTag = _loc1_.furniItems[_loc2_].tag;
               }
               else if(_loc1_.furniItems[_loc2_].scoreType == "phonograph")
               {
                  _loc1_.phonographTag = _loc1_.furniItems[_loc2_].tag;
               }
               else if(_loc1_.furniItems[_loc2_].scoreType == "jukebox")
               {
                  _loc1_.jukeboxTag = _loc1_.furniItems[_loc2_].tag;
               }
               else
               {
                  class_6.error("Unknown music furniture - scoreType needs to be set to the music type: " + _loc1_.furniItems[_loc2_].tag);
               }
            }
            _loc2_++;
         }
      }
      
      private function checkFurniTags() : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc1_:GameData = this;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.themeTagsPerMonth.length)
         {
            _loc3_ = false;
            if((_loc4_ = String(_loc1_.themeTagsPerMonth[_loc2_])) != "")
            {
               _loc5_ = 0;
               while(_loc5_ < _loc1_.furniItems.length)
               {
                  if(_loc1_.furniItems[_loc5_].theme == _loc4_)
                  {
                     _loc3_ = true;
                     break;
                  }
                  _loc5_++;
               }
               if(_loc3_ == false)
               {
                  class_6.error("Theme Setup Error: Could not find any furniture for Theme \"" + _loc4_ + "\".  Make sure themeTagsPerMonth array has the correct themes listed.");
               }
            }
            _loc2_++;
         }
      }
      
      public function getFurniFromTag(param1:String) : FurniData
      {
         var _loc2_:GameData = this;
         var _loc3_:FurniData = null;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.furniItems.length)
         {
            if(FurniData(_loc2_.furniItems[_loc4_]).tag == param1)
            {
               _loc3_ = _loc2_.furniItems[_loc4_];
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getFurniStoreTags() : Array
      {
         var _loc1_:GameData = this;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.furniItems.length)
         {
            if(_loc1_.furniItems[_loc3_].tag != "wall1" && _loc1_.furniItems[_loc3_].tag != "floor1" && _loc1_.furniItems[_loc3_].inStore == true)
            {
               _loc2_.push(_loc1_.furniItems[_loc3_].tag);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getStoreTags(param1:String, param2:String = "all", param3:Number = -1) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Boolean = false;
         var _loc4_:GameData = this;
         var _loc5_:Array = [];
         if(param1 == "furniture" || param1 == "poster" || param1 == "wallfloor")
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_.furniItems.length)
            {
               if(_loc4_.furniItems[_loc6_].tag != "wall1" && _loc4_.furniItems[_loc6_].tag != "floor1" && _loc4_.furniItems[_loc6_].inStore == true)
               {
                  if(!((_loc4_.furniItems[_loc6_].special == FurniData.SPECIAL_SCORE || _loc4_.furniItems[_loc6_].special == FurniData.SPECIAL_SCOREBUBBLEGUM) && (_loc4_.furniItems[_loc6_].scoreType == "build" || _loc4_.furniItems[_loc6_].scoreType == "grill") && _loc4_.gameObj.var_127.hasTopping(_loc4_.furniItems[_loc6_].toppingType) == false))
                  {
                     _loc7_ = "all";
                     if(param3 == 0)
                     {
                        _loc7_ = "g";
                     }
                     else if(param3 > 0 && param3 <= 12)
                     {
                        _loc7_ = String(_loc4_.themeTagsPerMonth[param3]);
                     }
                     if(_loc7_ == "all" || _loc4_.furniItems[_loc6_].theme == _loc7_)
                     {
                        if(param2 == "all" || param2 == "owned" && _loc4_.gameObj.var_127.alreadyOwnsFurniture(_loc4_.furniItems[_loc6_].tag) || param2 == "notowned" && _loc4_.gameObj.var_127.alreadyOwnsFurniture(_loc4_.furniItems[_loc6_].tag) == false)
                        {
                           if(param1 == "furniture" && _loc4_.furniItems[_loc6_].type == FurniData.TYPE_FURNI)
                           {
                              _loc5_.push(_loc4_.furniItems[_loc6_].tag);
                           }
                           else if(param1 == "poster" && _loc4_.furniItems[_loc6_].type == FurniData.TYPE_POSTER)
                           {
                              _loc5_.push(_loc4_.furniItems[_loc6_].tag);
                           }
                           else if(param1 == "wallfloor" && (_loc4_.furniItems[_loc6_].type == FurniData.TYPE_WALLPAPER || _loc4_.furniItems[_loc6_].type == FurniData.TYPE_FLOORING) && !_loc4_.gameObj.var_127.alreadyOwnsFurniture(_loc4_.furniItems[_loc6_].tag))
                           {
                              _loc5_.push(_loc4_.furniItems[_loc6_].tag);
                           }
                        }
                     }
                  }
               }
               _loc6_++;
            }
         }
         else if(param1 == "upgrades")
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_.shopItems.length)
            {
               if(_loc4_.shopItems[_loc6_].tag == "coupon")
               {
                  _loc5_.push(_loc4_.shopItems[_loc6_].tag);
               }
               else if(!(_loc4_.shopItems[_loc6_].toppingType != null && _loc4_.gameObj.var_127.hasTopping(_loc4_.shopItems[_loc6_].toppingType) == false))
               {
                  if(!_loc4_.gameObj.var_127.hasBonus(_loc4_.shopItems[_loc6_].tag))
                  {
                     _loc5_.push(_loc4_.shopItems[_loc6_].tag);
                  }
               }
               _loc6_++;
            }
         }
         else if(param1 == "clothing")
         {
            _loc8_ = false;
            if(_loc4_.gameObj.var_127.whichCharacter == "marty" || _loc4_.gameObj.var_127.whichCharacter == "rita")
            {
               _loc8_ = true;
            }
            if(param2 == "all")
            {
               _loc5_ = _loc4_.gameObj.var_134.getAvailableClothingTags("any",_loc4_.gameObj.workerData.gender,true,false,_loc8_,param3);
            }
            else
            {
               _loc5_ = _loc4_.gameObj.var_134.getAvailableClothingTags(param2,_loc4_.gameObj.workerData.gender,true,false,_loc8_,param3);
            }
         }
         return _loc5_;
      }
      
      public function getTeamSKU(param1:Number) : String
      {
         var _loc2_:Array = ["tomatoes","sizzlers","hardshells","coconuts","flapjacks","buffaloes","crushers"];
         if(param1 > 0 && param1 <= _loc2_.length)
         {
            return _loc2_[param1 + 1];
         }
         return "";
      }
      
      public function getSkyStartingFrame() : Number
      {
         var _loc1_:GameData = this;
         var _loc2_:Number = _loc1_.gameObj.var_127.getMonth();
         if(_loc2_ == 0 || _loc2_ == 1 || _loc2_ == 12)
         {
            return 1;
         }
         if(_loc2_ == 2 || _loc2_ == 11)
         {
            return 8;
         }
         if(_loc2_ == 3)
         {
            return 15;
         }
         if(_loc2_ == 4)
         {
            return 29;
         }
         if(_loc2_ == 5 || _loc2_ == 9)
         {
            return 36;
         }
         if(_loc2_ == 6 || _loc2_ == 8)
         {
            return 43;
         }
         if(_loc2_ == 7)
         {
            return 50;
         }
         if(_loc2_ == 10)
         {
            return 57;
         }
         return 1;
      }
      
      public function setPrizes() : void
      {
         var _loc2_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:FurniData = null;
         var _loc11_:ClothingItem = null;
         var _loc12_:SpecialItem = null;
         var _loc13_:FurniData = null;
         var _loc14_:ClothingItem = null;
         var _loc1_:GameData = this;
         var _loc3_:Array = [];
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.minigamePrizes.length)
         {
            _loc8_ = 0;
            while(_loc8_ < _loc1_.minigamePrizes[_loc2_].length)
            {
               _loc9_ = String(_loc1_.minigamePrizes[_loc2_][_loc8_]);
               _loc3_.push(_loc9_);
               if((_loc10_ = _loc1_.getFurniFromTag(_loc9_)) != null)
               {
                  if(_loc10_.inStore == true)
                  {
                     _loc10_.inStore = false;
                     _loc4_++;
                  }
                  else
                  {
                     class_6.error("This prize is added more than once: " + _loc9_);
                  }
               }
               else if((_loc11_ = _loc1_.gameObj.var_134.getItemFromSKU(_loc9_)) != null)
               {
                  if(_loc11_.isTinting())
                  {
                     _loc1_.gameObj.var_134.checkValidTinting(_loc11_,_loc9_);
                  }
                  else if(_loc11_.inStore == true)
                  {
                     _loc11_.inStore = false;
                     _loc5_++;
                  }
                  else
                  {
                     class_6.error("This prize is added more than once: " + _loc9_);
                  }
               }
               else
               {
                  class_6.error("Unknown prize for Mini-Game -- can\'t find it to remove from store: " + _loc9_);
               }
               _loc8_++;
            }
            if(_loc1_.minigamePrizes[_loc2_].length != 16)
            {
               class_6.error("Not enough Prizes for Set " + _loc2_ + " (" + _loc1_.minigamePrizes[_loc2_].length + " instead of 16)");
            }
            _loc2_++;
         }
         class_6.info("Removed Mini-Game Prizes from Store: " + _loc4_ + " Furni, " + _loc5_ + " Clothing.");
         class_6.info("");
         class_6.info("Remove Special Recipe Prizes:");
         _loc2_ = 0;
         while(_loc2_ < _loc1_.specials.length)
         {
            if((_loc12_ = _loc1_.specials[_loc2_]).prizeSKU != null)
            {
               if(_loc3_.indexOf(_loc12_.prizeSKU) > -1)
               {
                  class_6.error(" -- ERROR -- " + _loc12_.prizeSKU + " Special Prize is already an existing prize!");
               }
               else
               {
                  _loc3_.push(_loc12_.prizeSKU);
               }
               if(_loc12_.removePrizeFromStore)
               {
                  if((_loc13_ = _loc1_.getFurniFromTag(_loc12_.prizeSKU)) != null)
                  {
                     if(_loc13_.inStore == true)
                     {
                        _loc10_.inStore = false;
                        _loc6_++;
                     }
                     else
                     {
                        class_6.error(" -- Error -- " + _loc12_.prizeSKU + " was already removed from store.");
                     }
                  }
                  else if((_loc14_ = _loc1_.gameObj.var_134.getItemFromSKU(_loc12_.prizeSKU)) != null)
                  {
                     if(_loc14_.isTinting())
                     {
                        _loc1_.gameObj.var_134.checkValidTinting(_loc14_,_loc12_.prizeSKU);
                     }
                     else if(_loc14_.inStore == true)
                     {
                        _loc14_.inStore = false;
                        _loc7_++;
                     }
                     else
                     {
                        class_6.error(" -- Error -- " + _loc12_.prizeSKU + " was already removed from store.");
                     }
                  }
                  else
                  {
                     class_6.error("Unknown prize for Special -- can\'t find it to remove from store: " + _loc12_.prizeSKU);
                  }
               }
            }
            _loc2_++;
         }
         class_6.info("Removed Special Prizes from Store: " + _loc6_ + " Furni, " + _loc7_ + " Clothing.");
         class_6.info("");
         _loc3_ = null;
      }
      
      public function isRarePrize(param1:String) : Boolean
      {
         var _loc2_:GameData = this;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.minigamePrizes.length)
         {
            if(_loc2_.minigamePrizes[_loc4_].indexOf(param1) >= 13)
            {
               _loc3_ = true;
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getHolidayName(param1:Number) : String
      {
         var _loc2_:GameData = this;
         if(param1 > 0 && param1 < _loc2_.themeTagNames.length)
         {
            return _loc2_.themeTagNames[param1];
         }
         return "";
      }
   }
}

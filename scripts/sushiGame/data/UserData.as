package sushiGame.data
{
   import flash.events.NetStatusEvent;
   import flash.net.SharedObject;
   import flash.net.SharedObjectFlushStatus;
   import flipline.api.*;
   import package_2.class_12;
   import package_2.class_16;
   import package_2.class_6;
   import package_4.class_5;
   
   public class UserData
   {
       
      
      public var gameObj:class_5;
      
      public var saveSlotPrefix:String = "papassushiria";
      
      public var saveSlotVersion:String = "1.0";
      
      public var saveSlotMaxSize:Number = 102400;
      
      public var so:SharedObject = null;
      
      public var lastMonthSeen:Number = 0;
      
      public var ranksPerMonth:Number = 5;
      
      public var playedALevel:Boolean = false;
      
      public var playedLevelsToday:Number = 0;
      
      public var myRank:Number = 1;
      
      public var myName:String = "Anonymous";
      
      public var whichCharacter:String = "marty";
      
      public var numCoupons:Number = 0;
      
      public var waiterName:String = "Waiter";
      
      public var whichWaiter:String = "custom";
      
      public var lastRibbon:Number = 0;
      
      public var ribbonDaysActive:Number = 3;
      
      public var totalMoneyEarned:Number = 0;
      
      public var totalTicketsEarned:Number = 0;
      
      public var totalScore:Number = 0;
      
      public var totalTips:Number = 0;
      
      public var totalTickets:Number = 0;
      
      public var currentDay:Number = 1;
      
      public var todayScore:Number = 0;
      
      public var todayTickets:Number = 0;
      
      public var todayNaturalTickets:Number = 0;
      
      public var todayTips:Number = 0;
      
      public var todayWaitScore:Number = 0;
      
      public var todayCookScore:Number = 0;
      
      public var todayBuildScore:Number = 0;
      
      public var todayTeaScore:Number = 0;
      
      public var todayCustomers:Number = 0;
      
      public var todayMeterTopping:Number = 0;
      
      public var customersUnlocked:Array;
      
      public var customerStars:Array;
      
      public var customerSeals:Array;
      
      public var customerVisits:Array;
      
      public var customerFirstVisit:Array;
      
      public var customerSecondOutfits:Array;
      
      public var customerWearing:Array;
      
      public var didShowParade:Boolean = false;
      
      public var seenFloatsInParade:Number = 0;
      
      public var couponCustomer:Number = -1;
      
      public var couponDay:Number = 0;
      
      public var didClickTwitter:Boolean = false;
      
      public var didClickFacebook:Boolean = false;
      
      public var trainingFlagNames:Array;
      
      public var trainingFlags:Array;
      
      public var hasContinuedGame:Boolean = false;
      
      public var hasVisitedUpgradeShop:Boolean = false;
      
      public var hasVisitedLobbyEditor:Boolean = false;
      
      public var hasPlacedFurniture:Boolean = false;
      
      public var hasVisitedBadgesScreen:Boolean = false;
      
      public var didCreateWaiter:Boolean = false;
      
      public var closerCustomers:Number = 7;
      
      public var toppingsUnlocked:Array;
      
      public var toppingsRevealed:Array;
      
      public var toppingIndexes:Array;
      
      public var toppingNames:Array;
      
      public var totalBonuses:Number = 13;
      
      public var bonusUpgrades:Array;
      
      public var furniInventory:Array;
      
      public var lobbyPlacement:Array;
      
      public var furniSorting:String = "newest";
      
      public var lobbyWallpaper:Number = 1;
      
      public var lobbyFlooring:Number = 1;
      
      public var lobbyTrim:uint = 14117206;
      
      public var lobbyTop:uint = 65325;
      
      public var defaultLobbyTrim:uint = 14117206;
      
      public var defaultLobbyTop:uint = 65325;
      
      public var clothingInventory:Array;
      
      public var hasNewClothing:Boolean = false;
      
      public var hasNewFurni:Boolean = false;
      
      public var hasNewClothingTypes:Array;
      
      public var rankTitles:Array;
      
      public var rankPlateauLimit:Number = 15;
      
      public var rankMultiplier:Number = 130;
      
      public var lastRankLimit:Number = 0;
      
      public var baseWeeklyWage:Number = 15000;
      
      public var wageIncreasePerRank:Number = 500;
      
      public var whichSlot:Number = 1;
      
      public var medalsEarned:Array;
      
      public var medalProgress:Array;
      
      public var medalsViewed:Array;
      
      public var numberOfMinigames:Number = 7;
      
      public var minigamesPlayed:Array;
      
      public var minigamePrizes:Array;
      
      public var specialsOwned:Array;
      
      public var specialFromCustomer:Array;
      
      public var specialsServed:Array;
      
      public var specialStars:Array;
      
      public var specialsViewed:Array;
      
      public var currentSpecial:Number = -1;
      
      public var lastDaySpecialEarned:Number = 0;
      
      public var showSpecialSign:Number = 1;
      
      public var starsToMasterSpecial:Number = 5;
      
      public var randomSeed:Number = 56789;
      
      public function UserData(param1:class_5)
      {
         this.customersUnlocked = [];
         this.customerStars = [];
         this.customerSeals = [];
         this.customerVisits = [];
         this.customerFirstVisit = [];
         this.customerSecondOutfits = [];
         this.customerWearing = [];
         this.trainingFlagNames = ["boost","closer","critic","ribbon","decorate","inventory","poster","furni","ticket","season","toptrim","lobbypoints","minigame","server","santa","clothingbonus","stickeropenmenu","stickeropencustomers","stickersort","stickergivegift","customeroutfit","bringspecial","openspecial","cheatsheet","listspecial","setspecial","bonusspecial","givecoupon","flipsushi","shaker","brownrice","cutting"];
         this.trainingFlags = [];
         this.toppingsUnlocked = [];
         this.toppingsRevealed = [];
         this.toppingIndexes = [];
         this.toppingNames = [];
         this.bonusUpgrades = [];
         this.furniInventory = [];
         this.lobbyPlacement = [];
         this.clothingInventory = [];
         this.hasNewClothingTypes = [];
         this.rankTitles = ["!","Newbie","Lobster Lover","Yum Yum Master","Blueberry Buddy","Tofu Guru","Momoiro Hero","Narutomaki Master","Sakura Senpai","Hakuto Hero","Watermelon Wrangler","Yuzu Kosho Pro","Chorizo Champ","Nacho Fan","Horchata Champ","Ukoniro Hero","Onion Wrangler","Pineapple Pro","Calypso Specialist","Punch Professional","Kiwi Buddy","Tempura Cruncher","Brisket Buddy","BBQ Pit Pro","Powsicle Pourer","Wagyu Warrior","Cherry Champ","Brezn Baker","Mustard Master","Forest Fan","Hibachi Hero","Shrimp Server","Bacon Buddy","Maple Master","Breakfast Buddy","Tangerine Hero","Sriracha Specialist","Uni Expert","Squid Specialist","Brewmaster","Octopus Wrangler","Taro Hero","Sweet Potato Pro","Gravy Guru","Pumpkin Professional","Pawpaw Pro","Radish Fan","Tai Catcher","Cranberry Buddy","Peppermint Pro","Asaparagus Fan","Ponzu Professional","Yokan Hero","Flavor X Fan","Fruit Fanatic","Sayori Specialist","Sugarplumber","Strawberry Buddy","Azuki Hero","Raspberry Wrangler","Chocolate Champ","Cotton Candy Fan","Datemaki Master","Kuri Kinton Pro","Iyokan Itamae","Calamari Master","Better Than Papa!"];
         this.medalsEarned = [];
         this.medalProgress = [];
         this.medalsViewed = [];
         this.minigamesPlayed = [0,0,0,0,0,0,0];
         this.minigamePrizes = [0,0,0,0,0,0,0];
         this.specialsOwned = [];
         this.specialFromCustomer = [];
         this.specialsServed = [];
         this.specialStars = [];
         this.specialsViewed = [];
         super();
         var _loc2_:UserData = this;
         _loc2_.gameObj = param1;
         _loc2_.setupToppingIndexes();
      }
      
      public function loadData(param1:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:UserData = this;
         _loc2_.whichSlot = param1;
         _loc2_.gameObj.var_136.resetAllTallies();
         _loc2_.so = SharedObject.getLocal(this.saveSlotPrefix + param1,"/");
         if(this.so.data.rank)
         {
            class_6.debug("Load from Existing Slot " + param1);
            _loc2_.myRank = this.so.data.rank;
            _loc2_.totalScore = this.so.data.score;
            _loc2_.totalTips = this.so.data.tips;
            _loc2_.currentDay = this.so.data.day;
            _loc2_.myName = this.so.data.playername;
            if(this.so.data.couponcustomer)
            {
               _loc2_.couponCustomer = this.so.data.couponcustomer;
            }
            else
            {
               _loc2_.couponCustomer = -1;
            }
            if(this.so.data.couponday)
            {
               _loc2_.couponDay = this.so.data.couponday;
            }
            else
            {
               _loc2_.couponDay = 0;
            }
            if(this.so.data.allmoney)
            {
               _loc2_.totalMoneyEarned = this.so.data.allmoney;
            }
            else
            {
               _loc2_.totalMoneyEarned = _loc2_.totalTips;
            }
            if(this.so.data.character)
            {
               _loc2_.whichCharacter = this.so.data.character;
            }
            else
            {
               _loc2_.whichCharacter = "marty";
            }
            if(this.so.data.waiter)
            {
               _loc2_.whichWaiter = this.so.data.waiter;
            }
            else
            {
               _loc2_.whichWaiter = "custom";
            }
            if(this.so.data.waitername)
            {
               _loc2_.waiterName = this.so.data.waitername;
            }
            else
            {
               _loc2_.waiterName = "Waiter";
            }
            if(this.so.data.didcreatewaiter)
            {
               _loc2_.didCreateWaiter = this.so.data.didcreatewaiter;
            }
            else
            {
               _loc2_.didCreateWaiter = false;
            }
            if(this.so.data.coupons)
            {
               _loc2_.numCoupons = this.so.data.coupons;
            }
            else
            {
               _loc2_.numCoupons = 0;
            }
            if(this.so.data.bonuses)
            {
               _loc2_.bonusUpgrades = this.so.data.bonuses.concat();
               _loc6_ = _loc2_.bonusUpgrades.length;
               if(_loc2_.bonusUpgrades.length < _loc2_.totalBonuses + 1)
               {
                  _loc7_ = _loc6_;
                  while(_loc7_ <= _loc2_.totalBonuses)
                  {
                     _loc2_.bonusUpgrades.push(0);
                     _loc7_++;
                  }
               }
            }
            else
            {
               _loc2_.bonusUpgrades = [];
               _loc8_ = 0;
               while(_loc8_ <= _loc2_.totalBonuses)
               {
                  _loc2_.bonusUpgrades.push(0);
                  _loc8_++;
               }
            }
            if(this.so.data.inventory)
            {
               _loc2_.furniInventory = class_16.method_124(this.so.data.inventory);
            }
            else
            {
               _loc2_.furniInventory = [];
            }
            if(this.so.data.furnisorting)
            {
               _loc2_.furniSorting = this.so.data.furnisorting;
            }
            else
            {
               _loc2_.furniSorting = "newest";
            }
            if(this.so.data.lobby)
            {
               _loc2_.lobbyPlacement = class_16.method_124(this.so.data.lobby);
            }
            else
            {
               _loc2_.lobbyPlacement = [];
            }
            if(this.so.data.wallpaper)
            {
               _loc2_.lobbyWallpaper = this.so.data.wallpaper;
            }
            else
            {
               _loc2_.lobbyWallpaper = 1;
            }
            if(this.so.data.flooring)
            {
               _loc2_.lobbyFlooring = this.so.data.flooring;
            }
            else
            {
               _loc2_.lobbyFlooring = 1;
            }
            if(this.so.data.lobbytrim)
            {
               _loc2_.lobbyTrim = this.so.data.lobbytrim;
            }
            else
            {
               _loc2_.lobbyTrim = _loc2_.defaultLobbyTrim;
            }
            if(this.so.data.lobbytop)
            {
               _loc2_.lobbyTop = this.so.data.lobbytop;
            }
            else
            {
               _loc2_.lobbyTop = _loc2_.defaultLobbyTop;
            }
            if(this.so.data.toppings)
            {
               _loc2_.toppingsUnlocked = this.so.data.toppings.concat();
            }
            else
            {
               _loc2_.setupDefaultToppingData();
            }
            if(this.so.data.toppingsrevealed)
            {
               _loc2_.toppingsRevealed = this.so.data.toppingsrevealed.concat();
            }
            else
            {
               _loc2_.toppingsRevealed = _loc2_.toppingsUnlocked.concat();
            }
            if(this.so.data.minigamesPlayed)
            {
               _loc2_.minigamesPlayed = this.so.data.minigamesPlayed.concat();
            }
            else
            {
               _loc2_.minigamesPlayed = [0,0,0,0,0,0,0];
            }
            if(this.so.data.minigamePrizes)
            {
               _loc2_.minigamePrizes = this.so.data.minigamePrizes.concat();
            }
            else
            {
               _loc2_.minigamePrizes = [0,0,0,0,0,0,0];
            }
            if(this.so.data.specialStars)
            {
               _loc2_.specialStars = this.so.data.specialStars.concat();
            }
            if(this.so.data.specialsServed)
            {
               _loc2_.specialsServed = this.so.data.specialsServed.concat();
            }
            if(this.so.data.specialFromCustomer)
            {
               _loc2_.specialFromCustomer = this.so.data.specialFromCustomer.concat();
            }
            if(this.so.data.specialsViewed)
            {
               _loc2_.specialsViewed = this.so.data.specialsViewed.concat();
            }
            if(this.so.data.specialsOwned)
            {
               _loc2_.specialsOwned = this.so.data.specialsOwned.concat();
            }
            else
            {
               _loc2_.setupDefaultSpecialData();
            }
            if(this.so.data.currentSpecial)
            {
               _loc2_.currentSpecial = this.so.data.currentSpecial;
            }
            else if(this.so.data.currentSpecial === 0)
            {
               _loc2_.currentSpecial = this.so.data.currentSpecial;
            }
            else
            {
               _loc2_.currentSpecial = -1;
            }
            if(this.so.data.lastDaySpecialEarned)
            {
               _loc2_.lastDaySpecialEarned = this.so.data.lastDaySpecialEarned;
            }
            else
            {
               _loc2_.lastDaySpecialEarned = 0;
            }
            if(this.so.data.showSpecialSign === 0)
            {
               _loc2_.showSpecialSign = 0;
            }
            else
            {
               _loc2_.showSpecialSign = 1;
            }
            if(this.so.data.ribbon)
            {
               _loc2_.lastRibbon = this.so.data.ribbon;
            }
            else
            {
               _loc2_.lastRibbon = 0;
            }
            if(this.so.data.tickets)
            {
               _loc2_.totalTickets = this.so.data.tickets;
            }
            else
            {
               _loc2_.totalTickets = 0;
            }
            if(this.so.data.alltickets)
            {
               _loc2_.totalTicketsEarned = this.so.data.alltickets;
            }
            else
            {
               _loc2_.totalTicketsEarned = _loc2_.totalTickets;
            }
            _loc2_.lastRankLimit = _loc2_.getLastRankLimit();
            if(this.so.data.lastmonth)
            {
               _loc2_.lastMonthSeen = this.so.data.lastmonth;
            }
            else
            {
               _loc2_.lastMonthSeen = 0;
            }
            _loc2_.customersUnlocked = this.so.data.unlocked.concat();
            _loc2_.customerStars = this.so.data.stars.concat();
            _loc2_.customerSeals = this.so.data.seals.concat();
            _loc2_.customerVisits = this.so.data.visits.concat();
            _loc2_.customerFirstVisit = this.so.data.first.concat();
            if(this.so.data.outfits)
            {
               _loc2_.customerSecondOutfits = this.so.data.outfits.concat();
            }
            else
            {
               _loc2_.customerSecondOutfits = [];
            }
            if(this.so.data.wearing)
            {
               _loc2_.customerWearing = this.so.data.wearing.concat();
            }
            else
            {
               _loc2_.customerWearing = [];
            }
            if(this.so.data.workerdata)
            {
               _loc2_.gameObj.workerData.populateWorkerData(this.so.data.workerdata);
            }
            else if(_loc2_.whichCharacter == "marty")
            {
               _loc2_.gameObj.workerData.setupPremadeMale();
            }
            else if(_loc2_.whichCharacter == "rita")
            {
               _loc2_.gameObj.workerData.setupPremadeFemale();
            }
            else
            {
               class_6.error("Could not load previously-saved custom worker data.");
               _loc2_.gameObj.workerData.setupDefaults();
            }
            if(this.so.data.waiterdata)
            {
               _loc2_.gameObj.var_143.populateWorkerData(this.so.data.waiterdata);
            }
            else if(_loc2_.whichWaiter == "marty")
            {
               _loc2_.gameObj.var_143.setupPremadeMale();
            }
            else if(_loc2_.whichWaiter == "rita")
            {
               _loc2_.gameObj.var_143.setupPremadeFemale();
            }
            else
            {
               class_6.error("Could not load previously-saved custom waiter data.");
               _loc2_.gameObj.var_143.setupDefaults();
            }
            if(this.so.data.clothinginventory)
            {
               _loc2_.clothingInventory = this.so.data.clothinginventory.concat();
            }
            else
            {
               class_6.method_1("Could not find clothing inventory on save slot!  Generate a fresh batch.");
               _loc2_.clothingInventory = _loc2_.gameObj.var_134.getSKUsForInventory(_loc2_.whichCharacter,_loc2_.gameObj.workerData.gender,false,_loc2_.gameObj.workerData.accd);
            }
            if(this.so.data.medalsEarned)
            {
               _loc2_.medalsEarned = this.so.data.medalsEarned.concat();
            }
            else
            {
               _loc2_.medalsEarned = [];
            }
            if(this.so.data.medalProgress)
            {
               _loc2_.medalProgress = this.so.data.medalProgress.concat();
            }
            else
            {
               _loc2_.medalProgress = [];
            }
            if(this.so.data.medalsViewed)
            {
               _loc2_.medalsViewed = this.so.data.medalsViewed.concat();
            }
            else
            {
               _loc2_.medalsViewed = [];
               _loc9_ = 0;
               while(_loc9_ < _loc2_.medalsEarned.length)
               {
                  if(_loc2_.medalsEarned[_loc9_] == 1)
                  {
                     _loc2_.medalsViewed[_loc9_] = 1;
                  }
                  _loc9_++;
               }
            }
            if(this.so.data.hasnewclothing)
            {
               _loc2_.hasNewClothing = this.so.data.hasnewclothing;
            }
            else
            {
               _loc2_.hasNewClothing = false;
            }
            if(this.so.data.hasnewclothingtypes)
            {
               _loc2_.hasNewClothingTypes = this.so.data.hasnewclothingtypes.concat();
            }
            else
            {
               _loc2_.hasNewClothingTypes = [];
            }
            if(this.so.data.hasnewfurni)
            {
               _loc2_.hasNewFurni = this.so.data.hasnewfurni;
            }
            else
            {
               _loc2_.hasNewFurni = false;
            }
            if(this.so.data.trainingflags)
            {
               _loc2_.trainingFlags = this.so.data.trainingflags.concat();
               _loc10_ = _loc2_.trainingFlags.length;
               if(_loc2_.trainingFlags.length < _loc2_.trainingFlagNames.length)
               {
                  class_6.method_1("(Added some training flags since last save. Update this progress array.)");
                  _loc11_ = _loc10_;
                  while(_loc11_ < _loc2_.trainingFlagNames.length)
                  {
                     _loc2_.trainingFlags.push(0);
                     _loc11_++;
                  }
               }
            }
            else
            {
               _loc2_.trainingFlags = [];
            }
            if(this.so.data.continuedgame)
            {
               _loc2_.hasContinuedGame = true;
            }
            else
            {
               _loc2_.hasContinuedGame = true;
            }
            if(this.so.data.shownparade)
            {
               _loc2_.didShowParade = this.so.data.shownparade;
            }
            else
            {
               _loc2_.didShowParade = false;
            }
            if(this.so.data.floatsparade)
            {
               _loc2_.seenFloatsInParade = this.so.data.floatsparade;
            }
            else
            {
               _loc2_.seenFloatsInParade = 0;
            }
            if(this.so.data.clicktwitter)
            {
               _loc2_.didClickTwitter = this.so.data.clicktwitter;
            }
            else
            {
               _loc2_.didClickTwitter = false;
            }
            if(this.so.data.clickfacebook)
            {
               _loc2_.didClickFacebook = this.so.data.clickfacebook;
            }
            else
            {
               _loc2_.didClickFacebook = false;
            }
            if(this.so.data.visitedshop)
            {
               _loc2_.hasVisitedUpgradeShop = this.so.data.visitedshop;
            }
            else
            {
               _loc2_.hasVisitedUpgradeShop = false;
            }
            if(this.so.data.visitedbadges)
            {
               _loc2_.hasVisitedBadgesScreen = this.so.data.visitedbadges;
            }
            else
            {
               _loc2_.hasVisitedBadgesScreen = false;
            }
            if(this.so.data.visitedlobby)
            {
               _loc2_.hasVisitedLobbyEditor = this.so.data.visitedlobby;
            }
            else
            {
               _loc2_.hasVisitedLobbyEditor = false;
            }
            if(this.so.data.placedfurni)
            {
               _loc2_.hasPlacedFurniture = this.so.data.placedfurni;
            }
            else
            {
               _loc2_.hasPlacedFurniture = false;
            }
            while(_loc2_.customersUnlocked.length - 1 < _loc2_.gameObj.var_131.getCustomerTotal())
            {
               _loc2_.customersUnlocked.push(0);
            }
            while(_loc2_.customerStars.length - 1 < _loc2_.gameObj.var_131.getCustomerTotal())
            {
               _loc2_.customerStars.push(0);
            }
            while(_loc2_.customerSeals.length - 1 < _loc2_.gameObj.var_131.getCustomerTotal())
            {
               _loc2_.customerSeals.push(0);
            }
            while(_loc2_.customerVisits.length - 1 < _loc2_.gameObj.var_131.getCustomerTotal())
            {
               _loc2_.customerVisits.push(0);
            }
            while(_loc2_.customerFirstVisit.length - 1 < _loc2_.gameObj.var_131.getCustomerTotal())
            {
               _loc2_.customerFirstVisit.push(0);
            }
            while(_loc2_.customerSecondOutfits.length - 1 < _loc2_.gameObj.var_131.getCustomerTotal())
            {
               _loc2_.customerSecondOutfits.push(0);
            }
            while(_loc2_.customerWearing.length - 1 < _loc2_.gameObj.var_131.getCustomerTotal())
            {
               _loc2_.customerWearing.push(1);
            }
         }
         else
         {
            class_6.error("No Existing Slot even though it thought there was, Create New Slot");
            _loc2_.createNewSlot(param1,"Nameless","marty");
         }
         _loc2_.gameObj.var_136.populateMedalProgress(_loc2_.medalProgress);
         _loc2_.clearScoresForToday();
         _loc2_.gameObj.var_130.method_156();
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.gameObj.var_132.specials.length)
         {
            if(_loc2_.specialsOwned.length > _loc4_ && _loc2_.specialsOwned[_loc4_] == 1)
            {
               _loc3_++;
            }
            _loc4_++;
         }
         var _loc5_:Boolean;
         if(_loc5_ = _loc2_.gameObj.var_136.recordEarningSpecialRecipeAmount(_loc3_))
         {
            _loc2_.saveData();
         }
      }
      
      public function createNewSlot(param1:Number, param2:String, param3:String = "marty") : void
      {
         var _loc4_:UserData;
         (_loc4_ = this).gameObj.var_136.resetAllTallies();
         if(param2 == "" || param2 == " " || param2 == "  ")
         {
            if(param3 == "marty")
            {
               param2 = "Matt";
            }
            else
            {
               param2 = "Clover";
            }
         }
         _loc4_.whichSlot = param1;
         class_6.method_1("Create New Slot: " + param1);
         _loc4_.myRank = 1;
         _loc4_.totalScore = 0;
         _loc4_.totalTips = 0;
         _loc4_.totalTickets = 0;
         _loc4_.totalMoneyEarned = 0;
         _loc4_.totalTicketsEarned = 0;
         _loc4_.lastRankLimit = 0;
         _loc4_.currentDay = 1;
         _loc4_.myName = param2;
         _loc4_.whichCharacter = param3;
         _loc4_.hasNewClothing = true;
         _loc4_.lastMonthSeen = 0;
         _loc4_.couponCustomer = -1;
         _loc4_.couponDay = 0;
         _loc4_.numCoupons = 0;
         if(param3 == "marty")
         {
            _loc4_.hasNewClothingTypes = [ClothingItem.TYPE_SHIRT,ClothingItem.TYPE_PANTS,ClothingItem.TYPE_ACC_BELT,ClothingItem.TYPE_SHOES];
         }
         else if(param3 == "rita")
         {
            _loc4_.hasNewClothingTypes = [ClothingItem.TYPE_SHIRT,ClothingItem.TYPE_PANTS,ClothingItem.TYPE_ACC_BELT,ClothingItem.TYPE_SHOES,ClothingItem.TYPE_ACC_BODY,ClothingItem.TYPE_HAT];
         }
         else if(_loc4_.gameObj.workerData.accd != "" && _loc4_.gameObj.workerData.accd != null)
         {
            _loc4_.hasNewClothingTypes = [ClothingItem.TYPE_ACC_FACE];
         }
         _loc4_.didCreateWaiter = false;
         _loc4_.whichWaiter = "custom";
         _loc4_.waiterName = "Waiter";
         _loc4_.hasNewFurni = false;
         _loc4_.hasContinuedGame = false;
         _loc4_.hasVisitedUpgradeShop = false;
         _loc4_.hasVisitedLobbyEditor = false;
         _loc4_.hasPlacedFurniture = false;
         _loc4_.didShowParade = false;
         _loc4_.seenFloatsInParade = 0;
         _loc4_.didClickFacebook = false;
         _loc4_.didClickTwitter = false;
         _loc4_.lastRibbon = 0;
         _loc4_.bonusUpgrades = [];
         _loc4_.furniInventory = [];
         _loc4_.furniSorting = "newest";
         _loc4_.clothingInventory = [];
         _loc4_.lobbyPlacement = [];
         _loc4_.lobbyTrim = _loc4_.defaultLobbyTrim;
         _loc4_.lobbyTop = _loc4_.defaultLobbyTop;
         _loc4_.medalsEarned = [];
         _loc4_.medalProgress = [];
         _loc4_.medalsViewed = [];
         _loc4_.minigamesPlayed = [0,0,0,0,0,0,0];
         _loc4_.minigamePrizes = [0,0,0,0,0,0,0];
         _loc4_.lastDaySpecialEarned = 0;
         _loc4_.showSpecialSign = 1;
         _loc4_.currentSpecial = -1;
         var _loc5_:Number = 0;
         while(_loc5_ <= _loc4_.totalBonuses)
         {
            _loc4_.bonusUpgrades.push(0);
            _loc5_++;
         }
         if(param3 == "marty")
         {
            _loc4_.gameObj.workerData.setupPremadeMale();
            _loc4_.clothingInventory = _loc4_.gameObj.var_134.getSKUsForInventory(param3,WorkerData.GENDER_MALE);
         }
         else if(param3 == "rita")
         {
            _loc4_.gameObj.workerData.setupPremadeFemale();
            _loc4_.clothingInventory = _loc4_.gameObj.var_134.getSKUsForInventory(param3,WorkerData.GENDER_FEMALE);
         }
         else
         {
            _loc4_.clothingInventory = _loc4_.gameObj.var_134.getSKUsForInventory("custom",_loc4_.gameObj.workerData.gender,false,_loc4_.gameObj.workerData.accd);
         }
         _loc4_.gameObj.var_143.setupDefaults();
         _loc4_.furniInventory.push(["wall1",0,1,1,0]);
         _loc4_.furniInventory.push(["floor1",0,1,1,0]);
         _loc4_.lobbyWallpaper = 1;
         _loc4_.lobbyFlooring = 1;
         _loc4_.setupDefaultCustomerData();
         _loc4_.setupDefaultToppingData();
         _loc4_.setupDefaultSpecialData();
         _loc4_.so = SharedObject.getLocal(this.saveSlotPrefix + param1,"/");
         this.so.data.playername = _loc4_.myName;
         this.so.data.rank = _loc4_.myRank;
         this.so.data.day = _loc4_.currentDay;
         this.so.data.score = _loc4_.totalScore;
         this.so.data.tips = _loc4_.totalTips;
         this.so.data.tickets = _loc4_.totalTickets;
         this.so.data.coupons = _loc4_.numCoupons;
         this.so.data.allmoney = _loc4_.totalMoneyEarned;
         this.so.data.alltickets = _loc4_.totalTicketsEarned;
         this.so.data.character = _loc4_.whichCharacter;
         this.so.data.continuedgame = false;
         this.so.data.visitedshop = false;
         this.so.data.visitedbadges = false;
         this.so.data.shownparade = false;
         this.so.data.floatsparade = 0;
         this.so.data.clicktwitter = false;
         this.so.data.clickfacebook = false;
         this.so.data.lastmonth = _loc4_.lastMonthSeen;
         this.so.data.couponcustomer = _loc4_.couponCustomer;
         this.so.data.couponday = _loc4_.couponDay;
         this.so.data.hasnewfurni = false;
         this.so.data.hasnewclothing = _loc4_.hasNewClothing;
         this.so.data.hasnewclothingtypes = _loc4_.hasNewClothingTypes.concat();
         this.so.data.workerdata = _loc4_.gameObj.workerData.getDataToSave();
         this.so.data.waiterdata = _loc4_.gameObj.var_143.getDataToSave();
         this.so.data.waiter = _loc4_.whichWaiter;
         this.so.data.waitername = _loc4_.waiterName;
         this.so.data.didcreatewaiter = false;
         this.so.data.unlocked = _loc4_.customersUnlocked.concat();
         this.so.data.stars = _loc4_.customerStars.concat();
         this.so.data.seals = _loc4_.customerSeals.concat();
         this.so.data.visits = _loc4_.customerVisits.concat();
         this.so.data.first = _loc4_.customerFirstVisit.concat();
         this.so.data.outfits = _loc4_.customerSecondOutfits.concat();
         this.so.data.wearing = _loc4_.customerWearing.concat();
         this.so.data.toppings = _loc4_.toppingsUnlocked.concat();
         this.so.data.toppingsrevealed = _loc4_.toppingsRevealed.concat();
         this.so.data.bonuses = _loc4_.bonusUpgrades.concat();
         this.so.data.ribbon = _loc4_.lastRibbon;
         this.so.data.inventory = class_16.method_124(_loc4_.furniInventory);
         this.so.data.lobby = class_16.method_124(_loc4_.lobbyPlacement);
         this.so.data.wallpaper = _loc4_.lobbyWallpaper;
         this.so.data.flooring = _loc4_.lobbyFlooring;
         this.so.data.lobbytrim = _loc4_.lobbyTrim;
         this.so.data.lobbytop = _loc4_.lobbyTop;
         this.so.data.furnisorting = _loc4_.furniSorting;
         this.so.data.clothinginventory = _loc4_.clothingInventory.concat();
         this.so.data.medalsEarned = [];
         this.so.data.medalProgress = [];
         this.so.data.medalsViewed = [];
         this.so.data.minigamesPlayed = _loc4_.minigamesPlayed.concat();
         this.so.data.minigamePrizes = _loc4_.minigamePrizes.concat();
         _loc4_.trainingFlags = [];
         this.so.data.trainingflags = _loc4_.trainingFlags.concat();
         this.so.data.specialsOwned = _loc4_.specialsOwned.concat();
         this.so.data.specialsViewed = _loc4_.specialsViewed.concat();
         this.so.data.specialsServed = _loc4_.specialsServed.concat();
         this.so.data.specialFromCustomer = _loc4_.specialFromCustomer.concat();
         this.so.data.specialStars = _loc4_.specialStars.concat();
         this.so.data.currentSpecial = _loc4_.currentSpecial;
         this.so.data.lastDaySpecialEarned = _loc4_.lastDaySpecialEarned;
         this.so.data.showSpecialSign = _loc4_.showSpecialSign;
         _loc4_.flushSaveSlot();
         _loc4_.clearScoresForToday();
      }
      
      private function flushSaveSlot() : void
      {
         var ob:UserData = null;
         var flushStatus:String = null;
         ob = this;
         if(ob.so != null)
         {
            flushStatus = null;
            try
            {
               flushStatus = ob.so.flush(ob.saveSlotMaxSize);
            }
            catch(err:Error)
            {
               class_6.error("Error saving to Save Slot, may be disabled from saving.");
               ob.gameObj.var_130.api.method_131("Your computer won\'t let your progress be saved!  Right-click and choose \'Settings...\', then choose \'Unlimited\'.");
            }
            if(flushStatus != null)
            {
               switch(flushStatus)
               {
                  case SharedObjectFlushStatus.PENDING:
                     ob.gameObj.var_130.api.method_131("You need to Allow this site to save your game progress in the pop-up.");
                     class_6.info("Asking the player to increase storage size...");
                     ob.so.addEventListener(NetStatusEvent.NET_STATUS,ob.onFlushStatus);
                     break;
                  case SharedObjectFlushStatus.FLUSHED:
                     ob.gameObj.var_130.api.method_138();
                     class_6.info("Saved.");
               }
            }
         }
         else
         {
            class_6.error("Trying to Flush/Save, but there\'s no save slot!");
         }
      }
      
      public function onFlushStatus(param1:NetStatusEvent) : void
      {
         var _loc2_:UserData = this;
         switch(param1.info.code)
         {
            case "SharedObject.Flush.Success":
               class_6.info("Granted Permission to Save, data will now save.");
               _loc2_.gameObj.var_130.api.method_138();
               break;
            case "SharedObject.Flush.Failed":
               _loc2_.gameObj.var_130.api.method_131("Your game progress will not be saved!");
               class_6.info("Denied Permission to Save, no progress will be saved!");
         }
         _loc2_.so.removeEventListener(NetStatusEvent.NET_STATUS,_loc2_.onFlushStatus);
      }
      
      private function cheatLevelUp(param1:Number, param2:Number = 0) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc3_:UserData = this;
         _loc3_.myRank = 1;
         _loc3_.totalScore = 0;
         _loc3_.lastRankLimit = 0;
         _loc3_.currentDay = 1;
         _loc3_.unlockCustomerAndTopping(false,true);
         if(param1 > 1)
         {
            _loc4_ = 2;
            while(_loc4_ <= param1)
            {
               _loc3_.myRank = _loc4_;
               _loc3_.currentDay = _loc4_;
               _loc3_.lastRankLimit = _loc3_.getLastRankLimit();
               _loc3_.totalScore = _loc3_.lastRankLimit + 1;
               _loc6_ = false;
               if(_loc4_ < param1)
               {
                  _loc6_ = true;
               }
               _loc3_.unlockCustomerAndTopping(true,_loc6_);
               _loc4_++;
            }
            _loc5_ = 0;
            while(_loc5_ < 30)
            {
               ++_loc3_.currentDay;
               _loc3_.unlockCustomerAndTopping(false,true);
               _loc5_++;
            }
         }
      }
      
      public function eraseSlot(param1:Number) : void
      {
         this;
         var _loc3_:SharedObject = SharedObject.getLocal(this.saveSlotPrefix + param1,"/");
         _loc3_.clear();
      }
      
      public function setupDefaultSpecialData() : void
      {
         var _loc1_:UserData = this;
         var _loc2_:GameData = _loc1_.gameObj.var_132;
         _loc1_.specialsOwned = [];
         _loc1_.specialsViewed = [];
         _loc1_.specialsServed = [];
         _loc1_.specialFromCustomer = [];
         _loc1_.specialStars = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.specials.length)
         {
            _loc1_.specialsOwned.push(0);
            _loc1_.specialsViewed.push(0);
            _loc1_.specialsServed.push(0);
            _loc1_.specialFromCustomer.push(0);
            _loc1_.specialStars.push(0);
            _loc3_++;
         }
      }
      
      public function setupDefaultCustomerData() : void
      {
         var _loc5_:Number = NaN;
         var _loc1_:UserData = this;
         var _loc2_:CustomerData = _loc1_.gameObj.var_131;
         var _loc3_:GameData = _loc1_.gameObj.var_132;
         _loc1_.customersUnlocked = [0];
         _loc1_.customerSeals = [0];
         _loc1_.customerStars = [0];
         _loc1_.customerVisits = [0];
         _loc1_.customerFirstVisit = [0];
         _loc1_.customerSecondOutfits = [0];
         _loc1_.customerWearing = [0];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.unlockArray.length)
         {
            if(_loc3_.unlockArray[_loc4_].type == "customer" || _loc3_.unlockArray[_loc4_].type == "filler")
            {
               if((_loc5_ = _loc2_.getCustomerIndex(_loc3_.unlockArray[_loc4_].tag)) > -1)
               {
                  if(_loc3_.unlockArray[_loc4_].rank == 0 && _loc3_.unlockArray[_loc4_].type != "filler")
                  {
                     _loc1_.customersUnlocked[_loc5_] = 1;
                     _loc1_.customerFirstVisit[_loc5_] = 1;
                  }
                  else
                  {
                     _loc1_.customersUnlocked[_loc5_] = 0;
                     _loc1_.customerFirstVisit[_loc5_] = 0;
                  }
                  _loc1_.customerSeals[_loc5_] = 0;
                  _loc1_.customerStars[_loc5_] = 0;
                  _loc1_.customerVisits[_loc5_] = 0;
                  _loc1_.customerSecondOutfits[_loc5_] = 0;
                  _loc1_.customerWearing[_loc5_] = 1;
               }
               else
               {
                  class_6.error("Error with Default Customer Index: " + _loc3_.unlockArray[_loc4_].tag);
               }
            }
            _loc4_++;
         }
      }
      
      public function setupToppingIndexes() : void
      {
         var _loc1_:UserData = this;
         _loc1_.toppingIndexes = [];
         _loc1_.toppingNames = [];
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.gameObj.var_132.unlockArray.length)
         {
            if(_loc1_.gameObj.var_132.unlockArray[_loc2_].type == "topping" || _loc1_.gameObj.var_132.unlockArray[_loc2_].type == "toppingfiller")
            {
               _loc1_.toppingIndexes.push(_loc1_.gameObj.var_132.unlockArray[_loc2_].tag);
               _loc1_.toppingNames.push(_loc1_.gameObj.var_132.unlockArray[_loc2_].title);
            }
            _loc2_++;
         }
      }
      
      public function setupDefaultToppingData() : void
      {
         var _loc5_:Number = NaN;
         var _loc1_:UserData = this;
         var _loc2_:GameData = _loc1_.gameObj.var_132;
         _loc1_.toppingsUnlocked = [];
         _loc1_.toppingsRevealed = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.unlockArray.length)
         {
            if(_loc2_.unlockArray[_loc3_].type == "topping" || _loc2_.unlockArray[_loc3_].type == "toppingfiller")
            {
               if((_loc5_ = _loc1_.toppingIndexes.indexOf(_loc2_.unlockArray[_loc3_].tag)) > -1)
               {
                  if(_loc2_.unlockArray[_loc3_].rank == 0 && _loc2_.unlockArray[_loc3_].type == "topping")
                  {
                     _loc1_.toppingsUnlocked[_loc5_] = 1;
                     _loc1_.toppingsRevealed[_loc5_] = 1;
                  }
                  else
                  {
                     _loc1_.toppingsUnlocked[_loc5_] = 0;
                     _loc1_.toppingsRevealed[_loc5_] = 0;
                  }
               }
               else
               {
                  class_6.error("Error with default topping index: " + _loc2_.unlockArray[_loc3_].tag);
               }
            }
            _loc3_++;
         }
         _loc1_.gameObj.var_136.recordUnlockTopping();
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.trainingFlagNames.length)
         {
            _loc1_.trainingFlags.push(0);
            _loc4_++;
         }
      }
      
      public function getMinRankForMonth(param1:Number) : Number
      {
         param1 -= GameData.STARTER_MONTH - 1;
         if(param1 < 1)
         {
            param1 += 12;
         }
         else if(param1 == 1)
         {
            param1 += 12;
         }
         return 1 + (param1 - 1) * 5;
      }
      
      public function getRank() : Number
      {
         var _loc1_:UserData = this;
         return _loc1_.myRank;
      }
      
      public function getRankTitle(param1:Number = -1) : String
      {
         var _loc2_:UserData = this;
         var _loc3_:String = "???";
         var _loc4_:Number = _loc2_.myRank;
         if(param1 > -1)
         {
            _loc4_ = param1;
         }
         if(_loc2_.rankTitles.length > _loc4_)
         {
            _loc3_ = String(_loc2_.rankTitles[_loc4_]);
         }
         else
         {
            _loc3_ = String(_loc2_.rankTitles[_loc2_.rankTitles.length - 1]);
         }
         return _loc3_;
      }
      
      public function getMeterAward(param1:String, param2:Boolean = false) : *
      {
         var _loc4_:* = undefined;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:String = null;
         var _loc9_:String = null;
         this;
         var _loc5_:Number = 0;
         if(param1 == "awesome")
         {
            _loc5_ = 100;
         }
         else if(param1 == "great")
         {
            _loc5_ = 50;
         }
         else if(param1 == "good")
         {
            _loc5_ = 25;
         }
         if(param2)
         {
            _loc6_ = Math.floor(_loc5_ / 100);
            _loc7_ = _loc5_ - _loc6_ * 100;
            if((_loc8_ = String(_loc7_)).length < 2)
            {
               _loc8_ = "0" + _loc8_;
            }
            _loc9_ = class_12.method_114(_loc6_);
            _loc4_ = "$" + _loc9_ + "." + _loc8_;
         }
         else
         {
            _loc4_ = _loc5_;
         }
         return _loc4_;
      }
      
      public function getWeeklyWage(param1:Boolean = false) : *
      {
         var _loc3_:* = undefined;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc2_:UserData = this;
         var _loc4_:Number = _loc2_.baseWeeklyWage + _loc2_.wageIncreasePerRank * (_loc2_.myRank - 1);
         if(param1)
         {
            _loc5_ = Math.floor(_loc4_ / 100);
            _loc6_ = _loc4_ - _loc5_ * 100;
            if((_loc7_ = String(_loc6_)).length < 2)
            {
               _loc7_ = "0" + _loc7_;
            }
            _loc8_ = class_12.method_114(_loc5_);
            _loc3_ = "$" + _loc8_ + "." + _loc7_;
         }
         else
         {
            _loc3_ = _loc4_;
         }
         return _loc3_;
      }
      
      public function getPaydayMessage(param1:Boolean = false) : String
      {
         var _loc2_:UserData = this;
         var _loc3_:* = "";
         var _loc4_:Number;
         if((_loc4_ = 7 - _loc2_.currentDay % 7) == 0 || _loc4_ == 7)
         {
            if(param1)
            {
               _loc3_ = "Payday! " + _loc2_.getWeeklyWage(true);
            }
            else
            {
               _loc3_ = "Payday Today!";
            }
         }
         else if(_loc4_ == 1)
         {
            _loc3_ = "Payday in 1 Day!";
         }
         else
         {
            _loc3_ = "Payday in " + _loc4_ + " Days!";
         }
         return _loc3_;
      }
      
      public function isPayday() : Boolean
      {
         var _loc1_:UserData = this;
         var _loc2_:Number = _loc1_.currentDay % 7;
         if(_loc2_ == 0)
         {
            return true;
         }
         return false;
      }
      
      public function alreadyEarnedCustomer(param1:Number) : Boolean
      {
         var _loc2_:UserData = this;
         if(_loc2_.customersUnlocked.length > param1 && _loc2_.customersUnlocked[param1] == 1 && _loc2_.customerFirstVisit.length > param1 && _loc2_.customerFirstVisit[param1] > 0)
         {
            return true;
         }
         return false;
      }
      
      public function getCustomerStars(param1:Number) : Number
      {
         var _loc2_:UserData = this;
         if(_loc2_.customerStars.length > param1)
         {
            if(_loc2_.customerStars[param1] >= 5)
            {
               return 0;
            }
            return _loc2_.customerStars[param1];
         }
         return 0;
      }
      
      public function getCustomerSeal(param1:Number) : Number
      {
         var _loc2_:UserData = this;
         if(_loc2_.customerSeals.length > param1)
         {
            return _loc2_.customerSeals[param1];
         }
         return 0;
      }
      
      public function getCustomerFirstDay(param1:Number) : Number
      {
         var _loc2_:UserData = this;
         if(_loc2_.customerFirstVisit.length > param1)
         {
            return _loc2_.customerFirstVisit[param1];
         }
         return 0;
      }
      
      public function getCustomerTotalOrders(param1:Number) : Number
      {
         var _loc2_:UserData = this;
         if(_loc2_.customerVisits.length > param1)
         {
            return _loc2_.customerVisits[param1];
         }
         return 0;
      }
      
      public function earnCustomerStar(param1:Number, param2:Number) : void
      {
         var _loc3_:UserData = this;
         _loc3_.customerStars[param1] = param2;
      }
      
      public function earnCustomerSeal(param1:Number, param2:Number) : void
      {
         var _loc3_:UserData = this;
         _loc3_.customerSeals[param1] = param2;
         _loc3_.gameObj.var_136.recordCustomerSeal(param2);
      }
      
      public function hasAlternateOutfit(param1:Number) : Boolean
      {
         var _loc2_:UserData = this;
         if(_loc2_.customerSecondOutfits.length > param1 && _loc2_.customerSecondOutfits[param1] == 1)
         {
            return true;
         }
         return false;
      }
      
      public function unlockAlternateOutfit(param1:Number) : void
      {
         var _loc2_:UserData = this;
         _loc2_.customerSecondOutfits[param1] = 1;
         _loc2_.gameObj.var_136.recordCustomerOutfit(_loc2_.gameObj.var_131.getCustomerName(param1));
      }
      
      public function setWearingOutfit(param1:Number, param2:Number) : void
      {
         var _loc3_:UserData = this;
         _loc3_.customerWearing[param1] = Math.max(1,param2);
      }
      
      public function getWearingOutfit(param1:Number) : Number
      {
         var _loc4_:Number = NaN;
         var _loc2_:UserData = this;
         var _loc3_:Number = 1;
         if(_loc2_.customerWearing.length > param1)
         {
            if(((_loc4_ = Number(_loc2_.customerWearing[param1])) == 2 || _loc4_ == 4) && _loc2_.hasAlternateOutfit(param1) == false)
            {
               class_6.error(param1 + " -- Trying to get Outfit #2, but you don\'t own it!  Stick to the default.");
               _loc3_ = 1;
            }
            else
            {
               _loc3_ = _loc4_;
            }
         }
         return _loc3_;
      }
      
      public function canWearHoliday(param1:Number) : Boolean
      {
         var _loc2_:UserData = this;
         var _loc3_:Number = _loc2_.getWearingOutfit(param1);
         if(_loc3_ == 1 || _loc3_ == 2)
         {
            return true;
         }
         return false;
      }
      
      public function isWearingAlternate(param1:Number) : Boolean
      {
         var _loc2_:UserData = this;
         var _loc3_:Number = _loc2_.getWearingOutfit(param1);
         if(_loc3_ == 2 || _loc3_ == 4)
         {
            return true;
         }
         return false;
      }
      
      public function earnBlueRibbon() : void
      {
         var _loc1_:UserData = this;
         _loc1_.lastRibbon = _loc1_.currentDay;
         _loc1_.gameObj.var_136.recordRibbon();
      }
      
      public function hasRibbon() : Boolean
      {
         var _loc1_:UserData = this;
         var _loc2_:Boolean = false;
         if(_loc1_.lastRibbon > 0 && _loc1_.currentDay <= _loc1_.lastRibbon + _loc1_.ribbonDaysActive)
         {
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function clearScoresForToday() : void
      {
         var _loc1_:UserData = this;
         _loc1_.todayBuildScore = 0;
         _loc1_.todayCookScore = 0;
         _loc1_.todayTeaScore = 0;
         _loc1_.todayWaitScore = 0;
         _loc1_.todayScore = 0;
         _loc1_.todayTips = 0;
         _loc1_.todayTickets = 0;
         _loc1_.todayNaturalTickets = 0;
         _loc1_.todayCustomers = 0;
         _loc1_.todayMeterTopping = 0;
      }
      
      public function addToCustomersToday(param1:Number) : void
      {
         var _loc2_:UserData = this;
         ++_loc2_.todayCustomers;
         if(_loc2_.customersUnlocked[param1] == 0)
         {
            _loc2_.customersUnlocked[param1] = 1;
         }
         if(_loc2_.customerFirstVisit[param1] == 0 || _loc2_.customerVisits[param1] == 0)
         {
            _loc2_.customerFirstVisit[param1] = _loc2_.currentDay;
         }
      }
      
      public function recordCustomerVisit(param1:Number) : void
      {
         var _loc2_:UserData = this;
         ++_loc2_.customerVisits[param1];
      }
      
      public function addToDailyScore(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number = 0) : void
      {
         var _loc8_:UserData = this;
         _loc8_.todayWaitScore += param1;
         _loc8_.todayCookScore += param2;
         _loc8_.todayBuildScore += param3;
         _loc8_.todayTeaScore += param4;
         _loc8_.todayScore += param5;
         _loc8_.todayTips += param6;
         _loc8_.todayTickets += param7;
         _loc8_.todayNaturalTickets += param7;
      }
      
      public function earnExtraDailyTicket(param1:Number = 1, param2:Boolean = false) : void
      {
         var _loc3_:UserData = this;
         _loc3_.todayTickets += param1;
         if(param2 == false)
         {
            _loc3_.todayNaturalTickets += param1;
         }
      }
      
      public function getTodayWaitingAverage() : Number
      {
         var _loc1_:UserData = this;
         return Math.floor(_loc1_.todayWaitScore / _loc1_.todayCustomers);
      }
      
      public function getTodayTeaAverage() : Number
      {
         var _loc1_:UserData = this;
         return Math.floor(_loc1_.todayTeaScore / _loc1_.todayCustomers);
      }
      
      public function getTodayBuildAverage() : Number
      {
         var _loc1_:UserData = this;
         return Math.floor(_loc1_.todayBuildScore / _loc1_.todayCustomers);
      }
      
      public function getTodayCookAverage() : Number
      {
         var _loc1_:UserData = this;
         return Math.floor(_loc1_.todayCookScore / _loc1_.todayCustomers);
      }
      
      public function getTodayTotalAverage() : Number
      {
         var _loc1_:UserData = this;
         return Math.floor((_loc1_.getTodayWaitingAverage() + _loc1_.getTodayBuildAverage() + _loc1_.getTodayCookAverage() + _loc1_.getTodayTeaAverage()) / 4);
      }
      
      public function getCurrentPercentQuality(param1:Number) : Number
      {
         var _loc2_:UserData = this;
         var _loc3_:Number = _loc2_.todayWaitScore / param1;
         var _loc4_:Number = _loc2_.todayCookScore / param1;
         var _loc5_:Number = _loc2_.todayBuildScore / param1;
         var _loc6_:Number = _loc2_.todayTeaScore / param1;
         return Math.floor((_loc3_ + _loc5_ + _loc4_ + _loc6_) / 4);
      }
      
      public function getTodayTotalScore() : Number
      {
         var _loc1_:UserData = this;
         return _loc1_.todayScore;
      }
      
      public function getTotalPoints(param1:Boolean = false) : Number
      {
         var _loc2_:UserData = this;
         var _loc3_:Number = _loc2_.totalScore;
         if(param1)
         {
            _loc3_ += _loc2_.todayScore;
         }
         return _loc3_;
      }
      
      public function getTipsToday(param1:Boolean = false) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc2_:UserData = this;
         if(param1)
         {
            _loc4_ = _loc2_.todayTips;
            _loc5_ = Math.floor(_loc4_ / 100);
            _loc6_ = _loc4_ - _loc5_ * 100;
            if((_loc7_ = String(_loc6_)).length < 2)
            {
               _loc7_ = "0" + _loc7_;
            }
            _loc8_ = class_12.method_114(_loc5_);
            _loc3_ = "$" + _loc8_ + "." + _loc7_;
         }
         else
         {
            _loc3_ = _loc2_.todayTips;
         }
         return _loc3_;
      }
      
      public function getTipsTotal(param1:Boolean = false, param2:Boolean = false) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc3_:UserData = this;
         if(param1)
         {
            _loc5_ = _loc3_.totalTips;
            if(param2)
            {
               _loc5_ += _loc3_.todayTips;
            }
            _loc6_ = Math.floor(_loc5_ / 100);
            _loc7_ = _loc5_ - _loc6_ * 100;
            if((_loc8_ = String(_loc7_)).length < 2)
            {
               _loc8_ = "0" + _loc8_;
            }
            _loc9_ = class_12.method_114(_loc6_);
            _loc4_ = "$" + _loc9_ + "." + _loc8_;
         }
         else
         {
            _loc4_ = _loc3_.totalTips;
            if(param2)
            {
               _loc4_ += _loc3_.todayTips;
            }
         }
         return _loc4_;
      }
      
      public function getTicketsTotal(param1:Boolean = false) : Number
      {
         var _loc2_:UserData = this;
         var _loc3_:Number = _loc2_.totalTickets;
         if(param1)
         {
            _loc3_ += _loc2_.todayTickets;
         }
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         return _loc3_;
      }
      
      public function useTicket(param1:Number) : void
      {
         var _loc2_:UserData = this;
         _loc2_.totalTickets -= param1;
         if(_loc2_.totalTickets < 0)
         {
            _loc2_.totalTickets = 0;
         }
      }
      
      public function saveScores() : Number
      {
         var _loc1_:UserData = this;
         _loc1_.totalScore += _loc1_.todayScore;
         _loc1_.totalTips += _loc1_.todayTips;
         _loc1_.totalMoneyEarned += _loc1_.todayTips;
         _loc1_.totalTickets += _loc1_.todayTickets;
         _loc1_.totalTicketsEarned += _loc1_.todayTickets;
         var _loc2_:Number = _loc1_.getNextRankLimit();
         if(_loc1_.totalScore >= _loc2_)
         {
            ++_loc1_.myRank;
            _loc1_.lastRankLimit = _loc2_;
            _loc1_.gameObj.var_136.recordRank(_loc1_.myRank);
            _loc1_.unlockCustomerAndTopping(true);
         }
         else
         {
            _loc1_.unlockCustomerAndTopping(false);
         }
         _loc1_.updateFurniFreshness();
         if(_loc1_.couponCustomer > -1 && _loc1_.couponDay <= _loc1_.currentDay)
         {
            _loc1_.couponCustomer = -1;
         }
         ++_loc1_.currentDay;
         _loc1_.clearScoresForToday();
         _loc1_.saveData();
         return _loc1_.myRank;
      }
      
      private function unlockCustomerAndTopping(param1:Boolean = false, param2:Boolean = false) : void
      {
         var _loc6_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:* = null;
         var _loc13_:Number = NaN;
         var _loc3_:UserData = this;
         var _loc4_:Vector.<UnlockData> = null;
         var _loc5_:Boolean = false;
         if(param1)
         {
            _loc4_ = _loc3_.gameObj.var_132.getUnlocksAtRank(_loc3_.myRank);
            class_6.info("Unlocks at Rank " + _loc3_.myRank + ": " + _loc4_.length);
            if(_loc4_.length == 0)
            {
               _loc4_ = _loc3_.gameObj.var_132.getUnlocksAtRank(_loc3_.myRank,true);
               _loc5_ = true;
               class_6.info("Possible Fillers: " + _loc4_.length);
            }
         }
         else if(_loc3_.currentDay == 1)
         {
            _loc4_ = _loc3_.gameObj.var_132.getUnlocksAtRank(1);
            class_6.info("Unlocks at Day Two: " + _loc4_.length);
         }
         else
         {
            _loc4_ = _loc3_.gameObj.var_132.getUnlocksAtRank(_loc3_.myRank,true);
            _loc5_ = true;
            class_6.info("Possible Fillers: " + _loc4_.length);
         }
         if(_loc4_ != null && _loc4_.length > 0)
         {
            if(_loc5_ == false)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc4_.length)
               {
                  if(_loc4_[_loc6_].type == "customer")
                  {
                     if((_loc9_ = _loc3_.gameObj.var_131.getCustomerIndex(_loc4_[_loc6_].tag)) > -1)
                     {
                        _loc3_.customersUnlocked[_loc9_] = 1;
                        if(param2)
                        {
                           _loc3_.customerFirstVisit[_loc9_] = _loc3_.currentDay;
                           _loc3_.customerVisits[_loc9_] = 1;
                        }
                        if(_loc3_.gameObj.var_131.getCustomerClipName(_loc9_) == "Santa")
                        {
                           class_6.method_1("Santa Starts with Silver");
                           _loc3_.customerSeals[_loc9_] = 2;
                        }
                        class_6.method_1("Unlock " + _loc4_[_loc6_].tag + " (" + _loc9_ + ")");
                     }
                     else
                     {
                        class_6.error("Could not find customer data for unlocking: " + _loc4_[_loc6_].tag);
                     }
                  }
                  else if(_loc4_[_loc6_].type == "topping")
                  {
                     if((_loc10_ = _loc3_.toppingIndexes.indexOf(_loc4_[_loc6_].tag)) > -1)
                     {
                        _loc3_.toppingsUnlocked[_loc10_] = 1;
                        if(param2)
                        {
                           _loc3_.toppingsRevealed[_loc10_] = 1;
                        }
                        class_6.method_1("Unlock " + _loc4_[_loc6_].tag + " (" + _loc10_ + ")");
                     }
                     else
                     {
                        class_6.error("Cound not find topping index for unlocking:" + _loc4_[_loc6_].tag);
                     }
                  }
                  _loc6_++;
               }
            }
            else
            {
               _loc6_ = 0;
               while(_loc6_ < _loc4_.length)
               {
                  if((_loc11_ = _loc3_.gameObj.var_131.getCustomerIndex(_loc4_[_loc6_].tag)) > -1)
                  {
                     if(_loc3_.customersUnlocked[_loc11_] == 0)
                     {
                        _loc3_.customersUnlocked[_loc11_] = 1;
                        if(param2)
                        {
                           _loc3_.customerFirstVisit[_loc11_] = _loc3_.currentDay;
                           _loc3_.customerVisits[_loc11_] = 1;
                        }
                        if(_loc3_.gameObj.var_131.getCustomerClipName(_loc11_) == "Santa")
                        {
                           class_6.method_1("Santa Starts with Silver");
                           _loc3_.customerSeals[_loc11_] = 2;
                        }
                        class_6.method_1("Unlock Filler: " + _loc4_[_loc6_].tag + " (" + _loc11_ + ")");
                        break;
                     }
                  }
                  else
                  {
                     class_6.error("Could not find customer data for unlocking filler: " + _loc4_[_loc6_].tag);
                  }
                  _loc6_++;
               }
            }
         }
         _loc4_ = null;
         var _loc7_:Number = _loc3_.myRank;
         if((_loc7_ = _loc3_.myRank % (_loc3_.ranksPerMonth * 12)) == 0)
         {
            _loc7_ = _loc3_.ranksPerMonth * 12;
         }
         if(_loc3_.isNewYear() && _loc7_ <= _loc3_.ranksPerMonth)
         {
            _loc7_ += _loc3_.ranksPerMonth * 12;
         }
         _loc4_ = _loc3_.gameObj.var_132.getFillerToppingsAtRank(_loc7_,param1);
         var _loc8_:Boolean = false;
         if(_loc4_ != null && _loc4_.length > 0)
         {
            _loc12_ = "Possible Filler Toppings at Rank " + _loc3_.myRank + " (" + _loc7_ + "): ";
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               _loc12_ += _loc4_[_loc6_].tag + " (" + _loc4_[_loc6_].rank + " - " + _loc4_[_loc6_].maxRank + "), ";
               _loc6_++;
            }
            class_6.method_1(_loc12_);
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               if((_loc13_ = _loc3_.toppingIndexes.indexOf(_loc4_[_loc6_].tag)) > -1)
               {
                  if(_loc3_.toppingsUnlocked[_loc13_] == 0)
                  {
                     if(!_loc8_ || _loc4_[_loc6_].maxRank == _loc7_)
                     {
                        _loc3_.toppingsUnlocked[_loc13_] = 1;
                        if(param2)
                        {
                           _loc3_.toppingsRevealed[_loc13_] = 1;
                        }
                        class_6.method_1("Topping Filler Unlock " + _loc4_[_loc6_].tag + " (" + _loc13_ + "). Range " + _loc4_[_loc6_].rank + " - " + _loc4_[_loc6_].maxRank + ".");
                        _loc8_ = true;
                     }
                  }
               }
               else
               {
                  class_6.error("Could not find topping data for unlocking filler: " + _loc4_[_loc6_].tag);
               }
               _loc6_++;
            }
         }
      }
      
      public function saveCharacterData() : void
      {
         var _loc1_:UserData = this;
         if(_loc1_.so == null)
         {
            class_6.error("Saved data was missing for this character save.  Generating a new one.");
            _loc1_.so = SharedObject.getLocal(this.saveSlotPrefix + _loc1_.whichSlot,"/");
         }
         this.so.data.workerdata = _loc1_.gameObj.workerData.getDataToSave();
         this.so.data.waiterdata = _loc1_.gameObj.var_143.getDataToSave();
         this.so.data.waiter = _loc1_.whichWaiter;
         this.so.data.waitername = _loc1_.waiterName;
         this.so.data.didcreatewaiter = _loc1_.didCreateWaiter;
         this.so.data.playername = _loc1_.myName;
         this.so.data.hasnewclothing = _loc1_.hasNewClothing;
         this.so.data.hasnewclothingtypes = _loc1_.hasNewClothingTypes.concat();
         _loc1_.flushSaveSlot();
      }
      
      public function saveSpecialData() : void
      {
         var _loc1_:UserData = this;
         if(_loc1_.so == null)
         {
            class_6.error("Saved data was missing for this character save.  Generating a new one.");
            _loc1_.so = SharedObject.getLocal(this.saveSlotPrefix + _loc1_.whichSlot,"/");
         }
         this.so.data.specialsOwned = _loc1_.specialsOwned.concat();
         this.so.data.specialsViewed = _loc1_.specialsViewed.concat();
         this.so.data.specialsServed = _loc1_.specialsServed.concat();
         this.so.data.specialFromCustomer = _loc1_.specialFromCustomer.concat();
         this.so.data.specialStars = _loc1_.specialStars.concat();
         this.so.data.currentSpecial = _loc1_.currentSpecial;
         this.so.data.showSpecialSign = _loc1_.showSpecialSign;
         class_6.error("-- SAVING SPECIAL DATA --");
         _loc1_.flushSaveSlot();
      }
      
      public function saveData() : void
      {
         var _loc1_:UserData = this;
         if(_loc1_.so == null)
         {
            class_6.error("Saved data was missing for this save.  Generating a new one.");
            _loc1_.so = SharedObject.getLocal(this.saveSlotPrefix + _loc1_.whichSlot,"/");
         }
         this.so.data.day = _loc1_.currentDay;
         this.so.data.rank = _loc1_.myRank;
         this.so.data.tips = _loc1_.totalTips;
         this.so.data.tickets = _loc1_.totalTickets;
         this.so.data.score = _loc1_.totalScore;
         this.so.data.allmoney = _loc1_.totalMoneyEarned;
         this.so.data.alltickets = _loc1_.totalTicketsEarned;
         this.so.data.lastmonth = _loc1_.lastMonthSeen;
         this.so.data.couponcustomer = _loc1_.couponCustomer;
         this.so.data.couponday = _loc1_.couponDay;
         this.so.data.playername = _loc1_.myName;
         this.so.data.workerdata = _loc1_.gameObj.workerData.getDataToSave();
         this.so.data.waiterdata = _loc1_.gameObj.var_143.getDataToSave();
         this.so.data.waiter = _loc1_.whichWaiter;
         this.so.data.waitername = _loc1_.waiterName;
         this.so.data.didcreatewaiter = _loc1_.didCreateWaiter;
         this.so.data.unlocked = _loc1_.customersUnlocked.concat();
         this.so.data.stars = _loc1_.customerStars.concat();
         this.so.data.seals = _loc1_.customerSeals.concat();
         this.so.data.visits = _loc1_.customerVisits.concat();
         this.so.data.first = _loc1_.customerFirstVisit.concat();
         this.so.data.outfits = _loc1_.customerSecondOutfits.concat();
         this.so.data.wearing = _loc1_.customerWearing.concat();
         this.so.data.bonuses = _loc1_.bonusUpgrades.concat();
         this.so.data.ribbon = _loc1_.lastRibbon;
         this.so.data.coupons = _loc1_.numCoupons;
         this.so.data.inventory = class_16.method_124(_loc1_.furniInventory);
         this.so.data.lobby = class_16.method_124(_loc1_.lobbyPlacement);
         this.so.data.wallpaper = _loc1_.lobbyWallpaper;
         this.so.data.flooring = _loc1_.lobbyFlooring;
         this.so.data.lobbytrim = _loc1_.lobbyTrim;
         this.so.data.lobbytop = _loc1_.lobbyTop;
         this.so.data.furnisorting = _loc1_.furniSorting;
         this.so.data.clothinginventory = _loc1_.clothingInventory.concat();
         this.so.data.hasnewclothing = _loc1_.hasNewClothing;
         this.so.data.hasnewclothingtypes = _loc1_.hasNewClothingTypes.concat();
         this.so.data.hasnewfurni = _loc1_.hasNewFurni;
         this.so.data.toppings = _loc1_.toppingsUnlocked.concat();
         this.so.data.toppingsrevealed = _loc1_.toppingsRevealed.concat();
         this.so.data.medalsEarned = _loc1_.medalsEarned.concat();
         this.so.data.medalProgress = _loc1_.gameObj.var_136.getMedalProgressArray();
         this.so.data.medalsViewed = _loc1_.medalsViewed.concat();
         this.so.data.minigamesPlayed = _loc1_.minigamesPlayed.concat();
         this.so.data.minigamePrizes = _loc1_.minigamePrizes.concat();
         this.so.data.version = _loc1_.saveSlotVersion;
         this.so.data.continuedgame = _loc1_.hasContinuedGame;
         this.so.data.visitedshop = _loc1_.hasVisitedUpgradeShop;
         this.so.data.visitedbadges = _loc1_.hasVisitedBadgesScreen;
         this.so.data.visitedlobby = _loc1_.hasVisitedLobbyEditor;
         this.so.data.placedfurni = _loc1_.hasPlacedFurniture;
         this.so.data.shownparade = _loc1_.didShowParade;
         this.so.data.floatsparade = _loc1_.seenFloatsInParade;
         this.so.data.clicktwitter = _loc1_.didClickTwitter;
         this.so.data.clickfacebook = _loc1_.didClickFacebook;
         this.so.data.trainingflags = _loc1_.trainingFlags.concat();
         this.so.data.specialsOwned = _loc1_.specialsOwned.concat();
         this.so.data.specialsViewed = _loc1_.specialsViewed.concat();
         this.so.data.specialsServed = _loc1_.specialsServed.concat();
         this.so.data.specialFromCustomer = _loc1_.specialFromCustomer.concat();
         this.so.data.specialStars = _loc1_.specialStars.concat();
         this.so.data.currentSpecial = _loc1_.currentSpecial;
         this.so.data.lastDaySpecialEarned = _loc1_.lastDaySpecialEarned;
         this.so.data.showSpecialSign = _loc1_.showSpecialSign;
         _loc1_.flushSaveSlot();
         _loc1_.gameObj.var_130.method_156();
      }
      
      public function saveAfterBadge() : void
      {
      }
      
      public function purchaseBonus(param1:String, param2:Boolean = false) : Boolean
      {
         var _loc3_:UserData = this;
         var _loc5_:Upgrade;
         var _loc4_:GameData;
         var _loc6_:Number = (_loc5_ = (_loc4_ = _loc3_.gameObj.var_132).getUpgradeFromTag(param1)).price;
         if(_loc3_.totalTips >= _loc6_)
         {
            if(_loc3_.bonusUpgrades.indexOf(param1) == -1)
            {
               _loc3_.bonusUpgrades.push(param1);
            }
            _loc3_.totalTips -= _loc6_;
            _loc3_.gameObj.var_136.recordUpgrade(_loc5_.tag);
            _loc3_.gameObj.var_136.recordPurchase("upgrade");
            if(param1 == "coupon")
            {
               _loc3_.numCoupons += 1;
            }
            if(!param2)
            {
               _loc3_.saveData();
            }
            return true;
         }
         return false;
      }
      
      public function recordMinigamePlayed(param1:Number) : void
      {
         var _loc2_:UserData = this;
         if(param1 > -1)
         {
            ++_loc2_.minigamesPlayed[param1];
            _loc2_.gameObj.var_136.recordPlayingMinigame();
         }
      }
      
      public function earnMinigameFurniture(param1:String, param2:Number = -1, param3:Boolean = false) : void
      {
         var _loc5_:GameData;
         var _loc4_:UserData;
         var _loc6_:FurniData = (_loc5_ = (_loc4_ = this).gameObj.var_132).getFurniFromTag(param1);
         var _loc7_:Number;
         if((_loc7_ = _loc4_.getExistingFurniIndex(_loc6_.tag)) > -1)
         {
            _loc4_.furniInventory[_loc7_][1] += 1;
         }
         else
         {
            _loc4_.furniInventory.push([_loc6_.tag,1,0,1,0]);
         }
         if(param3 == false)
         {
            if(param2 > -1)
            {
               ++_loc4_.minigamePrizes[param2];
            }
            _loc4_.gameObj.var_136.recordEarningPrize();
         }
         else
         {
            _loc4_.gameObj.var_136.recordEarningSpecialPrize();
         }
         _loc4_.hasNewFurni = true;
         if(!param3)
         {
            _loc4_.saveData();
         }
      }
      
      public function earnMinigameClothing(param1:String, param2:Number = -1, param3:Boolean = false) : void
      {
         var _loc5_:ClothingData;
         var _loc4_:UserData;
         var _loc6_:ClothingItem = (_loc5_ = (_loc4_ = this).gameObj.var_134).getItemFromSKU(param1);
         if(_loc4_.clothingInventory.indexOf(param1) == -1)
         {
            _loc4_.clothingInventory.push(param1);
         }
         if(param3 == false)
         {
            if(param2 > -1)
            {
               ++_loc4_.minigamePrizes[param2];
            }
            _loc4_.gameObj.var_136.recordEarningPrize();
         }
         else
         {
            _loc4_.gameObj.var_136.recordEarningSpecialPrize();
         }
         _loc4_.hasNewClothing = true;
         _loc4_.addNewClothingFlag(_loc6_.type);
         if(!param3)
         {
            _loc4_.saveData();
         }
      }
      
      public function addNewClothingFlag(param1:String) : void
      {
         var _loc2_:UserData = this;
         if(_loc2_.hasNewClothingTypes.indexOf(param1) == -1)
         {
            _loc2_.hasNewClothingTypes.push(param1);
         }
      }
      
      public function removeNewClothingFlag(param1:String) : void
      {
         var _loc2_:UserData = this;
         var _loc3_:Number = _loc2_.hasNewClothingTypes.indexOf(param1);
         if(_loc3_ > -1)
         {
            _loc2_.hasNewClothingTypes.splice(_loc3_,1);
         }
      }
      
      public function hasNewClothingFlag(param1:String) : Boolean
      {
         var _loc2_:UserData = this;
         if(_loc2_.hasNewClothingTypes.indexOf(param1) == -1)
         {
            return false;
         }
         return true;
      }
      
      public function earnMinigameTips(param1:Number) : void
      {
         var _loc2_:UserData = this;
         _loc2_.totalTips += param1;
         _loc2_.saveData();
      }
      
      public function earnMinigameTickets(param1:Number) : void
      {
         var _loc2_:UserData = this;
         _loc2_.totalTickets += param1;
         _loc2_.saveData();
      }
      
      public function getClothingHolidaySpirit(param1:Boolean = false) : Number
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:WorkerData = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc14_:Array = null;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:ClothingItem = null;
         var _loc24_:Array = null;
         var _loc25_:Boolean = false;
         var _loc26_:Array = null;
         var _loc27_:Array = null;
         var _loc28_:Array = null;
         var _loc29_:Array = null;
         var _loc30_:Array = null;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Array = null;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc2_:UserData = this;
         var _loc3_:ClothingData = _loc2_.gameObj.var_134;
         var _loc4_:Number = 0;
         var _loc5_:Number = _loc2_.getHolidayMonth();
         class_6.method_1("Get Holiday Spirit: >>>>>");
         if(_loc5_ > 0)
         {
            _loc8_ = _loc2_.gameObj.workerData;
            if(param1)
            {
               _loc8_ = _loc2_.gameObj.var_143;
            }
            _loc9_ = _loc3_.getHolidayPalette(_loc5_);
            _loc10_ = [];
            _loc6_ = 0;
            while(_loc6_ < _loc9_.length)
            {
               _loc10_.push(0);
               _loc6_++;
            }
            _loc11_ = [];
            _loc12_ = [];
            _loc13_ = [];
            _loc14_ = [];
            _loc15_ = 0;
            _loc16_ = 0;
            _loc17_ = [];
            _loc18_ = [];
            _loc19_ = [];
            _loc20_ = [];
            _loc17_.push(_loc8_.shirt);
            _loc17_.push(_loc8_.pants);
            _loc17_.push(_loc8_.shoes);
            _loc18_.push("shirt","pants","shoes");
            if(_loc8_.hat != "" && _loc8_.hat != null)
            {
               _loc17_.push(_loc8_.hat);
               _loc18_.push("hat");
            }
            if(_loc8_.accb != "" && _loc8_.accb != null)
            {
               _loc17_.push(_loc8_.accb);
               _loc18_.push("accb");
            }
            if(_loc8_.jacket != "" && _loc8_.jacket != null)
            {
               _loc17_.push(_loc8_.jacket);
               _loc18_.push("jacket");
            }
            if(_loc8_.accd != "" && _loc8_.accd != null)
            {
               _loc17_.push(_loc8_.accd);
               _loc18_.push("accd");
            }
            if(_loc8_.accc != "" && _loc8_.accc != null)
            {
               _loc17_.push(_loc8_.accc);
               _loc18_.push("accc");
            }
            if(_loc8_.acca != "" && _loc8_.acca != null)
            {
               _loc17_.push(_loc8_.acca);
               _loc18_.push("acca");
            }
            _loc6_ = 0;
            while(_loc6_ < _loc17_.length)
            {
               _loc19_.push(0);
               _loc20_.push(false);
               _loc6_++;
            }
            _loc6_ = 0;
            while(_loc6_ < _loc17_.length)
            {
               _loc23_ = _loc3_.getItemFromSKU(_loc17_[_loc6_]);
               _loc24_ = _loc3_.getAllColorsFromSKU(_loc17_[_loc6_]);
               _loc25_ = false;
               if(_loc23_.isTinting() && _loc23_.tintHolidayBonus == _loc5_)
               {
                  _loc16_++;
                  _loc25_ = true;
               }
               else if(!_loc23_.isTinting() && _loc23_.holidayBonus == _loc5_)
               {
                  _loc15_++;
                  _loc25_ = true;
               }
               if(_loc23_.isTinting() == false && _loc23_.limitColor1 != null && _loc23_.limitColor1.length > 0)
               {
                  class_6.method_1("  >>  Non-Tinting Item - " + _loc23_.tag + " - contains color data: " + _loc23_.limitColor1.toString());
                  _loc24_ = _loc23_.limitColor1.concat();
               }
               _loc26_ = [];
               _loc27_ = [];
               _loc28_ = [];
               _loc29_ = [];
               _loc30_ = [];
               _loc7_ = 0;
               while(_loc7_ < _loc9_.length)
               {
                  _loc26_.push(0);
                  _loc7_++;
               }
               _loc7_ = 0;
               while(_loc7_ < _loc24_.length)
               {
                  if(_loc24_[_loc7_] != int.MIN_VALUE)
                  {
                     if(!_loc23_.isMinorColor(_loc7_ + 1))
                     {
                        if(_loc9_.indexOf(_loc24_[_loc7_]) > -1)
                        {
                           if(_loc24_[_loc7_] == ClothingItem.TINT_BLACK || _loc24_[_loc7_] == ClothingItem.TINT_WHITE)
                           {
                           }
                           ++_loc10_[_loc9_.indexOf(_loc24_[_loc7_])];
                           ++_loc26_[_loc9_.indexOf(_loc24_[_loc7_])];
                        }
                        else if(_loc3_.neutralPalette.indexOf(_loc24_[_loc7_]) > -1)
                        {
                           if(_loc13_.indexOf(_loc24_[_loc7_]) == -1)
                           {
                              _loc13_.push(_loc24_[_loc7_]);
                              _loc14_.push(1);
                           }
                           else
                           {
                              ++_loc14_[_loc13_.indexOf(_loc24_[_loc7_])];
                           }
                           if(_loc27_.indexOf(_loc24_[_loc7_]) == -1)
                           {
                              _loc27_.push(_loc24_[_loc7_]);
                              _loc28_.push(1);
                           }
                           else
                           {
                              ++_loc28_[_loc27_.indexOf(_loc24_[_loc7_])];
                           }
                        }
                        else if(!_loc23_.isMinorColor(_loc7_ + 1))
                        {
                           if(_loc11_.indexOf(_loc24_[_loc7_]) == -1)
                           {
                              _loc11_.push(_loc24_[_loc7_]);
                              _loc12_.push(1);
                           }
                           else
                           {
                              ++_loc12_[_loc11_.indexOf(_loc24_[_loc7_])];
                           }
                           if(_loc29_.indexOf(_loc24_[_loc7_]) == -1)
                           {
                              _loc29_.push(_loc24_[_loc7_]);
                              _loc30_.push(1);
                           }
                           else
                           {
                              ++_loc30_[_loc29_.indexOf(_loc24_[_loc7_])];
                           }
                        }
                     }
                  }
                  _loc7_++;
               }
               _loc31_ = 0;
               if(_loc23_.isTinting() == false)
               {
                  if(_loc25_)
                  {
                     _loc31_ = 1;
                  }
                  class_6.method_1("  >>  >>  " + _loc17_[_loc6_] + ": Score = " + _loc31_ + ". (Non-tinting)");
               }
               if(_loc23_.isTinting() || _loc24_.length > 0 && _loc31_ != 1)
               {
                  if(_loc25_)
                  {
                     _loc31_ += 0.2;
                  }
                  _loc32_ = 0;
                  _loc7_ = 0;
                  while(_loc7_ < _loc24_.length)
                  {
                     if(_loc24_[_loc7_] != int.MIN_VALUE && _loc23_.isMinorColor(_loc7_ + 1) == false && _loc24_[_loc7_] != uint.MAX_VALUE)
                     {
                        _loc32_++;
                     }
                     _loc7_++;
                  }
                  _loc33_ = 0;
                  _loc7_ = 0;
                  while(_loc7_ < _loc26_.length)
                  {
                     if(_loc26_[_loc7_] > 0)
                     {
                        _loc33_++;
                     }
                     _loc7_++;
                  }
                  _loc34_ = 0;
                  if(_loc33_ > 0)
                  {
                     if(_loc29_.length == 0)
                     {
                        _loc34_ = 1;
                     }
                     else
                     {
                        _loc34_ = Math.min(1,(_loc32_ - _loc29_.length) / _loc32_);
                     }
                  }
                  if((_loc31_ += _loc34_) > 1)
                  {
                     _loc31_ = 1;
                  }
                  else if(_loc31_ < 0)
                  {
                     _loc31_ = 0;
                  }
                  class_6.method_1("  >>  >>  " + _loc17_[_loc6_] + ": Score = " + _loc31_ + ".  Holiday Theme?: " + _loc25_ + ".  Possible Colors: " + _loc32_ + ".  Percent of colors are holiday colors?: " + _loc34_ + ".  Extra colors used: " + _loc29_.toString() + ". Item Holiday Color Uses: " + _loc26_.toString());
               }
               _loc19_[_loc6_] = _loc31_;
               _loc6_++;
            }
            _loc21_ = 0;
            _loc6_ = 0;
            while(_loc6_ < _loc10_.length)
            {
               if(_loc10_[_loc6_] > 0)
               {
                  _loc21_++;
               }
               _loc6_++;
            }
            _loc22_ = _loc21_ / _loc10_.length;
            class_6.method_1("-->>-->>--");
            class_6.method_1("  >>  Overall Percent of Total Holiday Colors That Were Used: " + (_loc21_ + " / " + _loc10_.length));
            class_6.method_1("  >>  How many holiday themed designs: " + _loc16_);
            class_6.method_1("  >>  How many holiday specific items: " + _loc15_);
            class_6.method_1("  >>  Individual Item Scores: " + _loc19_.toString());
            if(_loc21_ == 0 && 1 == 0)
            {
               if(_loc16_ > 0 || _loc15_ > 0)
               {
                  _loc4_ = Math.min(0.3,(_loc16_ + _loc15_) * 0.1);
                  class_6.method_1("  >>  No holiday colors used, but " + (_loc16_ + _loc15_) + " holiday items/designs used.  Score is " + _loc4_);
               }
               else
               {
                  _loc4_ = 0;
               }
            }
            else
            {
               _loc35_ = 0;
               _loc36_ = 0;
               _loc37_ = 0;
               _loc38_ = 0;
               _loc39_ = 0;
               _loc40_ = [];
               _loc6_ = 0;
               while(_loc6_ < _loc19_.length)
               {
                  _loc42_ = Number(_loc19_[_loc6_]);
                  if(_loc18_[_loc6_] == "acca" || _loc18_[_loc6_] == "accb" || _loc18_[_loc6_] == "accc" || _loc18_[_loc6_] == "accd")
                  {
                     if(_loc42_ != 0)
                     {
                        _loc40_.push(_loc42_);
                        _loc38_ += _loc42_;
                        _loc39_++;
                     }
                  }
                  else
                  {
                     if(_loc42_ == 0)
                     {
                        _loc36_++;
                     }
                     else
                     {
                        _loc35_ += _loc42_;
                        _loc36_++;
                     }
                     _loc37_++;
                  }
                  _loc6_++;
               }
               _loc41_ = 0;
               if(_loc36_ > 0)
               {
                  _loc41_ = _loc35_ / _loc36_;
               }
               class_6.method_1("  >>  Average of item scores that had some holiday spirit: " + _loc41_);
               _loc4_ = _loc41_;
               if(_loc39_ > 0)
               {
                  _loc6_ = 0;
                  while(_loc6_ < _loc40_.length)
                  {
                     _loc4_ += 0.025 * _loc40_[_loc6_];
                     _loc6_++;
                  }
                  class_6.method_1("  >>  Adjust Score for Accessories: " + _loc40_.toString());
                  if(_loc4_ > 1)
                  {
                     _loc4_ = 1;
                  }
               }
               if(_loc21_ == 1)
               {
                  _loc4_ *= 0.7;
                  class_6.method_1("  >>  Only one holiday color used, reduce to " + _loc4_);
               }
               if(_loc37_ - _loc36_ > 1)
               {
                  _loc4_ *= 0.85;
                  class_6.method_1("  >>  More than one non-holiday item on, reduce to " + _loc4_);
               }
               if(_loc36_ == 1)
               {
                  _loc4_ *= 0.3;
                  class_6.method_1("  >>  Only one holiday item used, reduce to " + _loc4_);
               }
               else if(_loc36_ == 2)
               {
                  _loc4_ *= 0.7;
                  class_6.method_1("  >>  Only two holiday items used, reduce to " + _loc4_);
               }
            }
            if(_loc4_ > 1)
            {
               _loc4_ = 1;
            }
            else if(_loc4_ < 0)
            {
               _loc4_ = 0;
            }
            class_6.method_1("FINAL VALUE: " + _loc4_ + " --------------------------");
         }
         return _loc4_;
      }
      
      public function getHolidayClothingItemsWorn(param1:Boolean = false) : Number
      {
         var _loc2_:UserData = this;
         var _loc3_:ClothingData = _loc2_.gameObj.var_134;
         var _loc4_:Number = 0;
         var _loc5_:Number = _loc2_.getMonth();
         var _loc6_:WorkerData = _loc2_.gameObj.workerData;
         if(param1)
         {
            _loc6_ = _loc2_.gameObj.var_143;
         }
         if(_loc3_.clothingHasHolidayBonus(_loc6_.shirt,_loc5_))
         {
            _loc4_++;
         }
         if(_loc3_.clothingHasHolidayBonus(_loc6_.pants,_loc5_))
         {
            _loc4_++;
         }
         if(_loc3_.clothingHasHolidayBonus(_loc6_.acca,_loc5_))
         {
            _loc4_++;
         }
         if(_loc3_.clothingHasHolidayBonus(_loc6_.accb,_loc5_))
         {
            _loc4_++;
         }
         if(_loc3_.clothingHasHolidayBonus(_loc6_.accc,_loc5_))
         {
            _loc4_++;
         }
         if(_loc3_.clothingHasHolidayBonus(_loc6_.accd,_loc5_))
         {
            _loc4_++;
         }
         if(_loc3_.clothingHasHolidayBonus(_loc6_.jacket,_loc5_))
         {
            _loc4_++;
         }
         if(_loc3_.clothingHasHolidayBonus(_loc6_.hat,_loc5_))
         {
            _loc4_++;
         }
         if(_loc3_.clothingHasHolidayBonus(_loc6_.shoes,_loc5_))
         {
            _loc4_++;
         }
         return _loc4_;
      }
      
      public function purchaseClothing(param1:String, param2:Boolean = false) : Boolean
      {
         var _loc3_:UserData = this;
         var _loc5_:ClothingItem;
         var _loc4_:ClothingData;
         var _loc6_:Number = (_loc5_ = (_loc4_ = _loc3_.gameObj.var_134).getItemFromSKU(param1)).price;
         if(_loc3_.totalTips >= _loc6_)
         {
            _loc3_.clothingInventory.push(param1);
            _loc3_.totalTips -= _loc6_;
            _loc3_.gameObj.var_136.recordPurchase("clothing");
            _loc3_.hasNewClothing = true;
            _loc3_.addNewClothingFlag(_loc5_.type);
            if(!param2)
            {
               _loc3_.saveData();
            }
            return true;
         }
         return false;
      }
      
      public function purchaseFurniture(param1:String, param2:Boolean = false) : Boolean
      {
         var _loc7_:Number = NaN;
         var _loc8_:String = null;
         var _loc3_:UserData = this;
         var _loc5_:FurniData;
         var _loc4_:GameData;
         var _loc6_:Number = (_loc5_ = (_loc4_ = _loc3_.gameObj.var_132).getFurniFromTag(param1)).price;
         if(_loc3_.totalTips >= _loc6_)
         {
            if((_loc7_ = _loc3_.getExistingFurniIndex(_loc5_.tag)) > -1)
            {
               _loc3_.furniInventory[_loc7_][1] += 1;
            }
            else
            {
               _loc3_.furniInventory.push([_loc5_.tag,1,0,1,0]);
            }
            _loc3_.totalTips -= _loc6_;
            if((_loc8_ = _loc5_.type) == FurniData.TYPE_FLOORING || _loc8_ == FurniData.TYPE_WALLPAPER)
            {
               _loc8_ = "wallfloor";
            }
            _loc3_.gameObj.var_136.recordPurchase(_loc8_);
            _loc3_.hasNewFurni = true;
            if(!param2)
            {
               _loc3_.saveData();
            }
            return true;
         }
         return false;
      }
      
      private function getExistingFurniIndex(param1:String) : Number
      {
         var _loc2_:UserData = this;
         var _loc3_:Number = -1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.furniInventory.length)
         {
            if(_loc2_.furniInventory[_loc4_][0] == param1)
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getFurniAmount(param1:String, param2:Boolean = false) : Number
      {
         var _loc3_:UserData = this;
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.furniInventory.length)
         {
            if(_loc3_.furniInventory[_loc5_][0] == param1)
            {
               _loc4_ = Number(_loc3_.furniInventory[_loc5_][1]);
               if(param2 == true)
               {
                  _loc4_ += _loc3_.furniInventory[_loc5_][2];
               }
               break;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function getFurniAvailable(param1:String = "any") : Array
      {
         var _loc4_:int = 0;
         var _loc5_:FurniData = null;
         var _loc6_:Array = null;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:FurniData = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:UserData = this;
         var _loc3_:Array = [];
         if(_loc2_.furniSorting == "newest")
         {
            _loc4_ = int(_loc2_.furniInventory.length - 1);
            while(_loc4_ >= 0)
            {
               if(_loc2_.furniInventory[_loc4_][1] > 0 || param1 == "wallpaper" || param1 == "flooring")
               {
                  if(param1 == "any")
                  {
                     _loc3_.push(_loc2_.furniInventory[_loc4_][0]);
                  }
                  else if((_loc5_ = _loc2_.gameObj.var_132.getFurniFromTag(_loc2_.furniInventory[_loc4_][0])) != null && _loc5_.type == param1)
                  {
                     _loc3_.push(_loc2_.furniInventory[_loc4_][0]);
                  }
               }
               _loc4_--;
            }
         }
         else if(_loc2_.furniSorting == "holiday")
         {
            _loc6_ = [[],[],[],[],[],[],[],[],[],[],[],[],[]];
            _loc4_ = int(_loc2_.furniInventory.length - 1);
            while(_loc4_ >= 0)
            {
               if(_loc2_.furniInventory[_loc4_][1] > 0 || param1 == "wallpaper" || param1 == "flooring")
               {
                  if((_loc9_ = _loc2_.gameObj.var_132.getFurniFromTag(_loc2_.furniInventory[_loc4_][0])) != null && _loc9_.type == param1)
                  {
                     if((_loc10_ = _loc2_.gameObj.var_132.themeTagsPerMonth.indexOf(_loc9_.theme)) == -1)
                     {
                        _loc6_[0].push(_loc2_.furniInventory[_loc4_][0]);
                     }
                     else
                     {
                        _loc6_[_loc10_].push(_loc2_.furniInventory[_loc4_][0]);
                     }
                  }
               }
               _loc4_--;
            }
            if((_loc7_ = _loc2_.getHolidayMonth()) == 0)
            {
               if((_loc7_ = _loc2_.getMonth() + 1) > 12)
               {
                  _loc7_ = 1;
               }
            }
            _loc8_ = 0;
            while(_loc8_ < _loc6_.length)
            {
               if((_loc11_ = _loc8_ + _loc7_) >= _loc6_.length)
               {
                  _loc11_ -= _loc6_.length;
               }
               _loc3_ = _loc3_.concat(_loc6_[_loc11_]);
               _loc8_++;
            }
         }
         return _loc3_;
      }
      
      public function isFurniInLobby(param1:String) : Boolean
      {
         var _loc4_:String = null;
         var _loc2_:UserData = this;
         var _loc3_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.lobbyPlacement.length)
         {
            _loc4_ = String(_loc2_.lobbyPlacement[_loc5_][0]);
            if(param1 == _loc4_)
            {
               _loc3_ = true;
               break;
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function placeFurniInLobby(param1:String, param2:Number, param3:Number) : Boolean
      {
         var _loc4_:UserData = this;
         var _loc5_:Boolean = false;
         var _loc6_:Number;
         if((_loc6_ = _loc4_.getExistingFurniIndex(param1)) > -1)
         {
            if(_loc4_.furniInventory[_loc6_][1] > 0)
            {
               _loc4_.furniInventory[_loc6_][1] = _loc4_.furniInventory[_loc6_][1] - 1;
               _loc4_.furniInventory[_loc6_][2] += 1;
               _loc4_.lobbyPlacement.push([param1,param2,param3]);
               _loc5_ = true;
            }
         }
         return _loc5_;
      }
      
      public function placeFlooringInLobby(param1:String, param2:Number) : Boolean
      {
         var ob:UserData = null;
         var i:int = 0;
         var previousFlooring:Number = NaN;
         var didRemove:Boolean = false;
         var tag:String = param1;
         var num:Number = param2;
         ob = this;
         var success:Boolean = false;
         previousFlooring = ob.lobbyFlooring;
         try
         {
            didRemove = false;
            i = 0;
            while(i < ob.furniInventory.length)
            {
               if(ob.furniInventory[i][0] == "floor" + previousFlooring)
               {
                  ob.furniInventory[i][1] = 1;
                  ob.furniInventory[i][2] = 0;
                  didRemove = true;
                  break;
               }
               i++;
            }
            if(didRemove)
            {
               i = 0;
               while(i < ob.furniInventory.length)
               {
                  if(ob.furniInventory[i][0] == tag)
                  {
                     ob.furniInventory[i][1] = 0;
                     ob.furniInventory[i][2] = 1;
                     break;
                  }
                  i++;
               }
               ob.lobbyFlooring = num;
               success = true;
            }
         }
         catch(err:Error)
         {
            ob.lobbyFlooring = previousFlooring;
         }
         return success;
      }
      
      public function placeWallpaperInLobby(param1:String, param2:Number) : Boolean
      {
         var ob:UserData = null;
         var i:int = 0;
         var previousWallpaper:Number = NaN;
         var didRemove:Boolean = false;
         var tag:String = param1;
         var num:Number = param2;
         ob = this;
         var success:Boolean = false;
         previousWallpaper = ob.lobbyWallpaper;
         try
         {
            didRemove = false;
            i = 0;
            while(i < ob.furniInventory.length)
            {
               if(ob.furniInventory[i][0] == "wall" + previousWallpaper)
               {
                  ob.furniInventory[i][1] = 1;
                  ob.furniInventory[i][2] = 0;
                  didRemove = true;
                  break;
               }
               i++;
            }
            if(didRemove)
            {
               i = 0;
               while(i < ob.furniInventory.length)
               {
                  if(ob.furniInventory[i][0] == tag)
                  {
                     ob.furniInventory[i][1] = 0;
                     ob.furniInventory[i][2] = 1;
                     break;
                  }
                  i++;
               }
               ob.lobbyWallpaper = num;
               success = true;
            }
         }
         catch(err:Error)
         {
            ob.lobbyWallpaper = previousWallpaper;
         }
         return success;
      }
      
      public function removeFurniFromLobby(param1:String, param2:Number, param3:Number) : Boolean
      {
         var _loc7_:Number = NaN;
         var _loc4_:UserData = this;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.lobbyPlacement.length)
         {
            if(_loc4_.lobbyPlacement[_loc6_][0] == param1 && _loc4_.lobbyPlacement[_loc6_][1] == param2 && _loc4_.lobbyPlacement[_loc6_][2] == param3)
            {
               _loc4_.lobbyPlacement.splice(_loc6_,1);
               if((_loc7_ = _loc4_.getExistingFurniIndex(param1)) > -1)
               {
                  _loc4_.furniInventory[_loc7_][1] += 1;
                  _loc4_.furniInventory[_loc7_][2] = _loc4_.furniInventory[_loc7_][2] - 1;
                  _loc5_ = true;
               }
            }
            _loc6_++;
         }
         return _loc5_;
      }
      
      public function getDay() : Number
      {
         var _loc1_:UserData = this;
         return _loc1_.currentDay;
      }
      
      private function getLastRankLimit() : Number
      {
         var _loc1_:UserData = this;
         var _loc2_:Number = 0;
         var _loc3_:Number = 2;
         while(_loc3_ <= _loc1_.myRank)
         {
            if(_loc3_ < _loc1_.rankPlateauLimit)
            {
               _loc2_ += _loc3_;
            }
            else
            {
               _loc2_ += _loc1_.rankPlateauLimit;
            }
            _loc3_++;
         }
         return _loc2_ * _loc1_.rankMultiplier;
      }
      
      private function getNextRankLimit() : Number
      {
         var _loc1_:UserData = this;
         var _loc2_:Number = 0;
         var _loc3_:Number = _loc1_.getLastRankLimit();
         if(_loc1_.myRank + 1 < _loc1_.rankPlateauLimit)
         {
            _loc2_ = _loc3_ + (_loc1_.myRank + 1) * _loc1_.rankMultiplier;
         }
         else
         {
            _loc2_ = _loc3_ + _loc1_.rankPlateauLimit * _loc1_.rankMultiplier;
         }
         return _loc2_;
      }
      
      public function getPointsUntilNextRank(param1:Boolean = false) : Number
      {
         var _loc2_:UserData = this;
         var _loc3_:Number = _loc2_.getNextRankLimit();
         var _loc4_:Number = _loc3_ - _loc2_.totalScore;
         if(param1)
         {
            _loc4_ -= _loc2_.todayScore;
         }
         return _loc4_;
      }
      
      public function getCurrentPointPercentage() : Number
      {
         var _loc1_:UserData = this;
         var _loc2_:Number = _loc1_.lastRankLimit;
         var _loc3_:Number = _loc1_.getNextRankLimit();
         var _loc5_:Number;
         var _loc4_:Number;
         if((_loc5_ = ((_loc4_ = _loc1_.totalScore + _loc1_.todayScore) - _loc2_) / (_loc3_ - _loc2_)) > 1)
         {
            _loc5_ = 1;
         }
         else if(_loc5_ < 0)
         {
            _loc5_ = 0;
         }
         return _loc5_;
      }
      
      public function loadLabelsForSlot(param1:Number) : Object
      {
         var _loc2_:UserData = this;
         var _loc3_:Object = null;
         var _loc4_:SharedObject;
         if((_loc4_ = SharedObject.getLocal(this.saveSlotPrefix + param1,"/")).data.rank)
         {
            _loc3_ = {};
            if(_loc4_.data.playername)
            {
               _loc3_.name = _loc4_.data.playername;
            }
            else
            {
               _loc3_.name = "Anonymous";
            }
            _loc3_.score = _loc4_.data.score;
            _loc3_.tips = _loc4_.data.tips;
            _loc3_.rank = _loc4_.data.rank;
            _loc3_.title = _loc2_.getRankTitle(Number(_loc4_.data.rank));
            _loc3_.day = _loc4_.data.day;
            _loc3_.gold = _loc4_.data.seals.concat();
            _loc3_.stickers = _loc4_.data.medalsEarned.concat();
         }
         return _loc3_;
      }
      
      public function loadSlotDataForBackup(param1:Number) : Object
      {
         this;
         var _loc3_:Object = null;
         var _loc4_:SharedObject;
         if((_loc4_ = SharedObject.getLocal(this.saveSlotPrefix + param1,"/")).data.rank)
         {
            _loc3_ = _loc4_.data;
         }
         return _loc3_;
      }
      
      public function hasBonus(param1:String) : Boolean
      {
         var _loc2_:UserData = this;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.bonusUpgrades.length)
         {
            if(_loc2_.bonusUpgrades.length > _loc4_ && _loc2_.bonusUpgrades[_loc4_] == param1)
            {
               _loc3_ = true;
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function hasSpecial(param1:Number) : Boolean
      {
         var _loc2_:UserData = this;
         var _loc3_:Boolean = false;
         if(param1 >= 0 && param1 < _loc2_.specialsOwned.length)
         {
            if(_loc2_.specialsOwned[param1] == 1)
            {
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public function hasAllSpecialToppings(param1:Number) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:UserData = this;
         var _loc3_:Boolean = true;
         var _loc4_:SpecialItem;
         if((_loc4_ = _loc2_.gameObj.var_132.getSpecial(param1)) == null)
         {
            _loc3_ = false;
            class_6.method_1("Null Special. Forget this.");
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.ingredients.length)
            {
               if(!(_loc4_.ingredients[_loc5_] === true || _loc4_.ingredients[_loc5_] === false))
               {
                  if(_loc4_.ingredients[_loc5_] is Array)
                  {
                     if(_loc2_.hasTopping(_loc4_.ingredients[_loc5_][0]) == false)
                     {
                        _loc3_ = false;
                        class_6.method_1("Special: " + _loc4_.title + ".  You don\'t have " + _loc4_.ingredients[_loc5_][0] + ". Forget this.");
                        break;
                     }
                  }
                  else if(_loc2_.hasTopping(_loc4_.ingredients[_loc5_]) == false)
                  {
                     _loc3_ = false;
                     class_6.method_1("Special: " + _loc4_.title + ".  You don\'t have " + _loc4_.ingredients[_loc5_] + ". Forget this.");
                     break;
                  }
               }
               _loc5_++;
            }
         }
         return _loc3_;
      }
      
      public function setSpecialViewed(param1:Number) : void
      {
         var _loc2_:UserData = this;
         if(param1 >= 0 && param1 < _loc2_.specialsOwned.length)
         {
            _loc2_.specialsViewed[param1] = 1;
         }
      }
      
      public function recordSpecialServed(param1:Number) : void
      {
         var _loc2_:UserData = this;
         if(param1 >= 0 && param1 < _loc2_.specialsOwned.length)
         {
            ++_loc2_.specialsServed[param1];
         }
      }
      
      public function recordSpecialStar(param1:Number) : void
      {
         var _loc2_:UserData = this;
         if(param1 >= 0 && param1 < _loc2_.specialsOwned.length)
         {
            ++_loc2_.specialStars[param1];
         }
      }
      
      public function isSpecialViewed(param1:Number) : Boolean
      {
         var _loc2_:UserData = this;
         var _loc3_:Boolean = false;
         if(param1 >= 0 && param1 < _loc2_.specialsOwned.length)
         {
            if(_loc2_.specialsViewed[param1] == 1)
            {
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public function getSpecialStars(param1:Number) : Number
      {
         var _loc2_:UserData = this;
         var _loc3_:Number = 0;
         if(param1 >= 0 && param1 < _loc2_.specialsOwned.length)
         {
            _loc3_ = Number(_loc2_.specialStars[param1]);
         }
         return _loc3_;
      }
      
      public function getSpecialsServed(param1:Number) : Number
      {
         var _loc2_:UserData = this;
         var _loc3_:Number = 0;
         if(param1 >= 0 && param1 < _loc2_.specialsOwned.length)
         {
            _loc3_ = Number(_loc2_.specialsServed[param1]);
         }
         return _loc3_;
      }
      
      public function getSpecialCustomerName(param1:Number) : String
      {
         var _loc4_:Number = NaN;
         var _loc2_:UserData = this;
         var _loc3_:String = "???";
         if(param1 >= 0 && param1 < _loc2_.specialsOwned.length)
         {
            _loc4_ = Number(_loc2_.specialFromCustomer[param1]);
            _loc3_ = _loc2_.gameObj.var_131.getCustomerName(_loc4_);
         }
         return _loc3_;
      }
      
      public function earnSpecial(param1:Number, param2:Number) : void
      {
         var _loc3_:UserData = this;
         if(param1 >= 0 && param1 < _loc3_.specialsOwned.length)
         {
            _loc3_.specialsOwned[param1] = 1;
            _loc3_.specialFromCustomer[param1] = param2;
            _loc3_.gameObj.var_136.recordEarningSpecialRecipe();
         }
      }
      
      public function hasNewSpecials() : Boolean
      {
         var _loc1_:UserData = this;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.specialsViewed.length)
         {
            if(_loc1_.specialsOwned[_loc3_] == 1 && _loc1_.specialsViewed[_loc3_] == 0)
            {
               _loc2_ = true;
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function hasAnySpecials() : Boolean
      {
         var _loc1_:UserData = this;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.specialsOwned.length)
         {
            if(_loc1_.specialsOwned[_loc3_] == 1)
            {
               _loc2_ = true;
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function hasTopping(param1:String = null, param2:Number = -1) : Boolean
      {
         var _loc3_:UserData = this;
         var _loc4_:Boolean = false;
         var _loc5_:Number = -1;
         if(param1 != null)
         {
            _loc5_ = _loc3_.toppingIndexes.indexOf(param1);
         }
         else
         {
            _loc5_ = param2;
         }
         if(_loc5_ > -1 && _loc3_.toppingsUnlocked.length > _loc5_ && _loc3_.toppingsUnlocked[_loc5_] == 1)
         {
            _loc4_ = true;
         }
         else
         {
            _loc4_ = false;
         }
         return _loc4_;
      }
      
      public function getAvailableBonuses() : Array
      {
         var _loc1_:UserData = this;
         var _loc2_:Array = [];
         var _loc3_:int = 1;
         while(_loc3_ <= _loc1_.totalBonuses)
         {
            if(_loc1_.bonusUpgrades[_loc3_] == 0)
            {
               _loc2_.push(_loc3_);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getTotalBonuses() : Number
      {
         var _loc1_:UserData = this;
         return _loc1_.totalBonuses;
      }
      
      public function getBonusWaitOffset() : Number
      {
         var _loc5_:Number = NaN;
         var _loc6_:String = null;
         var _loc1_:UserData = this;
         var _loc2_:GameData = _loc1_.gameObj.var_132;
         var _loc3_:Number = 0;
         var _loc4_:String = "Get Bonus Wait Offset: ";
         _loc5_ = 1;
         while(_loc5_ <= _loc1_.totalBonuses)
         {
            if(_loc1_.bonusUpgrades[_loc5_] == 1)
            {
               _loc3_ += Upgrade(_loc2_.shopItems[_loc5_ - 1]).waitingOffset;
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc1_.lobbyPlacement.length)
         {
            _loc6_ = String(_loc1_.lobbyPlacement[_loc5_][0]);
            _loc3_ += _loc2_.getFurniFromTag(_loc6_).waitingOffset;
            _loc5_++;
         }
         _loc4_ += _loc3_ + ". ";
         class_6.debug(_loc4_);
         return _loc3_;
      }
      
      public function hasBonusFurniture(param1:String, param2:String) : Boolean
      {
         var _loc5_:String = null;
         var _loc6_:FurniData = null;
         var _loc3_:UserData = this;
         var _loc4_:Boolean = false;
         var _loc7_:int = 0;
         while(_loc7_ < _loc3_.lobbyPlacement.length)
         {
            _loc5_ = String(_loc3_.lobbyPlacement[_loc7_][0]);
            if(((_loc6_ = _loc3_.gameObj.var_132.getFurniFromTag(_loc5_)).special == FurniData.SPECIAL_SCORE || _loc6_.special == FurniData.SPECIAL_SCOREBUBBLEGUM) && _loc6_.scoreType == param1 && _loc6_.toppingType == param2)
            {
               _loc4_ = true;
               break;
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      public function alreadyOwnsFurniture(param1:String) : Boolean
      {
         var _loc2_:UserData = this;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.furniInventory.length)
         {
            if(_loc2_.furniInventory[_loc4_][0] == param1)
            {
               _loc3_ = true;
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function alreadyOwnsClothing(param1:String) : Boolean
      {
         var _loc2_:UserData = this;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.clothingInventory.length)
         {
            if(_loc2_.clothingInventory[_loc4_] == param1)
            {
               _loc3_ = true;
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getCustomerPool(param1:Number, param2:Boolean = false) : Array
      {
         var _loc5_:Number = NaN;
         var _loc7_:Array = null;
         var _loc8_:Number = NaN;
         var _loc3_:UserData = this;
         var _loc4_:Array = [];
         _loc5_ = 1 + _loc3_.closerCustomers;
         while(_loc5_ < _loc3_.customersUnlocked.length)
         {
            if(_loc3_.customersUnlocked[_loc5_] == 1 && _loc3_.gameObj.var_131.getCustomerInPool(_loc5_))
            {
               if(_loc3_.getCustomerSeal(_loc5_) < 3)
               {
                  if(param2 == false || _loc3_.customerVisits[_loc5_] > 0)
                  {
                     _loc4_.push(_loc5_);
                  }
               }
            }
            _loc5_++;
         }
         var _loc6_:Number;
         if((_loc6_ = param1 - _loc4_.length) > 0)
         {
            _loc7_ = [];
            _loc5_ = 1 + _loc3_.closerCustomers;
            while(_loc5_ < _loc3_.customersUnlocked.length)
            {
               if(_loc3_.customersUnlocked[_loc5_] == 1 && _loc3_.gameObj.var_131.getCustomerInPool(_loc5_))
               {
                  if(_loc4_.indexOf(_loc5_) == -1)
                  {
                     _loc7_.push(_loc5_);
                  }
               }
               _loc5_++;
            }
            while(_loc4_.length < param1 && _loc7_.length > 0)
            {
               _loc8_ = Math.floor(Math.random() * _loc7_.length);
               _loc4_.unshift(_loc7_[_loc8_]);
               _loc7_.splice(_loc8_,1);
            }
         }
         _loc4_.sort(Array.NUMERIC);
         return _loc4_;
      }
      
      public function getNewestCustomer() : Number
      {
         var _loc1_:UserData = this;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:int = 1 + _loc1_.closerCustomers;
         while(_loc4_ < _loc1_.customersUnlocked.length)
         {
            if(_loc1_.customersUnlocked[_loc4_] == 1 && _loc1_.customerFirstVisit[_loc4_] == 0)
            {
               _loc2_ = _loc4_;
               break;
            }
            if(_loc1_.customersUnlocked[_loc4_] == 1 && _loc1_.customerFirstVisit[_loc4_] > _loc3_)
            {
               _loc2_ = _loc4_;
               _loc3_ = Number(_loc1_.customerFirstVisit[_loc4_]);
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function getCloserCustomer() : Number
      {
         var _loc1_:UserData = this;
         var _loc2_:Number = _loc1_.currentDay % _loc1_.closerCustomers;
         if(_loc2_ == 0)
         {
            _loc2_ = _loc1_.closerCustomers;
         }
         return _loc2_;
      }
      
      public function getToppingToReveal() : String
      {
         var _loc1_:UserData = this;
         var _loc2_:String = "none";
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.toppingsUnlocked.length)
         {
            if(_loc1_.toppingsUnlocked[_loc3_] == 1 && _loc1_.toppingsRevealed[_loc3_] == 0)
            {
               _loc2_ = String(_loc1_.toppingIndexes[_loc3_]);
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getAllToppingsToReveal() : Array
      {
         var _loc1_:UserData = this;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.toppingsUnlocked.length)
         {
            if(_loc1_.toppingsUnlocked[_loc3_] == 1 && _loc1_.toppingsRevealed[_loc3_] == 0)
            {
               _loc2_.push(_loc1_.toppingIndexes[_loc3_]);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function rememberRevealedTopping(param1:String) : void
      {
         var _loc2_:UserData = this;
         var _loc3_:Number = _loc2_.toppingIndexes.indexOf(param1);
         if(_loc3_ > -1 && _loc3_ < _loc2_.toppingsRevealed.length)
         {
            _loc2_.toppingsRevealed[_loc3_] = 1;
         }
      }
      
      public function hasAllStickers(param1:Array) : Boolean
      {
         var _loc2_:UserData = this;
         var _loc3_:Boolean = true;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            if(_loc2_.hasBadge(_loc2_.gameObj.var_136.getChallengeIndexForSticker(param1[_loc4_])) == false)
            {
               _loc3_ = false;
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function hasViewedBadge(param1:Number) : Boolean
      {
         var _loc2_:UserData = this;
         var _loc3_:Boolean = false;
         if(_loc2_.medalsViewed.length > param1)
         {
            if(_loc2_.medalsViewed[param1] == 1)
            {
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public function setViewedBadge(param1:Number) : void
      {
         var _loc2_:UserData = this;
         _loc2_.medalsViewed[param1] = 1;
      }
      
      public function hasBadge(param1:Number) : Boolean
      {
         var _loc2_:UserData = this;
         var _loc3_:Boolean = false;
         if(_loc2_.medalsEarned.length > param1)
         {
            if(_loc2_.medalsEarned[param1] == 1)
            {
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public function earnBadge(param1:Number, param2:String = "", param3:Number = 0, param4:Number = 0) : void
      {
         var _loc5_:UserData;
         (_loc5_ = this).medalsEarned[param1] = 1;
         _loc5_.medalsViewed[param1] = 1;
         _loc5_.totalTips += param3;
         _loc5_.totalTickets += param4;
         try
         {
            _loc5_.gameObj.var_130.api.method_132("earnedSticker");
         }
         catch(err:Error)
         {
         }
      }
      
      public function getTotalBadgesEarned() : Number
      {
         var _loc1_:UserData = this;
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.medalsEarned.length)
         {
            if(_loc1_.medalsEarned[_loc3_] == 1)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getStatCustomersUnlocked() : Number
      {
         var _loc1_:UserData = this;
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.customersUnlocked.length)
         {
            if(_loc1_.customersUnlocked[_loc3_] == 1)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getStatCustomersBronze() : Number
      {
         var _loc1_:UserData = this;
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.customerSeals.length)
         {
            if(_loc1_.customerSeals[_loc3_] >= 1)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getStatCustomersSilver() : Number
      {
         var _loc1_:UserData = this;
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.customerSeals.length)
         {
            if(_loc1_.customerSeals[_loc3_] >= 2)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getStatCustomersGold() : Number
      {
         var _loc1_:UserData = this;
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.customerSeals.length)
         {
            if(_loc1_.customerSeals[_loc3_] == 3)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getStatUpgradesUnlocked() : Number
      {
         var _loc1_:UserData = this;
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.bonusUpgrades.length)
         {
            if(_loc1_.bonusUpgrades[_loc3_] == 1)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getMonth(param1:Number = -1) : Number
      {
         var _loc2_:UserData = this;
         var _loc3_:Number = 1;
         if(param1 > -1)
         {
            _loc3_ = param1;
         }
         else
         {
            _loc3_ = _loc2_.getRank();
         }
         var _loc4_:Number;
         if((_loc4_ = (_loc4_ = Math.ceil(_loc3_ / _loc2_.ranksPerMonth) - 1 + GameData.STARTER_MONTH) % 12) == 0)
         {
            _loc4_ = 12;
         }
         return _loc4_;
      }
      
      public function isNewYear(param1:Number = -1) : Boolean
      {
         var _loc2_:UserData = null;
         var _loc3_:Number = NaN;
         _loc2_ = this;
         _loc3_ = 1;
         if(param1 > -1)
         {
            _loc3_ = param1;
         }
         else
         {
            _loc3_ = _loc2_.getRank();
         }
         if(_loc3_ > _loc2_.ranksPerMonth * 12)
         {
            return true;
         }
         return false;
      }
      
      public function getHolidayMonth() : Number
      {
         var _loc1_:UserData = null;
         var _loc2_:Number = NaN;
         _loc1_ = this;
         _loc2_ = _loc1_.getMonth();
         if(_loc2_ == GameData.STARTER_MONTH && _loc1_.isNewYear() == false)
         {
            _loc2_ = 0;
         }
         return _loc2_;
      }
      
      public function isBeyondFullYear(param1:Number = -1) : Boolean
      {
         var _loc2_:UserData = null;
         var _loc3_:Number = NaN;
         _loc2_ = this;
         _loc3_ = 1;
         if(param1 > -1)
         {
            _loc3_ = param1;
         }
         else
         {
            _loc3_ = _loc2_.getRank();
         }
         if(_loc3_ > _loc2_.ranksPerMonth * 13)
         {
            return true;
         }
         return false;
      }
      
      public function getHomeTeam() : Number
      {
         var _loc1_:UserData = null;
         var _loc2_:Number = NaN;
         _loc1_ = this;
         _loc2_ = Math.ceil(_loc1_.getDay() / 7);
         return (_loc2_ - 1) % 12 + 1;
      }
      
      public function getAwayTeam() : Number
      {
         var _loc1_:UserData = null;
         var _loc2_:Number = NaN;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         _loc1_ = this;
         _loc2_ = _loc1_.getHomeTeam();
         _loc3_ = [];
         _loc4_ = 1;
         while(_loc4_ <= 12)
         {
            if(_loc4_ != _loc2_)
            {
               _loc3_.push(_loc4_);
            }
            _loc4_++;
         }
         _loc1_.setRandomSeed(_loc1_.getDay());
         _loc1_.randomize();
         _loc1_.randomize();
         _loc5_ = Math.floor(_loc1_.randomize() * _loc3_.length);
         return _loc3_[_loc5_];
      }
      
      public function getHolidayThemeThisMonth() : String
      {
         var _loc1_:UserData = null;
         var _loc2_:String = null;
         var _loc3_:Array = null;
         _loc1_ = this;
         _loc2_ = "unknown";
         _loc3_ = _loc1_.gameObj.var_132.themeTagsPerMonth;
         if(_loc1_.getMonth() < _loc3_.length)
         {
            _loc2_ = String(_loc3_[_loc1_.getMonth()]);
         }
         if(_loc1_.getMonth() == GameData.STARTER_MONTH && _loc1_.isNewYear() == false)
         {
            _loc2_ = "nothing";
         }
         return _loc2_;
      }
      
      public function getLobbyMaxPoints() : Number
      {
         var _loc1_:UserData = null;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:String = null;
         var _loc5_:FurniData = null;
         var _loc6_:FurniData = null;
         var _loc7_:FurniData = null;
         _loc1_ = this;
         _loc3_ = 0;
         _loc4_ = _loc1_.getHolidayThemeThisMonth();
         _loc2_ = 0;
         while(_loc2_ < _loc1_.lobbyPlacement.length)
         {
            _loc7_ = _loc1_.gameObj.var_132.getFurniFromTag(_loc1_.lobbyPlacement[_loc2_][0]);
            _loc3_ += _loc7_.getMaxPoints(_loc4_);
            _loc2_++;
         }
         _loc5_ = _loc1_.gameObj.var_132.getFurniFromTag("wall" + _loc1_.lobbyWallpaper);
         _loc3_ += _loc5_.getMaxPoints(_loc4_);
         _loc6_ = _loc1_.gameObj.var_132.getFurniFromTag("floor" + _loc1_.lobbyFlooring);
         return _loc3_ + _loc6_.getMaxPoints(_loc4_);
      }
      
      public function getLobbyMatchingPoints() : Number
      {
         var _loc1_:UserData = null;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:FurniData = null;
         var _loc8_:FurniData = null;
         var _loc9_:FurniData = null;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         _loc1_ = this;
         _loc3_ = 0;
         _loc4_ = _loc1_.getHolidayThemeThisMonth();
         _loc5_ = [];
         _loc6_ = [];
         _loc2_ = 0;
         while(_loc2_ < _loc1_.lobbyPlacement.length)
         {
            _loc9_ = _loc1_.gameObj.var_132.getFurniFromTag(_loc1_.lobbyPlacement[_loc2_][0]);
            if(_loc5_.indexOf(_loc9_.theme) == -1)
            {
               _loc5_.push(_loc9_.theme);
               _loc6_.push([]);
            }
            _loc6_[_loc5_.indexOf(_loc9_.theme)].push(_loc9_.getMaxPoints(_loc4_));
            _loc2_++;
         }
         _loc7_ = _loc1_.gameObj.var_132.getFurniFromTag("wall" + _loc1_.lobbyWallpaper);
         if(_loc5_.indexOf(_loc7_.theme) == -1)
         {
            _loc5_.push(_loc7_.theme);
            _loc6_.push([]);
         }
         _loc6_[_loc5_.indexOf(_loc7_.theme)].push(_loc7_.getMaxPoints(_loc4_));
         _loc8_ = _loc1_.gameObj.var_132.getFurniFromTag("floor" + _loc1_.lobbyFlooring);
         if(_loc5_.indexOf(_loc8_.theme) == -1)
         {
            _loc5_.push(_loc8_.theme);
            _loc6_.push([]);
         }
         _loc6_[_loc5_.indexOf(_loc8_.theme)].push(_loc8_.getMaxPoints(_loc4_));
         _loc2_ = 0;
         while(_loc2_ < _loc6_.length)
         {
            _loc10_ = 0;
            _loc11_ = 0;
            while(_loc11_ < _loc6_[_loc2_].length)
            {
               _loc10_ += _loc6_[_loc2_][_loc11_];
               _loc11_++;
            }
            if(_loc6_[_loc2_].length == 1)
            {
               _loc10_ *= 0.5;
            }
            else if(_loc6_[_loc2_].length == 2)
            {
               _loc10_ *= 0.75;
            }
            _loc3_ += Math.ceil(_loc10_);
            _loc2_++;
         }
         return _loc3_;
      }
      
      public function getLobbyMatchingInTheme(param1:String) : Number
      {
         var _loc2_:UserData = null;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc7_:FurniData = null;
         var _loc8_:FurniData = null;
         var _loc9_:FurniData = null;
         _loc2_ = this;
         _loc4_ = 0;
         [];
         [];
         _loc3_ = 0;
         while(_loc3_ < _loc2_.lobbyPlacement.length)
         {
            if((_loc9_ = _loc2_.gameObj.var_132.getFurniFromTag(_loc2_.lobbyPlacement[_loc3_][0])).theme == param1)
            {
               _loc4_++;
            }
            _loc3_++;
         }
         if((_loc7_ = _loc2_.gameObj.var_132.getFurniFromTag("wall" + _loc2_.lobbyWallpaper)).theme == param1)
         {
            _loc4_++;
         }
         if((_loc8_ = _loc2_.gameObj.var_132.getFurniFromTag("floor" + _loc2_.lobbyFlooring)).theme == param1)
         {
            _loc4_++;
         }
         return _loc4_;
      }
      
      public function getLobbyItemsPerTheme() : Array
      {
         var _loc1_:UserData = null;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:FurniData = null;
         var _loc6_:FurniData = null;
         var _loc7_:FurniData = null;
         _loc1_ = this;
         _loc2_ = [];
         _loc3_ = [];
         _loc4_ = 0;
         while(_loc4_ < _loc1_.lobbyPlacement.length)
         {
            _loc7_ = _loc1_.gameObj.var_132.getFurniFromTag(_loc1_.lobbyPlacement[_loc4_][0]);
            if(_loc2_.indexOf(_loc7_.theme) == -1)
            {
               _loc2_.push(_loc7_.theme);
               _loc3_.push(1);
            }
            else
            {
               _loc3_[_loc2_.indexOf(_loc7_.theme)] = _loc3_[_loc2_.indexOf(_loc7_.theme)] + 1;
            }
            _loc4_++;
         }
         _loc5_ = _loc1_.gameObj.var_132.getFurniFromTag("wall" + _loc1_.lobbyWallpaper);
         if(_loc2_.indexOf(_loc5_.theme) == -1)
         {
            _loc2_.push(_loc5_.theme);
            _loc3_.push(1);
         }
         else
         {
            _loc3_[_loc2_.indexOf(_loc5_.theme)] = _loc3_[_loc2_.indexOf(_loc5_.theme)] + 1;
         }
         _loc6_ = _loc1_.gameObj.var_132.getFurniFromTag("floor" + _loc1_.lobbyFlooring);
         if(_loc2_.indexOf(_loc6_.theme) == -1)
         {
            _loc2_.push(_loc6_.theme);
            _loc3_.push(1);
         }
         else
         {
            _loc3_[_loc2_.indexOf(_loc6_.theme)] = _loc3_[_loc2_.indexOf(_loc6_.theme)] + 1;
         }
         return _loc3_;
      }
      
      public function getLobbyFreshness() : Number
      {
         var _loc1_:UserData = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         _loc1_ = this;
         _loc2_ = 0;
         _loc3_ = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc1_.furniInventory.length)
         {
            if(_loc1_.furniInventory[_loc4_][2] > 0)
            {
               if(_loc1_.furniInventory[_loc4_].length < 4)
               {
                  _loc2_ += 1 * _loc1_.furniInventory[_loc4_][2];
                  _loc3_ += _loc1_.furniInventory[_loc4_][2];
               }
               else
               {
                  _loc2_ += _loc1_.furniInventory[_loc4_][3] * _loc1_.furniInventory[_loc4_][2];
                  _loc3_ += _loc1_.furniInventory[_loc4_][2];
               }
            }
            _loc4_++;
         }
         _loc5_ = _loc2_ / _loc3_;
         if(_loc3_ == 0)
         {
            _loc5_ = 1;
         }
         return _loc5_;
      }
      
      public function getLobbyPercent() : Number
      {
         var _loc1_:UserData = null;
         _loc1_ = this;
         return 0.667 + 0.333 * (_loc1_.getLobbyMatchingPoints() / _loc1_.getLobbyMaxPoints()) * _loc1_.getLobbyFreshness();
      }
      
      public function getFurniItemFreshness(param1:String) : Number
      {
         var _loc2_:UserData = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         _loc2_ = this;
         _loc3_ = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc2_.furniInventory.length)
         {
            if(_loc2_.furniInventory[_loc4_][0] == param1)
            {
               if(_loc2_.furniInventory[_loc4_].length < 4)
               {
                  _loc3_ = 1;
                  break;
               }
               _loc3_ = Number(_loc2_.furniInventory[_loc4_][3]);
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function updateFurniFreshness() : void
      {
         var _loc1_:UserData = null;
         var _loc2_:int = 0;
         _loc1_ = this;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.furniInventory.length)
         {
            if(_loc1_.furniInventory[_loc2_][2] == 0)
            {
               _loc1_.furniInventory[_loc2_][3] = 1;
               _loc1_.furniInventory[_loc2_][4] = 0;
            }
            else
            {
               if(_loc1_.furniInventory[_loc2_].length < 3)
               {
                  _loc1_.furniInventory[_loc2_][3] = 1;
                  _loc1_.furniInventory[_loc2_][4] = 0;
               }
               4;
               ++_loc1_.furniInventory[_loc2_][4];
               if(_loc1_.furniInventory[_loc2_][4] >= 3)
               {
                  _loc1_.furniInventory[_loc2_][3] -= 0.02;
                  if(_loc1_.furniInventory[_loc2_][3] < 0)
                  {
                     _loc1_.furniInventory[_loc2_][3] = 0;
                  }
               }
            }
            _loc2_++;
         }
      }
      
      public function isValidTrainingFlag(param1:String) : Boolean
      {
         var _loc2_:UserData = null;
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         _loc2_ = this;
         _loc3_ = false;
         if((_loc4_ = _loc2_.trainingFlagNames.indexOf(param1)) > -1)
         {
            _loc3_ = true;
         }
         return _loc3_;
      }
      
      public function hasTrained(param1:String) : Boolean
      {
         var _loc2_:UserData = null;
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         _loc2_ = this;
         _loc3_ = false;
         if((_loc4_ = _loc2_.trainingFlagNames.indexOf(param1)) > -1 && _loc2_.trainingFlags.length > _loc4_)
         {
            if(_loc2_.trainingFlags[_loc4_] == 1)
            {
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public function setTrained(param1:String) : void
      {
         var _loc2_:UserData = null;
         var _loc3_:Number = NaN;
         _loc2_ = this;
         _loc3_ = _loc2_.trainingFlagNames.indexOf(param1);
         if(_loc3_ > -1)
         {
            _loc2_.trainingFlags[_loc3_] = 1;
            class_6.method_1("--->>> SET TRAINED: " + param1 + " <<<---");
         }
      }
      
      public function setWaiter(param1:String, param2:String, param3:Array) : void
      {
         var _loc4_:UserData = null;
         var _loc5_:int = 0;
         (_loc4_ = this).waiterName = param1;
         _loc4_.whichWaiter = param2;
         _loc5_ = 0;
         while(_loc5_ < param3.length)
         {
            if(_loc4_.clothingInventory.indexOf(param3[_loc5_]) == -1)
            {
               _loc4_.clothingInventory.push(param3[_loc5_]);
            }
            _loc5_++;
         }
         _loc4_.didCreateWaiter = true;
         _loc4_.gameObj.var_130.method_156();
      }
      
      public function adjustClothingIfAlreadyOwned(param1:String) : String
      {
         var _loc2_:UserData = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:ClothingItem = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Array = null;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         _loc2_ = this;
         _loc3_ = param1;
         if(_loc2_.clothingInventory.indexOf(param1) > -1)
         {
            class_6.method_1("YOU ALREADY OWN " + param1 + " --- remix the colors for this prize.");
            if((_loc4_ = _loc2_.gameObj.var_134.getBaseSKU(param1)) != param1)
            {
               _loc5_ = _loc2_.gameObj.var_134.getItemFromSKU(_loc4_);
               _loc12_ = 0;
               while(_loc12_ < 12)
               {
                  if((_loc11_ = _loc2_.gameObj.var_127.getMonth() + _loc12_) > 12)
                  {
                     _loc11_ -= 12;
                  }
                  _loc10_ = _loc2_.gameObj.var_134.getHolidayPalette(_loc11_);
                  _loc6_ = Number(class_16.method_122(_loc10_,0));
                  _loc7_ = Number(class_16.method_122(_loc10_,1));
                  _loc8_ = Number(class_16.method_122(_loc10_,2));
                  _loc9_ = Number(class_16.method_122(_loc10_,3));
                  if(_loc5_.limitColor1 != null && _loc5_.limitColor1.indexOf(_loc6_) == -1)
                  {
                     _loc6_ = Number(class_16.method_122(_loc5_.limitColor1,0));
                  }
                  if(_loc5_.limitColor2 != null && _loc5_.limitColor2.indexOf(_loc7_) == -1)
                  {
                     _loc7_ = Number(class_16.method_122(_loc5_.limitColor2,0));
                  }
                  if(_loc5_.limitColor3 != null && _loc5_.limitColor3.indexOf(_loc8_) == -1)
                  {
                     _loc8_ = Number(class_16.method_122(_loc5_.limitColor3,0));
                  }
                  if(_loc5_.limitDecalColor != null && _loc5_.limitDecalColor.indexOf(_loc9_) == -1)
                  {
                     _loc9_ = Number(class_16.method_122(_loc5_.limitDecalColor,0));
                  }
                  if(_loc5_.decalMatchColor == 1)
                  {
                     _loc9_ = _loc6_;
                  }
                  else if(_loc5_.decalMatchColor == 2)
                  {
                     _loc9_ = _loc7_;
                  }
                  else if(_loc5_.decalMatchColor == 3)
                  {
                     _loc9_ = _loc8_;
                  }
                  if(_loc5_.isForcingColor(2))
                  {
                     _loc7_ = _loc5_.getForceColor(2,_loc6_,_loc7_,_loc8_);
                  }
                  if(_loc5_.isForcingColor(3))
                  {
                     _loc8_ = _loc5_.getForceColor(3,_loc6_,_loc7_,_loc8_);
                  }
                  if(_loc5_.isForcingColor(4))
                  {
                     _loc9_ = _loc5_.getForceColor(4,_loc6_,_loc7_,_loc8_);
                  }
                  _loc13_ = _loc2_.gameObj.var_134.generateTintCode(_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
                  if(_loc2_.clothingInventory.indexOf(_loc4_ + "" + _loc13_) == -1)
                  {
                     _loc3_ = _loc4_ + "" + _loc13_;
                     break;
                  }
                  class_6.method_1(" >>>> You already own " + _loc4_ + "" + _loc13_ + ", try again.....");
                  _loc12_++;
               }
            }
         }
         return _loc3_;
      }
      
      public function randomize(param1:Boolean = true) : Number
      {
         var _loc2_:UserData = null;
         _loc2_ = this;
         if(param1)
         {
            return (_loc2_.randomSeed = _loc2_.randomSeed * 16807 % 2147483647) / 2147483647 + 2.33e-10;
         }
         return Math.random();
      }
      
      public function setRandomSeed(param1:Number) : void
      {
         var _loc2_:UserData = null;
         _loc2_ = this;
         _loc2_.randomSeed = param1;
         _loc2_.randomize();
      }
   }
}

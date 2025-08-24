package sushiGame.data
{
   public class Challenge
   {
      
      public static const RANK:String = "rank";
      
      public static const UPGRADES:String = "upgrades";
      
      public static const FURNITURE:String = "furniture";
      
      public static const REWARDFURNI:String = "rewardfurni";
      
      public static const CLOTHING:String = "clothing";
      
      public static const REWARDCLOTHING:String = "rewardclothing";
      
      public static const REWARDANY:String = "rewardany";
      
      public static const PURCHASES:String = "purchases";
      
      public static const SPECIALSTAR:String = "specialstar";
      
      public static const SPECIALS:String = "specials";
      
      public static const SEALS:String = "seals";
      
      public static const USETOPPING:String = "usetopping";
      
      public static const SCORE:String = "score";
      
      public static const RIBBON:String = "ribbon";
      
      public static const SERVICEQUALITY:String = "servicequality";
      
      public static const SERVECUSTOMERS:String = "servecustomers";
      
      public static const PAYDAY:String = "payday";
      
      public static const UNLOCKTOPPING:String = "unlocktopping";
      
      public static const HAT:String = "hat";
      
      public static const METER:String = "meter";
      
      public static const MINIGAME:String = "minigame";
      
      public static const PRIZE:String = "prize";
      
      public static const MULTIPRIZE:String = "multiprize";
      
      public static const SPECIALPRIZE:String = "specialprize";
      
      public static const TAGGED:String = "tagged";
      
      public static const UNLOCKCUSTOMER:String = "unlockcustomer";
      
      public static const UNLOCKSEASON:String = "unlockseason";
      
      public static const UNLOCKHOLIDAY:String = "unlockholiday";
      
      public static const SERVECUSTOMERSINMONTH:String = "servecustomersinmonth";
      
      public static const SERVECLOTHING:String = "serveclothing";
      
      public static const SERVECLOTHINGTHEME:String = "serveclothingtheme";
      
      public static const SERVESECRETSPECIAL:String = "servesecretspecial";
      
      public static const EXTRAINGREDIENTS:String = "extraingredients";
       
      
      public var title:String = "";
      
      public var description:String = "";
      
      public var rewardMoney:Number = 0;
      
      public var tickets:Number = 0;
      
      public var challengeType:String;
      
      public var targetAmount:Number = 0;
      
      public var tally:Number = 0;
      
      public var upgrades:*;
      
      public var sealType:String = "bronze";
      
      public var topping:String = "soft";
      
      public var customer:String = "any";
      
      public var score:Number = 0;
      
      public var scoreType:String = "Waiting";
      
      public var percentQuality:Number = 100;
      
      public var customers:*;
      
      public var toppings:*;
      
      public var hat:String = "tacohat";
      
      public var machine:String = "icecream";
      
      public var tagName:String = "";
      
      public var month:Number = -1;
      
      public var theme:String = "any";
      
      public var clothing:*;
      
      public var reqMonth:Number = -1;
      
      public var reqCustomer:String = null;
      
      public var reqToppings:Array = null;
      
      public var isQuest:Boolean = false;
      
      public var showTally:Boolean = false;
      
      public var stickerSKU:String = null;
      
      public var params:Object;
      
      public function Challenge(param1:String, param2:Object)
      {
         super();
         var _loc3_:Challenge = this;
         _loc3_.challengeType = param1;
         _loc3_.params = param2;
         if(param1 == Challenge.RANK)
         {
            _loc3_.setupRank();
         }
         else if(param1 == Challenge.UPGRADES)
         {
            _loc3_.setupUpgrades();
         }
         else if(param1 == Challenge.FURNITURE)
         {
            _loc3_.setupFurniture();
         }
         else if(param1 == Challenge.PURCHASES)
         {
            _loc3_.setupPurchases();
         }
         else if(param1 == Challenge.CLOTHING)
         {
            _loc3_.setupClothing();
         }
         else if(param1 == Challenge.SEALS)
         {
            _loc3_.setupSeals();
         }
         else if(param1 == Challenge.USETOPPING)
         {
            _loc3_.setupUseTopping();
         }
         else if(param1 == Challenge.SCORE)
         {
            _loc3_.setupScore();
         }
         else if(param1 == Challenge.RIBBON)
         {
            _loc3_.setupRibbon();
         }
         else if(param1 == Challenge.SPECIALSTAR || param1 == Challenge.SPECIALS)
         {
            _loc3_.setupSpecialStar();
         }
         else if(param1 == Challenge.SERVICEQUALITY)
         {
            _loc3_.setupServiceQuality();
         }
         else if(param1 == Challenge.SERVECUSTOMERS)
         {
            _loc3_.setupServeCustomers();
         }
         else if(param1 == Challenge.PAYDAY)
         {
            _loc3_.setupPayDay();
         }
         else if(param1 == Challenge.UNLOCKTOPPING)
         {
            _loc3_.setupUnlockTopping();
         }
         else if(param1 == Challenge.HAT)
         {
            _loc3_.setupHat();
         }
         else if(param1 == Challenge.METER)
         {
            _loc3_.setupMeter();
         }
         else if(param1 == Challenge.MINIGAME)
         {
            _loc3_.setupMinigame();
         }
         else if(param1 == Challenge.PRIZE)
         {
            _loc3_.setupPrize();
         }
         else if(param1 == Challenge.MULTIPRIZE)
         {
            _loc3_.setupMultiPrize();
         }
         else if(param1 == Challenge.SPECIALPRIZE)
         {
            _loc3_.setupSpecialPrize();
         }
         else if(param1 == Challenge.TAGGED)
         {
            _loc3_.setupTagged();
         }
         else if(param1 == Challenge.UNLOCKCUSTOMER)
         {
            _loc3_.setupUnlockCustomers();
         }
         else if(param1 == Challenge.UNLOCKHOLIDAY)
         {
            _loc3_.setupUnlockHoliday();
         }
         else if(param1 == Challenge.UNLOCKSEASON)
         {
            _loc3_.setupUnlockSeason();
         }
         else if(param1 == Challenge.SERVECUSTOMERSINMONTH)
         {
            _loc3_.setupServeCustomersInMonth();
         }
         else if(param1 == Challenge.SERVECLOTHING)
         {
            _loc3_.setupServeClothing();
         }
         else if(param1 == Challenge.SERVECLOTHINGTHEME)
         {
            _loc3_.setupServeClothingTheme();
         }
         else if(param1 == Challenge.SERVESECRETSPECIAL)
         {
            _loc3_.setupServeSecretSpecial();
         }
         else if(param1 == Challenge.EXTRAINGREDIENTS)
         {
            _loc3_.setupExtraIngredients();
         }
         _loc3_.setupTitles();
         _loc3_.setupRequirements();
      }
      
      public function setupTitles() : void
      {
         var _loc1_:Challenge = this;
         if(_loc1_.params.hasOwnProperty("title"))
         {
            _loc1_.title = _loc1_.params.title;
         }
         if(_loc1_.params.hasOwnProperty("description"))
         {
            _loc1_.description = _loc1_.params.description;
         }
         if(_loc1_.params.hasOwnProperty("rewardMoney"))
         {
            _loc1_.rewardMoney = _loc1_.params.rewardMoney;
         }
         else
         {
            _loc1_.rewardMoney = 0;
         }
         if(_loc1_.params.hasOwnProperty("tickets"))
         {
            _loc1_.tickets = _loc1_.params.tickets;
         }
         else
         {
            _loc1_.tickets = 0;
         }
         if(_loc1_.params.hasOwnProperty("sticker"))
         {
            _loc1_.stickerSKU = _loc1_.params.sticker;
         }
         else
         {
            _loc1_.stickerSKU = null;
         }
         if(_loc1_.params.hasOwnProperty("showTally"))
         {
            _loc1_.showTally = _loc1_.params.showTally;
         }
         else
         {
            _loc1_.showTally = false;
         }
      }
      
      public function setupRequirements() : void
      {
         var _loc1_:Challenge = this;
         if(_loc1_.params.hasOwnProperty("reqMonth"))
         {
            _loc1_.reqMonth = Number(_loc1_.params.reqMonth);
         }
         else
         {
            _loc1_.reqMonth = -1;
         }
         if(_loc1_.params.hasOwnProperty("reqCustomer"))
         {
            _loc1_.reqCustomer = _loc1_.params.reqCustomer;
         }
         else
         {
            _loc1_.reqCustomer = null;
         }
         if(_loc1_.params.hasOwnProperty("reqToppings"))
         {
            if(_loc1_.params.reqToppings is String)
            {
               _loc1_.reqToppings = [_loc1_.params.reqToppings];
            }
            else if(_loc1_.params.reqToppings is Array)
            {
               _loc1_.reqToppings = _loc1_.params.reqToppings;
            }
            else
            {
               _loc1_.reqToppings = null;
            }
         }
         else
         {
            _loc1_.reqToppings = null;
         }
         if(_loc1_.params.hasOwnProperty("isQuest"))
         {
            _loc1_.isQuest = _loc1_.params.isQuest;
         }
         else
         {
            _loc1_.isQuest = false;
         }
      }
      
      public function setupMinigame() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
      }
      
      public function setupPrize() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
      }
      
      public function setupMultiPrize() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
      }
      
      public function setupSpecialPrize() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
      }
      
      public function setupRank() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
      }
      
      public function setupPayDay() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
      }
      
      public function setupRibbon() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
      }
      
      public function setupSpecialStar() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
      }
      
      public function setupUpgrades() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("upgrades"))
         {
            if(_loc1_.params.upgrades is Array)
            {
               _loc1_.upgrades = _loc1_.params.upgrades.concat();
            }
            else
            {
               _loc1_.upgrades = _loc1_.params.upgrades;
            }
         }
         else
         {
            _loc1_.upgrades = "any";
         }
      }
      
      public function setupFurniture() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("upgrades"))
         {
            if(_loc1_.params.upgrades is Array)
            {
               _loc1_.upgrades = _loc1_.params.upgrades.concat();
            }
            else
            {
               _loc1_.upgrades = _loc1_.params.upgrades;
            }
         }
         else
         {
            _loc1_.upgrades = "any";
         }
      }
      
      public function setupPurchases() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("upgrades"))
         {
            if(_loc1_.params.upgrades is Array)
            {
               _loc1_.upgrades = _loc1_.params.upgrades.concat();
            }
            else
            {
               _loc1_.upgrades = _loc1_.params.upgrades;
            }
         }
         else
         {
            _loc1_.upgrades = "any";
         }
      }
      
      public function setupClothing() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("upgrades"))
         {
            if(_loc1_.params.upgrades is Array)
            {
               _loc1_.upgrades = _loc1_.params.upgrades.concat();
            }
            else
            {
               _loc1_.upgrades = _loc1_.params.upgrades;
            }
         }
         else
         {
            _loc1_.upgrades = "any";
         }
      }
      
      public function setupSeals() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         _loc1_.sealType = _loc1_.params.sealType;
      }
      
      public function setupUseTopping() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         _loc1_.topping = _loc1_.params.topping;
      }
      
      public function setupScore() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("customer"))
         {
            _loc1_.customer = _loc1_.params.customer;
         }
         else
         {
            _loc1_.customer = "any";
         }
         _loc1_.score = _loc1_.params.score;
         _loc1_.scoreType = _loc1_.params.scoreType;
      }
      
      public function setupExtraIngredients() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("customer"))
         {
            _loc1_.customer = _loc1_.params.customer;
         }
         else
         {
            _loc1_.customer = "any";
         }
         if(_loc1_.params.hasOwnProperty("toppings"))
         {
            if(_loc1_.params.toppings is Array)
            {
               _loc1_.toppings = _loc1_.params.toppings.concat();
            }
            else
            {
               _loc1_.toppings = _loc1_.params.toppings;
            }
         }
         else
         {
            _loc1_.toppings = "all";
         }
      }
      
      public function setupMeter() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("machine"))
         {
            _loc1_.machine = _loc1_.params.machine;
         }
         else
         {
            _loc1_.machine = "any";
         }
         if(_loc1_.params.hasOwnProperty("scoreType"))
         {
            _loc1_.scoreType = _loc1_.params.scoreType;
         }
         else
         {
            _loc1_.scoreType = "any";
         }
      }
      
      public function setupTagged() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         _loc1_.tagName = _loc1_.params.tagName;
      }
      
      public function setupServiceQuality() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         _loc1_.percentQuality = _loc1_.params.percentQuality;
      }
      
      public function setupServeCustomers() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("customers"))
         {
            if(_loc1_.params.customers is Array)
            {
               _loc1_.customers = _loc1_.params.customers.concat();
            }
            else
            {
               _loc1_.customers = _loc1_.params.customers;
            }
         }
         else
         {
            _loc1_.customers = "all";
         }
      }
      
      public function setupServeSecretSpecial() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("customers"))
         {
            if(_loc1_.params.customers is Array)
            {
               _loc1_.customers = _loc1_.params.customers.concat();
            }
            else
            {
               _loc1_.customers = _loc1_.params.customers;
            }
         }
         else if(_loc1_.params.hasOwnProperty("customer"))
         {
            _loc1_.customers = _loc1_.params.customer;
         }
         else
         {
            _loc1_.customers = "any";
         }
      }
      
      public function setupServeCustomersInMonth() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("customers"))
         {
            if(_loc1_.params.customers is Array)
            {
               _loc1_.customers = _loc1_.params.customers.concat();
            }
            else
            {
               _loc1_.customers = _loc1_.params.customers;
            }
         }
         else
         {
            _loc1_.customers = "all";
         }
         _loc1_.month = _loc1_.params.month;
      }
      
      public function setupServeClothing() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("customers"))
         {
            if(_loc1_.params.customers is Array)
            {
               _loc1_.customers = _loc1_.params.customers.concat();
            }
            else
            {
               _loc1_.customers = _loc1_.params.customers;
            }
         }
         else
         {
            _loc1_.customers = "any";
         }
         if(_loc1_.params.hasOwnProperty("clothing"))
         {
            if(_loc1_.params.clothing is Array)
            {
               _loc1_.clothing = _loc1_.params.clothing.concat();
            }
            else
            {
               _loc1_.clothing = [_loc1_.params.clothing];
            }
         }
         if(_loc1_.params.hasOwnProperty("month"))
         {
            _loc1_.month = _loc1_.params.month;
         }
         else
         {
            _loc1_.month = -1;
         }
      }
      
      public function setupServeClothingTheme() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("customers"))
         {
            if(_loc1_.params.customers is Array)
            {
               _loc1_.customers = _loc1_.params.customers.concat();
            }
            else
            {
               _loc1_.customers = _loc1_.params.customers;
            }
         }
         else
         {
            _loc1_.customers = "any";
         }
         if(_loc1_.params.hasOwnProperty("month"))
         {
            _loc1_.month = _loc1_.params.month;
         }
         else
         {
            _loc1_.month = -1;
         }
         if(_loc1_.params.hasOwnProperty("theme"))
         {
            _loc1_.theme = _loc1_.params.theme;
         }
         else
         {
            _loc1_.theme = "any";
         }
      }
      
      public function setupUnlockTopping() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("toppings"))
         {
            if(_loc1_.params.toppings is Array)
            {
               _loc1_.toppings = _loc1_.params.toppings.concat();
            }
            else
            {
               _loc1_.toppings = _loc1_.params.toppings;
            }
         }
         else
         {
            _loc1_.toppings = "all";
         }
      }
      
      public function setupUnlockCustomers() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         if(_loc1_.params.hasOwnProperty("customers"))
         {
            if(_loc1_.params.customers is Array)
            {
               _loc1_.customers = _loc1_.params.customers.concat();
            }
            else
            {
               _loc1_.customers = _loc1_.params.customers;
            }
         }
         else
         {
            _loc1_.customers = "all";
         }
      }
      
      public function setupUnlockHoliday() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
      }
      
      public function setupUnlockSeason() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = 1;
         _loc1_.tagName = _loc1_.params.tagName;
      }
      
      public function setupHat() : void
      {
         var _loc1_:Challenge = this;
         _loc1_.targetAmount = _loc1_.params.targetAmount;
         _loc1_.hat = _loc1_.params.hat;
      }
      
      public function clearTally(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tally = 0;
         }
      }
      
      public function setTally(param1:Number) : Boolean
      {
         var _loc2_:Challenge = this;
         _loc2_.tally = param1;
         if(_loc2_.tally >= _loc2_.targetAmount)
         {
            return true;
         }
         return false;
      }
      
      public function addToTally(param1:Number = 1) : Boolean
      {
         var _loc2_:Challenge = this;
         _loc2_.tally += param1;
         if(_loc2_.tally >= _loc2_.targetAmount)
         {
            return true;
         }
         return false;
      }
      
      public function getRewardAmount() : Number
      {
         var _loc1_:Challenge = this;
         return _loc1_.rewardMoney;
      }
      
      public function getTicketAmount() : Number
      {
         var _loc1_:Challenge = this;
         return _loc1_.tickets;
      }
   }
}

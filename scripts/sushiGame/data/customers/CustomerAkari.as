package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerAkari extends CustomerDataFile
   {
       
      
      public function CustomerAkari()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Akari";
         this.customerClipName = "Akari";
         this.customerFirstGame = "Papa\'s Burgeria";
         this.thumbColor = "yellow";
         this.flipdeckNumber = 50;
         this.isCloser = true;
         this.holidayOutfit = GameData.MONTH_OCTOBER;
         this.hasHolidayHands = true;
         this.setupOrder();
         this.stickers = ["coconuts","dillworm","habanero"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_BROWN,true);
         _loc1_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc1_.addToppings(FoodData.DROP_TUNA,FoodData.SAUCE_YUMYUM);
         _loc1_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_UKONIRO);
         _loc2_.setRice(FoodData.RICE_BROWN,true);
         _loc2_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc2_.addToppings(FoodData.DROP_NARUTOMAKI,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_WAKAME);
         _loc2_.setTea(FoodData.TEA_HAKUTO,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc2_);
         var _loc3_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc3_.setPaper(FoodData.PAPER_UKONIRO);
         _loc3_.setRice(FoodData.RICE_BROWN,true);
         _loc3_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc3_.addToppings(FoodData.DROP_CHORIZO,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_RECADOROJO);
         _loc3_.setTea(FoodData.TEA_HORCHATA,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc3_);
         var _loc4_:CustomerOrder;
         (_loc4_ = new CustomerOrder(GameData.MONTH_JUNE)).setPaper(FoodData.PAPER_UKONIRO);
         _loc4_.setRice(FoodData.RICE_BROWN,true);
         _loc4_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc4_.addToppings(FoodData.DROP_PINEAPPLE,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_LEMONHERB);
         _loc4_.setTea(FoodData.TEA_LUAUPUNCH,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc4_);
         var _loc5_:CustomerOrder;
         (_loc5_ = new CustomerOrder(GameData.MONTH_JULY)).setPaper(FoodData.PAPER_UKONIRO);
         _loc5_.setRice(FoodData.RICE_BROWN,true);
         _loc5_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc5_.addToppings(FoodData.DROP_BRISKET,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_BBQRUB);
         _loc5_.setTea(FoodData.TEA_POWSICLE,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc5_);
         var _loc6_:CustomerOrder;
         (_loc6_ = new CustomerOrder(GameData.MONTH_AUGUST)).setPaper(FoodData.PAPER_UKONIRO);
         _loc6_.setRice(FoodData.RICE_BROWN,true);
         _loc6_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc6_.addToppings(FoodData.DROP_BREZN,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_SAUERKRAUT);
         _loc6_.setTea(FoodData.TEA_BLACKFOREST,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc6_);
         var _loc7_:CustomerOrder;
         (_loc7_ = new CustomerOrder(GameData.MONTH_SEPTEMBER)).setPaper(FoodData.PAPER_UKONIRO);
         _loc7_.setRice(FoodData.RICE_BROWN,true);
         _loc7_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc7_.addToppings(FoodData.DROP_BACON,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_CINNAMON);
         _loc7_.setTea(FoodData.TEA_BREAKFAST,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc7_);
         var _loc8_:CustomerOrder;
         (_loc8_ = new CustomerOrder(GameData.MONTH_OCTOBER)).setPaper(FoodData.PAPER_UKONIRO);
         _loc8_.setRice(FoodData.RICE_BROWN,true);
         _loc8_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc8_.addToppings(FoodData.DROP_UNI,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_IKURA);
         _loc8_.setTea(FoodData.TEA_WITCHSBREW,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc8_);
         var _loc9_:CustomerOrder;
         (_loc9_ = new CustomerOrder(GameData.MONTH_NOVEMBER)).setPaper(FoodData.PAPER_UKONIRO);
         _loc9_.setRice(FoodData.RICE_BROWN,true);
         _loc9_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc9_.addToppings(FoodData.DROP_SWEETPOTATOES,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_PUMPKINSEEDS);
         _loc9_.setTea(FoodData.TEA_PUMPKINSPICE,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc9_);
         var _loc10_:CustomerOrder;
         (_loc10_ = new CustomerOrder(GameData.MONTH_DECEMBER)).setPaper(FoodData.PAPER_UKONIRO);
         _loc10_.setRice(FoodData.RICE_BROWN,true);
         _loc10_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc10_.addToppings(FoodData.DROP_TAI,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_YULEMASAGO);
         _loc10_.setTea(FoodData.TEA_PEPPERMINT,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc10_);
         var _loc11_:CustomerOrder;
         (_loc11_ = new CustomerOrder(GameData.MONTH_JANUARY)).setPaper(FoodData.PAPER_UKONIRO);
         _loc11_.setRice(FoodData.RICE_BROWN,true);
         _loc11_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc11_.addToppings(FoodData.DROP_RAINBOWYOKAN,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_RAINBOW);
         _loc11_.setTea(FoodData.TEA_TUTTIFRUTTI,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc11_);
         var _loc12_:CustomerOrder;
         (_loc12_ = new CustomerOrder(GameData.MONTH_FEBRUARY)).setPaper(FoodData.PAPER_UKONIRO);
         _loc12_.setRice(FoodData.RICE_BROWN,true);
         _loc12_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc12_.addToppings(FoodData.DROP_STRAWBERRY,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_POMEGRANATE);
         _loc12_.setTea(FoodData.TEA_RASPBERRY,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc12_);
         var _loc13_:CustomerOrder;
         (_loc13_ = new CustomerOrder(GameData.MONTH_MARCH)).setPaper(FoodData.PAPER_UKONIRO);
         _loc13_.setRice(FoodData.RICE_BROWN,true);
         _loc13_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_TOFU);
         _loc13_.addToppings(FoodData.DROP_DATEMAKI,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_LUCKYDUST);
         _loc13_.setTea(FoodData.TEA_IYOKAN,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc13_);
      }
   }
}

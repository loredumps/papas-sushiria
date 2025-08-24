package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerWhiff extends CustomerDataFile
   {
       
      
      public function CustomerWhiff()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Whiff";
         this.customerClipName = "Whiff";
         this.customerFirstGame = "Papa\'s Bakeria";
         this.thumbColor = "midblue";
         this.livesInApartment = true;
         this.setupOrder();
         this.isCloser = true;
         this.holidayOutfit = GameData.MONTH_OCTOBER;
         this.hasHolidayHands = true;
         this.holidayHandExtra = "hammer";
         this.stickers = ["checkpoint","habanero","gameticket"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK);
         _loc1_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc1_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_SHIROI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc2_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc2_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc2_);
         var _loc3_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc3_.setPaper(FoodData.PAPER_TORTILLA);
         _loc3_.setRice(FoodData.RICE_WHITE);
         _loc3_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc3_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc3_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc3_);
         var _loc4_:CustomerOrder;
         (_loc4_ = new CustomerOrder(GameData.MONTH_JUNE)).setPaper(FoodData.PAPER_MIZUIRO);
         _loc4_.setRice(FoodData.RICE_WHITE);
         _loc4_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc4_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc4_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc4_);
         var _loc5_:CustomerOrder;
         (_loc5_ = new CustomerOrder(GameData.MONTH_JULY)).setPaper(FoodData.PAPER_DELI);
         _loc5_.setRice(FoodData.RICE_WHITE);
         _loc5_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc5_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc5_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc5_);
         var _loc6_:CustomerOrder;
         (_loc6_ = new CustomerOrder(GameData.MONTH_AUGUST)).setPaper(FoodData.PAPER_RAUTENFLAGGE);
         _loc6_.setRice(FoodData.RICE_WHITE);
         _loc6_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc6_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc6_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc6_);
         var _loc7_:CustomerOrder;
         (_loc7_ = new CustomerOrder(GameData.MONTH_SEPTEMBER)).setPaper(FoodData.PAPER_KIIROI);
         _loc7_.setRice(FoodData.RICE_WHITE);
         _loc7_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc7_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc7_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc7_);
         var _loc8_:CustomerOrder;
         (_loc8_ = new CustomerOrder(GameData.MONTH_OCTOBER)).setPaper(FoodData.PAPER_TARANTULA);
         _loc8_.setRice(FoodData.RICE_WHITE);
         _loc8_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc8_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc8_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc8_);
         var _loc9_:CustomerOrder;
         (_loc9_ = new CustomerOrder(GameData.MONTH_NOVEMBER)).setPaper(FoodData.PAPER_CHAIRO);
         _loc9_.setRice(FoodData.RICE_WHITE);
         _loc9_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc9_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc9_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc9_);
         var _loc10_:CustomerOrder;
         (_loc10_ = new CustomerOrder(GameData.MONTH_DECEMBER)).setPaper(FoodData.PAPER_ELF);
         _loc10_.setRice(FoodData.RICE_WHITE);
         _loc10_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc10_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc10_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc10_);
         var _loc11_:CustomerOrder;
         (_loc11_ = new CustomerOrder(GameData.MONTH_JANUARY)).setPaper(FoodData.PAPER_RAINBOW);
         _loc11_.setRice(FoodData.RICE_WHITE);
         _loc11_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc11_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc11_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc11_);
         var _loc12_:CustomerOrder;
         (_loc12_ = new CustomerOrder(GameData.MONTH_FEBRUARY)).setPaper(FoodData.PAPER_AKAI);
         _loc12_.setRice(FoodData.RICE_WHITE);
         _loc12_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc12_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc12_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc12_);
         var _loc13_:CustomerOrder;
         (_loc13_ = new CustomerOrder(GameData.MONTH_MARCH)).setPaper(FoodData.PAPER_LUCKY);
         _loc13_.setRice(FoodData.RICE_WHITE);
         _loc13_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc13_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc13_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc13_);
      }
   }
}

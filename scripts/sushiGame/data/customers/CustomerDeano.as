package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerDeano extends CustomerDataFile
   {
       
      
      public function CustomerDeano()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Deano";
         this.customerClipName = "Deano";
         this.thumbColor = "midblue";
         this.customerFirstGame = "Papa\'s Pastaria";
         this.flipdeckNumber = 127;
         this.isCloser = true;
         this.holidayOutfit = GameData.MONTH_OCTOBER;
         this.hasHolidayHands = true;
         this.stickers = ["habanero","coconuts","gameticket"];
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BLACK);
         _loc1_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_YELLOWTAIL);
         _loc1_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_GENERALTSO);
         _loc1_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BLACK);
         _loc2_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_YELLOWTAIL);
         _loc2_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_SWEETSAKURA);
         _loc2_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc2_);
         var _loc3_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc3_.setPaper(FoodData.PAPER_NORI);
         _loc3_.setRice(FoodData.RICE_BLACK);
         _loc3_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_CHIPOTLECHEDDAR,FoodData.FILLING_YELLOWTAIL);
         _loc3_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_NACHOCHEESE);
         _loc3_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc3_);
         var _loc4_:CustomerOrder;
         (_loc4_ = new CustomerOrder(GameData.MONTH_JUNE)).setPaper(FoodData.PAPER_NORI);
         _loc4_.setRice(FoodData.RICE_BLACK);
         _loc4_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_YELLOWTAIL);
         _loc4_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_CALYPSO);
         _loc4_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc4_);
         var _loc5_:CustomerOrder;
         (_loc5_ = new CustomerOrder(GameData.MONTH_JULY)).setPaper(FoodData.PAPER_NORI);
         _loc5_.setRice(FoodData.RICE_BLACK);
         _loc5_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_ONIONSTRINGS,FoodData.FILLING_YELLOWTAIL);
         _loc5_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_LONESTARPIT);
         _loc5_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc5_);
         var _loc6_:CustomerOrder;
         (_loc6_ = new CustomerOrder(GameData.MONTH_AUGUST)).setPaper(FoodData.PAPER_NORI);
         _loc6_.setRice(FoodData.RICE_BLACK);
         _loc6_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_YELLOWTAIL);
         _loc6_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_MUSTARD);
         _loc6_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc6_);
         var _loc7_:CustomerOrder;
         (_loc7_ = new CustomerOrder(GameData.MONTH_SEPTEMBER)).setPaper(FoodData.PAPER_NORI);
         _loc7_.setRice(FoodData.RICE_BLACK);
         _loc7_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_HASHBROWN,FoodData.FILLING_YELLOWTAIL);
         _loc7_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_MAPLE);
         _loc7_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc7_);
         var _loc8_:CustomerOrder;
         (_loc8_ = new CustomerOrder(GameData.MONTH_OCTOBER)).setPaper(FoodData.PAPER_NORI);
         _loc8_.setRice(FoodData.RICE_BLACK);
         _loc8_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_YELLOWTAIL);
         _loc8_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_SQUID);
         _loc8_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc8_);
         var _loc9_:CustomerOrder;
         (_loc9_ = new CustomerOrder(GameData.MONTH_NOVEMBER)).setPaper(FoodData.PAPER_NORI);
         _loc9_.setRice(FoodData.RICE_BLACK);
         _loc9_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_TURKEY,FoodData.FILLING_YELLOWTAIL);
         _loc9_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_GRAVY);
         _loc9_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc9_);
         var _loc10_:CustomerOrder;
         (_loc10_ = new CustomerOrder(GameData.MONTH_DECEMBER)).setPaper(FoodData.PAPER_NORI);
         _loc10_.setRice(FoodData.RICE_BLACK);
         _loc10_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_YELLOWTAIL);
         _loc10_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_CRANBERRY);
         _loc10_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc10_);
         var _loc11_:CustomerOrder;
         (_loc11_ = new CustomerOrder(GameData.MONTH_JANUARY)).setPaper(FoodData.PAPER_NORI);
         _loc11_.setRice(FoodData.RICE_BLACK);
         _loc11_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_EGGPLANT,FoodData.FILLING_YELLOWTAIL);
         _loc11_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_FLAVORX);
         _loc11_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc11_);
         var _loc12_:CustomerOrder;
         (_loc12_ = new CustomerOrder(GameData.MONTH_FEBRUARY)).setPaper(FoodData.PAPER_NORI);
         _loc12_.setRice(FoodData.RICE_BLACK);
         _loc12_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_YELLOWTAIL);
         _loc12_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_AZUKI);
         _loc12_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc12_);
         var _loc13_:CustomerOrder;
         (_loc13_ = new CustomerOrder(GameData.MONTH_MARCH)).setPaper(FoodData.PAPER_NORI);
         _loc13_.setRice(FoodData.RICE_BLACK);
         _loc13_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_KANPYO,FoodData.FILLING_YELLOWTAIL);
         _loc13_.addToppings(FoodData.DROP_SABA,FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_KURIKINTON);
         _loc13_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc13_);
      }
   }
}

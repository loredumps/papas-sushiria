package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerXolo extends CustomerDataFile
   {
       
      
      public function CustomerXolo()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Xolo";
         this.customerClipName = "Xolo";
         this.customerFirstGame = "Papa\'s Wingeria";
         this.thumbColor = "pink";
         this.houseColor = "yelloworange";
         this.isCloser = true;
         this.holidayOutfit = GameData.MONTH_OCTOBER;
         this.hasHolidayHands = true;
         this.setupOrder();
         this.isHuge = true;
         this.stickers = ["sslouie","discoplumm","onion"];
         this.hasAlternateShoes = true;
         this.hasAlternateHands = true;
         this.secretSpecialIndex = 9;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_CUCUMBER);
         _loc1_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc1_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_SHIROI);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_KAMPACHI,FoodData.FILLING_CUCUMBER);
         _loc2_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc2_.setTea(FoodData.TEA_HAKUTO,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc2_);
         var _loc3_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc3_.setPaper(FoodData.PAPER_TORTILLA);
         _loc3_.setRice(FoodData.RICE_SHISO);
         _loc3_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_CHORIZO,FoodData.FILLING_CUCUMBER);
         _loc3_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc3_.setTea(FoodData.TEA_HORCHATA,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc3_);
         var _loc4_:CustomerOrder;
         (_loc4_ = new CustomerOrder(GameData.MONTH_JUNE)).setPaper(FoodData.PAPER_MIZUIRO);
         _loc4_.setRice(FoodData.RICE_SHISO);
         _loc4_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_CANNEDHAM,FoodData.FILLING_CUCUMBER);
         _loc4_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc4_.setTea(FoodData.TEA_LUAUPUNCH,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc4_);
         var _loc5_:CustomerOrder;
         (_loc5_ = new CustomerOrder(GameData.MONTH_JULY)).setPaper(FoodData.PAPER_DELI);
         _loc5_.setRice(FoodData.RICE_SHISO);
         _loc5_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_BRISKET,FoodData.FILLING_CUCUMBER);
         _loc5_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc5_.setTea(FoodData.TEA_POWSICLE,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc5_);
         var _loc6_:CustomerOrder;
         (_loc6_ = new CustomerOrder(GameData.MONTH_AUGUST)).setPaper(FoodData.PAPER_RAUTENFLAGGE);
         _loc6_.setRice(FoodData.RICE_SHISO);
         _loc6_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_BRATWURST,FoodData.FILLING_CUCUMBER);
         _loc6_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc6_.setTea(FoodData.TEA_BLACKFOREST,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc6_);
         var _loc7_:CustomerOrder;
         (_loc7_ = new CustomerOrder(GameData.MONTH_SEPTEMBER)).setPaper(FoodData.PAPER_KIIROI);
         _loc7_.setRice(FoodData.RICE_SHISO);
         _loc7_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_BACON,FoodData.FILLING_CUCUMBER);
         _loc7_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc7_.setTea(FoodData.TEA_BREAKFAST,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc7_);
         var _loc8_:CustomerOrder;
         (_loc8_ = new CustomerOrder(GameData.MONTH_OCTOBER)).setPaper(FoodData.PAPER_TARANTULA);
         _loc8_.setRice(FoodData.RICE_SHISO);
         _loc8_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_TORIGAI,FoodData.FILLING_CUCUMBER);
         _loc8_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc8_.setTea(FoodData.TEA_WITCHSBREW,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc8_);
         var _loc9_:CustomerOrder;
         (_loc9_ = new CustomerOrder(GameData.MONTH_NOVEMBER)).setPaper(FoodData.PAPER_CHAIRO);
         _loc9_.setRice(FoodData.RICE_SHISO);
         _loc9_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_SWEETPOTATOES,FoodData.FILLING_CUCUMBER);
         _loc9_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc9_.setTea(FoodData.TEA_PUMPKINSPICE,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc9_);
         var _loc10_:CustomerOrder;
         (_loc10_ = new CustomerOrder(GameData.MONTH_DECEMBER)).setPaper(FoodData.PAPER_ELF);
         _loc10_.setRice(FoodData.RICE_SHISO);
         _loc10_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_SPRUCETIPS,FoodData.FILLING_CUCUMBER);
         _loc10_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc10_.setTea(FoodData.TEA_PEPPERMINT,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc10_);
         var _loc11_:CustomerOrder;
         (_loc11_ = new CustomerOrder(GameData.MONTH_JANUARY)).setPaper(FoodData.PAPER_RAINBOW);
         _loc11_.setRice(FoodData.RICE_SHISO);
         _loc11_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_RAINBOWYOKAN,FoodData.FILLING_CUCUMBER);
         _loc11_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc11_.setTea(FoodData.TEA_TUTTIFRUTTI,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc11_);
         var _loc12_:CustomerOrder;
         (_loc12_ = new CustomerOrder(GameData.MONTH_FEBRUARY)).setPaper(FoodData.PAPER_AKAI);
         _loc12_.setRice(FoodData.RICE_SHISO);
         _loc12_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_HOKKIGAI,FoodData.FILLING_CUCUMBER);
         _loc12_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc12_.setTea(FoodData.TEA_RASPBERRY,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc12_);
         var _loc13_:CustomerOrder;
         (_loc13_ = new CustomerOrder(GameData.MONTH_MARCH)).setPaper(FoodData.PAPER_LUCKY);
         _loc13_.setRice(FoodData.RICE_SHISO);
         _loc13_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_DATEMAKI,FoodData.FILLING_CUCUMBER);
         _loc13_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc13_.setTea(FoodData.TEA_IYOKAN,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc13_);
      }
   }
}

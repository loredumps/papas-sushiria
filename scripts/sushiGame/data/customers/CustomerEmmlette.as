package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerEmmlette extends CustomerDataFile
   {
       
      
      public function CustomerEmmlette()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Emmlette";
         this.customerClipName = "Emmlette";
         this.thumbColor = "yellow";
         this.customerFirstGame = "Papa\'s Sushiria";
         this.isCloser = true;
         this.holidayOutfit = GameData.MONTH_OCTOBER;
         this.isHuge = true;
         this.setupOrder();
         this.stickers = ["checkpoint","dillworm","gameticket"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_SNOWPEAS);
         _loc1_.addToppings(FoodData.DROP_PRAWN,FoodData.SAUCE_GINGERMISO);
         _loc1_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_UKONIRO);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_NARUTOMAKI);
         _loc2_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_WAKAME,FoodData.SAUCE_GINGERMISO);
         _loc2_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc2_);
         var _loc3_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc3_.setPaper(FoodData.PAPER_UKONIRO);
         _loc3_.setRice(FoodData.RICE_WHITE);
         _loc3_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CHORIZO);
         _loc3_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_RECADOROJO,FoodData.SAUCE_GINGERMISO);
         _loc3_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc3_);
         var _loc4_:CustomerOrder;
         (_loc4_ = new CustomerOrder(GameData.MONTH_JUNE)).setPaper(FoodData.PAPER_UKONIRO);
         _loc4_.setRice(FoodData.RICE_WHITE);
         _loc4_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_PINEAPPLE);
         _loc4_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_LEMONHERB,FoodData.SAUCE_GINGERMISO);
         _loc4_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc4_);
         var _loc5_:CustomerOrder;
         (_loc5_ = new CustomerOrder(GameData.MONTH_JULY)).setPaper(FoodData.PAPER_UKONIRO);
         _loc5_.setRice(FoodData.RICE_WHITE);
         _loc5_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_BRISKET);
         _loc5_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_BBQRUB,FoodData.SAUCE_GINGERMISO);
         _loc5_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc5_);
         var _loc6_:CustomerOrder;
         (_loc6_ = new CustomerOrder(GameData.MONTH_AUGUST)).setPaper(FoodData.PAPER_UKONIRO);
         _loc6_.setRice(FoodData.RICE_WHITE);
         _loc6_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_BREZN);
         _loc6_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_SAUERKRAUT,FoodData.SAUCE_GINGERMISO);
         _loc6_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc6_);
         var _loc7_:CustomerOrder;
         (_loc7_ = new CustomerOrder(GameData.MONTH_SEPTEMBER)).setPaper(FoodData.PAPER_UKONIRO);
         _loc7_.setRice(FoodData.RICE_WHITE);
         _loc7_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_BACON);
         _loc7_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_CINNAMON,FoodData.SAUCE_GINGERMISO);
         _loc7_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc7_);
         var _loc8_:CustomerOrder;
         (_loc8_ = new CustomerOrder(GameData.MONTH_OCTOBER)).setPaper(FoodData.PAPER_UKONIRO);
         _loc8_.setRice(FoodData.RICE_WHITE);
         _loc8_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_UNI);
         _loc8_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_IKURA,FoodData.SAUCE_GINGERMISO);
         _loc8_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc8_);
         var _loc9_:CustomerOrder;
         (_loc9_ = new CustomerOrder(GameData.MONTH_NOVEMBER)).setPaper(FoodData.PAPER_UKONIRO);
         _loc9_.setRice(FoodData.RICE_WHITE);
         _loc9_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_SWEETPOTATOES);
         _loc9_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_PUMPKINSEEDS,FoodData.SAUCE_GINGERMISO);
         _loc9_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc9_);
         var _loc10_:CustomerOrder;
         (_loc10_ = new CustomerOrder(GameData.MONTH_DECEMBER)).setPaper(FoodData.PAPER_UKONIRO);
         _loc10_.setRice(FoodData.RICE_WHITE);
         _loc10_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_TAI);
         _loc10_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_YULEMASAGO,FoodData.SAUCE_GINGERMISO);
         _loc10_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc10_);
         var _loc11_:CustomerOrder;
         (_loc11_ = new CustomerOrder(GameData.MONTH_JANUARY)).setPaper(FoodData.PAPER_UKONIRO);
         _loc11_.setRice(FoodData.RICE_WHITE);
         _loc11_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_RAINBOWYOKAN);
         _loc11_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_RAINBOW,FoodData.SAUCE_GINGERMISO);
         _loc11_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc11_);
         var _loc12_:CustomerOrder;
         (_loc12_ = new CustomerOrder(GameData.MONTH_FEBRUARY)).setPaper(FoodData.PAPER_UKONIRO);
         _loc12_.setRice(FoodData.RICE_WHITE);
         _loc12_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_STRAWBERRY);
         _loc12_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_POMEGRANATE,FoodData.SAUCE_GINGERMISO);
         _loc12_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc12_);
         var _loc13_:CustomerOrder;
         (_loc13_ = new CustomerOrder(GameData.MONTH_MARCH)).setPaper(FoodData.PAPER_UKONIRO);
         _loc13_.setRice(FoodData.RICE_WHITE);
         _loc13_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_DATEMAKI);
         _loc13_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_LUCKYDUST,FoodData.SAUCE_GINGERMISO);
         _loc13_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc13_);
      }
   }
}

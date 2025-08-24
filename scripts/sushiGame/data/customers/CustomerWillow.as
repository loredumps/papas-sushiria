package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerWillow extends CustomerDataFile
   {
       
      
      public function CustomerWillow()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Willow";
         this.customerClipName = "Willow";
         this.thumbColor = "seafoam";
         this.customerFirstGame = "Papa\'s Hot Doggeria";
         this.flipdeckNumber = 108;
         this.setupOrder();
         this.holidayOutfit = GameData.MONTH_OCTOBER;
         this.hasHolidayMouth = true;
         this.hasHolidayEyes = true;
         this.hasHolidayHands = true;
         this.holidayHandExtra = "skullpail";
         this.stickers = ["chickenwing","lettucelark","coin"];
         this.hasAlternateShoes = true;
         this.hasAlternateHands = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_SNOWPEAS);
         _loc1_.addToppings(FoodData.SAUCE_TERIYAKI,FoodData.SHAKER_TEMPURACRUNCH);
         _loc1_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_OCTOBER);
         _loc2_.setPaper(FoodData.PAPER_TARANTULA);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_UNI,FoodData.FILLING_SNOWPEAS);
         _loc2_.addToppings(FoodData.SAUCE_TERIYAKI,FoodData.SHAKER_TEMPURACRUNCH);
         _loc2_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc2_);
      }
   }
}

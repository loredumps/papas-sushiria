package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerCrystal extends CustomerDataFile
   {
       
      
      public function CustomerCrystal()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Crystal";
         this.customerClipName = "Crystal";
         this.thumbColor = "midred";
         this.customerFirstGame = "Papa\'s Pastaria";
         this.flipdeckNumber = 121;
         this.holidayOutfit = GameData.MONTH_MARCH;
         this.hasHolidayHands = true;
         this.hasHolidayShoes = true;
         this.setupOrder();
         this.stickers = ["sarge","fizzo","pizza"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BLACK);
         _loc1_.addFillings(FoodData.FILLING_CALAMARI,FoodData.FILLING_ASAPARAGUS,FoodData.FILLING_TAMAGO);
         _loc1_.addToppings(FoodData.SHAKER_FURIKAKE);
         _loc1_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MARCH);
         _loc2_.setPaper(FoodData.PAPER_LUCKY);
         _loc2_.setRice(FoodData.RICE_BLACK);
         _loc2_.addFillings(FoodData.FILLING_CALAMARI,FoodData.FILLING_ASAPARAGUS,FoodData.FILLING_DATEMAKI);
         _loc2_.addToppings(FoodData.DROP_DATEMAKI,FoodData.SHAKER_LUCKYDUST);
         _loc2_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc2_);
      }
   }
}

package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerSkyler extends CustomerDataFile
   {
       
      
      public function CustomerSkyler()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Skyler";
         this.customerClipName = "Skyler";
         this.thumbColor = "yellow";
         this.customerFirstGame = "Papa\'s Wingeria";
         this.livesInApartment = true;
         this.setupOrder();
         this.stickers = ["cheddarmac","grilledcheese","pasta"];
         this.hasAlternateEyes = true;
         this.hasAlternateHands = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_TOFU);
         _loc1_.addToppings(FoodData.SHAKER_FURIKAKE);
         _loc1_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MARCH);
         _loc2_.setPaper(FoodData.PAPER_LUCKY);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_TOFU);
         _loc2_.addToppings(FoodData.DROP_DATEMAKI,FoodData.SHAKER_LUCKYDUST);
         _loc2_.setTea(FoodData.TEA_IYOKAN,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc2_);
      }
   }
}

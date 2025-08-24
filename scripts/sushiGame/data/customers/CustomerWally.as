package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerWally extends CustomerDataFile
   {
       
      
      public function CustomerWally()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Wally";
         this.customerClipName = "Wally";
         this.thumbColor = "brown";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 2;
         this.livesInApartment = true;
         this.setupOrder();
         this.stickers = ["cheesecake","taco","samurais"];
         this.hasAlternateShoes = true;
         this.hasAlternateEyes = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_SALMON);
         _loc1_.addToppings(FoodData.DROP_SABA,FoodData.SAUCE_TERIYAKI,FoodData.SHAKER_TOBIKO);
         _loc1_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JANUARY);
         _loc2_.setPaper(FoodData.PAPER_RAINBOW);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_SALMON,FoodData.FILLING_RAINBOWYOKAN);
         _loc2_.addToppings(FoodData.DROP_SABA,FoodData.SAUCE_TERIYAKI,FoodData.SHAKER_TOBIKO);
         _loc2_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc2_);
      }
   }
}

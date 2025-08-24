package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerPinchHitwell extends CustomerDataFile
   {
       
      
      public function CustomerPinchHitwell()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Pinch Hitwell";
         this.customerClipName = "PinchHitwell";
         this.customerFirstGame = "Papa\'s Hot Doggeria";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 51;
         this.setupOrder();
         this.stickers = ["blackbirds","powseeker","xmastree"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE,true);
         _loc1_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_YELLOWTAIL);
         _loc1_.addToppings(FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_TERIYAKI);
         _loc1_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_NOVEMBER);
         _loc2_.setPaper(FoodData.PAPER_CHAIRO);
         _loc2_.setRice(FoodData.RICE_WHITE,true);
         _loc2_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_YELLOWTAIL);
         _loc2_.addToppings(FoodData.SHAKER_PUMPKINSEEDS,FoodData.SAUCE_TERIYAKI);
         _loc2_.setTea(FoodData.TEA_PUMPKINSPICE,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc2_);
      }
   }
}

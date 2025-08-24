package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerPapaLouie extends CustomerDataFile
   {
       
      
      public function CustomerPapaLouie()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Papa Louie";
         this.customerClipName = "PapaLouie";
         this.thumbColor = "midblue";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 15;
         this.stickers = ["pepperjack","slider","firework"];
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_LOBSTER,FoodData.FILLING_GREENONIONS);
         _loc1_.addToppings(FoodData.DROP_SAYORI,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc1_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MARCH);
         _loc2_.setPaper(FoodData.PAPER_UKONIRO);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_KANPYO,FoodData.FILLING_GREENONIONS);
         _loc2_.addToppings(FoodData.DROP_SAYORI,FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_KURIKINTON);
         _loc2_.setTea(FoodData.TEA_IYOKAN,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerEmber extends CustomerDataFile
   {
       
      
      public function CustomerEmber()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Ember";
         this.customerClipName = "Ember";
         this.customerFirstGame = "Papa\'s Donuteria";
         this.thumbColor = "fire";
         this.flipdeckNumber = 152;
         this.setupOrder();
         this.stickers = ["pretzel","turkeys","slider"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_JALAPENO,FoodData.FILLING_WAGYU);
         _loc1_.addToppings(FoodData.DROP_WAGYU,FoodData.SAUCE_SRIRACHA);
         _loc1_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JULY);
         _loc2_.setPaper(FoodData.PAPER_DELI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_JALAPENO,FoodData.FILLING_BRISKET);
         _loc2_.addToppings(FoodData.DROP_WAGYU,FoodData.SAUCE_DUCK);
         _loc2_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc2_);
      }
   }
}

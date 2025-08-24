package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerYui extends CustomerDataFile
   {
       
      
      public function CustomerYui()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Yui";
         this.customerClipName = "Yui";
         this.customerFirstGame = "Papa Louie 3";
         this.thumbColor = "brown";
         this.setupOrder();
         this.stickers = ["coconuts","dillworm","checkpoint"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_AVOCADO,FoodData.FILLING_CUCUMBER,FoodData.FILLING_WAGYU);
         _loc1_.addToppings(FoodData.SAUCE_GINGERMISO,FoodData.SHAKER_BONITOFLAKES);
         _loc1_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MARCH);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_AVOCADO,FoodData.FILLING_CUCUMBER,FoodData.FILLING_DATEMAKI);
         _loc2_.addToppings(FoodData.SAUCE_KURIKINTON,FoodData.SHAKER_BONITOFLAKES);
         _loc2_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc2_);
      }
   }
}

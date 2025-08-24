package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerIggy extends CustomerDataFile
   {
       
      
      public function CustomerIggy()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Iggy";
         this.customerClipName = "Iggy";
         this.customerFirstGame = "Papa\'s Donuteria";
         this.thumbColor = "purple";
         this.flipdeckNumber = 145;
         this.setupOrder();
         this.stickers = ["blondie","sundaesaurus","flipper"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.DROP_TUNA,FoodData.FILLING_GREENONIONS);
         _loc1_.addToppings(FoodData.SHAKER_BONITOFLAKES,FoodData.SAUCE_GENERALTSO);
         _loc1_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_OCTOBER);
         _loc2_.setPaper(FoodData.PAPER_TARANTULA);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.DROP_TUNA,FoodData.FILLING_TORIGAI,FoodData.FILLING_GREENONIONS);
         _loc2_.addToppings(FoodData.SHAKER_BONITOFLAKES,FoodData.SAUCE_GENERALTSO);
         _loc2_.setTea(FoodData.TEA_WITCHSBREW,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc2_);
      }
   }
}

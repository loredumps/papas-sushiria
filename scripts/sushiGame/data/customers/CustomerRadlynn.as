package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerRadlynn extends CustomerDataFile
   {
       
      
      public function CustomerRadlynn()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Radlynn";
         this.customerClipName = "Radlynn";
         this.thumbColor = "deepred";
         this.customerFirstGame = "Papa\'s Hot Doggeria";
         this.flipdeckNumber = 116;
         this.setupOrder();
         this.stickers = ["armyonion","newyear","pie"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_BLACK);
         _loc1_.addFillings(FoodData.FILLING_OCTOPUS,FoodData.FILLING_RADISHSPROUTS,FoodData.FILLING_GREENONIONS);
         _loc1_.addToppings(FoodData.SAUCE_SRIRACHA);
         _loc1_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_NOVEMBER);
         _loc2_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc2_.setRice(FoodData.RICE_BLACK);
         _loc2_.addFillings(FoodData.FILLING_TURKEY,FoodData.FILLING_RADISHSPROUTS,FoodData.FILLING_GREENONIONS);
         _loc2_.addToppings(FoodData.SHAKER_PUMPKINSEEDS,FoodData.SAUCE_SRIRACHA);
         _loc2_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc2_);
      }
   }
}

package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerJanana extends CustomerDataFile
   {
       
      
      public function CustomerJanana()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Janana";
         this.customerClipName = "Janana";
         this.customerFirstGame = "Papa\'s Bakeria";
         this.thumbColor = "purple";
         this.setupOrder();
         this.stickers = ["bananapants","shrooms","mangoby"];
         this.secretSpecialIndex = 36;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_WAGYU,FoodData.FILLING_GREENONIONS,FoodData.FILLING_CUCUMBER);
         _loc1_.addToppings(FoodData.SAUCE_GINGERMISO);
         _loc1_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JULY);
         _loc2_.setPaper(FoodData.PAPER_DELI);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_WAGYU,FoodData.FILLING_ONIONSTRINGS,FoodData.FILLING_CUCUMBER);
         _loc2_.addToppings(FoodData.SHAKER_BBQRUB,FoodData.SAUCE_LONESTARPIT);
         _loc2_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc2_);
      }
   }
}

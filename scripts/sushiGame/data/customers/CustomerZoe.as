package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerZoe extends CustomerDataFile
   {
       
      
      public function CustomerZoe()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Zoe";
         this.customerClipName = "Zoe";
         this.customerFirstGame = "Papa\'s Taco Mia!";
         this.thumbColor = "yellow";
         this.flipdeckNumber = 65;
         this.setupOrder();
         this.stickers = ["woollies","sizzlers","onion"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_CARROTS,FoodData.FILLING_CUCUMBER);
         _loc1_.addToppings(FoodData.SHAKER_BONITOFLAKES,FoodData.SAUCE_GINGERMISO);
         _loc1_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JANUARY);
         _loc2_.setPaper(FoodData.PAPER_RAINBOW);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_EGGPLANT,FoodData.FILLING_CUCUMBER);
         _loc2_.addToppings(FoodData.SHAKER_BONITOFLAKES,FoodData.SAUCE_GINGERMISO);
         _loc2_.setTea(FoodData.TEA_TUTTIFRUTTI,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerFoodini extends CustomerDataFile
   {
       
      
      public function CustomerFoodini()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Foodini";
         this.customerClipName = "Foodini";
         this.thumbColor = "pink";
         this.customerFirstGame = "Papa\'s Pancakeria";
         this.flipdeckNumber = 32;
         this.setupOrder();
         this.secretSpecialIndex = 2;
         this.stickers = ["mallowmen","tomatoes","newyear"];
         this.isHuge = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_TOFU,FoodData.FILLING_SHRIMP,FoodData.FILLING_TAMAGO);
         _loc1_.addToppings(FoodData.SHAKER_BONITOFLAKES,FoodData.SAUCE_GINGERMISO);
         _loc1_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JANUARY);
         _loc2_.setPaper(FoodData.PAPER_RAINBOW);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_TOFU,FoodData.FILLING_SHRIMP,FoodData.FILLING_TAMAGO);
         _loc2_.addToppings(FoodData.SHAKER_RAINBOW,FoodData.SAUCE_GINGERMISO);
         _loc2_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

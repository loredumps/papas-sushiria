package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerMindy extends CustomerDataFile
   {
       
      
      public function CustomerMindy()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Mindy";
         this.customerClipName = "Mindy";
         this.thumbColor = "seafoam";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 42;
         this.livesInApartment = true;
         this.setupOrder();
         this.stickers = ["dillwheel","blueribbon","rocky"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_RADISHSPROUTS);
         _loc1_.addToppings(FoodData.DROP_SAYORI,FoodData.SAUCE_PONZU);
         _loc1_.setTea(FoodData.TEA_STRAWBERRY,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_FEBRUARY);
         _loc2_.setPaper(FoodData.PAPER_AKAI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_HOKKIGAI);
         _loc2_.addToppings(FoodData.DROP_SAYORI,FoodData.SHAKER_POMEGRANATE,FoodData.SAUCE_PONZU);
         _loc2_.setTea(FoodData.TEA_RASPBERRY,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

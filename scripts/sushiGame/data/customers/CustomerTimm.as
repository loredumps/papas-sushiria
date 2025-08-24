package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerTimm extends CustomerDataFile
   {
       
      
      public function CustomerTimm()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Timm";
         this.customerClipName = "Timm";
         this.thumbColor = "fire";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 10;
         this.stickers = ["cordialbomb","warpcoin","flapjacks"];
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_WAGYU,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.SAUCE_HIBACHI);
         _loc1_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_AUGUST);
         _loc2_.setPaper(FoodData.PAPER_UKONIRO);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_BREZN,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.DROP_BREZN,FoodData.SHAKER_SAUERKRAUT,FoodData.SAUCE_HIBACHI);
         _loc2_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc2_);
      }
   }
}

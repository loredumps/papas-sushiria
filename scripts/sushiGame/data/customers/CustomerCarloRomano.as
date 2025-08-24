package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerCarloRomano extends CustomerDataFile
   {
       
      
      public function CustomerCarloRomano()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Carlo Romano";
         this.customerClipName = "CarloRomano";
         this.thumbColor = "deepred";
         this.flipdeckNumber = 53;
         this.setupOrder();
         this.stickers = ["dillworm","tomatoes","sundae"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE,true);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_UNAGI);
         _loc1_.addToppings(FoodData.DROP_SAYORI,FoodData.SAUCE_TONKATSU);
         _loc1_.setTea(FoodData.TEA_STRAWBERRY,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_FEBRUARY);
         _loc2_.setPaper(FoodData.PAPER_AKAI);
         _loc2_.setRice(FoodData.RICE_WHITE,true);
         _loc2_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_HOKKIGAI,FoodData.FILLING_STRAWBERRY);
         _loc2_.addToppings(FoodData.DROP_SAYORI,FoodData.SHAKER_POMEGRANATE,FoodData.SAUCE_TONKATSU);
         _loc2_.setTea(FoodData.TEA_RASPBERRY,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

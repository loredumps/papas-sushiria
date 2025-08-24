package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerScooter extends CustomerDataFile
   {
       
      
      public function CustomerScooter()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Scooter";
         this.customerClipName = "Scooter";
         this.thumbColor = "forest";
         this.customerFirstGame = "Papa\'s Wingeria";
         this.flipdeckNumber = 114;
         this.setupOrder();
         this.stickers = ["cordialbomb","jellyback","pretzel"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_CARROTS,FoodData.FILLING_TUNA);
         _loc1_.addToppings(FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_TONKATSU);
         _loc1_.setTea(FoodData.TEA_STRAWBERRY,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JULY);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_CARROTS,FoodData.FILLING_ONIONSTRINGS,FoodData.FILLING_TUNA);
         _loc2_.addToppings(FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_TONKATSU);
         _loc2_.setTea(FoodData.TEA_POWSICLE,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

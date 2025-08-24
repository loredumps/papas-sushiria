package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerBoomer extends CustomerDataFile
   {
       
      
      public function CustomerBoomer()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Boomer";
         this.customerClipName = "Boomer";
         this.thumbColor = "lightred";
         this.customerFirstGame = "Papa\'s Wingeria";
         this.flipdeckNumber = 44;
         this.holidayOutfit = GameData.MONTH_JULY;
         this.hasHolidayHands = true;
         this.holidayHandExtra = "sparkler";
         this.setupOrder();
         this.hasAlternateShoes = true;
         this.hasAlternateHands = true;
         this.stickers = ["burger","peppermintflower","powseeker"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_UNAGI,FoodData.FILLING_CALAMARI,FoodData.FILLING_SNOWPEAS);
         _loc1_.addToppings(FoodData.SHAKER_FURIKAKE,FoodData.SAUCE_GENERALTSO);
         _loc1_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JULY);
         _loc2_.setPaper(FoodData.PAPER_DELI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_BRISKET,FoodData.FILLING_SNOWPEAS);
         _loc2_.addToppings(FoodData.SHAKER_BBQRUB,FoodData.SAUCE_LONESTARPIT);
         _loc2_.setTea(FoodData.TEA_POWSICLE,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

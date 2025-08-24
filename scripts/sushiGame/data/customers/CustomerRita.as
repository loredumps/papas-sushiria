package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerRita extends CustomerDataFile
   {
       
      
      public function CustomerRita()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Rita";
         this.customerClipName = "Rita";
         this.thumbColor = "lime";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 75;
         this.livesInApartment = true;
         this.setupOrder();
         this.stickers = ["peppermintflower","chickenwing","radley"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_YELLOWTAIL,FoodData.FILLING_SHIITAKE,FoodData.FILLING_SNOWPEAS);
         _loc1_.addToppings(FoodData.SHAKER_FURIKAKE,FoodData.SAUCE_YUZAKOSHO);
         _loc1_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_DECEMBER);
         _loc2_.setPaper(FoodData.PAPER_ELF);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_TAI,FoodData.FILLING_SHIITAKE,FoodData.FILLING_SPRUCETIPS);
         _loc2_.addToppings(FoodData.SHAKER_YULEMASAGO,FoodData.SAUCE_YUZAKOSHO);
         _loc2_.setTea(FoodData.TEA_PEPPERMINT,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

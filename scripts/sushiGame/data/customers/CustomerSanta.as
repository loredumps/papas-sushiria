package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerSanta extends CustomerDataFile
   {
       
      
      public function CustomerSanta()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Santa";
         this.customerClipName = "Santa";
         this.customerFirstGame = "Papa\'s Cupcakeria";
         this.thumbColor = "midred";
         this.flipdeckNumber = 94;
         this.notInPool = true;
         this.setupOrder();
         this.stickers = ["honeydew","newyear","coolada"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_TUNA,FoodData.FILLING_ASAPARAGUS);
         _loc1_.addToppings(FoodData.SHAKER_FURIKAKE,FoodData.SHAKER_TOBIKO);
         _loc1_.setTea(FoodData.TEA_STRAWBERRY,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_DECEMBER);
         _loc2_.setPaper(FoodData.PAPER_ELF);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_TAI,FoodData.FILLING_SPRUCETIPS);
         _loc2_.addToppings(FoodData.SHAKER_FURIKAKE,FoodData.SHAKER_YULEMASAGO,FoodData.SAUCE_CRANBERRY);
         _loc2_.setTea(FoodData.TEA_PEPPERMINT,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc2_);
      }
   }
}

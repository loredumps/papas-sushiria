package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerPenny extends CustomerDataFile
   {
       
      
      public function CustomerPenny()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Penny";
         this.customerClipName = "Penny";
         this.thumbColor = "dustyblue";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 46;
         this.setupOrder();
         this.stickers = ["slider","cordialbomb","turkeys"];
         this.hasAlternateShoes = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_SNOWPEAS);
         _loc1_.addToppings(FoodData.SAUCE_GINGERMISO);
         _loc1_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_AUGUST);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_BRATWURST);
         _loc2_.addToppings(FoodData.SAUCE_MUSTARD);
         _loc2_.setTea(FoodData.TEA_BLACKFOREST,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc2_);
      }
   }
}

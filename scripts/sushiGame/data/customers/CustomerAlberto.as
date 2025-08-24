package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerAlberto extends CustomerDataFile
   {
       
      
      public function CustomerAlberto()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Alberto";
         this.customerClipName = "Alberto";
         this.thumbColor = "lime";
         this.customerFirstGame = "Papa\'s Burgeria";
         this.flipdeckNumber = 88;
         this.setupOrder();
         this.stickers = ["burger","firework","gondoliers"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_SNOWPEAS,FoodData.FILLING_GREENONIONS,FoodData.FILLING_UNAGI);
         _loc1_.addToppings(FoodData.SAUCE_TONKATSU,FoodData.SHAKER_BONITOFLAKES);
         _loc1_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JUNE);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_SNOWPEAS,FoodData.FILLING_GREENONIONS,FoodData.FILLING_CANNEDHAM);
         _loc2_.addToppings(FoodData.SAUCE_CALYPSO,FoodData.SHAKER_LEMONHERB);
         _loc2_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc2_);
      }
   }
}

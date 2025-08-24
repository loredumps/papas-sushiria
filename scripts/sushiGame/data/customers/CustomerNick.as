package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerNick extends CustomerDataFile
   {
       
      
      public function CustomerNick()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Nick";
         this.customerClipName = "Nick";
         this.customerFirstGame = "Papa\'s Taco Mia!";
         this.thumbColor = "lightred";
         this.flipdeckNumber = 29;
         this.setupOrder();
         this.stickers = ["warpcoin","flapjacks","jellyback"];
         this.isHuge = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_SHISO,true);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_CARROTS,FoodData.FILLING_SNOWPEAS);
         _loc1_.addToppings(FoodData.DROP_SABA,FoodData.SAUCE_TERIYAKI);
         _loc1_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_AUGUST);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_SHISO,true);
         _loc2_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_CARROTS,FoodData.FILLING_SNOWPEAS);
         _loc2_.addToppings(FoodData.DROP_SABA,FoodData.SAUCE_MUSTARD);
         _loc2_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc2_);
      }
   }
}

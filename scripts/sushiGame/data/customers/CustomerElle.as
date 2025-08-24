package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerElle extends CustomerDataFile
   {
       
      
      public function CustomerElle()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Elle";
         this.customerClipName = "Elle";
         this.thumbColor = "midblue";
         this.customerFirstGame = "Papa\'s Sushiria";
         this.stickers = ["radish","sizzlers","awesomesaucer"];
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_CUCUMBER,FoodData.FILLING_TUNA,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.DROP_AVOCADO);
         _loc1_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_CUCUMBER,FoodData.FILLING_KAMPACHI,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.DROP_NARUTOMAKI,FoodData.SHAKER_WAKAME);
         _loc2_.setTea(FoodData.TEA_HAKUTO,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc2_);
      }
   }
}

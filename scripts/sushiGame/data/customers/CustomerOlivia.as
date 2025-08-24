package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerOlivia extends CustomerDataFile
   {
       
      
      public function CustomerOlivia()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Olivia";
         this.customerClipName = "Olivia";
         this.thumbColor = "lime";
         this.customerFirstGame = "Papa\'s Pastaria";
         this.setupOrder();
         this.stickers = ["cherryblossom","jillberry","sizzlers"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_CUCUMBER,FoodData.FILLING_TOFU);
         _loc1_.addToppings(FoodData.DROP_SABA,FoodData.SAUCE_WASABIMAYO);
         _loc1_.setTea(FoodData.TEA_MATCHA,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_SHIROI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_CUCUMBER,FoodData.FILLING_TOFU,FoodData.FILLING_NARUTOMAKI);
         _loc2_.addToppings(FoodData.DROP_SABA,FoodData.SAUCE_WASABIMAYO);
         _loc2_.setTea(FoodData.TEA_MATCHA,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc2_);
      }
   }
}

package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerSargeFan extends CustomerDataFile
   {
       
      
      public function CustomerSargeFan()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Sarge Fan";
         this.customerClipName = "SargeFan";
         this.thumbColor = "purple";
         this.flipdeckNumber = 12;
         this.setupOrder();
         this.stickers = ["xmastree","mallowmen","flipline"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BLACK);
         _loc1_.addFillings(FoodData.FILLING_OCTOPUS,FoodData.FILLING_GREENONIONS);
         _loc1_.addToppings(FoodData.SAUCE_WASABIMAYO);
         _loc1_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_OCTOBER);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BLACK);
         _loc2_.addFillings(FoodData.FILLING_OCTOPUS,FoodData.FILLING_TORIGAI,FoodData.FILLING_GREENONIONS);
         _loc2_.addToppings(FoodData.SAUCE_WASABIMAYO);
         _loc2_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc2_);
      }
   }
}

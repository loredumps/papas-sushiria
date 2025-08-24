package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerKingsley extends CustomerDataFile
   {
       
      
      public function CustomerKingsley()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Kingsley";
         this.customerClipName = "Kingsley";
         this.thumbColor = "skyblue";
         this.flipdeckNumber = 6;
         this.setupOrder();
         this.isHuge = true;
         this.hasAlternateShoes = true;
         this.stickers = ["chilifeather","cherryblossom","tomato"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_GREENONIONS,FoodData.FILLING_UNAGI);
         _loc1_.addToppings(FoodData.DROP_SABA,FoodData.SAUCE_GINGERMISO);
         _loc1_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_SHIROI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_GREENONIONS,FoodData.FILLING_UNAGI);
         _loc2_.addToppings(FoodData.DROP_NARUTOMAKI,FoodData.SAUCE_SWEETSAKURA);
         _loc2_.setTea(FoodData.TEA_HAKUTO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

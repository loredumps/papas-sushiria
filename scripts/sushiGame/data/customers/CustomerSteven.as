package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerSteven extends CustomerDataFile
   {
       
      
      public function CustomerSteven()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Steven";
         this.customerClipName = "Steven";
         this.customerFirstGame = "Papa\'s Bakeria";
         this.thumbColor = "midblue";
         this.livesInApartment = true;
         this.setupOrder();
         this.stickers = ["chipmcmint","flipline","mallowmen"];
         this.hasAlternateShoes = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_SHIITAKE);
         _loc1_.addToppings(FoodData.SHAKER_SESAMESEEDS);
         _loc1_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_NOVEMBER);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_TURKEY,FoodData.FILLING_SWEETPOTATOES,FoodData.FILLING_SHIITAKE);
         _loc2_.addToppings(FoodData.SHAKER_PUMPKINSEEDS);
         _loc2_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc2_);
      }
   }
}

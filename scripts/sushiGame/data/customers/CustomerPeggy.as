package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerPeggy extends CustomerDataFile
   {
       
      
      public function CustomerPeggy()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Peggy";
         this.customerClipName = "Peggy";
         this.thumbColor = "skyblue";
         this.flipdeckNumber = 90;
         this.setupOrder();
         this.stickers = ["coolada","heart","musicnote"];
         this.hasAlternateShoes = true;
         this.secretSpecialIndex = 27;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_JALAPENO,FoodData.FILLING_CUCUMBER);
         _loc1_.addToppings(FoodData.SAUCE_SRIRACHA);
         _loc1_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MARCH);
         _loc2_.setPaper(FoodData.PAPER_UKONIRO);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_DATEMAKI,FoodData.FILLING_JALAPENO);
         _loc2_.addToppings(FoodData.SAUCE_KURIKINTON);
         _loc2_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc2_);
      }
   }
}

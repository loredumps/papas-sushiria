package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerFranco extends CustomerDataFile
   {
       
      
      public function CustomerFranco()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Franco";
         this.customerClipName = "Franco";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 156;
         this.setupOrder();
         this.stickers = ["hardshells","sslouie","cupcake"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_AVOCADO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CALAMARI);
         _loc1_.addToppings(FoodData.DROP_AVOCADO);
         _loc1_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc2_.setPaper(FoodData.PAPER_UKONIRO);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_AVOCADO,FoodData.FILLING_CHIPOTLECHEDDAR,FoodData.FILLING_CHORIZO);
         _loc2_.addToppings(FoodData.DROP_AVOCADO);
         _loc2_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc2_);
      }
   }
}

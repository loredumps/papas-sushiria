package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerJames extends CustomerDataFile
   {
       
      
      public function CustomerJames()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "James";
         this.customerClipName = "James";
         this.thumbColor = "midred";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 63;
         this.livesInApartment = true;
         this.setupOrder();
         this.hasAlternateShoes = true;
         this.stickers = ["coin","sundae","radley"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE,true);
         _loc1_.addFillings(FoodData.FILLING_TAMAGO);
         _loc1_.addToppings(FoodData.DROP_AVOCADO,FoodData.SAUCE_SRIRACHA);
         _loc1_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_SEPTEMBER);
         _loc2_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc2_.setRice(FoodData.RICE_WHITE,true);
         _loc2_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_BACON);
         _loc2_.addToppings(FoodData.DROP_AVOCADO,FoodData.SAUCE_SRIRACHA);
         _loc2_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc2_);
      }
   }
}

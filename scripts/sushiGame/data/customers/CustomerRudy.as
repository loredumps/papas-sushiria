package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerRudy extends CustomerDataFile
   {
       
      
      public function CustomerRudy()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Rudy";
         this.customerClipName = "Rudy";
         this.customerFirstGame = "Papa\'s Donuteria";
         this.thumbColor = "midblue";
         this.flipdeckNumber = 149;
         this.setupOrder();
         this.stickers = ["blueribbon","hotdog","partysubs"];
         this.hasAlternateEyes = true;
         this.hasAlternateShoes = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BLACK,true);
         _loc1_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_JALAPENO);
         _loc1_.addToppings(FoodData.SAUCE_SRIRACHA,FoodData.SHAKER_TOBIKO);
         _loc1_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JULY);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BLACK,true);
         _loc2_.addFillings(FoodData.DROP_SALMON,FoodData.FILLING_JALAPENO);
         _loc2_.addToppings(FoodData.DROP_BRISKET,FoodData.SAUCE_LONESTARPIT,FoodData.SHAKER_TOBIKO);
         _loc2_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc2_);
      }
   }
}

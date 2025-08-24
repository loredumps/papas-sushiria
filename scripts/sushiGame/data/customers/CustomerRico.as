package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerRico extends CustomerDataFile
   {
       
      
      public function CustomerRico()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Rico";
         this.customerClipName = "Rico";
         this.customerFirstGame = "Papa\'s Taco Mia!";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 30;
         this.setupOrder();
         this.isHuge = true;
         this.stickers = ["powseeker","gondoliers","derps"];
         this.hasAlternateShoes = true;
         this.hasAlternateEyes = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE,true);
         _loc1_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_GREENONIONS,FoodData.FILLING_WAGYU);
         _loc1_.addToppings(FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_GENERALTSO);
         _loc1_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JULY);
         _loc2_.setPaper(FoodData.PAPER_UKONIRO);
         _loc2_.setRice(FoodData.RICE_WHITE,true);
         _loc2_.addFillings(FoodData.FILLING_ONIONSTRINGS,FoodData.FILLING_GREENONIONS,FoodData.FILLING_WAGYU);
         _loc2_.addToppings(FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_LONESTARPIT);
         _loc2_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc2_);
      }
   }
}

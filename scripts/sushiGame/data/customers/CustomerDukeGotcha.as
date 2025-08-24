package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerDukeGotcha extends CustomerDataFile
   {
       
      
      public function CustomerDukeGotcha()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Duke Gotcha";
         this.customerClipName = "DukeGotcha";
         this.customerFirstGame = "Papa\'s Bakeria";
         this.thumbColor = "lightred";
         this.setupOrder();
         this.stickers = ["barryblue","sandbucket","cheddarmac"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_UNAGI,FoodData.FILLING_TAMAGO);
         _loc1_.addToppings(FoodData.SAUCE_GENERALTSO,FoodData.SHAKER_TOBIKO);
         _loc1_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_SEPTEMBER);
         _loc2_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_UNAGI,FoodData.FILLING_TAMAGO,FoodData.FILLING_HASHBROWN);
         _loc2_.addToppings(FoodData.SAUCE_GENERALTSO,FoodData.SHAKER_TOBIKO);
         _loc2_.setTea(FoodData.TEA_BREAKFAST,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc2_);
      }
   }
}

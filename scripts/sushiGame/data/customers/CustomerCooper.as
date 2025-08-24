package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerCooper extends CustomerDataFile
   {
       
      
      public function CustomerCooper()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Cooper";
         this.customerClipName = "Cooper";
         this.thumbColor = "bluepurple";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 106;
         this.livesInApartment = true;
         this.setupOrder();
         this.stickers = ["anchovy","skull","radley"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.SAUCE_GINGERMISO);
         _loc1_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_SEPTEMBER);
         _loc2_.setPaper(FoodData.PAPER_KIIROI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_HASHBROWN);
         _loc2_.addToppings(FoodData.SHAKER_CINNAMON,FoodData.SAUCE_MAPLE);
         _loc2_.setTea(FoodData.TEA_BREAKFAST,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc2_);
      }
   }
}

package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerJohnny extends CustomerDataFile
   {
       
      
      public function CustomerJohnny()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Johnny";
         this.customerClipName = "Johnny";
         this.customerFirstGame = "Papa\'s Pancakeria";
         this.thumbColor = "dustyblue";
         this.flipdeckNumber = 55;
         this.holidayOutfit = GameData.MONTH_SEPTEMBER;
         this.holidayHandExtra = "bacon";
         this.setupOrder();
         this.stickers = ["skull","chickenwing","blondie"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_AVOCADO);
         _loc1_.addToppings(FoodData.SAUCE_DUCK);
         _loc1_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_SEPTEMBER);
         _loc2_.setPaper(FoodData.PAPER_KIIROI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_BACON,FoodData.FILLING_AVOCADO);
         _loc2_.addToppings(FoodData.DROP_BACON,FoodData.SHAKER_CINNAMON,FoodData.SAUCE_MAPLE);
         _loc2_.setTea(FoodData.TEA_BREAKFAST,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc2_);
      }
   }
}

package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerNevada extends CustomerDataFile
   {
       
      
      public function CustomerNevada()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Nevada";
         this.customerClipName = "Nevada";
         this.customerFirstGame = "Papa\'s Cupcakeria";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 135;
         this.stickers = ["burger","powseeker","gondoliers"];
         this.hasAlternateShoes = true;
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE,true);
         _loc1_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_CUCUMBER,FoodData.FILLING_CARROTS);
         _loc1_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_FURIKAKE,FoodData.SAUCE_GENERALTSO);
         _loc1_.setTea(FoodData.TEA_MATCHA,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JUNE);
         _loc2_.setPaper(FoodData.PAPER_MIZUIRO);
         _loc2_.setRice(FoodData.RICE_WHITE,true);
         _loc2_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_CUCUMBER,FoodData.FILLING_CARROTS);
         _loc2_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_LEMONHERB,FoodData.SAUCE_GENERALTSO);
         _loc2_.setTea(FoodData.TEA_LUAUPUNCH,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc2_);
      }
   }
}

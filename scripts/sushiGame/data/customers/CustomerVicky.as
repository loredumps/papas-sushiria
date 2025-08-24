package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerVicky extends CustomerDataFile
   {
       
      
      public function CustomerVicky()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Vicky";
         this.customerClipName = "Vicky";
         this.customerFirstGame = "Papa\'s Burgeria";
         this.thumbColor = "skyblue";
         this.flipdeckNumber = 102;
         this.livesInApartment = true;
         this.setupOrder();
         this.isHuge = true;
         this.stickers = ["hotdog","grilledcheese","chilifeather"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_BLACK);
         _loc1_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_TAMAGO);
         _loc1_.addToppings(FoodData.SAUCE_YUMYUM);
         _loc1_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc2_.setPaper(FoodData.PAPER_TORTILLA);
         _loc2_.setRice(FoodData.RICE_BLACK);
         _loc2_.addFillings(FoodData.DROP_SALMON,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_TAMAGO);
         _loc2_.addToppings(FoodData.SAUCE_NACHOCHEESE);
         _loc2_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

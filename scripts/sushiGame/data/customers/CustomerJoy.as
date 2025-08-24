package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerJoy extends CustomerDataFile
   {
       
      
      public function CustomerJoy()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Joy";
         this.customerClipName = "Joy";
         this.customerFirstGame = "Papa\'s Pizzeria To Go!";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 168;
         this.setupOrder();
         this.stickers = ["hotdog","mangoby","papalouie"];
         this.hasAlternateHands = true;
         this.hasAlternateShoes = true;
         this.hasAlternateEyes = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_BLACK,true);
         _loc1_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_SHRIMP,FoodData.FILLING_SHIITAKE);
         _loc1_.addToppings(FoodData.SAUCE_TERIYAKI);
         _loc1_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_OCTOBER);
         _loc2_.setPaper(FoodData.PAPER_TARANTULA);
         _loc2_.setRice(FoodData.RICE_BLACK,true);
         _loc2_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_SHRIMP,FoodData.FILLING_SHIITAKE);
         _loc2_.addToppings(FoodData.SHAKER_IKURA,FoodData.SAUCE_TERIYAKI);
         _loc2_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerHope extends CustomerDataFile
   {
       
      
      public function CustomerHope()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Hope";
         this.customerClipName = "Hope";
         this.thumbColor = "midblue";
         this.customerFirstGame = "Papa\'s Pastaria";
         this.hasAlternateShoes = true;
         this.setupOrder();
         this.stickers = ["leaf","sundae","bananapants"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BLACK);
         _loc1_.addFillings(FoodData.FILLING_CARROTS,FoodData.FILLING_CUCUMBER,FoodData.FILLING_TAMAGO);
         _loc1_.addToppings(FoodData.DROP_KIWI,FoodData.SAUCE_YUZAKOSHO);
         _loc1_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_OCTOBER);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BLACK);
         _loc2_.addFillings(FoodData.FILLING_CARROTS,FoodData.FILLING_CUCUMBER,FoodData.FILLING_TAMAGO);
         _loc2_.addToppings(FoodData.DROP_KIWI,FoodData.SAUCE_SQUID);
         _loc2_.setTea(FoodData.TEA_WITCHSBREW,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc2_);
      }
   }
}

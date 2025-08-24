package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerWendy extends CustomerDataFile
   {
       
      
      public function CustomerWendy()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Wendy";
         this.customerClipName = "Wendy";
         this.customerFirstGame = "Papa\'s Pancakeria";
         this.thumbColor = "purple";
         this.flipdeckNumber = 81;
         this.setupOrder();
         this.stickers = ["bananapants","sundae","blackbirds"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP);
         _loc1_.addToppings(FoodData.DROP_PRAWN,FoodData.SAUCE_WASABIMAYO);
         _loc1_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_OCTOBER);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_TORIGAI);
         _loc2_.addToppings(FoodData.DROP_PRAWN,FoodData.SAUCE_SQUID);
         _loc2_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc2_);
      }
   }
}

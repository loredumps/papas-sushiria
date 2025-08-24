package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerChester extends CustomerDataFile
   {
       
      
      public function CustomerChester()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Chester";
         this.customerClipName = "Chester";
         this.customerFirstGame = "Papa\'s Cheeseria";
         this.thumbColor = "brown";
         this.flipdeckNumber = 164;
         this.setupOrder();
         this.stickers = ["peachbuzzy","cupcake","shrooms"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_JALAPENO,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.DROP_KIWI,FoodData.SAUCE_TERIYAKI);
         _loc1_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JUNE);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_JALAPENO,FoodData.FILLING_PINEAPPLE,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.DROP_KIWI,FoodData.SAUCE_CALYPSO);
         _loc2_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc2_);
      }
   }
}

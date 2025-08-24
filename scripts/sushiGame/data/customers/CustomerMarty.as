package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerMarty extends CustomerDataFile
   {
       
      
      public function CustomerMarty()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Marty";
         this.customerClipName = "Marty";
         this.thumbColor = "midred";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 25;
         this.holidayOutfit = GameData.MONTH_JULY;
         this.holidayHandExtra = "spatula";
         this.hasHolidayShoes = true;
         this.stickers = ["peppermintflower","firework","derps"];
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_JALAPENO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_WAGYU);
         _loc1_.addToppings(FoodData.DROP_WAGYU,FoodData.SAUCE_TONKATSU);
         _loc1_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JULY);
         _loc2_.setPaper(FoodData.PAPER_DELI);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_JALAPENO,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_BRISKET);
         _loc2_.addToppings(FoodData.DROP_BRISKET,FoodData.SAUCE_TONKATSU);
         _loc2_.setTea(FoodData.TEA_POWSICLE,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc2_);
      }
   }
}

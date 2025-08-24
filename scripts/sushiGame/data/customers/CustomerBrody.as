package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerBrody extends CustomerDataFile
   {
       
      
      public function CustomerBrody()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Brody";
         this.customerClipName = "Brody";
         this.customerFirstGame = "Papa\'s Cheeseria";
         this.thumbColor = "seafoam";
         this.livesInApartment = true;
         this.flipdeckNumber = 170;
         this.setupOrder();
         this.stickers = ["dillwheel","sandbucket","barryblue"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_BLACK);
         _loc1_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_CARROTS,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_TONKATSU);
         _loc1_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_SEPTEMBER);
         _loc2_.setPaper(FoodData.PAPER_KIIROI);
         _loc2_.setRice(FoodData.RICE_BLACK);
         _loc2_.addFillings(FoodData.FILLING_TAMAGO,FoodData.FILLING_BACON,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.DROP_BACON,FoodData.SHAKER_CINNAMON,FoodData.SAUCE_MAPLE);
         _loc2_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerScarlett extends CustomerDataFile
   {
       
      
      public function CustomerScarlett()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Scarlett";
         this.customerClipName = "Scarlett";
         this.customerFirstGame = "Papa\'s Cupcakeria";
         this.thumbColor = "midred";
         this.flipdeckNumber = 98;
         this.holidayOutfit = GameData.MONTH_FEBRUARY;
         this.hasHolidayShoes = true;
         this.holidayHandExtra = "cupidbow";
         this.setupOrder();
         this.stickers = ["rocky","daruma","burgerzilla"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_RADISHSPROUTS,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CRABSTICK);
         _loc1_.addToppings(FoodData.SAUCE_GENERALTSO);
         _loc1_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_FEBRUARY);
         _loc2_.setPaper(FoodData.PAPER_AKAI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_RADISHSPROUTS,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.DROP_STRAWBERRY,FoodData.SHAKER_POMEGRANATE,FoodData.SAUCE_AZUKI);
         _loc2_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

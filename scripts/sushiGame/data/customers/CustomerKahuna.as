package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerKahuna extends CustomerDataFile
   {
       
      
      public function CustomerKahuna()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Kahuna";
         this.customerClipName = "Kahuna";
         this.customerFirstGame = "Papa\'s Freezeria";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 36;
         this.setupOrder();
         this.isHuge = true;
         this.hasAlternateShoes = true;
         this.hasAlternateEyes = true;
         this.secretSpecialIndex = 30;
         this.stickers = ["sarge","derps","peppermintflower"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_JALAPENO,FoodData.FILLING_CARROTS,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.DROP_MANGO,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_TEMPURACRUNCH);
         _loc1_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JUNE);
         _loc2_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_JALAPENO,FoodData.FILLING_CARROTS,FoodData.FILLING_CANNEDHAM);
         _loc2_.addToppings(FoodData.DROP_PINEAPPLE,FoodData.SAUCE_YUMYUM,FoodData.SHAKER_TEMPURACRUNCH);
         _loc2_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc2_);
      }
   }
}

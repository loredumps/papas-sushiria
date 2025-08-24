package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerAllan extends CustomerDataFile
   {
       
      
      public function CustomerAllan()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Allan";
         this.customerClipName = "Allan";
         this.thumbColor = "lime";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 61;
         this.setupOrder();
         this.hasAlternateShoes = true;
         this.hasAlternateEyes = true;
         this.alternateHandExtra = "hockeystick";
         this.stickers = ["buffaloes","chipmcmint","pasta"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_JALAPENO,FoodData.FILLING_TAMAGO,FoodData.FILLING_CARROTS);
         _loc1_.addToppings(FoodData.SAUCE_DUCK);
         _loc1_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_DECEMBER);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_JALAPENO,FoodData.FILLING_TAMAGO,FoodData.FILLING_SPRUCETIPS);
         _loc2_.addToppings(FoodData.SAUCE_CRANBERRY);
         _loc2_.setTea(FoodData.TEA_PEPPERMINT,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc2_);
      }
   }
}

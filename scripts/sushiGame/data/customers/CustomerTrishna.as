package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerTrishna extends CustomerDataFile
   {
       
      
      public function CustomerTrishna()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Trishna";
         this.customerClipName = "Trishna";
         this.customerFirstGame = "Papa\'s Cupcakeria";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 160;
         this.setupOrder();
         this.stickers = ["leaf","blackbirds","blondie"];
         this.hasAlternateShoes = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_SHISO,true);
         _loc1_.addFillings(FoodData.FILLING_TOFU,FoodData.FILLING_TAMAGO);
         _loc1_.addToppings(FoodData.DROP_MANGO,FoodData.SAUCE_SRIRACHA);
         _loc1_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_SEPTEMBER);
         _loc2_.setPaper(FoodData.PAPER_UKONIRO);
         _loc2_.setRice(FoodData.RICE_SHISO,true);
         _loc2_.addFillings(FoodData.FILLING_TOFU,FoodData.FILLING_HASHBROWN,FoodData.FILLING_TAMAGO);
         _loc2_.addToppings(FoodData.DROP_MANGO,FoodData.SAUCE_SRIRACHA);
         _loc2_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc2_);
      }
   }
}

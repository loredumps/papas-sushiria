package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerClair extends CustomerDataFile
   {
       
      
      public function CustomerClair()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Clair";
         this.customerClipName = "Clair";
         this.thumbColor = "purple";
         this.flipdeckNumber = 174;
         this.houseColor = "yelloworange";
         this.hasAlternateShoes = true;
         this.setupOrder();
         this.stickers = ["pie","honeydew","coolada"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_RADISHSPROUTS,FoodData.FILLING_CUCUMBER);
         _loc1_.addToppings(FoodData.SAUCE_PONZU);
         _loc1_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_FEBRUARY);
         _loc2_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_RADISHSPROUTS,FoodData.FILLING_HOKKIGAI);
         _loc2_.addToppings(FoodData.SAUCE_AZUKI);
         _loc2_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc2_);
      }
   }
}

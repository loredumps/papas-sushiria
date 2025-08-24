package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerCaptainCori extends CustomerDataFile
   {
       
      
      public function CustomerCaptainCori()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Captain Cori";
         this.customerClipName = "CaptainCori";
         this.customerFirstGame = "Papa\'s Freezeria";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 17;
         this.setupOrder();
         this.hasAlternateShoes = true;
         this.stickers = ["woollies","lettucelark","musicnote"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE,true);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_CALAMARI);
         _loc1_.addToppings(FoodData.DROP_PRAWN,FoodData.SAUCE_HIBACHI);
         _loc1_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MARCH);
         _loc2_.setPaper(FoodData.PAPER_LUCKY);
         _loc2_.setRice(FoodData.RICE_WHITE,true);
         _loc2_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_CALAMARI,FoodData.FILLING_KANPYO);
         _loc2_.addToppings(FoodData.DROP_PRAWN,FoodData.SAUCE_HIBACHI);
         _loc2_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc2_);
      }
   }
}

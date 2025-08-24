package sushiGame.data
{
   public class UnlockData
   {
       
      
      public var rank:Number = 0;
      
      public var type:String = "";
      
      public var tag:String = "";
      
      public var title:String = "";
      
      public var maxRank:Number = 0;
      
      public function UnlockData(param1:Number, param2:String, param3:String, param4:String = null, param5:Number = 2147483647)
      {
         super();
         this.rank = param1;
         this.maxRank = param5;
         this.type = param2;
         this.tag = param3;
         if(param4 == null)
         {
            this.title = param3;
         }
         else
         {
            this.title = param4;
         }
      }
   }
}

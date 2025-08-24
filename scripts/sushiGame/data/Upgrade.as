package sushiGame.data
{
   public class Upgrade
   {
       
      
      public var tag:String;
      
      public var title:String;
      
      public var price:Number;
      
      public var effect:String;
      
      public var description:String;
      
      public var waitingOffset:Number = 0;
      
      public var inLobby:Boolean = false;
      
      public var lobbyClipName:String = null;
      
      public var toppingType:String = null;
      
      public var index:Number = -1;
      
      public function Upgrade(param1:String, param2:String, param3:Number, param4:String, param5:String, param6:Number = 0, param7:Boolean = false, param8:String = null, param9:String = null)
      {
         super();
         this.tag = param1;
         this.title = param2;
         this.price = param3;
         this.effect = param4;
         this.description = param5;
         this.waitingOffset = param6;
         this.inLobby = param7;
         this.lobbyClipName = param8;
         this.toppingType = param9;
      }
   }
}

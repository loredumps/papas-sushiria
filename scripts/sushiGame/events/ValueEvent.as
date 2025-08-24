package sushiGame.events
{
   import flash.events.Event;
   
   public class ValueEvent extends Event
   {
      
      public static const OUTFIT:String = "eventOutfit";
       
      
      public var value:Number = -1;
      
      public function ValueEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Number = -1)
      {
         super(param1,param2,param3);
         this.value = param4;
      }
      
      override public function clone() : Event
      {
         return new ValueEvent(type,bubbles,cancelable,this.value);
      }
      
      override public function toString() : String
      {
         return formatToString("ValueEvent","type","bubbles","cancelable","eventPhase","value");
      }
   }
}

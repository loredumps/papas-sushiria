package
{
   import flash.display.Sprite;
   import flash.events.Event;
   import package_4.class_5;
   
   public class Main extends Sprite
   {
       
      
      public var gameModule:class_5;
      
      public function Main()
      {
         super();
         if(stage)
         {
            this.init();
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.init);
         }
      }
      
      private function init(param1:Event = null) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.gameModule = new class_5();
         this.addChild(this.gameModule);
         this.gameModule.method_262();
      }
   }
}

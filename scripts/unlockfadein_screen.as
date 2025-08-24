package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="unlockfadein_screen")]
   public dynamic class unlockfadein_screen extends MovieClip
   {
       
      
      public function unlockfadein_screen()
      {
         super();
         addFrameScript(4,this.frame5);
      }
      
      internal function frame5() : *
      {
         stop();
      }
   }
}

package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="unlockfadeout_screen")]
   public dynamic class unlockfadeout_screen extends MovieClip
   {
       
      
      public function unlockfadeout_screen()
      {
         super();
         addFrameScript(5,this.frame6);
      }
      
      internal function frame6() : *
      {
         stop();
      }
   }
}

package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="furni_halloween_bats")]
   public dynamic class furni_halloween_bats extends MovieClip
   {
       
      
      public function furni_halloween_bats()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

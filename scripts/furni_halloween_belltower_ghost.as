package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="furni_halloween_belltower_ghost")]
   public dynamic class furni_halloween_belltower_ghost extends MovieClip
   {
       
      
      public function furni_halloween_belltower_ghost()
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

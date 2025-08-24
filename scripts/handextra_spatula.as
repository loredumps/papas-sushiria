package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_spatula")]
   public dynamic class handextra_spatula extends MovieClip
   {
       
      
      public function handextra_spatula()
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

package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_rose")]
   public dynamic class handextra_rose extends MovieClip
   {
       
      
      public function handextra_rose()
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

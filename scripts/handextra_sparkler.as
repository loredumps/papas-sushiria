package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_sparkler")]
   public dynamic class handextra_sparkler extends MovieClip
   {
       
      
      public function handextra_sparkler()
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

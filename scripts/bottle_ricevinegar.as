package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="bottle_ricevinegar")]
   public dynamic class bottle_ricevinegar extends MovieClip
   {
       
      
      public function bottle_ricevinegar()
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

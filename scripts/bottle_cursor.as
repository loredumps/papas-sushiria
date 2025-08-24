package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="bottle_cursor")]
   public dynamic class bottle_cursor extends MovieClip
   {
       
      
      public function bottle_cursor()
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

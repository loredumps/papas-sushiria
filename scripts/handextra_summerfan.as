package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_summerfan")]
   public dynamic class handextra_summerfan extends MovieClip
   {
       
      
      public function handextra_summerfan()
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

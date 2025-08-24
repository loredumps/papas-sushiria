package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="sponsor_logo_small")]
   public dynamic class sponsor_logo_small extends MovieClip
   {
       
      
      public function sponsor_logo_small()
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

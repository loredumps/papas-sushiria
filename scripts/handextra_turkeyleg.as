package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_turkeyleg")]
   public dynamic class handextra_turkeyleg extends MovieClip
   {
       
      
      public function handextra_turkeyleg()
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

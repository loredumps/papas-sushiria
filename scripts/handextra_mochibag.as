package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_mochibag")]
   public dynamic class handextra_mochibag extends MovieClip
   {
       
      
      public function handextra_mochibag()
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

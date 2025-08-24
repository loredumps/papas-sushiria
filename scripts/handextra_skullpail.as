package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_skullpail")]
   public dynamic class handextra_skullpail extends MovieClip
   {
       
      
      public function handextra_skullpail()
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

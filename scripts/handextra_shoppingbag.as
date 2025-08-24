package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_shoppingbag")]
   public dynamic class handextra_shoppingbag extends MovieClip
   {
       
      
      public function handextra_shoppingbag()
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

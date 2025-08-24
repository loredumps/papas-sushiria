package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_BigPauly_head")]
   public dynamic class customer_BigPauly_head extends MovieClip
   {
       
      
      public function customer_BigPauly_head()
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

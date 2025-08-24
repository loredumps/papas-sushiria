package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_SargeFan_hand")]
   public dynamic class customer_SargeFan_hand extends MovieClip
   {
       
      
      public function customer_SargeFan_hand()
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

package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Johnny_forearm")]
   public dynamic class customer_Johnny_forearm extends MovieClip
   {
       
      
      public function customer_Johnny_forearm()
      {
         super();
         addFrameScript(1,this.frame2);
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

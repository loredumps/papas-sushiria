package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Sue_forearm")]
   public dynamic class customer_Sue_forearm extends MovieClip
   {
       
      
      public function customer_Sue_forearm()
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

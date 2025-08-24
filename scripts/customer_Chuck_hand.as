package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Chuck_hand")]
   public dynamic class customer_Chuck_hand extends MovieClip
   {
       
      
      public function customer_Chuck_hand()
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

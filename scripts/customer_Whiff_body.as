package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Whiff_body")]
   public dynamic class customer_Whiff_body extends MovieClip
   {
       
      
      public function customer_Whiff_body()
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

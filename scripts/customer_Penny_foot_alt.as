package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Penny_foot_alt")]
   public dynamic class customer_Penny_foot_alt extends MovieClip
   {
       
      
      public function customer_Penny_foot_alt()
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

package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Ninjoy_head")]
   public dynamic class customer_Ninjoy_head extends MovieClip
   {
       
      
      public function customer_Ninjoy_head()
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

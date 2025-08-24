package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Bertha_head")]
   public dynamic class customer_Bertha_head extends MovieClip
   {
       
      
      public function customer_Bertha_head()
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

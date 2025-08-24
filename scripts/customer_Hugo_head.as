package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Hugo_head")]
   public dynamic class customer_Hugo_head extends MovieClip
   {
       
      
      public function customer_Hugo_head()
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

package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Jojo_head")]
   public dynamic class customer_Jojo_head extends MovieClip
   {
       
      
      public function customer_Jojo_head()
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

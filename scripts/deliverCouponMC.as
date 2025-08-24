package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="deliverCouponMC")]
   public dynamic class deliverCouponMC extends MovieClip
   {
       
      
      public var bgholder:MovieClip;
      
      public var holder:MovieClip;
      
      public function deliverCouponMC()
      {
         super();
         addFrameScript(179,this.frame180);
      }
      
      internal function frame180() : *
      {
         stop();
      }
   }
}

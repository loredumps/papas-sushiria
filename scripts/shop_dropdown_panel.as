package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="shop_dropdown_panel")]
   public dynamic class shop_dropdown_panel extends MovieClip
   {
       
      
      public var arrow:MovieClip;
      
      public var hiliter:MovieClip;
      
      public var label_txt:TextField;
      
      public var theme:MovieClip;
      
      public function shop_dropdown_panel()
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

package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="shop_palette")]
   public dynamic class shop_palette extends MovieClip
   {
       
      
      public var left_btn:SimpleButton;
      
      public var right_btn:SimpleButton;
      
      public var theme_icon:MovieClip;
      
      public var title_txt:TextField;
      
      public function shop_palette()
      {
         super();
      }
   }
}

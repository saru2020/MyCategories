MyCategories
============

Adding the Categories here anything that i use hereafter in my projects.



<b><u> To Add aShake View Effect, (just like what the iOS Lock Screen does when given a wrong password)  to your view : </u></b><br/>
<i> Just Drag & Drop the “UIView+View.h” & “UIView+View.m” in your project, then import it in your class and use the below line of code to apply it to your/any view. </b>

<br>

![Shake Effect](https://raw.github.com/saru2020/MyCategories/master/Categories/My%20Categories/shake.gif)

<br>

    [self.view shakeView:20];//Pass in the value to say how far the view must shake horizontally


<br>

<b><u> To Add iOS7’s “Parallax Effect” to your view : </u></b><br/>
<i> Just Drag & Drop the “UIView+View.h” & “UIView+View.m” in your project, then import it in your class and use the below line of code to apply it to your/any view. </b>

    [self.view addParallaxEffect];


<br>

<b><u> To apply a Floating Effect to your view (Just like the Selected Cards in the Paper App) : </u></b><br/>
<i> Just Drag & Drop the “UIView+View.h” & “UIView+View.m” in your project, then import it in your class and use the below line of code to apply it to your/any view. </b>

    ["your view" floatLeft:0.05 value:5]; // 0.05 = Angle, at which the view must rotate ; 5 = Value, adjust for floating effect

Unwind-Segue-Demo
=================

Several working unwind segue patterns and one question for Stackoverflow
I've almost finished converting a large Universal app to use Storyboards, 
but have one issue that is stumping me. 
I have created a Scene for a custom UIImagePickerController, 
but I can't figure out how to unwind from it. I know I could just dismiss the controller, 
but I want to use the unwind process to pass the image back to the original source view controller. 
When I try to do the manual unwind, I get the following exception:

'NSInvalidArgumentException', reason: 'Receiver (<MyImagePickerController: 0x7facdb838000>) has no segue with identifier 'unwindPickImage''

I think it is interesting that the crash log shows a call to

[UIViewController shouldPerformSegueWithIdentifier:sender:]

but if I implement that method in the MyImagePickerController class, it does not get called. 
Also, it is interesting that at the time of the crash, 
the view controller's _storyboardSequeTemplates private property is nil, 
but they are visually present in IB.

This project demonstrates this error and also several unwind segue patterns 
that I have used successfully elsewhere in the project to communicate between view controllers. 

Is is possible to use a manual unwind segue from a UIImagePickerController 
rather than using the old delegate pattern to return the image? If so, how? Thanks.

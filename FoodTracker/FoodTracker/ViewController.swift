//
//  ViewController.swift
//  FoodTracker
//
//  Created by leiquan on 15/12/22.
//  Copyright © 2015年 leiquan.me. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {//这里的delegate是让 After UIViewController, add a comma (,) and UITextFieldDelegate to adopt the protocol.
    // This means you can set it as the delegate of the text field and implement some of its behavior to handle the text field’s user input.
    
    // MARK: Properties  ,属性就是变量的意思
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    //@IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        //The self refers to the ViewController class, because it’s referenced inside the scope of the ViewController class definition.
        //ViewController is now a delegate for nameTextField.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()//注意，这个FirstResponder比较复杂
        return true //受气键盘
    }
    
    //The textFieldDidEndEditing(_:) method gives you a chance to read the information entered into the text field and do something with it. In your case, you’ll take the text that’s in the text field and use it to change the value of the label in your UI
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        // 这句话有问题
        //photoImageView.image = selectedImage
        print("这句话语文题");
        print(selectedImage);
        print(photoImageView);
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: Actions action就是时间响应
    //手势识别
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary//.号是缩写的形式
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    
    
    //The sender parameter points to the object that was responsible for triggering the action—in this case, a button.
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }

}


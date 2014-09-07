** IOS LinkedIn Authentication Library**
===================================
A Simple and easy to use library that helps you make user authentication in linkedin using Auth2.0 ,and retrieve the access toke which is required to retrieve any data from linkedin API.

![](/images/12.png)
![](/images/11.png)

**How to use this library**
===================================
1-you must create a linkedIn application , see the following steps 

## Step 1
log in with your linked in account and then go to https://www.linkedin.com/secure/developer and click on ‘Add New Application’
 
![](/images/13.png)

## Step 2
Fill out the form to register a new application , impotrant fields must be filled .

Default Scope: select the permissions that your application needs to retrieve data from linkedIn API
OAuth 2.0 Redirect URLs: enter a url that your application will redirect to it after end of authentication

finally , read LinkedIn API Terms of use and check in  agree and then click  on ‘Add Application’ .

![](/images/14.png)

## Step 3
Now you have registered your application on LinkedIn API , we will use the API Key and Secret Key in next steps .
![](/images/16.png)

2-Download the library and drag the folder named ...... to your project ,then open the config.h and set the values of the parameter in it 
![](/images/17.png)

3-create a button in your app that will make user authentication the action of the button will be like this 
![](/images/18.png)
After user authentication you will have the user acecess token to use in your application or there will be an error which will be printed in console


**Example App**
===================================
A small example application can be found here: https://github.com/jeyben/IOSLinkedInAPI/tree/master/Example/IOSLinkedInAPI-Podexample/IOSLinkedInAPI-Podexample






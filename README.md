# Google-Login

Follow below mentioned process to integrate Google Login in your iOS swift project.



Open terminaml and drag your project

Create podfile using following command

pod init

Install following pod in your project.

pod  'GoogleSignIn'

Login to your Google Account and Get an OAuth client ID.

Put this client id in following snipt

struct Constant {

    static let CLIENT_ID = "Put your client id here"

}

Now Add a URL scheme to your project

Google Sign-in requires a custom URL Scheme to be added to your project. To add the custom scheme:

Open your project configuration: double-click the project name in the left tree view. Select your app from the TARGETS section, then select the Info tab, and expand the URL Types section.
Click the + button, and add your reversed client ID as a URL scheme.

The reversed client ID is your client ID with the order of the dot-delimited fields reversed. For example:

com.googleusercontent.apps.1234567890-abcdefg






![](DemoGoogleLoginSources/Images/screenshot.png)




Run your code.

Thanks have a nice day.

# Widgetbook Challenge

This flutter app represents a coding challenge for Flutter enthusiasts applying for a job at [Widgetbook](https://widgetbook.io). 

If you just stumbled upon this repository for any other reason, you are welcome to participate in the challenge to cure your boredom. But make sure to send us an application after finishing 💪🏻

## Requirements

The app has been created with `flutter 2.10.3` (`dart 2.16.1`).

## Assignment

In this coding challenge, you will implement an application which accepts an input from the user and sends the input to a simulated backend. The flow of the user is the following:

1. The user is greeted on the home screen with the provided `Scaffold` which hosts a `TextField` and a submission `Button`. 
1. The user inserts a name into the `TextField` and presses the `Button` to send the request to the simulated backend.
1. The application computes the request, while the UI waits for the response. 
1. Once the request finished, the message of the response is shown in the UI below the submission button. If any error occurs while requesting from the server, an error message is shown instead.

## Tasks

1. Read this documentation.
1. Clone (do not fork) the repository.
1. Understand the provided code.
1. Implement a `TextField` accepting a `name`.
    - make sure to verify that no invalid input (e.g. numbers) has been inserted!
1. Implement a `Button`.
1. Implement the compution of the request whenever the `onPressed` of the button is triggered.
1. Show the response of the simulated backend.
1. Upload your code to a new repository 
    - do not create a fork
    - do not create a pull request
1. [send us the link](mailto:jens@widgetbook.io) to your repository with the solution
    - if you don't like the idea of your solution to be publicly available make sure to create a private repository and invite [JensHor](https://github.com/jenshor).

## Additional info

- You are allowed to use any package available on [pub.dev](https://pub.dev).
- You are allowed to create additional `Widget`s and classes.
- We do not expect a fancy design. For UI components, you can use Material or Cupertino widgets. 
- Please do not modify the `WidgetbookApi` class.
- Make sure to submit a solution from which you'd say that it is embracing standard software development patterns and practices. 

## Questions?

- If you have any questions regarding this assignment, let us know within an issue!

## Have fun! 

import 'package:exposys_registration/widgets/click_page_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/domain_tile.dart';

Map<String, String> matterDescription = {
  "Data Science": """PROJECT DESCRIPTION
In the given dataset, R&D Spend, Administration Cost and Marketing Spend of 50 Companies
are given along with the profit earned. The target is to prepare an ML model which can predict
the profit value of a company if the value of its R&D Spend, Administration Cost and Marketing
Spend are given.
i) Construct Different Regression algorithms
ii) Divide the data into train set and test set
iii) Calculate different regression metrics
iv) Choose the best model
Language: Python or R
DATA SET LINK:

https://drive.google.com/file/d/1Z7RKmScBO7n9vcDIG3Xeo853Ics4QFaF/view""",
  "FullStack Developer": """

FULL STACK DEVELOPER
Students build a complete Full Stack web application. They will work on project selection,
requirements gathering, project implementation and presentation.
Glimpse of FrontEnd Lab/Project:
Objective
Brrrgrrr - A online website that sells burgers. It suggests users to not only customize their
burgers by adding or removing ingredients but also create their own burger from the ingredients
in stock.
Mandatory things:
1. Arrays
2. DOM Manipulation
3. ES6 compatible
4. Higher Order Functions


Glimpse of BackEnd Lab/Project:
Objective
Blog Application - Build a blog application end to end with modules such as login, sign up, new
post addition deletion updation, search etc.
Mandatory things:
1. CRUD operations
2. File saving using Excel/Word
3. OOPs concepts
""",
  "Web Development": """
“Design and Develop Website Mass-Mail Dispatcher”
1. The system have been working with in this project is the web-based Mass-Mail
Dispatcher.
2. The application is designed to send mass mails to all the recipients uploaded through a
CSV file.
3. The purpose of this is to provide a tool to control and send emails to a vast number of
recipients.
4. The application will list and sort out all the valid and invalid emails detected by the
application allowing the users to more readily send emails as per user convenience.
5. The end user should be able to upload CSV file.
6. The application shall list the detected invalid emails found in the CSV File.
7. The user should be given a structured list of the valid emails.
INPUT CSV FILE:

https://drive.google.com/file/d/1kbu3Fu0LQzkM3CQLWXyRoB5Suguq8wqq/view""",
  "App Developer": """

Let’s assume students want to apply Exposys Data Labs Virtual internship through mobile
application.
1. Create Mobile User Interface
2. Develop Registration form & Login Credential
3. Explore different domains with ICONS
4. You can select the domain from the menu
5. You can apply

YOU CAN BUILD THIS APP USING ANDRIOD STUDIO.""",
  "Software Developer": """
Building an E-Learning Web application Platform guides you through creating an e-learning
platform. You will add fixtures to your project, use model inheritance, create custom model
fields, use class-based views, and manage groups and permissions. You will create a content
management system and handle formsets""",
  "IOT": """
OBJECTIVE:
Develop Intelligent Traffic information System based on Internet of things:
1. It connected to internet to receive data from traffic center or transmit data to car.
2. Or it can store data the car take an action according to the received data.
""",
  "UI, UX Design": """

1. Design the poster that helps you to promote company products or Services.
2. Use case: Design Exposys Data Labs Virtual Internship Posters With different domains
with attractive contents.
3. Domains Like Data Science,FrontEnd Developer,BackEnd Developer Full Stack
Developer UIUX Design Etc........
""",
  "Cyber Security": """
Project Description:
Encryption and Decryption of Text By Using Caesar Cipher.
Explaination: For example, if you encrypt the word ‘Software’ by shifting 3 alphabets, then the
Caesar chipper for it will be ‘VRIWZDUH.’ So, you can start by building a Software Interface to
break such simple encryption; later on, you can move on to complex concepts. Your software
interface should have a space for the input text, and drop option to choose the ‘Shift,’ and a space
for the output text, which will be the cipher decoded text.
Develop Caesar Cipher method using any programming language.
""",
  "Digital Marketing": """

DIGITAL MARKETING
1. Work on Social media marketing generate leads for Exposys Data Labs Virtual Internship
2. Report your leads in the form of xlsheet and send datalabs491@gmail.com
3. Work on Email Marketing and Write Content about Exposys Data Labs Virtual
Internship.
4. Make Reports
5. Work on Designs related services
6. Create short ads
""",
  "Content Writing": """
  . Crate Content for company Services/Products
2. Write all contents in the document
3. Use Case1: You Can Create Content about Exposys Data Labs Virtual Internship FAQ
4. Use Case2: You can create Content about Exposys Data Labs Services
""",
  "HR": """
1. Work on Company Requirement
2. Work on Hiring/on boarding/Screening/Negotiation Etc
""",
  "Digital Media Promoter": """
1. Monitor all Social Media
2. Work on Branding
3. Make Daily Report about Social Media Followers

USE CASE:
How to promoto Company Links Like Follow,Share. Youtube Channels and Subscribe through
Pan India/World Wide Using own Strategies. Examples the following Links can be Use user
Own digital media promotion Strategies.
2. Come with Solution all Digital media promotion and channels and increase the followers.
YouTube
Instagram
Pinterest.
Twitter.
LinkedIn.
Facebook


Social Links:


http://www.exposysdata.com/
https://www.youtube.com/channel/UCCdSuhhzWqmj9h9uyEl-JSA
https://www.facebook.com/Exposysdatalabs/
https://www.linkedin.com/company/13574296/admin/
https://www.instagram.com/exposysdatalabs
""",
  "Business Development Associate": """
1. Build contacts with potential clients to create new business opportunities
2. Keep prospective client database updated
3. Make cold calls for new business leads
4. Support in writing new business proposals
5. Maintain knowledge of all product and service offerings of the company
6. Arrange meetings for senior management with prospective clients
7. Follow company guidelines and procedures for acquisition of customers,
submission of tenders etc
""",
  "Process Associate": """
1. Understand company services or product
2. Depth understand about process of Services
3. Explain clearly about Services
4. Work on customer Services
"""
};

class ExplorationScreen extends StatelessWidget {
  const ExplorationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsList = [];
    matterDescription.forEach((key, value) {
      widgetsList.add(DomainTile(
          matter: key,
          clickPage: ClickPageTemplate(
            title: key,
            description: matterDescription[key] as String,
          )));
    });
    return Scaffold(
        appBar: AppBar(title: Text("Explore the domains")),
        body: Container(
            padding: EdgeInsets.all(20),
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 15,
                children: widgetsList)));
    // children: [
    //   DomainTile(
    //     matter: "Data Science",
    //     clickPage: Scaffold(),
    //   ),
    //   DomainTile(
    //     matter: "FullStack Developer",
    //     clickPage: Scaffold(),
    //   ),
    // ])));
  }
}

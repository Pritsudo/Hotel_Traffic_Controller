import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class MaileSender extends StatefulWidget {
  const MaileSender({Key? key}) : super(key: key);

  @override
  State<MaileSender> createState() => _MaileSenderState();
}

class _MaileSenderState extends State<MaileSender> {
  void sendMail() async {
    final Email send_email = Email(
  body: 'body of email',
  subject: 'subject of email',
  recipients: ['20dit008@charusat.edu.in'],
  cc: ['20dit008@charusat.edu.in'],
  bcc: ['20dit008@charusat.edu.in'],
  // attachmentPaths: ['/path/to/email_attachment.zip'],
  isHTML: false,
);

await FlutterEmailSender.send(send_email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: RaisedButton(
            onPressed: sendMail,
            child: Text('Send Mail'),
          ),
        ));
  }
}

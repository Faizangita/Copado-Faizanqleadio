trigger SendEmailOnPersonAccountCreation on Account (after insert) {
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
    
    // Iterate through the newly inserted Person Accounts
    for(Account acc : Trigger.new) {
        // Check if the Account is a Person Account (indicated by the record type)
        if(acc.PersonEmail != null) {
            // Create a new email message
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{ acc.PersonEmail });
            email.setSubject('New Person Account Created');
            
            // Compose email body with desired fields
            String emailBody = 'A new Person Account has been created with the following details:\n\n';
            emailBody += 'First Name: ' + acc.FirstName + '\n';
            emailBody += 'Last Name: ' + acc.LastName + '\n';
            emailBody += 'Phone: ' + acc.Phone + '\n';
            emailBody += 'Email: ' + acc.PersonEmail + '\n';
            emailBody += 'Date of Birth: ' + (acc.Date_of_Birth_c__c != null ? String.valueOf(acc.Date_of_Birth_c__c) : '') + '\n';
            emailBody += 'Shoe Sizes: ' + acc.shoe_sizes_c__c + '\n';
            emailBody += 'T-Shirt Sizes: ' + acc.T_shirt_sizes_c__c + '\n';
            emailBody += 'URL: https://innovation-page-99.scratch.my.salesforce-sites.com/personAccountsvf\n'; // Add the URL here
            
            email.setPlainTextBody(emailBody);
            emails.add(email);
        }
    }
    
    // Send the email messages
    if(!emails.isEmpty()) {
        Messaging.sendEmail(emails);
    }
}
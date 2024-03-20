public class personAccountController {
    public String FirstName { get; set; }
    public String LastName { get; set; }
    public String PersonEmail { get; set; }
    public String Phone { get; set; }
    public String shoe_sizes_c { get; set; }
    public String T_shirt_sizes_c { get; set; }
    public Date Date_of_Birth_c { get; set; }
    public Boolean isFormSubmitted { get; set; } // Add this property

    // Define options for shoe sizes picklist
    public List<SelectOption> getShoeSizeOptions() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('6', '6'));
        options.add(new SelectOption('6.5', '6.5'));
        options.add(new SelectOption('7', '7'));
        options.add(new SelectOption('7.5', '7.5'));
        options.add(new SelectOption('8', '8'));
        options.add(new SelectOption('8.5', '8.5'));
        options.add(new SelectOption('9', '9'));
        options.add(new SelectOption('9', '9.5'));
        options.add(new SelectOption('10', '10'));
        options.add(new SelectOption('10.5', '10.5'));
        options.add(new SelectOption('11', '11'));
        options.add(new SelectOption('11.5', '11.5'));
        options.add(new SelectOption('12', '12'));
        options.add(new SelectOption('12.5', '12.5'));
        options.add(new SelectOption('13', '13'));
        options.add(new SelectOption('13.5', '13.5'));
        options.add(new SelectOption('14', '14'));
        options.add(new SelectOption('14.5', '14.5'));
        options.add(new SelectOption('15', '15'));
        options.add(new SelectOption('15.5', '15.5'));
        options.add(new SelectOption('16', '16'));
        
        return options;
    }
    
    // Define options for t-shirt sizes picklist
    public List<SelectOption> getTShirtSizeOptions() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('XS', 'XS'));
        options.add(new SelectOption('S', 'S'));
        options.add(new SelectOption('M', 'M'));
        options.add(new SelectOption('L', 'L'));
        options.add(new SelectOption('XL', 'XL'));
        options.add(new SelectOption('XXL', 'XXL'));
       
        return options;
    }

    public personAccountController() {
        isFormSubmitted = false; // Initialize it to false
        // Initialize variables or retrieve existing user data here
        // For this example, let's assume you're querying some user data
        // Replace this with your actual query logic
        List<Account> currentUserList = [SELECT FirstName, LastName, PersonEmail, Phone, shoe_sizes_c__c, T_shirt_sizes_c__c, Date_of_Birth_c__c FROM Account WHERE Id = :UserInfo.getUserId() LIMIT 1];
    
    if(currentUserList.size() > 0) {
        Account currentUser = currentUserList[0];
        FirstName = currentUser.FirstName;
        LastName = currentUser.LastName;
        PersonEmail = currentUser.PersonEmail;
        Phone = currentUser.Phone;
        shoe_sizes_c = currentUser.shoe_sizes_c__c;
        T_shirt_sizes_c = currentUser.T_shirt_sizes_c__c;
        Date_of_Birth_c = currentUser.Date_of_Birth_c__c;
    } else {
        // Handle the scenario where no records are found
        // You can initialize the variables with default values or display an error message
    }
    }

    public void saveReview() {
        // Perform any necessary validation or processing before saving
        // For this example, let's assume you're directly updating the account record
        Account currentUser = [SELECT Id FROM Account WHERE Id = :UserInfo.getUserId()];

        currentUser.Phone = Phone;
        currentUser.shoe_sizes_c__c = shoe_sizes_c;
        currentUser.T_shirt_sizes_c__c = T_shirt_sizes_c;
        currentUser.Date_of_Birth_c__c = Date_of_Birth_c;

        update currentUser;

        // Optionally, you can add logic here to display a success message
        isFormSubmitted = true; // Set the flag to true after form submission
    }
}
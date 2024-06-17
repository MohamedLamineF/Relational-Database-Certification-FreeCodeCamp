#!/bin/bash

# Command to execute PostgreSQL queries
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# Print welcome message
echo -e "\n~~~~~ MY SALON ~~~~~\n"

# Function to display the service menu and handle customer interactions
SERVICE_MENU() {
    # Retrieve list of services from the database
    MY_SERVICES=$($PSQL "select service_id, name from services order by service_id")

    # If no services are available, display a message and return to the main menu
    if [[ -z $MY_SERVICES ]]; then
        MAIN_MENU "Sorry, we don't have any service available right now."
    else
        # Display the services menu
        echo 'Welcome to My Salon, how can I help you?'
        echo "$MY_SERVICES" | while read SERVICE_ID BAR NAME; do
            echo "$SERVICE_ID) $NAME"
        done

        # Read the customer's choice of service
        read SERVICE_ID_SELECTED

        # Retrieve the name of the selected service
        SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")

        # If the selected service does not exist, show the service menu again
        if [[ -z $SERVICE_NAME ]]; then
            SERVICE_MENU
        else
            # Prompt for customer's phone number
            echo -e "\nYour phone number?"
            read CUSTOMER_PHONE

            # Check if the customer already exists in the database
            CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE';")

            # If the customer does not exist, prompt for their name and insert a new customer record
            if [[ -z $CUSTOMER_NAME ]]; then
                echo -e "\nYour name?"
                read CUSTOMER_NAME

                # Prompt for the desired service time
                echo -e "\nHow many times do you want this service?"
                read SERVICE_TIME

                # Insert the new customer into the database
                ADD_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")

                # Retrieve the customer ID of the newly inserted customer
                CUSTOMER_ID=$($PSQL "SELECT customer_id from customers where name='$CUSTOMER_NAME'")

                # Insert a new appointment for the customer
                ADD_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) values('$SERVICE_TIME','$CUSTOMER_ID','$SERVICE_ID_SELECTED')")
            else
                # If the customer exists, just prompt for the service time
                echo -e "\nHow many times do you want this service?"
                read SERVICE_TIME
            fi

            # Confirm the appointment to the customer
            echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
        fi
    fi
}

# Call the service menu function to start the script
SERVICE_MENU

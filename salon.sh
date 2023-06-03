#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "How may I help you?" 
  echo -e "\n1) cut\n2) color\n3) style"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1 | 2| 3) BOOK_MENU ;;
    *) MAIN_MENU "Please enter an available service." ;;
  esac
}


BOOK_MENU() {
  # get customer info
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  
  # get costumer name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  # if not found
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nHello new customer. Please enter your name"
    read CUSTOMER_NAME
    
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
   fi

  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # get service time
  echo -e "\nAt what time would you like your appointment?"
  read SERVICE_TIME
  
  # add appointment to the table
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}




MAIN_MENU

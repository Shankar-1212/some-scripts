#!/bin/bash

# Fetch available topics
available_topics=$(curl -s https://www.azquotes.com/quotes/topics/index.html | pup 'a text{}' | grep -Ev '(Login|Sign Up|Authors|Topics|Quote of the Day|Picture Quotes|Top Quotes|Choose...|More|Join us on|Facebook|Join us on|Twitter|Join us on|Google+|Albert Einstein|Barack Obama|Mark Twain|Benjamin Franklin|Oscar Wilde|Mahatma Gandhi|Friedrich Nietzsche|Marilyn Monroe|George Bernard Shaw|William Shakespeare|View all|Javascript and RSS feeds|WordPress plugin|ES Version AZQuotes.ES|About Us|Contact Us|Terms|Privacy Policy|Create an Account|Forgot Password?|Sign in)' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' | sed '/^\s*$/d' | grep -v '^[A-Z]*$' | tr '[:upper:]' '[:lower:]')

# Prepare options for dmenu
options=$(echo "$available_topics" | tr ' ' '\n')

# Use dmenu to select a topic
selected_topic=$(echo "$options" | dmenu -p "Select a topic:")

if [ -n "$selected_topic" ]; then
    # Construct the URL with the lowercase topic
    url="https://www.azquotes.com/quotes/topics/${selected_topic}.html"
    
    # Fetch the quotes for the specified topic
    quotes=$(curl -s "$url" | pup 'a.title text{}' | grep -v '[!@#$%^&*()_+{}|":><?,./;~\[\]]' | grep -v '[0-9]')
    
    # Display the quotes
    echo "Quotes for topic: $selected_topic"
    echo "$quotes"
else
    echo "No topic selected."
fi

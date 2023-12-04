# README


## Thoughts and Experience

Gender was intersting, I went with the approach of their being two genders and everything else. So if you don't pick a gender you will get offers based solely on your age. Otherwise you get offers targeted towards your age and gender.

The front end can be replaced with a React front end. I gave myself a time limit, which I slightly exceeded, but after setting up the developer experience, data models, controllers, views, and tests, I was running short on time. I set a 4-hour time limit. I think I ended up going over by about 30 minutes, plus the time it takes me to write this. So, I decided to stick to the Rails stack (honestly, with Stimulus and Hotwire, it's pretty awesome now).

I have a love-hate relationship with take-home tests. It's nice not having someone stare at you while you code, but it misses that fun collaboration portion. I guess this depends on the developer you're pairing with, but when giving or taking a tech screen, it's nice to talk and meet people on the team and understand what they value when it comes to the code. I also find I can go down a rabbit hole on these things if I let myself. That's the reason I set firm stops.

## Things That Can Be Changed or Updated

- **Dockerization for Easy Setup**:
    - The app could be dockerized to simplify setup, making it as easy as running a single command. For those without a local Rails setup, a simple script is available: `/bin/bash -c "$(curl -fsSL https://rails.new/✨)"`. This script guides through the entire setup process in just a few minutes.

- **Dynamic Offer Compilation**:
    - Instead of directly tying offers to users, offers are compiled on the fly when a user logs in and accesses the offers page. For the current use case, directly linking offers to users seemed like overkill. However, as the user base and number of active offers grow, it might make sense to establish a many-to-many relationship between users and offers, with a join table precompiled with users' offers. This could be managed through a cron job.

- **Deactivating Offers**:
    - Offers could be designed to expire after a certain period. A chron job could be implemented to automatically deactivate these offers. This could mean the offers are expired for a little while before being deactivated if this job isn't pretty frequently.

- **Separation of Audience Data from Offers**:
    - Audience data is kept separate from the offers. This separation allows for future expansion of complex audience data without altering the offer table. It also enables users who create offers to save audience data, similar to how Facebook Ads saves ad sets and audiences. Enforcing this practice might be beneficial.

- **Spec Coverage**:
    - Efforts were made to cover the functionality with specs, though some cases may have been missed.

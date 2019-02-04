### Introduction

The [Hogwarts School of Witchcraft and Wizardry](https://en.wikipedia.org/wiki/Hogwarts) is switching over from owl delivery to e-mails when sending their admission letters. You have been hired to create a React application to facilitate writing these letters.

![Hogwarts Admission Letters 1](https://s3.amazonaws.com/horizon-production/images/hogwarts-admission-letters-1.png)

### Setup

From your challenges directory, run the following:

```no-highlight
$ et get hogwarts-admission-letters
$ cd hogwarts-admission-letters
$ yarn install
$ yarn run start
```

If you go to [localhost:8080](localhost:8080), there will be a static acceptance letter on the page and there should be no errors in your console.

Now you can make the letter dynamic so the user can select whether the letter is a rejection or acceptance letter. You can do this using the provided components -- App, AcceptanceLetterText, and RejectionLetterText -- and event handlers. This will allow the components to update without a full page reload.

### Deliverables

1.  When the initial application loads, your application should default to displaying an acceptance letter. The content of an acceptance letter is as follows:

    ```no-highlight
    HOGWARTS SCHOOL OF WITCHCRAFT AND WIZARDRY

    Headmaster: Albus Dumbledore
    (Order of Merlin, First Class, Grand Sorc., Chf. Warlock, Supreme Mugwump,
    International Confed. of Wizards)

    Dear Addressee,

    We are pleased to inform you that you have a place at Hogwarts School of
    Witchcraft and Wizardry. Please find enclosed a list of all necessary books and
    equipment.

    Term begins on 1 September. We await your owl by no later than 31 July.

    Your sincerely,

    Minerva McGonagall
    Deputy Headmistress
    ```

2.  Clicking on the "Rejected" checkbox should show the rejection letter with the following template:

    ```no-highlight
    HOGWARTS SCHOOL OF WITCHCRAFT AND WIZARDRY

    Headmaster: Albus Dumbledore
    (Order of Merlin, First Class, Grand Sorc., Chf. Warlock, Supreme Mugwump,
    International Confed. of Wizards)

    Dear Addressee,

    We regret to inform you that we are unable to offer you a place at Hogwarts
    School of Witchcraft and Wizardry. After reviewing your application and
    Github profile, we recognize that you are indeed a "coding wizard".
    Unfortunately, we have concluded that you do not have actual magical
    abilities, which you must have to be admitted into Hogwarts.

    Your sincerely,

    Minerva McGonagall
    Deputy Headmistress
    ```

3.  Unchecking the "Rejected" box should display the acceptance letter again.


## Pro-Tips:

* Pass an `onChange` handler to your checkbox.

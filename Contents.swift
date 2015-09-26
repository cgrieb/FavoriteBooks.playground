//: Favorite Books
//: A collection of book worth reading!

import UIKit

// >>>>>>>>>>>>>>>>> <<<<<<<<<<<<<<<<<<
// >>>>>>>> Set OPTIONS Here <<<<<<<<<<

// set this to limit the search to a specific "genre"
//    0 = include all
//    1 = Fantasy
//    2 = Science Fiction
//    3 = Classic
//    4 = Apologetics
var genreChoice = 0  // defaults to include all

// set this to limit the search to a specific author
//    0 = include all
//    1 = C.S. Lewis
//    2 = Josh McDowell
//    3 = J.R.R. Tolkien
//    4 = Louisa May Alcott
var authorChoice = 0  // defaults to include all

// set this true to include author bio for the selected author
let includeBio = false  // defaults to no bio

// >>>>> End of Settable Options <<<<<<
// >>>>>>>>>>>>>>>>> <<<<<<<<<<<<<<<<<<

// collection data
// the bookList contains: 
//     title, year of publication, genre, author
let bookList = [
    ["Evidence That Demands A Verdict",
        "1972",
        "Apologetics",
        "Josh McDowell"],
    ["Fellowship of the Ring, The",
        "1954",
        "Fantasy",
        "J.R.R. Tolkien"],
    ["Horse and His Boy, The",
        "1954",
        "Fantasy",
        "C.S. Lewis"],
    ["Hobbit, The",
        "1937",
        "Fantasy",
        "J.R.R. Tolkien"],
    ["Little Women",
        "1869",
        "Classic",
        "Louisa May Alcott"],
    ["Lion, the Witch and the Wardrobe, The",
        "1950",
        "Fantasy",
        "C.S. Lewis"],
    ["Last Battle, The",
        "1956",
        "Fantasy",
        "C.S. Lewis"],
    ["Magician's Nephew, The",
        "1955",
        "Fantasy",
        "C.S. Lewis"],
    ["Mere Christianity",
        "1952",
        "Apologetics",
        "C.S. Lewis"],
    ["More Evidence That Demands A Verdict",
        "1981",
        "Apologetics",
        "Josh McDowell"],
    ["Out of the Silent Planet",
        "1943",
        "Science Fiction",
        "C.S. Lewis"],
    ["Perelandra",
        "1943",
        "Science Fiction",
        "C.S. Lewis"],
    ["Prince Caspian: The Return to Narnia",
        "1951",
        "Fantasy",
        "C.S. Lewis"],
    ["Return of the King, The",
        "1955",
        "Fantasy",
        "J.R.R. Tolkien"],
    ["Silver Chair, The",
        "1953",
        "Fantasy",
        "C.S. Lewis"],
    ["That Hideous Strength",
        "1945",
        "Science Fiction",
        "C.S. Lewis"],
    ["Two Towers, The",
        "1954",
        "Fantasy",
        "J.R.R. Tolkien"],
    ["Voyage of the Dawn Treader, The",
        "1952",
        "Fantasy",
        "C.S. Lewis"]
]

// authors contains a brief bio keyed by author
let authors = [
    "Josh McDowell" : "As a young man, Josh McDowell considered himself an agnostic. He truly believed that Christianity was worthless. However, when challenged to intellectually examine the claims of Christianity, Josh discovered compelling, overwhelming evidence for the reliability of the Christian faith. After trusting in Jesus Christ as Savior and Lord, Josh’s life changed dramatically as he experienced the power of God’s love. [http://www.josh.org/about-us/joshs-bio/]",
    "C.S. Lewis" : "Few authors of fantasy literature are as beloved as C.S. Lewis, born in Belfast, Northern Ireland, on November 29, 1898. Time magazine has listed the first of his Chronicles of Narnia, The Lion, the Witch, and the Wardrobe, as one of the top 100 English language novels written in the twentieth century. Time had earlier confirmed Lewis’s stature as a writer of international renown when it featured him on its cover in September 1947.\n\nBut then, Time was merely affirming what millions of readers then and now understood: Lewis was a writer whose gifts gave his books an enduring appeal. Unforgettable characters, places and prose that stir the imagination and heart. The world of Narnia is one to which readers return again and again. It evokes a magic all its own. [http://www.cslewis.org/resource/cslewis/]",
    "J.R.R. Tolkien" : "John Ronald Reuel Tolkien (1892-1973) was a major scholar of the English language, specialising in Old and Middle English. Twice Professor of Anglo-Saxon (Old English) at the University of Oxford, he also wrote a number of stories, including most famously The Hobbit (1937) and The Lord of the Rings (1954-1955), which are set in a pre-historic era in an invented version of our world which he called by the Middle English name of Middle-earth. This was peopled by Men (and women), Elves, Dwarves, Trolls, Orcs (or Goblins) and of course Hobbits. He has regularly been condemned by the Eng. Lit. establishment, with honourable exceptions, but loved by literally millions of readers worldwide. [http://www.tolkiensociety.org/author/biography/]",
    "Louisa May Alcott" : "Louisa May Alcott was born in Germantown, Pennsylvania on November 29, 1832.  She and her three sisters, Anna, Elizabeth, and May, were educated by their father, philosopher/ teacher Bronson Alcott, and raised on the practical Christianity of their mother, Abigail May.\n Louisa spent her childhood in Boston and in Concord, Massachusetts, where her days were enlightened by visits to Ralph Waldo Emerson’s library, excursions into nature with Henry David Thoreau, and theatricals in the barn at \"Hillside\" (now Hawthorne’s \"Wayside\").\n\nLike her character, \"Jo March\" in Little Women, young Louisa was a tomboy.  \"No boy could be my friend till I had beaten him in a race,\" she claimed, \"and no girl if she refused to climb trees, leap fences ...\"\n\nFor Louisa, writing was an early passion.  She had a rich imagination and often her stories became melodramas that she and her sisters would act out for friends.  Louisa preferred to play the \"lurid\" parts in these plays --\"the villains, ghosts, bandits, and disdainful queens.\" [http://www.louisamayalcott.org/louisamaytext.html]"
]

// these constants are used for readability -- enumerations would be good here
// these values are used to index the bookList
let title = 0
let year = 1
let genre = 2
let author = 3
// these values are used to filter the "genre" - numbers are used to help prevent typos by user
let fantasy = 1
let sciFi = 2
let classic = 3
let apologetics = 4
// this dictionary returns the string based on the filter value
let genreDict = [ fantasy : "Fantasy", sciFi : "Science Fiction", classic : "Classic" , apologetics : "Apologetics" ]
// these values are used to filter the author - numbers are used to help prevent typos by user
let lewis = 1
let mcdowell = 2
let tolkien = 3
let alcott = 4
// this dictionary returns the string based on the filter value
let authorDict = [ lewis : "C.S. Lewis", mcdowell : "Josh McDowell", tolkien : "J.R.R. Tolkien", alcott : "Louisa May Alcott"]

//
// Now, display the collection based on the options selected
//

// first check data validity
if genreChoice < 0 || genreChoice > 5 {
    genreChoice = 0
}
if authorChoice < 0 || authorChoice > 5 {
    authorChoice = 0
}

// display a header
print("\n\nSuggested Reading:\n")

// if a specific author has been chosen, include the bio at the beginning if option selected
if authorChoice > 0 {
    print("Listing selections by \(authorDict[authorChoice]!)\n")
    if includeBio {
        print("\(authors[authorDict[authorChoice]!]!)\n")
    }
    for book in bookList.sort({ ($0[year] ) < ($1[year] ) }) {
        if genreChoice == 0 || book[genre] == genreDict[genreChoice]! {    // check for genre
            if book[author] == authorDict[authorChoice]! {
                print("\(book[title])  (\(book[year]), \(book[genre]))")
            }
        }
    }
} else if genreChoice > 0 {                  // if no specific author, check for genre option
    print("Listing \(genreDict[genreChoice]!) selections\n")
    for book in bookList.sort({ ($0[year] ) < ($1[year] ) }) {
        if book[genre] == genreDict[genreChoice]! {
            print("\(book[title]) by \(book[author])  (\(book[year]), \(book[genre]))")
        }
    }
} else {                                     // if no options apply, display all
    for book in bookList.sort({ ($0[year] ) < ($1[year] ) }) {
        print("\(book[title]) by \(book[author])  (\(book[year]), \(book[genre]))")
    }
}


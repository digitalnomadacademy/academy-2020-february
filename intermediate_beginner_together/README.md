#LESSON 6

## Git

Version Control

* git init

Initializes empty repository


* Source Tree

App that simplifies git management

* Commit

Commits changes, and adds message to the commit

* Branch

We can have different branches, to track multiple changes separately
You can switch between branches, to change your code

* Merge

You are on the branch that you want to merge into.
 Right click in source tree on the branch that has the changes that you
 want, and click Merge.
Changes from that branch will be merged into your branch.

* Rebase

You can move the root of your branch on top of new changes.
Be on your branch, and right click rebase on the branch that
you want to rebase on.

* Push / Pull / Remote (origin)

You can open empty git repository in github, and add that repository as a remote to your file

`git remote add origin https://github.com/digitalnomadacademy/git_example.git
 git push -u origin master
`

instructions will be shown in your git repository.

When you want to push your changes to the remote, press push.

When you want to pull the changes, that somebody else did, press pull. Make sure that
you are in the branch that you want to pull into. If you dont have that branch, double click on it
in source tree with name (origin/example_branch)


## HOMEWORK

1. Find a partner

2. One of you will open a repository in github, with name `'git_exercise_$name1_$name2'`
where `name1` and `name2` are your names.
Make sure to add your friend inside the repository, so that he can make changes as well.

3. One of you will create
* open flutter application
* `git init`
* add first git ignore - commit
* add the rest of counter app - commit
* add remote (github)
* push your changes

4. Other will clone the repository that was created (file new from version control, or clone in source tree)
First open your branch with your name.

5. One of you will change the appbar.
Add leading icon.
Add trailing text.
Change title.
 Center title.
Commit every change separately after the change.

6. Other will change the body.
Instead of Column with text, you will create centered Container with rounded corners.
child of that Container will be text that will show number of counter button presses.
Commit every change separately after the change.

// Make sure to push your branch as well to the remote


7.After each of you have done your changes, merge your changes to master branch.
After your friend has merged your changes to master branch, pull his changes localy.

p.s. If one of you has already pushed to master.
Before you can push, you have to pull first.
Proof of this will be link to the git repository.


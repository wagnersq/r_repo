## Script to verify and install a package

if(require("lme4", character.only=T, quietly=T)){
    print("lme4 is loaded correctly")
} else {
    print("trying to install lme4")
    install.packages("lme4")
    if(library(lme4, character.only=T)){
        print("lme4 installed and loaded")
    } else {
        stop("could not install lme4")
    }
}

print("package lme4 installed, loaded and now it will be unloaded.")

detach("package:lme4", unload=TRUE)

print("package lme4 installed unloaded.")
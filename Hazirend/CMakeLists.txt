
project(hazirend NONE)

add_latex_document(hazirend.tex INPUTS ../styles/rulebook.cls IMAGE_DIRS ../imgs)
copy_to_release(hazirend release)

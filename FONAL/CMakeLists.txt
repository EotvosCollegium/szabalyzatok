
project(fonal NONE)

add_latex_document(fonal.tex INPUTS ../styles/rulebook.cls IMAGE_DIRS ../imgs)
copy_to_release(fonal release)

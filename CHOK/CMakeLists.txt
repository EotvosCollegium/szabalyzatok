
project(chok NONE)

add_latex_document(chok.tex INPUTS ../styles/rulebook.cls IMAGE_DIRS ../imgs)
copy_to_release(chok release)

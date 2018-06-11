
project(ctszk NONE)

add_latex_document(ctszk.tex INPUTS ../styles/rulebook.cls IMAGE_DIRS ../imgs)
copy_to_release(ctszk release)


project(muhely NONE)

add_latex_document(francia.tex     INPUTS ../styles/rulebook.cls IMAGE_DIRS ../imgs)
add_latex_document(informatika.tex INPUTS ../styles/rulebook.cls IMAGE_DIRS ../imgs)
add_latex_document(klasszfil.tex   INPUTS ../styles/rulebook.cls IMAGE_DIRS ../imgs)
add_latex_document(magyar.tex      INPUTS ../styles/rulebook.cls IMAGE_DIRS ../imgs)
add_latex_document(tarstud.tex     INPUTS ../styles/rulebook.cls IMAGE_DIRS ../imgs)

copy_to_release(francia     release/Muhelyek)
copy_to_release(informatika release/Muhelyek)
copy_to_release(klasszfil   release/Muhelyek)
copy_to_release(magyar      release/Muhelyek)
copy_to_release(tarstud     release/Muhelyek)

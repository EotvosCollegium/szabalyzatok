# helper macro for copying the result pdf to the given folder
macro(copy_to_release file_name release_dir)
  latex_get_output_path(output_dir)
  
  add_custom_command(
    TARGET ${file_name}
    POST_BUILD
    COMMAND ${CMAKE_COMMAND}
    ARGS -E copy ${output_dir}/${file_name}.pdf ../${release_dir}/${file_name}.pdf
  )
endmacro(copy_to_release)

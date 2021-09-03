@[Include(
  "/home/ubuntu/projects/native-ui/LCUI/include/LCUI.h",
  "/home/ubuntu/projects/native-ui/LCUI/include/LCUI.h",
  "/home/ubuntu/projects/native-ui/LCUI/include/LCUI/display.h",
  "/home/ubuntu/projects/native-ui/LCUI/include/LCUI/gui/widget.h",
  "/home/ubuntu/projects/native-ui/LCUI/include/LCUI/gui/builder.h",
  "/home/ubuntu/projects/native-ui/LCUI/include/LCUI/gui/css_parser.h",
  "/home/ubuntu/projects/native-ui/LCUI/include/LCUI/gui/widget/textview.h",
  "/home/ubuntu/projects/native-ui/LCUI/include/LCUI/gui/widget/textedit.h",
  "/home/ubuntu/projects/native-ui/LCUI/include/LCUI/gui/widget/scrollbar.h",
  import_docstrings: "brief",
  prefix: %w(lcui_ LCUI_ LCUI Widget Widget_ Text ScrollBar),
  flags: "-I/home/ubuntu/projects/native-ui/LCUI/include/",
  remove_prefix: false
)]
@[Link(ldflags: "`pkg-config --cflags --libs x11 xcb libpng fontconfig`")]
# Rest
@[Link(ldflags: "-L#{__DIR__}/../LCUI/src/.libs")]
@[Link(ldflags: "-lLCUI")]
@[Link(ldflags: "-I#{__DIR__}/../LCUI/include")]
@[Link(ldflags: "-I#{__DIR__}/../LCUI/")]
lib LibLCUI
end
# LCUI_LoadCSSFile
# 
# rm ./tmp/output.cr && crystal run ./src/main.cr -- ./tmp/lib_lcui.cr >> ./tmp/output.cr
# cp ./tmp/output.cr /home/ubuntu/projects/native-ui/src/LibLCUI.cr
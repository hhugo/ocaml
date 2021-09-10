(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*             Maxence Guesdon, projet Cristal, INRIA Rocquencourt        *)
(*                                                                        *)
(*   Copyright 2001 Institut National de Recherche en Informatique et     *)
(*     en Automatique.                                                    *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)
(** The content of the LaTeX style to generate when generating LaTeX code. *)

let content =
  "\n\
   %% Support macros for LaTeX documentation generated by ocamldoc.\n\
   %% This file is in the public domain; do what you want with it.\n\n\
   \\NeedsTeXFormat{LaTeX2e}\n\
   \\ProvidesPackage{ocamldoc}\n\
  \              [2001/12/04 v1.0 ocamldoc support]\n\n\
   \\newenvironment{ocamldoccode}{%\n\
  \  \\bgroup\n\
  \  \\leftskip\\@totalleftmargin\n\
  \  \\rightskip\\z@skip\n\
  \  \\parindent\\z@\n\
  \  \\parfillskip\\@flushglue\n\
  \  \\parskip\\z@skip\n\
  \  %\\noindent\n\
  \  \\@@par\\smallskip\n\
  \  \\@tempswafalse\n\
  \  \\def\\par{%\n\
  \    \\if@tempswa\n\
  \      \\leavevmode\\null\\@@par\\penalty\\interlinepenalty\n\
  \  \\else\n\
  \    \\@tempswatrue\n\
  \    \\ifhmode\\@@par\\penalty\\interlinepenalty\\fi\n\
  \  \\fi}\n\
  \  \\obeylines\n\
  \  \\verbatim@font\n\
  \  \\let\\org@prime~%\n\
  \  \\@noligs\n\
  \  \\let\\org@dospecials\\dospecials\n\
  \  \\g@remfrom@specials{\\\\}\n\
  \  \\g@remfrom@specials{\\{}\n\
  \  \\g@remfrom@specials{\\}}\n\
  \  \\let\\do\\@makeother\n\
  \  \\dospecials\n\
  \  \\let\\dospecials\\org@dospecials\n\
  \  \\frenchspacing\\@vobeyspaces\n\
  \  \\everypar \\expandafter{\\the\\everypar \\unpenalty}}\n\
   {\\egroup\\par}\n\n\
   \\def\\g@remfrom@specials#1{%\n\
  \  \\def\\@new@specials{}\n\
  \  \\def\\@remove##1{%\n\
  \    \\ifx##1#1\\else\n\
  \    \\g@addto@macro\\@new@specials{\\do ##1}\\fi}\n\
  \  \\let\\do\\@remove\\dospecials\n\
  \  \\let\\dospecials\\@new@specials\n\
  \  }\n\n\
   \\newenvironment{ocamldocdescription}\n\
   {\\list{}{\\rightmargin0pt \
   \\topsep0pt}\\raggedright\\item\\noindent\\relax\\ignorespaces}\n\
   {\\endlist\\medskip}\n\n\
   \\newenvironment{ocamldoccomment}\n\
   {\\list{}{\\leftmargin 2\\leftmargini \\rightmargin0pt \
   \\topsep0pt}\\raggedright\\item\\noindent\\relax}\n\
   {\\endlist}\n\n\
   \\let \\ocamldocparagraph \\paragraph\n\
   \\def \\paragraph #1{\\ocamldocparagraph {#1}\\noindent}\n\
   \\let \\ocamldocsubparagraph \\subparagraph\n\
   \\def \\subparagraph #1{\\ocamldocsubparagraph {#1}\\noindent}\n\n\
   \\let\\ocamldocvspace\\vspace\n\n\
   \\newenvironment{ocamldocindent}{\\list{}{}\\item\\relax}{\\endlist}\n\
   \\newenvironment{ocamldocsigend}\n\
  \     {\\noindent\\quad\\texttt{sig}\\ocamldocindent}\n\
  \     {\\endocamldocindent\\vskip -\\lastskip\n\
  \      \\noindent\\quad\\texttt{end}\\medskip}\n\
   \\newenvironment{ocamldocobjectend}\n\
  \     {\\noindent\\quad\\texttt{object}\\ocamldocindent}\n\
  \     {\\endocamldocindent\\vskip -\\lastskip\n\
  \      \\noindent\\quad\\texttt{end}\\medskip}\n\n\
   \\endinput\n"

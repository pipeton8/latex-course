% !TEX encoding = UTF-8 Unicode
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tarea}
\LoadClass[11 pt]{article}

% Paquetes %
\RequirePackage{xkeyval}
\RequirePackage[pagestyles]{titlesec}\relax
\RequirePackage[bookmarks]{hyperref}\relax
\RequirePackage{titletoc}
\RequirePackage[T1]{fontenc}
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{setspace}
\RequirePackage{changepage}
\RequirePackage{eufrak}
\RequirePackage{charter}
\RequirePackage{graphicx, subfig, wrapfig}

% Opciones %
\define@key{tarea.cls}{duedate}[\today]{%
  \def\duedate{#1}%
}

\define@key{tarea.cls}{author}[Felipe Del Canto]{%
  \def\docauthorname{#1}%
}

\define@key{tarea.cls}{ramo}[]{%
  \def\ramo{#1}%
}

\define@key{tarea.cls}{doctype}[]{%
  \def\doctype{#1}%
}

\define@key{tarea.cls}{semester}[]{%
  \def\semester{#1}%
}

\define@key{tarea.cls}{year}[]{%
  \def\year{#1}%
}

\ExecuteOptionsX{duedate, author, ramo, doctype, semester, year}
\ProcessOptionsX\relax%

% Para página del título %
\def\@title{\huge\textbf{\doctype \\ \ramo}}
\def\@author{\LARGE\docauthorname}
\def\@date{\Large \duedate}

% Definición semestre %
\ifnum\semester=1
	\def\titulosemestre{Primer Semestre de }
\else
	\def\titulosemestre{Segundo Semestre de }
\fi

% Portada %
\newcommand{\dotitlepage}{
	\begin{titlepage}
	\thispagestyle{empty}

		\begin{minipage}{2.5cm}
			\includegraphics[width=2cm]{logouccolor.png}
		\end{minipage}
		\begin{minipage}{13 cm}
			\begin{flushleft}
   			     	\raggedright{
   			     		\noindent\large
   		 	    			{\sc Pontificia Universidad Católica de Chile \\ 
   			     			Facultad de Matemática \\ 
   			     			Departamento de Matemática \smallskip \\ 
						\titulosemestre \sc{\year}
   			     			}
    			    	}
			\end{flushleft}
		\end{minipage}
	
		% Título %
		\begin{center}
		\vspace*{\fill}
			\@title	\\
			\@author \\
		\vspace*{\fill}
		
		\vfill
		\Large{\duedate\ de \year}
		\end{center}
	\end{titlepage}
}

% Para título de los problemas %
\titleformat{name = \section, numberless}[hang]{\bf\huge}{}{0pt}{}


% Márgenes %
\oddsidemargin = 0.3 cm
\textwidth = 17 cm
\textheight = 24 cm
\headsep = 0.8 cm
\hoffset = -1 cm
\voffset = -2 cm
\spacing{1.4}

% Para las fotos %
\graphicspath{{./Graphics/}}

% Para las cosas matemáticas %
\everymath{\displaystyle}









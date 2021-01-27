\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ayudantia}
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
\RequirePackage{graphicx, subfig, wrapfig}

% Opciones %
\define@key{ayudantia.cls}{day}[]{%
  \def\day{#1}%
}

\define@key{ayudantia.cls}{month}[]{%
  \def\month{#1}%
}

\define@key{ayudantia.cls}{year}[]{%
  \def\year{#1}%
}

\define@key{ayudantia.cls}{ayudante}[Felipe Del Canto]{%
  \def\ayudante{#1}%
}

\define@key{ayudantia.cls}{profesor}[]{%
  \def\profesor{#1}%
}

\define@key{ayudantia.cls}{woman}[0]{%
  \def\woman{#1}%
}

\define@key{ayudantia.cls}{sigla}[]{%
  \def\sigla{#1}%
}

\define@key{ayudantia.cls}{ramo}[]{%
  \def\ramo{#1}%
}

\define@key{ayudantia.cls}{ayudnumber}[]{%
  \def\ayudnumber{#1}%
}

\define@key{ayudantia.cls}{facultad}[Facultad de Matem\'atica]{%
  \def\facultad{#1}%
}

\define@key{ayudantia.cls}{depto}[Departamento de Matem\'atica]{%
  \def\depto{#1}%
}

\ExecuteOptionsX{day, month, year, ayudante, profesor, woman, ramo, sigla, ayudnumber, facultad, depto}
\ProcessOptionsX\relax%

% Funciones para los títulos %
\def\Enero{Enero}
\def\Febrero{Febrero}
\def\Marzo{Marzo}
\def\Abril{Abril}
\def\Mayo{Mayo} 
\def\Junio{Junio}
\def\Julio{Julio}
\def\Agosto{Agosto} 
\def\Septiembre{Septiembre} 
\def\Octubre{Octubre} 
\def\Noviembre{Noviembre}

\ifx \month\Enero
	\def\titulosemestre{Temporada académica de Verano }
\fi

\ifx \month\Febrero
	\def\titulosemestre{Temporada académica de Verano }
\fi

\ifx \month\Marzo
	\def\titulosemestre{Primer Semestre de }
\fi

\ifx \month\Abril
	\def\titulosemestre{Primer Semestre de }
\fi

\ifx \month\Mayo
	\def\titulosemestre{Primer Semestre de }
\fi

\ifx \month\Junio
	\def\titulosemestre{Primer Semestre de }
\fi

\ifx \month\Julio
	\def\titulosemestre{Segundo Semestre de }
\fi

\ifx \month\Agosto
	\def\titulosemestre{Segundo Semestre de }
\fi

\ifx \month\Septiembre
	\def\titulosemestre{Segundo Semestre de }
\fi

\ifx \month\Octubre
	\def\titulosemestre{Segundo Semestre de }
\fi

\ifx \month\Noviembre
	\def\titulosemestre{Segundo Semestre de }
\fi

% Para títulos %
\newcommand{\dohead}{
	\begin{minipage}{2.5cm}
		\includegraphics[width=2.2cm]{/users/pipeton8/Library/texmf/tex/latex/logouc.jpg}
	\end{minipage}
	\begin{minipage}{13 cm}
		\begin{flushleft}
   		     	\raggedright{
   		     		\noindent
   	 	    			{\sc Pontificia Universidad Católica de Chile\smallskip \\ 
   		     			\facultad \smallskip \\ 
   		     			\depto \smallskip \\ 
   		     			\titulosemestre \year} \smallskip	\\
					{\ifnum\woman=0
						Profesor: \profesor\ -- Ayudante: \ayudante
					\else
						Profesora: \profesor\ -- Ayudante: \ayudante
					\fi}	
    		    	}
		\end{flushleft}
	\end{minipage}
	\vspace{6ex}
}

\newcommand{\dotitle}{
	{\Large \centerline{\bf \ramo \ - \sigla} \smallskip
	\centerline{\bf Ayudantía \ayudnumber} \smallskip
	\centerline{\day \ de \month \ de \year}}
	\vspace{3ex}
	\thispagestyle{empty}
}

% Márgenes %
\textheight = 23 cm
\textwidth = 18 cm
\hoffset = -2.5 cm
\voffset = -2 cm

% Para las fotos %
\graphicspath{{./Graphics/}}

% Para las cosas matemáticas %
\everymath{\displaystyle}









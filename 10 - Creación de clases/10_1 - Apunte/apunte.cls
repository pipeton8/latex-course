% Las clases permiten generar documentos con configuraciones especializadas, de manera que el preámbulo quede más pequeño y para que nosotros como usuarios tengamos que pensar menos.

% Las clases se comienzan muy parecidos a los paquetes:
\NeedsTeXFormat{LaTeX2e}	% Piden versión de LaTeX
\ProvidesClass{apunte}		% Proveen ``clase'' en lugar de ``paquete''
\LoadClass[11 pt]{article}		% Las clases, a diferencia de los paquetes, se basan en una clase preexistente, en este caso, article

% Paquetes %
% Nuevamente usamos la sintaxis \RequirePackage
\RequirePackage{xkeyval}		% Este paquete permite hacer los textos más inteligentes, como veremos en breve
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[pagestyles]{titlesec}\relax
\RequirePackage[bookmarks, colorlinks=true, allcolors=blue, pagebackref=true]{hyperref}\relax
\RequirePackage{titletoc}
\RequirePackage[T1]{fontenc}
\RequirePackage{setspace}
\RequirePackage{changepage}
\RequirePackage{eufrak}
\RequirePackage{charter}
\RequirePackage{graphicx, subfig, wrapfig}

% Opciones %
% Estas opciones (cuyo nombre no es asarozo, son opciones de la clase) nos permiten editar elementos de la clase, con inputs del usuario desde el documento mismo, o predeterminarlas
\define@key{apunte.cls}{author}[Felipe Del Canto]{% En este caso, para la clase apunte, creamos una opción llamada ``author'', cuyo valor predeterminado es ``Felipe Del Canto''
  \def\docauthorname{#1}%	% En el documento mismo, author puede ser editado
}

\define@key{apunte.cls}{docname}[]{%
  \def\docname{#1}%
}

\define@key{apunte.cls}{sigla}[]{%
  \def\sigla{#1}%
}

\define@key{apunte.cls}{semester}[]{%
  \def\semester{#1}%
}

\define@key{apunte.cls}{finished}[0]{%
  \def\finished{#1}%
}

\define@key{apunte.cls}{professor}[]{%
  \def\professor{#1}%
}

\define@key{apunte.cls}{year}[\the\year]{%
  \def\year{#1}%
}

\define@key{apunte.cls}{titulos}[Capítulo]{%
  \def\titulos{#1}%
}

\define@key{apunte.cls}{woman}[0]{%
  \def\woman{#1}%
}

\define@key{apunte.cls}{facultad}[Facultad de Matem\'atica]{%
  \def\facultad{#1}%
}

\define@key{apunte.cls}{depto}[Departamento de Matem\'atica]{%
  \def\depto{#1}%
}

% Los siguientes comandos le dicen a xkeyval que procese la información ingresada por el usuario
\ExecuteOptionsX{docname, author, semester, finished, sigla, professor, year, titulos, woman, facultad,depto}
\ProcessOptionsX\relax%

% Definiciones para portada %
\def\@title{\Huge\textbf{\sigla \\ \docname} }	% Usamos información del usuario para definir el título
\def\@author{\LARGE\docauthorname}		% y el autor

% Los siguientes comandos determinan la apariencia de las páginas y títulos en el documento. Me los robé de un
% tutorial y no las he editado (demasiado)

% Estilos de página %
\newpagestyle{index}[\large]{\headrule
\sethead{\docname}{\sectiontitle}{\ }}%

\newpagestyle{body}[\large]{\headrule
\sethead{\ \titulos\ \thesection }{\sectiontitle}{\thepage\ }}%

\newpagestyle{appendix}[\large]{\headrule
\sethead{\ Apéndice \thesection }{\sectiontitle}{\thepage\ }}%

% Estilos de título
\newcommand{\subsectiontitulo}{
	\titleformat{\subsection}[display]
	{\bf\large}{}{0pt}{\thesubsection \hspace{0.5 cm}}
	[{\titlerule[1pt]} \vspace{2ex}]
}

\newcommand{\sectiontitulo}{
	\titleformat{\section}[frame]
	{\Large}{\filcenter\small
	\ \MakeUppercase{\titulos}\ \thesection\ }
	{7pt}{\Large\bfseries\filcenter}
}

\newcommand{\indextitulo}{
	\titleformat{\section}[hang]
	{\bf\Huge}{}{0pt}{}
}

\newcommand{\appendixtitulo}{
	\titleformat{\section}[frame]
	{\normalfont}{\filcenter\small
	\ APÉNDICE \thesection \ }
	{7pt}{\Large\bfseries\filcenter}
}

% Márgenes %
% en una clase tiene sentido determinar los márgenes de la página, ya que la clase determina un tipo uniforme de documento.
\oddsidemargin = 0.3 cm
\textwidth = 17 cm
\textheight = 24 cm
\headsep = 0.8 cm
\hoffset = -1 cm
\voffset = -2 cm
\spacing{1.4}

% Para las fotos %
% Este comando le dice a LaTeX de donde importar las fotos. En este caso, le dice que busque en la carpeta Graphics que se encuentra en la misma carpeta del archivo .tex 
\graphicspath{{./Graphics/}}

% Para las cosas matemáticas %
\everymath{\displaystyle}

% Comandos de tipo de pagina %
% Estas funciones serán llamadas dentro del documento, para facilitar la escritura de este
\newcommand{\doindex}{\pagestyle{index} \indextitulo}
\newcommand{\dobody}{\pagestyle{body} \sectiontitulo \subsectiontitulo}
\newcommand{\doappendix}{\appendix \appendixtitulo \pagestyle{appendix}}

% Definición semestre %
% Esta ``función'' determina de manera inteligente, usando el input ``semester'' dado por el usuario, para escribir Primer o Segundo semestre, según corresponda
\ifnum\semester=1
	\def\titulosemestre{Primer Semestre de }
\else
	\def\titulosemestre{Segundo Semestre de }
\fi

% Portada %
% Este comando escribirá portadas inteligentes, que cambiaran según los input del usuario
\newcommand{\dotitlepage}{
	\begin{titlepage}
	\thispagestyle{empty}
		% Terminada %
	\ifnum\finished=1
		% Logo y encabezado %
		\begin{minipage}{2.5cm}
			\includegraphics[width=2cm]{logouccolor.png}
		\end{minipage}
		\begin{minipage}{13 cm}
			\begin{flushleft}
   			     	\raggedright{
   			     		\noindent\large
   		 	    			{\sc Pontificia Universidad Cat\'olica de Chile \\ 
   			     			\facultad \\ 
   			     			\depto \smallskip \\ 
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
		{\ifnum\woman=0
			\Large{Profesor: \professor}
		\else
			\Large{Profesora: \professor}
		\fi}
		\end{center}

		% No terminada
	\else
		% Logo y encabezado %
		\begin{minipage}{2cm}
			\includegraphics[width=1.5cm]{logouccolor.png}
		\end{minipage}
		\begin{minipage}{15 cm}
			\begin{flushleft}
			\vspace{1.5ex}
 			     	\raggedright{
   			     		\noindent\large
   		 	    			{\sc Pontificia Universidad Cat\'olica de Chile \\ 
   			     			\facultad \\ 
   			     			\depto \smallskip \\ 
   			     			}
    			    	}
			\end{flushleft}
		\end{minipage}
		
		% Título %
		\begin{center}
		\vspace*{\fill}	
			\@title	\\
			\@author \\
			{\ifnum\woman=0
				\Large{Profesor: \professor}
			\else
				\Large{Profesora: \professor}
			\fi}
		\vspace*{\fill}
	
		\vfill
	
		% Fecha %
		\large{\today}
		\end{center}
	\fi
	\end{titlepage}
}

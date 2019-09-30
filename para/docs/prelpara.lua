--[[

% Esport Language (PaRa) , first experiments
% This is a rapid prototype for planning Pasigraphy Rhapsody (Paszigráfia Rapszódia, PaRa)
%
% prelpara.lua
%
% Copyright (C) 2019 Norbert Bátfai, nbatfa@gmail.com, batfai.norbert@inf.unideb.hu
%
%  This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published by
%  the Free Software Foundation, either version 3 of the License, or
%  (at your option) any later version.
%
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
%
%  You should have received a copy of the GNU General Public License
%  along with this program.  If not, see <https://www.gnu.org/licenses/>.
%
% Version history
%
% Initial hack
%
% for vis_prel_para.tex
% Working title: Visualization of the Language of the Esports Culture: A Preliminary Study
%
% A LuaLaTeX based visualization experiment for Pasigraphy Rhapsody
%
% The idea of using yslant and xslant to achieve a 3D effect like appearance
% comes from Stefan Kottwitz's example http://www.texample.net/tikz/examples/sudoku-3d-cube/
%
%
--]]
function para2D(fmts)
    	local sntnc = fmts:split(":")
        r=sntnc[1]
        fmts_shift = 1
        for i = 0, r-1 do
            fmts_shift = fmts_shift +1
            n=sntnc[fmts_shift]
            fmts_shift = fmts_shift +1
            nod=sntnc[fmts_shift]
            tex.sprint(
            		"\\tikzstyle{shifting}=[xshift=", i,"cm]"
					,"\\shade[shifting, left color=mygray!100, right color=myblack!100] (0,0) rectangle +(1,1);"
					,"\\draw[shifting, step=\\N{",n,"}cm, mycyan] (0,0) grid (1,1);")
            for j = 1, nod do
            	fmts_shift = fmts_shift +1
            	x=sntnc[fmts_shift]
            	fmts_shift = fmts_shift +1
            	y=sntnc[fmts_shift]+1
				tex.sprint(
					"\\node[shifting, fill=myorange, anchor=north west,  inner sep=0pt,minimum size=\\N{",n,"}cm-\\pgflinewidth] at \\D{",n,"}{",x,"}{",y,"} {};")
            end
		end
	end

function para3D(direct, fmts)
    	dir=tonumber(direct)
        d={{2,1,2,-1,1,-1}, {1,0,1,-1,0,-1}}
       	local sntnc = fmts:split(":")
        r=sntnc[1]
        fmts_shift = 1
        for i = 0, r-1 do
            fmts_shift = fmts_shift +1
            n=sntnc[fmts_shift]
            fmts_shift = fmts_shift +1
            nod=sntnc[fmts_shift]
            tex.sprint(
            "\\tikzstyle{leftslant}=[yslant=-.5, xshift=",-1+i*d[dir][1],"cm, yshift=",-1+i*d[dir][2],"cm, blur shadow={shadow blur steps=5}]"
			,"\\tikzstyle{rightslant}=[yslant=0.5, xshift=",i*d[dir][3],"cm, yshift=",-1+i*d[dir][4],"cm, blur shadow={shadow blur steps=5}]"
			,"\\tikzstyle{topslant}=[yslant=0.5, xslant=-1, xshift=", i*d[dir][5],"cm, yshift=", i*d[dir][6],"cm, blur shadow={shadow blur steps=5}]"
			,"\\shade[leftslant, right color=mygray!100,left color=myblack!100] (0,0) rectangle +(1,1);"
			,"\\draw[leftslant, step=\\N{",n,"}cm, mycyan] (0,0) grid (1,1);")
            for j = 1, nod do
            	fmts_shift = fmts_shift +1
            	x=sntnc[fmts_shift]
            	fmts_shift = fmts_shift +1
            	y=sntnc[fmts_shift]+1
            	tex.sprint(
            	"\\node[leftslant, fill=myorange, anchor=north west,  inner sep=0pt,minimum size=\\N{",n,"}cm-\\pgflinewidth] at \\D{",n,"}{",x,"}{",y,"-.5*",x,"} {};")
            end
            fmts_shift = fmts_shift +1
            n=sntnc[fmts_shift]
            fmts_shift = fmts_shift +1
	        nod=sntnc[fmts_shift]
			tex.sprint(
				"\\shade[rightslant, right color=mygray!100,left color=myblack!100] (0,0) rectangle +(1,1);",
				"\\draw[rightslant, step=\\N{",n,"}cm, mypink](0,0) grid (1,1);")
			for j = 1, nod do
            	fmts_shift = fmts_shift +1
				x=sntnc[fmts_shift]
            	fmts_shift = fmts_shift +1
				y=sntnc[fmts_shift]
				tex.sprint(
					"\\node[rightslant, fill=mycyan, anchor=south west,  inner sep=0pt,minimum size=\\N{",n,"}cm-\\pgflinewidth] at \\D{",n,"}{",x,"}{",y,"+.5*",x,"} {};")
            end
            fmts_shift = fmts_shift +1
			n=sntnc[fmts_shift]
			fmts_shift = fmts_shift +1
            nod=sntnc[fmts_shift]
			tex.sprint(
				"\\shade[topslant, bottom color=mygray!100,top color=myblack!100] (0,0) rectangle +(1,1);",
				"\\draw[topslant, step=\\N{",n,"}cm, myorange] (0,0) grid (1,1);")
            for j = 1, nod do
           		fmts_shift = fmts_shift +1
            	x=sntnc[fmts_shift]
            	fmts_shift = fmts_shift +1
				y=sntnc[fmts_shift]
				tex.sprint(
					"\\node[topslant, fill=myyellow, anchor=south west,  inner sep=0pt,minimum size=\\N{",n,"}cm-\\pgflinewidth] at \\D{",n,"}{",y,"-",x,"}{",tonumber(y)/2,"+.5*",x,"} {};")
           end
	end
end

function N(n)
            tex.sprint(1/n)
end

function D(n, x, y)
            tex.sprint("(",       (1/n)*x,     ", ",   (1/n)*y,       ")")
end

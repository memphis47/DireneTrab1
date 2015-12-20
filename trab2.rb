$elementos = Array.new

def getVariaveis(sat)  
	sat.each do|cls|
		newclausulas = cls.tr('()', '')
		variaveis = newclausulas.split('#')
		variaveis.each do|elemento|
			elemento = elemento.tr(' ','')
			elemento = elemento.tr('~','')
			if !$elementos.include? elemento
				$elementos.push elemento
			end
		end
	end
end

def satTeste(elementos,pending)
	if elementos.empty? && !pending.empty?
		return false
	elsif pending.empty?
		return true
	else		
		eleAux = elementos
		head = elementos.first
		elementos.shift
		if(!satTeste(elementos,verifyTrue(pending,head)))
			eleAux.shift
			if(!satTeste(eleAux,verifyFalse(pending,head)))
				return false
			end
		end
		return true
	end
end

def verifyTrue(cls,elemento)
	aux = cls.dup
	cls.each do |clauses|
		newclausulas = clauses.tr('()', '')
		negelem = "~"+elemento
		newclausulas.slice! negelem
		if newclausulas.include? elemento
		   aux.delete(clauses)
		end
	end
	return aux
end

def verifyFalse(cls,elemento)
	aux = cls
	cls.each do |clauses|
		newclausulas = clauses.tr('()', '')
		if newclausulas.include? '~'+elemento
		   aux.delete(clauses)
		end
	end
	return aux
end


entrada = ARGV[0]
puts "Sat a ser verificado:" 
puts entrada

sat = entrada.split('&')

getVariaveis(sat)

elementosArray = $elementos

if satTeste(elementosArray,sat)
	puts "Sat Verdadeiro"
else
	puts "Sat Falso"
end


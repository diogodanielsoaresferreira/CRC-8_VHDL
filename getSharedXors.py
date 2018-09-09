from collections import Counter
import pprint

bit7 = [15, 14, 13, 12, 7, 6, 5, 0]
bit6 = [11, 7, 4, 2, 1, 0]
bit5 = [15, 14, 13, 12, 10, 7, 5, 3, 2, 1]
bit4 = [14, 13, 12, 11, 9, 6, 4, 2, 1, 0]
bit3 = [15, 14, 11, 10, 8, 7, 6, 3, 2, 1]
bit2 = [14, 13, 10, 9, 7, 6, 5, 2, 1, 0]
bit1 = [15, 14, 9, 8, 7, 4, 2, 1]
bit0 = [15, 14, 13, 8, 7, 6, 3, 1, 0]


def generateAllPairs(inArray):
	permutations = []
	for idx, i in enumerate(inArray):
		tmp = inArray[idx+1:]
		for j in tmp:
			permutations.append((i, j))

	assert len(permutations)==(len(inArray)*(len(inArray)-1))/2
	return permutations

def getBestPermutation(bit7, bit6, bit5, bit4, bit3, bit2, bit1, bit0, i=0):

	# All possible permutations
	allCombinations = [generateAllPairs(bit0), generateAllPairs(bit1), generateAllPairs(bit2), generateAllPairs(bit3), generateAllPairs(bit4), generateAllPairs(bit5), generateAllPairs(bit6), generateAllPairs(bit7)]
	tempCombinations = [[], [], [], [], [], [], [], []]
	fixedCombinations = [[], [], [], [], [], [], [], []]

	newCombsLen = 0

	# Order the list of combinations by its frequency
	# Is just a heuristic
	lista = [comb for bitComb in allCombinations for comb in bitComb]
	

	# If there are no possible combinations, the search has ended	
	if(len(lista)<1):
		return []

	counter=Counter(lista)

	# Only for the 10 most common permutations
	for inputs, count in counter.most_common(4):

		tempCombinations = [[], [], [], [], [], [], [], []]
		newbit7 = list(bit7)
		newbit6 = list(bit6)
		newbit5 = list(bit5)
		newbit4 = list(bit4)
		newbit3 = list(bit3)
		newbit2 = list(bit2)
		newbit1 = list(bit1)
		newbit0 = list(bit0)

		in0, in1 = inputs
		
		if in0 in newbit7:
			newbit7.remove(in0)
			if in1 in newbit7:
				tempCombinations[7].append((in0, in1))
		if in1 in newbit7:
			newbit7.remove(in1)
			
			

		if in0 in newbit6:
			newbit6.remove(in0)
			if in1 in newbit6:
				tempCombinations[6].append((in0, in1))
		if in1 in newbit6:
			newbit6.remove(in1)

		if in0 in newbit5:
			newbit5.remove(in0)
			if in1 in newbit5:
				tempCombinations[5].append((in0, in1))
		if in1 in newbit5:
			newbit5.remove(in1)
			


		if in0 in newbit4:
			newbit4.remove(in0)
			if in1 in newbit4:
				tempCombinations[4].append((in0, in1))
		if in1 in newbit4:
			newbit4.remove(in1)
			


		if in0 in newbit3:
			newbit3.remove(in0)
			if in1 in newbit3:
				tempCombinations[3].append((in0, in1))
		if in1 in newbit3:
				newbit3.remove(in1)
			

		if in0 in newbit2:
			newbit2.remove(in0)
			if in1 in newbit2:
				tempCombinations[2].append((in0, in1))
		if in1 in newbit2:
			newbit2.remove(in1)


		if in0 in newbit1:
			newbit1.remove(in0)
			if in1 in newbit1:
				tempCombinations[1].append((in0, in1))
		if in1 in newbit1:
			newbit1.remove(in1)
			


		if in0 in newbit0:
			newbit0.remove(in0)
			if in1 in newbit0:
				tempCombinations[0].append((in0, in1))
		if in1 in newbit0:
			newbit0.remove(in1)

		# Call the funcion recursively
		newCombstemp = getBestPermutation(newbit7, newbit6, newbit5, newbit4, newbit3, newbit2, newbit1, newbit0, i+1)
		for idx, newComb in enumerate(newCombstemp):
			tempCombinations[idx] += newComb


		# If the result is better that the one saved, save the new result

		countCombs = []
		for combsBit in tempCombinations:
			for comb in combsBit:
				countCombs += [comb]

		if len(countCombs)>newCombsLen:
			newCombsLen = len(countCombs)
			fixedCombinations = list(tempCombinations)

	return fixedCombinations

combinations = getBestPermutation(bit7, bit6, bit5, bit4, bit3, bit2, bit1, bit0)

# Get the combinations of all combinations
all_combs = []
for c in combinations:
	all_combs += generateAllPairs(c)

counter=Counter(all_combs)

pp=pprint.PrettyPrinter(indent=4)

print "1-Combinations"
pp.pprint(combinations)
print "2-Combinations to test if the number of xors reduces"
pp.pprint(counter.most_common())


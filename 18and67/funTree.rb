class Branch < Array
				attr_accessor :line_number

				def initialize line_number
								@line_number = line_number
				end
end

class Tree

				def initialize
								@branches = []
				end

				def getBranch line_number

								branch = @branches[line_number]

								if branch.nil?
												max_line_number = @branches.collect(&:line_number).max
												branch = Branch.new max_line_number+2
												max_line_number.times { branch << [Leaf.new(nil),Leaf.new(nil)]}
								end

								branch
				end

				def countMax 
								curr_leaf = @branches.first.first
								curr_leaf.countMaxRe 
				end

				def << branch
								begin
												raise unless branch.kind_of?(Branch) && branch.all?{ |l| l.kind_of?(Leaf)}
												@branches << branch
								rescue
												@branches << [Leaf.new(0)] # This needs more comprehensive handling, for more bizzare trees 
								end
				end

				def method_missing name, *args, &block
								@branches.send name, *args, &block
				end

				def sortTree 

								@branches.reverse.map! do |branch|
												branch.map! do |leaf|
																leaf.sortLeaves
																leaf
												end
												branch
								end.reverse
				end

end

class Leaf
				attr_accessor :value, :parent, :leftleaf, :rightleaf
				def initialize(value=0)
								@value = value
				end
				def sortLeaves
								return if @leftleaf.nil? && @rightleaf.nil?
								if @leftleaf.countMaxRe < @rightleaf.countMaxRe
												@leftleaf, @rightleaf = @rightleaf, @leftleaf
								end
				end

				def show
								puts "Leaf: Value: #{value}, Parent: #{parent.value unless parent.nil?}, Lf: #{ leftleaf.value unless leftleaf.nil?}, Rl #{rightleaf.value unless rightleaf.nil?}"
				end
				def countMaxRe 
								if @leftleaf.nil?
												return @value
								else
												return @value+@leftleaf.countMaxRe
								end
				end

end

def moveThroughTree tree
				curr_leaf = tree.first.first
				curr_leaf.show
				begin
								dir = gets.chomp
								case dir
								when 'r'
												curr_leaf = curr_leaf.rightleaf

								when 'l'
												curr_leaf = curr_leaf.rightleaf
								when 'p'
												curr_leaf = curr_leaf.parent
								end
								curr_leaf.show unless curr_leaf.nil?
				end until curr_leaf.nil? || curr_leaf.rightleaf.nil? && curr_leaf.leftleaf.nil?
end

#readTriangle reads into array arrays of every line of file. Therefore data
#should be in form of triangle (first node topmost). It skips the lines with text, so shouldn't rise any error
#
#EXAMPLE
#1
#2 3
#4 5 6
#into
#[[1],[2,3],[4,5,6]]
#
def readTriangle file
				triangle = []
				file.lines do |line|
								triangle << line.chomp.split.map(&:to_i) unless line=~/^$/ || line=~/[a-zA-Z]/
				end
				triangle
end

#extracts Tree from array of arrays formatted according to readTriangle example. 
#It creates tree, always with 2 children. The topmost parent and lowest children are nil
def convertTraingleToTreeWithoutConnections triangle
								tree = Tree.new
								triangle.each_with_index do |line, index|
												branch = Branch.new index

												line << 0 until line.count == index+1 if line.count < index+1
												line.pop  until line.count == index+1 if line.count > index+1

												line.each do |value|
																branch << Leaf.new(value)
												end
												tree << branch
								end
								tree
end

def convertSimpleBranchIntoBinaryBranch branch, branch_child
												#original branches:
												#1
												#2 3
												#4 5 6
												#7 8 9 10
												#are turned into
												#1
												#2 3
												#4 5 5 6
												#7 8 8 9 9 10
												#so it could be turned into binary tree
												if branch.size > 1
																middle = branch_child[1..-2].zip branch_child[1..-2]
																branch_child = [branch_child.first, middle, branch_child.last].flatten
												end

												branch_child
end

def connectChildrenAndParents branch_child, branch_parent
												#each element in parent branch gets two consecutive leaves from the children branch. 
												#Because middle leaves are reapeted, neighbouring parents have one common child
												#
												branch_child.each_slice(2).with_index do |(child_1, child_2), i|
																parent = branch_parent[i]

																child_1.parent = parent
																parent.leftleaf = child_1

																child_2.parent = parent 
																parent.rightleaf = child_2 
												end
end
def prepareTree triangle
				begin
								raise EmptyTriangle if triangle.empty?

								tree = convertTraingleToTreeWithoutConnections triangle

								tree[0..-2].each_with_index do |branch, branch_index|
												branch_child = tree.getBranch(branch.line_number+1)
												branch_parent = branch

												branch_child = convertSimpleBranchIntoBinaryBranch branch, branch_child

												connectChildrenAndParents branch_child, branch_parent

								end

				rescue EmptyTriangle
								tree = nil
				rescue MalformedTriangle
								tree = nil
				end
				tree
end


def showTree tree

				curr_leaf = tree.first.first
				showLeaf curr_leaf
end

def showLeaf leaf
				print leaf.value.to_s + " "
				unless leaf.leftleaf.nil?
								showLeaf leaf.leftleaf
				end
				unless leaf.rightleaf.nil?
								showLeaf leaf.rightleaf
				end
				if leaf.leftleaf.nil? 
								print "\n"
				end
end

class EmptyTriangle < StandardError
end
class MalformedTriangle < StandardError
end

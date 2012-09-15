require "./18"
require "minitest/spec"
require "minitest/autorun"


class Tree
				def == tree_2

								self.inspect == tree_2.inspect
								#@branches.each_with_index do |branch, b_index|
									#branch.each_with_index do |leaf, l_index|
										#return false unless leaf == tree_2.getBranch(b_index).fetch(l_index)
									#end
								#end
								#return true
				end

end

	describe 'Tree' do
def setup
		@file = File.open('test_cases.txt', 'rb')
		@data = @file.readlines('sep')
	end

	def teardown
		@file.close
	end
	it "test_answer" do
		assert_equal 7273, maxPatchInTree('triangle.txt')
	end

	it "test_readTrinagle_normal_data" do
		assert_equal readTriangle(@data[0]), [[1],[2,3],[4,5,6]]
		assert_equal readTriangle(@data[1]), [[123]]
		assert_equal readTriangle(@data[2]), [[1],[2,3],[4,5,6]]
	end

	it "test_readTrinagle_textfile" do
		assert_equal readTriangle(@data[3]), []

	end

	it "test_readTrinagle_incomplete_data" do
					assert_equal readTriangle(@data[4]), [[1],[1],[1,2,3]]
	end

	it "test_prepareTree_correct_triangle" do
		triangle = readTriangle @data[0]
		tree = prepareTree triangle
		assert_equal tree.first.first.value, triangle.first.first
	end

	it "test_prepareTree_incorrect_triangle" do
		triangle = readTriangle @data[3]
		tree = prepareTree triangle
		assert_equal tree, nil
	end

	it "test_prepareTree_incomplete_triangle" do
					triangle_incomplete = readTriangle @data[4]
					tree_from_incomplete = prepareTree triangle_incomplete
					
					triangle_complete = readTriangle @data[5]
					tree_from_complete = prepareTree triangle_complete

					assert_equal tree_from_incomplete, tree_from_complete
	end

	it "should get rid of malformed traingle" do
					triangle_malformed = readTriangle @data[6]
					tree_from_malformed = prepareTree triangle_malformed

					triangle_complete = readTriangle @data[0]
					tree_from_complete = prepareTree triangle_complete

					assert_equal tree_from_malformed, tree_from_complete
	end
		
	end

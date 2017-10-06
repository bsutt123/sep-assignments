include RSpec

require_relative 'binary_heap'
require 'pry'

RSpec.describe BinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:heap) { BinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      heap.insert(pacific_rim)
      expect(root.left.title).to eq "Pacific Rim"
    end

    it "properly inserts 2 nodes below root" do
      heap.insert(pacific_rim)
      heap.insert(braveheart)
      expect(root.right.title).to eq "Braveheart"
    end

    it "properly inserts 3rd node on 2nd level" do
      heap.insert(jedi)
      heap.insert(braveheart)
      heap.insert(pacific_rim)
      expect(root.left.left.title).to eq "Pacific Rim"
    end

    it "properly swaps nodes up" do
      heap.insert(jedi)
      heap.insert(braveheart)
      heap.insert(mad_max_2)
      expect(heap.root).to eq mad_max_2
  end
 
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(empire)
      heap.insert(braveheart)
      expect(heap.find(root, nil)).to eq nil
    end

    it "properly finds a node" do
      heap.insert(empire)
      heap.insert(braveheart)
      heap.insert(pacific_rim)
      expect(heap.find(root, pacific_rim.title)).to eq pacific_rim
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      heap.insert(jedi)
      heap.insert(braveheart)
      expect(heap.delete(root, nil)).to eq nil
    end

    it "properly deletes a node" do
      heap.insert(jedi)
      heap.insert(braveheart)
      heap.delete(root, braveheart.title)
      expect(heap.root.right).to eq nil
    end

    it "still maintains heap property" do
      heap.insert(donnie)
      heap.insert(braveheart)
      heap.insert(pacific_rim)
      heap.insert(jedi)
      heap.delete(root, donnie.title)
      expect(heap.root.left).to eq jedi
    end

    it "rebalance tree when deleteing" do
      heap.insert(jedi)
      heap.insert(braveheart)
      heap.insert(pacific_rim)
      heap.delete(root, braveheart.title)
      expect(heap.root.right).to eq pacific_rim
    end

  end

  describe "#printf" do

     specify {
       expected_output = "Mad Max 2: The Road Warrior: 98\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nThe Matrix: 87\nThe Martian: 92\nThe Shawshank Redemption: 91\nDistrict 9: 90\nInception: 86\nDonnie Darko: 85\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nPacific Rim: 72\n"
       heap.insert(mad_max_2)
       heap.insert(empire)
       heap.insert(hope)
       heap.insert(martian)
       heap.insert(shawshank)
       heap.insert(district)
       heap.insert(inception)
       heap.insert(donnie)
       heap.insert(jedi)
       heap.insert(braveheart)
       heap.insert(pacific_rim)
       expect { heap.print_heap }.to output(expected_output).to_stdout
     }
  end
end
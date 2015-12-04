chai = require 'chai'
Vector = require '../src/vector'
chai.should()

describe 'Empty Vector []', ->
    vec1 = new Vector
    it 'should have a length of 0', ->
        vec1.length.should.equal 0
    it 'elements should equal []', ->
        vec1.elements.join.should.equal [].join

describe 'Simple Vector [1,2,3,4,5]', ->
    vec1 = new Vector 1,2,3,4,5
    it 'should have a length of 5', ->
        vec1.length.should.equal 5
    it 'elements should equal [1,2,3,4,5]', ->
        vec1.elements.join.should.equal [1,2,3,4,5].join
describe 'Vector Operations', ->
    vec1 = new Vector 1,2,3,4,5
    vec2 = new Vector 1,1,1,1,1
    it '[1,2,3,4,5] + [1,1,1,1,1] should equal [2,3,4,5,6]', ->
        Vector.add(vec1, vec2).elements.join.should.equal [2,3,4,5,6].join
    it '[1,2,3,4,5] - [1,1,1,1,1] should equal [0,1,2,3,4]', ->
        Vector.sub(vec1,vec2).elements.join.should.equal [0,1,2,3,4].join

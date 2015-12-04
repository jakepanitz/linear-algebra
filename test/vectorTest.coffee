chai = require 'chai'
Vector = require '../src/vector'
chai.should()

describe 'Empty Vector Construction []', ->
    vec1 = new Vector
    it 'should have a length of 0', ->
        vec1.length.should.equal 0
    it 'elements should equal []', ->
        vec1.elements.should.eql []

describe 'Simple Vector Construction [1,2,3,4,5]', ->
    vec1 = new Vector 1,2,3,4,5
    it 'should have a length of 5', ->
        vec1.length.should.equal 5
    it 'elements should equal [1,2,3,4,5]', ->
        vec1.elements.should.eql [1,2,3,4,5]

describe 'Static Vector Operations', ->
    vec1 = new Vector 1,2,3,4,5
    vec2 = new Vector 1,1,1,1,1
    vec3 = new Vector 5,4,3,2,1
    vec4 = new Vector 10,20,30,40,50
    it '[1,2,3,4,5] + [1,1,1,1,1] should equal [2,3,4,5,6]', ->
        Vector.add(vec1, vec2).elements.join().should.equal [2,3,4,5,6].join()
    it '[1,2,3,4,5] - [1,1,1,1,1] should equal [0,1,2,3,4]', ->
        Vector.sub(vec1,vec2).elements.join().should.equal [0,1,2,3,4].join()
    it '[1,2,3,4,5] + [1,1,1,1,1] + [5,4,3,2,1] + [10,20,30,40,50] should equal [17,27,37,47,57] ', ->
        Vector.add(vec1,vec2,vec3,vec4).elements.join().should.equal [17,27,37,47,57].join()

describe 'Member Vector Operations', ->
    vec1 = new Vector 1,2,3,4,5
    vec2 = new Vector 1,1,1,1,1
    it '[1,2,3,4,5] + [1,1,1,1,1] should equal [2,3,4,5,6]', ->
        vec1.add vec2
        vec1.elements.join().should.equal [2,3,4,5,6].join()
    it '[2,3,4,5,6] - [1,1,1,1,1] should equal [1,2,3,4,5]', ->
        vec1.sub vec2
        vec1.elements.join().should.equal [1,2,3,4,5].join()

describe 'Magnitude and Direction', ->
    vec1 = new Vector 2,3,5
    vec2 = new Vector 1, 3, -4
    it 'Magnitude of [2,3,5] should equal 6.16', ->
        parseFloat(vec1.magnitude().toPrecision(3)).should.equal 6.16

    it 'Normalized Vector of [1,3,-4] should equal [0.34,0.53,-0.777]', ->
        vec2.normalized().elements.should.have.members [-0.20,0.59,-0.78]

class Vector
    # Vector constructor - takes any amount of numbers as arguments. Fails if any NaN are recieved.
    constructor: (args...) ->
        # initialize empty elements array
        @elements = []
        # if argumnt is a single array, construct vector out of array and return
        if args.length is 1 and Array.isArray args[0]
            for elem in args[0]
                if isNaN elem
                    console.log "Error: '" + elem + "' is not a number. Could not construct vector."
                    delete @elements
                    return
            @elements = args[0]
            @length = args[0].length
            return
        # else if multiple number arguments -
        # push every argument into element array, return and log error if NaN
        for arg in args
            if isNaN arg
                console.log "Error: '" + arg + "' is not a number. Could not construct vector."
                delete @elements
                return
            @elements.push arg
        # initialize and define vector length
        @length = args.length

    multiply: (multiple) =>
        for elemIndex in [0..@elements.length-1]
            @elements[elemIndex] *= multiple



    # Returns vector sum, returns null if vectors are of unequal length
    @add: (args...) ->
        # Check if all vector lengths are equal and return null if they are not.
        if !@assertEqualLength.apply(this, args)
            console.log "Error: Cannot add vectors of unequal length."
            return null
        # Define length of vector - They are all the same so getting the first is sufficient.
        vectorLength = args[0].length
        # Initalize empty vectorSum array to be returned
        vectorSum = []
        # Sum each element and push to vector sum array
        for i in [0..vectorLength-1]
            sum = 0
            sum += arg.elements[i] for arg in args
            vectorSum.push sum
        # return vector sum
        return vectorSum

    # Returns the vector sum of the first vector and the negation of all others.
    @sub: (args...) ->
        # initalize adjusted array that will contain original first vector and negated others
        adjustedArray = []
        adjustedArray.push(args[0])

        for arg in args.splice(1,args.length)
            adjustedArray.push(@negate arg)

        return @add.apply(this, adjustedArray)

    # Returns true if vectors are all the same length, and false otherwise.
    @assertEqualLength: (vectors...) ->
        for vector in vectors
            if typeof expectedLength is "undefined"
                expectedLength = vector.length
            if vector.length isnt expectedLength
                return false
        return true

    # Return the reverse vector
    @negate: (vector) ->
        # initalize negated vector array
        negatedVector = []
        # push each negated element into negated vector array
        for elem in vector.elements
            negatedVector.push -elem
        return new Vector(negatedVector)









vec1 = new Vector(8.218,-9.341)
vec2 = new Vector(-1.129, 2.111)
console.log Vector.add vec1, vec2

vec3 = new Vector(7.119, 8.215)
vec4 = new Vector(-8.223, 0.878)
console.log Vector.sub vec3, vec4

vec5 = new Vector(1.671, -1.012, -0.318)
vec5.multiply(7.41)
console.log vec5

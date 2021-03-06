class Vector
    # Vector constructor - takes any amount of numbers as arguments. Fails if any NaN are recieved.

    # Constructors ---------------------------------------------------------------------------------

    constructor: (args...) ->
        # initialize empty elements array
        @elements = []
        # if argumnt is a single array, construct vector out of array and return
        if args.length is 1 and Array.isArray args[0]
            for elem in args[0]
                if isNaN elem
                    throw "Error: '" + elem + "' is not a number. Could not construct vector."
                    delete @elements
                    return
            @elements = args[0]
            @length = args[0].length
            return
        # else if multiple number arguments -
        # push every argument into element array, return and log error if NaN
        for arg in args
            if isNaN arg
                throw "Error: '" + arg + "' is not a number. Could not construct vector."
                delete @elements
                return
            @elements.push arg
        # initialize and define vector length
        @length = args.length

    # ------------------------------------------------------------------------------------------



    # Member Functions -----------------------------------------------------------------------------

    add: (args...) ->
        args.unshift @
        @elements = Vector.add.apply(Vector, args).elements

    sub: (args...) ->
        args.unshift @
        @elements = Vector.sub.apply(Vector, args).elements

    multiply: (multiple) ->
        for elemIndex in [0..@elements.length-1]
            @elements[elemIndex] *= multiple

    magnitude: () ->
        sum = 0
        for elem in @elements
            sum += Math.pow elem, 2
        return Math.sqrt sum

    normalized: () ->
        normalizedVector = []
        for elem in @elements
            normalizedVector.push 1/@magnitude()*elem
        return new Vector normalizedVector

    toPrecision: (p) ->
        precisionVector = []
        for elem in @elements
            precisionVector.push elem.toPrecision(p)
        console.log precisionVector
        return new Vector precisionVector

    # ----------------------------------------------------------------------------------------------



    # Static Functions -----------------------------------------------------------------------------

    # Returns vector sum, returns d if vectors are of unequal length
    @add: (args...) ->
        # Check if all vector lengths are equal and return null if they are not.
        if !@assertEqualLength.apply(this, args)
            throw "Error: Cannot add vectors of unequal length."
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
        return new Vector(vectorSum)

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
        return new Vector negatedVector

    # Get dot product of two vectors
    @dotProduct: (vector1, vector2) ->
        if !@assertEqualLength vector1,vector2
            throw "Error: Cannot find dot product of vectors of unequal length."
            return null
        sum = 0
        for elem in [0..vector1.length-1]
            sum += vector1.elements[elem] * vector2.elements[elem]
        return sum

    # Get angle between two vectors in radians
    @angleBetween: (vector1, vector2) ->
        dotProduct = @dotProduct(vector1, vector2)
        magProduct = vector1.magnitude() * vector2.magnitude()
        return Math.acos(dotProduct / magProduct)

    # return true if parallel, false if not
    @areParallel: (vector1, vector2) ->
        scale = vector1.elements[0] / vector2.elements[0]
        for elem in [1..vector1.length-1]
            if (vector1.elements[elem] / vector2.elements[elem]).toFixed(3) != scale.toFixed(3)
                return false
        return true

    # return true if orthogonal, false if not
    @areOrthogonal: (vector1, vector2) ->
        if Math.abs(@dotProduct(vector1,vector2).toFixed(3)) == 0.toFixed(3)
            return true
        return false



    # ----------------------------------------------------------------------------------------------


module.exports = Vector

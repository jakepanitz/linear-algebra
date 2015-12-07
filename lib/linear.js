(function() {
  var Vector,
    slice = [].slice;

  Vector = (function() {
    function Vector() {
      var arg, args, elem, j, k, len, len1, ref;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      this.elements = [];
      if (args.length === 1 && Array.isArray(args[0])) {
        ref = args[0];
        for (j = 0, len = ref.length; j < len; j++) {
          elem = ref[j];
          if (isNaN(elem)) {
            throw "Error: '" + elem + "' is not a number. Could not construct vector.";
            delete this.elements;
            return;
          }
        }
        this.elements = args[0];
        this.length = args[0].length;
        return;
      }
      for (k = 0, len1 = args.length; k < len1; k++) {
        arg = args[k];
        if (isNaN(arg)) {
          throw "Error: '" + arg + "' is not a number. Could not construct vector.";
          delete this.elements;
          return;
        }
        this.elements.push(arg);
      }
      this.length = args.length;
    }

    Vector.prototype.add = function() {
      var args;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      args.unshift(this);
      return this.elements = Vector.add.apply(Vector, args).elements;
    };

    Vector.prototype.sub = function() {
      var args;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      args.unshift(this);
      return this.elements = Vector.sub.apply(Vector, args).elements;
    };

    Vector.prototype.multiply = function(multiple) {
      var elemIndex, j, ref, results;
      results = [];
      for (elemIndex = j = 0, ref = this.elements.length - 1; 0 <= ref ? j <= ref : j >= ref; elemIndex = 0 <= ref ? ++j : --j) {
        results.push(this.elements[elemIndex] *= multiple);
      }
      return results;
    };

    Vector.prototype.magnitude = function() {
      var elem, j, len, ref, sum;
      sum = 0;
      ref = this.elements;
      for (j = 0, len = ref.length; j < len; j++) {
        elem = ref[j];
        sum += Math.pow(elem, 2);
      }
      return Math.sqrt(sum);
    };

    Vector.prototype.normalized = function() {
      var elem, j, len, normalizedVector, ref;
      normalizedVector = [];
      ref = this.elements;
      for (j = 0, len = ref.length; j < len; j++) {
        elem = ref[j];
        normalizedVector.push(1 / this.magnitude() * elem);
      }
      return new Vector(normalizedVector);
    };

    Vector.prototype.toPrecision = function(p) {
      var elem, j, len, precisionVector, ref;
      precisionVector = [];
      ref = this.elements;
      for (j = 0, len = ref.length; j < len; j++) {
        elem = ref[j];
        precisionVector.push(elem.toPrecision(p));
      }
      console.log(precisionVector);
      return new Vector(precisionVector);
    };

    Vector.add = function() {
      var arg, args, i, j, k, len, ref, sum, vectorLength, vectorSum;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      if (!this.assertEqualLength.apply(this, args)) {
        throw "Error: Cannot add vectors of unequal length.";
        return null;
      }
      vectorLength = args[0].length;
      vectorSum = [];
      for (i = j = 0, ref = vectorLength - 1; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
        sum = 0;
        for (k = 0, len = args.length; k < len; k++) {
          arg = args[k];
          sum += arg.elements[i];
        }
        vectorSum.push(sum);
      }
      return new Vector(vectorSum);
    };

    Vector.sub = function() {
      var adjustedArray, arg, args, j, len, ref;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      adjustedArray = [];
      adjustedArray.push(args[0]);
      ref = args.splice(1, args.length);
      for (j = 0, len = ref.length; j < len; j++) {
        arg = ref[j];
        adjustedArray.push(this.negate(arg));
      }
      return this.add.apply(this, adjustedArray);
    };

    Vector.assertEqualLength = function() {
      var expectedLength, j, len, vector, vectors;
      vectors = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      for (j = 0, len = vectors.length; j < len; j++) {
        vector = vectors[j];
        if (typeof expectedLength === "undefined") {
          expectedLength = vector.length;
        }
        if (vector.length !== expectedLength) {
          return false;
        }
      }
      return true;
    };

    Vector.negate = function(vector) {
      var elem, j, len, negatedVector, ref;
      negatedVector = [];
      ref = vector.elements;
      for (j = 0, len = ref.length; j < len; j++) {
        elem = ref[j];
        negatedVector.push(-elem);
      }
      return new Vector(negatedVector);
    };

    Vector.dotProduct = function(vector1, vector2) {
      var elem, j, ref, sum;
      if (!this.assertEqualLength(vector1, vector2)) {
        throw "Error: Cannot find dot product of vectors of unequal length.";
        return null;
      }
      sum = 0;
      for (elem = j = 0, ref = vector1.length - 1; 0 <= ref ? j <= ref : j >= ref; elem = 0 <= ref ? ++j : --j) {
        sum += vector1.elements[elem] * vector2.elements[elem];
      }
      return sum;
    };

    Vector.angleBetween = function(vector1, vector2) {
      var dotProduct, magProduct;
      dotProduct = this.dotProduct(vector1, vector2);
      magProduct = vector1.magnitude() * vector2.magnitude();
      return Math.acos(dotProduct / magProduct);
    };

    Vector.areParallel = function(vector1, vector2) {
      var elem, j, ref, scale;
      scale = vector1.elements[0] / vector2.elements[0];
      for (elem = j = 1, ref = vector1.length - 1; 1 <= ref ? j <= ref : j >= ref; elem = 1 <= ref ? ++j : --j) {
        if ((vector1.elements[elem] / vector2.elements[elem]).toFixed(3) !== scale.toFixed(3)) {
          return false;
        }
      }
      return true;
    };

    Vector.areOrthogonal = function(vector1, vector2) {
      if (Math.abs(this.dotProduct(vector1, vector2).toFixed(3)) === 0..toFixed(3)) {
        return true;
      }
      return false;
    };

    return Vector;

  })();

  module.exports = Vector;

}).call(this);

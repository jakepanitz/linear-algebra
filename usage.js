Vector = require('./lib/linear.min.js')

vec1 = new Vector(-7.579,-7.88)
vec2 = new Vector(22.737,23.64)
console.log(Vector.areParallel(vec1,vec2))
console.log(Vector.areOrthogonal(vec1,vec2))

vec1 = new Vector(-2.029, 9.97, 4.172)
vec2 = new Vector(-9.231,-6.639,-7.245)
console.log(Vector.areParallel(vec1,vec2))
console.log(Vector.areOrthogonal(vec1,vec2))

vec1 = new Vector(-2.328,-7.284,-1.214)
vec2 = new Vector(-1.821,1.072,-2.940)
console.log(Vector.areParallel(vec1,vec2))
console.log(Vector.areOrthogonal(vec1,vec2))

vec1 = new Vector(2.118, 4.827)
vec2 = new Vector(0,0)
console.log(Vector.areParallel(vec1,vec2))
console.log(Vector.areOrthogonal(vec1,vec2))

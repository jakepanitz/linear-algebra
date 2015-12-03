Vector = require('./vector')



vec1 = new Vector(1,2,3)
vec2 = new Vector(1,1,1)

console.log "Vector 1 before add()"
console.log vec1
vec1.add(vec2)
console.log "Vector 1 after add()"
console.log vec1

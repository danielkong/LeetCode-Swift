// Garbage Collector

/**
Three approaches:
1. reference counting:
	each dynamically allocated memory is associated with a reference count, which increases when that piece of memory is references( pointers) and decreases when a reference is removed.
	when the reference count is 0, it can be removed.
	the good thing is that it is easy to implement and doesn't disturb the heap organization.
	bad thing is it adds overhead to pointer operation (although it is low cost) and cannot detect circular reference.

2. mark and sweep:initially all objects in the heap are unmarked.
	Then when they are directly or indirectly referenced, it is marked as "in-use".
	Finally all allocated memory is scanned and the unmarked objects are removed.
	The good thing with this approach is that it solves the problem of circular references and adds no overhead to pointer operation.
	Bad thing is that scanning the entire heap is time consuming and hard to implement efficiently.

3. copying:organizes the free memory into active and idle spaces.
	In garbage collection, all in-use objects from active spaces are found and copied to the idle space and then the role of the two spaces are reversed.
	This can solve the fragmented heap memory problem but resulted that only half of free memory can be in use.


	http://www.martinxia.me/2015/08/02/implementing-simple-garbage-collector/
*/

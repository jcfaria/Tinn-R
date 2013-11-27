------------------------------------------------------------------------------
TDiff
------------------------------------------------------------------------------

Version       : 2.5
Last updated  : 11 March 2005
Compilers     : Delphi 3 - Delphi 7
Author        : Angus Johnson - angusj-AT-myrealbox-DOT-com
Copyright     : © 2001-2004 Angus Johnson

Licence to use, terms and conditions:
	The code in the TDiff component is released as freeware
	provided you agree to the following terms & conditions:
	1. the copyright notice, terms and conditions are
	left unchanged.
	2. modifications to the code by other authors must be
	clearly documented and accompanied by the modifier's name.
	3. the TDiff component may be freely compiled into binary
	format and no acknowledgement is required.

Description: 
	Component to list differences between two integer arrays
	using a "longest common subsequence" algorithm.
	Typically, this component is used to diff 2 text files
	once their individuals lines have been hashed.
	By uncommenting {$DEFINE DIFF_BYTES} this component
	can also diff char arrays (eg to create file patches)

Acknowledgements: 
	The key algorithm in this component is based on:
	"An O(ND) Difference Algorithm and its Variations"
	By E Myers - Algorithmica Vol. 1 No. 2, 1986, pp. 251-266
	http://www.cs.arizona.edu/people/gene/
	http://www.cs.arizona.edu/people/gene/PAPERS/diff.ps

------------------------------------------------------------------------------
Includes TextDiff Utility
------------------------------------------------------------------------------

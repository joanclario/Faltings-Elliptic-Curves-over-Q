///////////////////////////////////////////////////////////////////////////////////////
//                                                                                   //
//      Parametrizations of isogeny graphs of elliptic curves over Q                 //
//                                                                                   //
//      Magma script: ParametrizationIsogGraphSignatureFaltings.m                    //
//      Recommended Magma version: V2.29-1                                           //
//                                                                                   //
//      This script constructs parametrized representatives, up to quadratic twist,  //
//      for rational isogeny graph types of elliptic curves over Q .                  //
//      It also computes the corresponding signatures                                //
//              (c4, c6, Delta) and j-invariants,                                    //
//      writing a factored output to the file signatures_output.txt.                 //
//                                                                                   //
//      The notation for graph types follows the conventions used in the             //
//      accompanying article.                                                        //
//                                                                                   //
///////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

// Global rational function field used for the parametrizations.
Qt<t>:=RationalFunctionField(Rationals());

function GenusZeroIsogenyJMaps(N)
// Input: an integer N for which the modular curve X_0(N) has genus zero.
//
// GenusZeroIsogenyJMaps returns a pair of rational functions (j, jj) giving the two
// j-invariants associated with a cyclic rational N-isogeny E -> E'. In other
// words, j = j(E) and jj = j(E') for the standard genus-zero parametrization
// of X_0(N).
  assert N in {2,3,4,5,6,7,8,9,10,12,13,16,18,25};
  _<t>:=RationalFunctionField(Rationals());
  case N:
    when 2:  j:=((t+16)^3)/(t);  jj:=((t+256)^3)/(t^2); 
    when 3:  j:=((t+27)*(t+3)^3)/(t);  jj:=((t+27)*(t+243)^3)/(t^3); 
    when 4:  j:=((t^2+16*t+16)^3)/(t*(t+16));  jj:=((t^2+256*t+4096)^3)/(t^4*(t+16)); 
    when 5:  j:=((t^2+10*t+5)^3)/(t);  jj:=((t^2+250*t+5^5)^3)/(t^5); 
    when 6:  j:=((t+6)^3*(t^3+18*t^2+84*t+24)^3)/(t*(t+8)^3*(t+9)^2);  jj:=((t+12)^3*(t^3+252*t^2+3888*t+15552)^3)/(t^6*(t+8)^2*(t+9)^3);   
    when 7:  j:=((t^2+13*t+49)*(t^2+5*t+1)^3)/(t);  jj:=((t^2+13*t+49)*(t^2+245*t+2401)^3)/(t^7); 
    when 8:  j:=((t^4-16*t^2+16)^3)/((t^2-16)*t^2);  jj:=((t^4 + 240*t^3 + 2144*t^2 + 3840*t + 256)^3)/((t-4)^8*t*(t+4)^2); 
    when 9:  j:=(t^3*(t^3-24)^3)/(t^3-27);  jj:=((t+6)^3*(t^3 + 234*t^2 + 756*t + 2160)^3)/((t-3)^8*(t^3-27)); 
    when 10:  j:=((t^6-4*t^5+16*t+16)^3)/((t+1)^2*(t-4)*t^5);  jj:=((t^6 + 236*t^5 + 1440*t^4 + 1920*t^3 + 3840*t^2 + 256*t + 256)^3)/((t-4)^(10)*t^2*(t+1)^5);
    when 12:  j:=((t^2-3)^3*(t^6-9*t^4+3*t^2-3)^3)/(t^4*(t^2-9)*(t^2-1)^3);  jj:=((t^2 + 6*t - 3)^3*(t^6 + 234*t^5 + 747*t^4 + 540*t^3 - 729*t^2 - 486*t - 243)^3)/((t-3)^(12)*(t-1)*t^3*(t+1)^4*(t+3)^3);  
    when 13:  j:=((t^2+5*t+13)*(t^4+7*t^3+20*t^2+19*t+1)^3)/(t);  jj:=((t^2+5*t+13)*(t^4+247*t^3+3380*t^2+15379*t+28561)^3)/(t^(13)); 
    when 16:  j:=((t^8-16*t^4+16)^3)/(t^4*(t^4-16));  jj:=((t^8 + 240*t^7 + 2160*t^6 + 6720*t^5 + 17504*t^4 + 26880*t^3 + 34560*t^2+ 15360*t + 256)^3)/((t-2)^(16)*t*(t+2)^4*(t^2+4));
    when 18:  j:=((t^3-2)^3*(t^9-6*t^6-12*t^3-8)^3)/(t^9*(t^3-8)*(t^3+1)^2);  jj:=((t^3 + 6*t^2 + 4)^3*(t^9 + 234*t^8 + 756*t^7 + 2172*t^6 + 1872*t^5 + 3024*t^4 + 48*t^3 + 3744*t^2 + 64)^3)/((t-2)^(18)*t^2*(t+1)^9*(t^2-t+1)*(t^2+2*t+4)^2); 
    when 25:  j:=((t^(10)+10*t^8+35*t^6-12*t^5+50*t^4-60*t^3+25*t^2-60*t+16)^3)/(t^5+5*t^3+5*t-11); jj:=((t^(10) + 240*t^9 + 2170*t^8 + 8880*t^7 + 34835*t^6 + 83748*t^5 +
206210*t^4 + 313380*t^3 + 503545*t^2 + 424740*t + 375376)^3)/((t-1)^(25)*(t^4 + t^3 + 6*t^2 + 6*t + 11));
  end case;

  return j,jj;
end function;

// For the following levels N, the modular curve X_0(N) has positive genus and
// X_0(N)(Q) is non-empty. Each set JN contains the possible j-invariants of
// elliptic curves over Q admitting a cyclic rational N-isogeny. 

J11:={-11*131^3,-2^(15),-11^2};
J14:={-3^3*5^3,3^3*5^3*17^3};
J15:={-5^2/2,-5^2*241^3/2^3,-5*29^3/2^5,5*211^3/2^(15)};
J17:={-17^2*101^3/2,-17*373^3/2^(17)};
J19:={-2^(15)*3^3};
J21:={-3^2*5^6/2^3,3^3*5^3/2,-3^2*5^3*101^3/2^(21),-3^3*5^3*383^3/2^7};
J27:={-2^15*3*5^3};
J37:={-7*11^3,-7*137^3*2083^3};
J43:={-2^(18)*3^3*5^3};
J67:={-2^(15)*3^3*5^3*11^3};
J163:={-2^(18)*3^3*5^3*23^3*29^3};

////////////////////////////////////////////////////////////////////////////////////////

function ReducedTwistModelFromJInvariant(j)
// Input: a j-invariant different from 0 and 1728.
//
// Output: an elliptic curve E given by a short Weierstrass model
//     y^2 = x^3 + A*x + B
// with j(E) = j. The model is chosen within its quadratic-twist class so that
// the coefficients A and B are reduced by extracting common square/cube factors
// from c4 and c6.
  E:=EllipticCurveFromjInvariant(j);
  W:=IntegralModel(WeierstrassModel((E)));
  csW:=cInvariants(W);
  Zt<t>:=PolynomialRing(Integers());
  c4:=Zt!Numerator(csW[1]);
  c6:=Zt!Numerator(csW[2]);
  s:=GCD(c4,c6);
  d:=&*[f[1]^Min(Valuation(c4,f[1]) div 2,Valuation(c6,f[1]) div 3) : f in Factorization(s)];
  return QuadraticTwist(W,-1/d);
end function;


function IsogenyCodomainFromKernelFactors(E,p,S)
// Input: an elliptic curve E, a prime p, and either an index or a sequence of
// indices S selecting factors of the p-division polynomial.
//
// Output: the codomain E' of the normalized p-isogeny E -> E' whose kernel is
// defined by the selected factor(s) of the p-division polynomial.      
  F:=Factorization(DivisionPolynomial(E,p));
  if Type(S) eq SeqEnum then
    K:=&*[F[i][1] : i in S]; 
   else 
    K:=F[S][1];
  end if;
  EE:=IsogenyFromKernel(E,K);
  return EE;
end function;


////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
// Parametrizations, up to quadratic twist, of isogeny graphs arising from
// levels N for which X_0(N) has genus zero. These give the infinite families
// of isogeny graphs considered below.

// Record format used to store, for each graph type, the level and the list of
// signatures [c4, c6, Delta] attached to the curves in the isogeny class.
isog := recformat< level:IntegerRing(), IsogClassSignature:SeqEnum>;

// Associative array indexed by the graph type, e.g. "L2(2)" or "R4(10)".
IsogGraph := AssociativeArray();

/////////////////////////
///////// L2(p) ///////// 
// Prime levels p in [2,3,5,7,13]. 
/////////////////////////
for p in [2,3,5,7,13] do
  graph:="L2(" cat IntegerToString(p) cat ")";
  N:=p;
  j1:=GenusZeroIsogenyJMaps(N);
  E1:=ReducedTwistModelFromJInvariant(j1);
  E2:=IsogenyCodomainFromKernelFactors(E1,p,1);
  EE:=[E1,E2];
  IsogGraph[graph] := rec<isog| level:=N, IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>; 
end for;

/////////////////////////
///////// L3(p^2) ///////// 
// Prime powers p^2 for p in [3,5]. 
/////////////////////////

for p in [3,5] do
  graph:="L3(" cat IntegerToString(p^2) cat ")";
  N:=p^2;
  j1:=GenusZeroIsogenyJMaps(N);
  E1:=ReducedTwistModelFromJInvariant(j1);
  E2:=IsogenyCodomainFromKernelFactors(E1,p,1); 
  E3:=IsogenyCodomainFromKernelFactors(E2,p,1);
  if E1 eq E3 then E3:=IsogenyCodomainFromKernelFactors(E2,p,2); end if;
  EE:=[E1,E2,E3];
  IsogGraph[graph] := rec<isog| level:=N, IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>; 
end for;

/////////////////////////
///////// R4(pq) ///////// 
// Cases pq = 2*3 and pq = 2*5. 
/////////////////////////
for q in [3,5] do

graph:="R4(" cat IntegerToString(2*q) cat ")";
N:=2*q;
j1:=GenusZeroIsogenyJMaps(N);
E1:=ReducedTwistModelFromJInvariant(j1);
E2:=IsogenyCodomainFromKernelFactors(E1,q,1);
E3:=IsogenyCodomainFromKernelFactors(E1,2,1);
E4:=IsogenyCodomainFromKernelFactors(E2,2,1);
assert E4 eq IsogenyCodomainFromKernelFactors(E3,q,1);
EE:=[E1,E2,E3,E4];
IsogGraph[graph] := rec<isog| level:=N, IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>; 

end for;

///////////////////////
///////// R6  ///////// 
///////////////////////

graph:="R6";
N:=18;
j1:=GenusZeroIsogenyJMaps(N);
E1:=ReducedTwistModelFromJInvariant(j1);
E2:=IsogenyCodomainFromKernelFactors(E1,2,1);
E3:=IsogenyCodomainFromKernelFactors(E1,3,1);
E5:=IsogenyCodomainFromKernelFactors(E3,3,1);
if E1 eq E5 then E5:=IsogenyCodomainFromKernelFactors(E3,3,2); end if;
E4:=IsogenyCodomainFromKernelFactors(E2,3,1);
assert E4 eq IsogenyCodomainFromKernelFactors(E3,2,1);
E6:=IsogenyCodomainFromKernelFactors(E4,3,1);
if E2 eq E6 then E6:=IsogenyCodomainFromKernelFactors(E4,3,2); end if;
assert E6 eq IsogenyCodomainFromKernelFactors(E5,2,1);

EE:=[E1,E2,E3,E4,E5,E6];
IsogGraph[graph] := rec<isog| level:=N, IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>; 

//////////////////////
///////// T4 ///////// 
//////////////////////
graph:="T4";
N:=4;
j2:=GenusZeroIsogenyJMaps(N);
E2:=ReducedTwistModelFromJInvariant(j2);
E1:=IsogenyCodomainFromKernelFactors(E2,2,1);
// Check that E1 has full rational 2-torsion over Q(t), as required by this graph type.
assert [2,2] eq AbelianInvariants(TwoTorsionSubgroup(BaseChange(E1,Qt)));
Eaux:=[IsogenyCodomainFromKernelFactors(E1,2,k) : k in [1,2,3] | not IsIsomorphic(IsogenyCodomainFromKernelFactors(E1,2,k),E2)];
E3:=Eaux[1];
E4:=Eaux[2];

EE:=[E1,E2,E3,E4];
IsogGraph[graph] := rec<isog| level:=N, IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>; 

//////////////////////
///////// T6 ///////// 
//////////////////////
graph:="T6";
N:=8;
j2:=GenusZeroIsogenyJMaps(N);
E2:=ReducedTwistModelFromJInvariant(j2);
E1:=IsogenyCodomainFromKernelFactors(E2,2,1);
assert [2,2] eq AbelianInvariants(TwoTorsionSubgroup(BaseChange(E1,Qt)));
Eaux:=[IsogenyCodomainFromKernelFactors(E1,2,k) : k in [1,2,3] | not IsIsomorphic(IsogenyCodomainFromKernelFactors(E1,2,k), E2)];
if [2,2] eq AbelianInvariants(TwoTorsionSubgroup(BaseChange(Eaux[1],Qt))) then 
  E4:=Eaux[1]; E3:=Eaux[2];
 else
  E3:=Eaux[1]; E4:=Eaux[2];
end if; 
assert [2,2] eq AbelianInvariants(TwoTorsionSubgroup(BaseChange(E4,Qt)));;
Eaux:=[IsogenyCodomainFromKernelFactors(E4,2,k) : k in [1,2,3] | not IsIsomorphic(IsogenyCodomainFromKernelFactors(E4,2,k), E1)];
E5:=Eaux[1];
E6:=Eaux[2];

EE:=[E1,E2,E3,E4,E5,E6];
IsogGraph[graph] := rec<isog| level:=N, IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>; 


//////////////////////
///////// T8 ///////// 
//////////////////////
graph:="T8";
N:=16;
j2:=GenusZeroIsogenyJMaps(N);
E2:=ReducedTwistModelFromJInvariant(j2);
E1:=IsogenyCodomainFromKernelFactors(E2,2,1);
assert [2,2] eq AbelianInvariants(TwoTorsionSubgroup(BaseChange(E1,Qt)));
Eaux:=[IsogenyCodomainFromKernelFactors(E1,2,k) : k in [1,2,3] | not IsIsomorphic(IsogenyCodomainFromKernelFactors(E1,2,k),E2)];
if [2,2] eq AbelianInvariants(TwoTorsionSubgroup(BaseChange(Eaux[1],Qt))) then 
  E4:=Eaux[1]; E3:=Eaux[2];
 else
  E3:=Eaux[1]; E4:=Eaux[2];
end if; 
assert [2,2] eq AbelianInvariants(TwoTorsionSubgroup(BaseChange(E4,Qt)));;
Eaux:=[IsogenyCodomainFromKernelFactors(E4,2,k) : k in [1,2,3] | not IsIsomorphic(IsogenyCodomainFromKernelFactors(E4,2,k),E1)];
if [2,2] eq AbelianInvariants(TwoTorsionSubgroup(BaseChange(Eaux[1],Qt))) then 
  E6:=Eaux[1]; E5:=Eaux[2];
 else
  E5:=Eaux[1]; E6:=Eaux[2];
end if;
assert [2,2] eq AbelianInvariants(TwoTorsionSubgroup(BaseChange(E6,Qt)));
Eaux:=[IsogenyCodomainFromKernelFactors(E6,2,k) : k in [1,2,3] | not IsIsomorphic(IsogenyCodomainFromKernelFactors(E6,2,k),E4)];
E7:=Eaux[1];
E8:=Eaux[2];

EE:=[E1,E2,E3,E4,E5,E6,E7,E8];
IsogGraph[graph] := rec<isog| level:=N, IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>; 

//////////////////////
///////// S  ///////// 
//////////////////////
graph:="S";
N:=12;
j3:=GenusZeroIsogenyJMaps(N);
E3:=ReducedTwistModelFromJInvariant(j3);
E4:=IsogenyCodomainFromKernelFactors(E3,3,1);
E1:=IsogenyCodomainFromKernelFactors(E3,2,1);
assert [2,2] eq AbelianInvariants(TwoTorsionSubgroup(BaseChange(E1,Qt)));
Eaux:=[IsogenyCodomainFromKernelFactors(E1,2,k) : k in [1,2,3] | not IsIsomorphic(IsogenyCodomainFromKernelFactors(E1,2,k),E3)];
E5:=Eaux[1];
E7:=Eaux[2];
E2:=IsogenyCodomainFromKernelFactors(E1,3,1);
assert E2 eq IsogenyCodomainFromKernelFactors(E4,2,1);
assert [2,2] eq AbelianInvariants(TwoTorsionSubgroup(BaseChange(E2,Qt)));
Eaux:=[IsogenyCodomainFromKernelFactors(E2,2,k) : k in [1,2,3] | not IsIsomorphic(IsogenyCodomainFromKernelFactors(E2,2,k),E4)];
if Eaux[1] eq IsogenyCodomainFromKernelFactors(E5,3,1) then 
  E6:=Eaux[1]; E8:=Eaux[2]; 
 else
  E6:=Eaux[2]; E8:=Eaux[1]; 
end if;
assert E8 eq IsogenyCodomainFromKernelFactors(E7,3,1);
assert E6 eq IsogenyCodomainFromKernelFactors(E5,3,1);

EE:=[E1,E2,E3,E4,E5,E6,E7,E8];
IsogGraph[graph] := rec<isog| level:=N, IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>; 

////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
// Parametrizations, up to quadratic twist, of isogeny graphs arising from
// levels N for which X_0(N) has positive genus. These correspond to the finite
// exceptional families of isogeny graphs.
/////////////////////////
///////// L2(11) ///////// 
/////////////////////////
graph:="L2(11)";
N:=11;

// labels:={"121a1", "121b1", "121c1"};
// assert labels eq {CremonaReference(MinimalQuadraticTwist(EllipticCurveFromjInvariant(j))) : j in J11};
EEa:=[EllipticCurve("121a1"),EllipticCurve("121a2")];
EEcm:=[EllipticCurve("121b1"),EllipticCurve("121b2")];

assert {jInvariant(e) : e in EEa cat EEcm} eq J11; 

IsogGraph["L2(11)a"] := rec<isog| level:=N , IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)] : E in EEa]>;
IsogGraph["L2(11)b"] := rec<isog| level:=N , IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)] : E in EEcm]>;

/////////////////////////
///////// L2(17) ///////// 
/////////////////////////
graph:="L2(17)";
N:=17;
//labels:={"14450p1", "14450n1"};
//assert labels eq {CremonaReference(MinimalQuadraticTwist(EllipticCurveFromjInvariant(j))) : j in J17};

EE:=[EllipticCurve("14450n1"),EllipticCurve("14450n2")];
assert {jInvariant(e) : e in EE} eq J17; 

IsogGraph["L2(17)"] := rec<isog| level:=17 , IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>;


/////////////////////////
///////// L2(19) ///////// 
/////////////////////////
graph:="L2(19)";
N:=19;
//labels:={"361a1"};
//assert labels eq {CremonaReference(MinimalQuadraticTwist(EllipticCurveFromjInvariant(j))) : j in J19};

EEcm:=[EllipticCurve("361a1"),EllipticCurve("361a2")];
assert {jInvariant(e) : e in EEcm} eq J19; 

IsogGraph["L2(19)"] := rec<isog| level:=19 , IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)] : E in EEcm]>;

/////////////////////////
///////// L2(37) ///////// 
/////////////////////////
graph:="L2(37)";
N:=37;
//labels:={"1225h1", "1225h2"};
//assert labels eq {CremonaReference(MinimalQuadraticTwist(EllipticCurveFromjInvariant(j))) : j in J37};

EE:=[EllipticCurve("1225h1"),EllipticCurve("1225h2")];
assert {jInvariant(e) : e in EE} eq J37; 

IsogGraph["L2(37)"] := rec<isog| level:=37 , IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>;

/////////////////////////
///////// L2(43) ///////// 
/////////////////////////
graph:="L2(43)";
N:=43;
//labels:={"1849a1"};
//assert labels eq {CremonaReference(MinimalQuadraticTwist(EllipticCurveFromjInvariant(j))) : j in J43};

EEcm:=[EllipticCurve("1849a1"),EllipticCurve("1849a2")];
assert {jInvariant(e) : e in EEcm} eq J43; 

IsogGraph["L2(43)"] := rec<isog| level:=43 , IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)] : E in EEcm]>;

/////////////////////////
///////// L2(67) ///////// 
/////////////////////////
graph:="L2(67)";
N:=67;
//labels:={"4489a1"};
//assert labels eq {CremonaReference(MinimalQuadraticTwist(EllipticCurveFromjInvariant(j))) : j in J67};

EEcm:=[EllipticCurve("4489a1"),EllipticCurve("4489a2")];
assert {jInvariant(e) : e in EEcm} eq J67; 

IsogGraph["L2(67)"] := rec<isog| level:=67 , IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)] : E in EEcm]>;

/////////////////////////
///////// L2(163) ///////// 
/////////////////////////
graph:="L2(163)";
N:=163;
//labels:={"26569a1"};
//assert labels eq {CremonaReference(MinimalQuadraticTwist(EllipticCurveFromjInvariant(j))) : j in J163};

EEcm:=[EllipticCurve("26569a1"),EllipticCurve("26569a2")];
assert {jInvariant(e) : e in EEcm} eq J163; 

IsogGraph["L2(163)"] := rec<isog| level:=163 , IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)] : E in EEcm]>;


/////////////////////////
/////////   L4  ///////// 
/////////////////////////
graph:="L4";
N:=27;

EE:=[EllipticCurve(label) : label in ["27a4","27a3","27a1","27a2"]];

assert {jInvariant(E) : E in [EE[1],EE[4]]} eq J27; 

IsogGraph["L4"] := rec<isog| level:=27, IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>;


/////////////////////////
///////// R4(14) //////// 
/////////////////////////
graph:="R4(14)";
N:=14;

EE:=[EllipticCurve(label) : label in ["49a2","49a1","49a4","49a3"]];
assert J14 eq {jInvariant(e) : e in EE};

IsogGraph["R4(14)"] := rec<isog | level:=14, IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>;


/////////////////////////
///////// R4(15) //////// 
/////////////////////////
graph:="R4(15)";
N:=14;

EE:=[EllipticCurve(label) : label in ["400c1","400c2","400c3","400c4"]];
assert J15 eq {jInvariant(e) : e in EE};

IsogGraph["R4(15)"] := rec<isog| level:=15, IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE]>;


/////////////////////////
///////// R4(21) //////// 
/////////////////////////
graph:="R4(21)";
N:=21;

EE:=[EllipticCurve(label) : label in ["1296k1","1296k3","1296k2","1296k4"]];
assert J21 eq {jInvariant(e) : e in EE};

IsogGraph["R4(21)"] := rec<isog| level:=21, IsogClassSignature := [[cInvariants(E)[1],cInvariants(E)[2],Discriminant(E)]: E in EE] >;


////////////////////////////////////////////////////////////////////////////////////////
// Change of model and ordering convention.
//
// The parametrizations below are written in the model
//     y^2 = x^3 + (A/144)*x - (B/1728)
// rather than the initial model
//     y^2 = x^3 + A*x + B.
//
// In addition, the following changes of parameter are applied:
//   * for L3(9), replace t by t + 3;
//   * for L3(25), replace t by t + 1.
//
// Finally, the curves in each isogeny class are reordered so that their order
// agrees with the tau-format convention used in the accompanying article.
function RawIsogenyGraphCoefficients(type,t)
// Return the raw parametrized coefficient pairs <A,B> for the requested
// isogeny graph type. The output is a tuple whose entries correspond to the
// vertices of the graph before the final normalization and reordering performed
// by NormalizedIsogenyGraphCoefficients.


  case type:
    when "L2(2)": return <<-3*t^2 - 240*t - 3072, 2*t^3 + 240*t^2 + 6144*t - 65536>, <-3*t^2 - 960*t - 49152, 2*t^3 - 768*t^2 - 122880*t - 4194304>>;
    when "L2(3)": return <<-3*t^2 - 90*t - 243, 2*t^3 + 90*t^2 + 918*t - 1458>, <-3*t^2 - 810*t - 19683, 2*t^3 - 918*t^2 - 65610*t - 1062882>>;
    when "L2(5)": return <<-3*t^4 - 96*t^3 - 1050*t^2 - 4080*t - 1875, 2*t^6 + 96*t^5 + 1818*t^4 + 16784*t^3 + 73782*t^2 + 114000*t - 31250>, <-3*t^4 - 816*t^3 - 26250*t^2 - 300000*t - 1171875, 2*t^6 - 912*t^5 - 73782*t^4 - 2098000*t^3 - 28406250*t^2 - 187500000*t - 488281250>>;
    when "L2(7)": return <<-3*t^4 - 54*t^3 - 345*t^2 - 774*t - 147, 2*t^6 + 54*t^5 + 588*t^4 + 3150*t^3 + 7980*t^2 + 6678*t - 686>, <-3*t^4 - 774*t^3 - 16905*t^2 - 129654*t - 352947, 2*t^6 - 954*t^5 - 55860*t^4 - 1080450*t^3 - 9882516*t^2 - 44471322*t - 80707214>>;
    when "L2(13)": return <<-3*t^8 - 54*t^7 - 459*t^6 - 2322*t^5 - 7500*t^4 - 15354*t^3 - 18459*t^2 - 10062*t - 507, 2*t^12 + 54*t^11 + 702*t^10 + 5724*t^9 + 32286*t^8 + 131454*t^7 + 391896*t^6 + 849330*t^5 + 1297914*t^4 + 1307700*t^3 + 750906*t^2 + 161226*t - 4394>, <-3*t^8 - 774*t^7 - 18459*t^6 - 199602*t^5 - 1267500*t^4 - 5101434*t^3 - 13109499*t^2 - 20049822*t - 14480427, 2*t^12 - 954*t^11 - 57762*t^10 - 1307700*t^9 - 16872882*t^8 - 143536770*t^7 - 860995512*t^6 - 3754457694*t^5 - 11987565798*t^4 - 27628654716*t^3 - 44049458934*t^2 - 44049458934*t - 21208998746>>;
    when "L3(9)": return <<-3*t^4 + 72*t, 2*t^6 - 72*t^3 + 432>, <-3*t^4 - 648*t, 2*t^6 - 1080*t^3 - 11664>, <-3*t^4 - 720*t^3 - 6480*t^2 - 20088*t - 38880, 2*t^6 - 1008*t^5 - 33264*t^4 - 246024*t^3 - 1034208*t^2 - 2286144*t - 2950992>>;
    when "L3(25)": return <<-3*t^12 - 42*t^10 - 225*t^8 + 36*t^7 - 570*t^6 + 324*t^5 - 675*t^4 + 900*t^3 - 348*t^2 + 720*t - 192, 2*t^18 + 42*t^16 + 372*t^14 - 36*t^13 + 1802*t^12 - 576*t^11 + 5172*t^10 - 3636*t^9 + 9042*t^8 - 11376*t^7 + 10442*t^6 - 18036*t^5 + 10632*t^4 - 12960*t^3 + 9312*t^2 - 2880*t + 2432>, <-3*t^12 - 42*t^10 - 225*t^8 - 684*t^7 - 570*t^6 - 6156*t^5 - 675*t^4 - 17100*t^3 - 1788*t^2 - 13680*t - 5952, 2*t^18 + 42*t^16 + 372*t^14 - 1044*t^13 + 1802*t^12 - 16704*t^11 + 5172*t^10 - 105444*t^9 - 11118*t^8 - 329904*t^7 - 211318*t^6 - 523044*t^5 - 815928*t^4 - 375840*t^3 - 1119648*t^2 - 83520*t - 320128>, <-3*t^12 - 720*t^11 - 6522*t^10 - 29520*t^9 - 130545*t^8 - 357804*t^7 - 1036650*t^6 - 1945116*t^5 - 3985155*t^4 - 5034780*t^3 - 7168668*t^2 - 5096880*t - 4504512, 2*t^18 - 1008*t^17 - 33222*t^16 - 266112*t^15 - 1697100*t^14 - 7746516*t^13 - 31166566*t^12 - 100050624*t^11 - 296106924*t^10 - 718791300*t^9 - 1640941374*t^8 - 3076776144*t^7 - 5469363286*t^6 - 7806080916*t^5 - 10604052600*t^4 - 10805918112*t^3 - 10550896032*t^2 - 6245506368*t - 3679762048>>;
    when "R4(6)": return <<-3*t^4 - 72*t^3 - 576*t^2 - 1584*t - 432, 2*t^6 + 72*t^5 + 1008*t^4 + 6768*t^3 + 21168*t^2 + 22464*t - 3456>, <-3*t^4 - 72*t^3 - 1296*t^2 - 11664*t - 34992, 2*t^6 + 72*t^5 - 19440*t^3 - 244944*t^2 - 1259712*t - 2519424>, <-3*t^4 - 72*t^3 - 576*t^2 - 2304*t - 6912, 2*t^6 + 72*t^5 + 1008*t^4 + 5760*t^3 - 110592*t - 221184>, <-3*t^4 - 792*t^3 - 20736*t^2 - 186624*t - 559872, 2*t^6 - 936*t^5 - 63504*t^4 - 1461888*t^3 - 15676416*t^2 - 80621568*t - 161243136>>;
    when "R4(10)": return <<-3*t^8 + 12*t^7 - 12*t^6 + 48*t^5 - 48*t^3 - 48*t^2 - 192*t - 192, 2*t^12 - 12*t^11 + 24*t^10 - 64*t^9 + 96*t^8 + 48*t^7 + 144*t^6 + 480*t^5 + 192*t^4 + 512*t^3 + 768*t^2 + 1536*t + 1024>, <-3*t^8 + 12*t^7 - 732*t^6 + 1488*t^5 - 7200*t^4 + 8592*t^3 - 17328*t^2 + 11328*t - 192, 2*t^12 - 12*t^11 - 984*t^10 + 3968*t^9 - 38208*t^8 + 88752*t^7 - 314352*t^6 + 524640*t^5 - 935232*t^4 + 968192*t^3 - 902400*t^2 + 130560*t + 1024>, <-3*t^8 + 12*t^7 - 12*t^6 + 48*t^5 - 768*t^3 - 768*t^2 - 3072*t - 3072, 2*t^12 - 12*t^11 + 24*t^10 - 64*t^9 + 96*t^8 - 960*t^7 + 1152*t^6 - 1536*t^5 + 12288*t^4 + 32768*t^3 + 49152*t^2 + 98304*t + 65536>, <-3*t^8 - 708*t^7 - 4332*t^6 - 8592*t^5 - 28800*t^4 - 23808*t^3 - 46848*t^2 - 3072*t - 3072, 2*t^12 - 1020*t^11 - 28200*t^10 - 121024*t^9 - 467616*t^8 - 1049280*t^7 - 2514816*t^6 - 2840064*t^5 - 4890624*t^4 - 2031616*t^3 - 2015232*t^2 + 98304*t + 65536>>;
    when "R6": return <<-3*t^12 + 24*t^9 - 48*t^3 - 48, 2*t^18 - 24*t^15 + 48*t^12 + 112*t^9 + 48*t^6 + 192*t^3 + 128>, <-3*t^12 + 24*t^9 - 768*t^3 - 768, 2*t^18 - 24*t^15 + 48*t^12 - 896*t^9 + 3072*t^6 + 12288*t^3 + 8192>, <-3*t^12 + 24*t^9 - 720*t^6 + 1392*t^3 - 48, 2*t^18 - 24*t^15 - 960*t^12 + 6160*t^9 - 24144*t^6 + 8256*t^3 + 128>, <-3*t^12 - 696*t^9 - 2880*t^6 - 768*t^3 - 768, 2*t^18 - 1032*t^15 - 24144*t^12 - 49280*t^9 - 61440*t^6 + 12288*t^3 + 8192>, <-3*t^12 - 720*t^10 + 24*t^9 - 6480*t^8 + 4320*t^7 - 20160*t^6 + 25920*t^5 - 47520*t^4 + 40272*t^3 - 25920*t^2 + 5760*t - 48, 2*t^18 - 1008*t^16 - 24*t^15 - 33264*t^14 + 10080*t^13 - 245904*t^12 + 266112*t^11 - 1074528*t^10 + 1475824*t^9 - 3084480*t^8 + 4217472*t^7 - 5902800*t^6 + 5636736*t^5 - 4217472*t^4 + 1967808*t^3 - 532224*t^2 + 32256*t + 128>, <-3*t^12 - 720*t^11 - 6480*t^10 - 20136*t^9 - 47520*t^8 - 51840*t^7 - 80640*t^6 - 34560*t^5 - 103680*t^4 - 768*t^3 - 46080*t^2 - 768, 2*t^18 - 1008*t^17 - 33264*t^16 - 245976*t^15 - 1054368*t^14 - 2818368*t^13 - 5902800*t^12 - 8434944*t^11 - 12337920*t^10 - 11806592*t^9 - 17192448*t^8 - 8515584*t^7 - 15737856*t^6 - 1290240*t^5 - 8515584*t^4 + 12288*t^3 - 1032192*t^2 + 8192>>;
    when "S": return <<-3*t^8 + 36*t^6 - 90*t^4 - 684*t^2 - 27, 2*t^12 - 36*t^10 + 198*t^8 - 1368*t^6 + 6318*t^4 + 3132*t^2 - 54>, <-3*t^8 - 684*t^6 - 810*t^4 + 2916*t^2 - 2187, 2*t^12 - 1044*t^10 - 18954*t^8 + 36936*t^6 - 48114*t^4 + 78732*t^2 - 39366>, <-3*t^8 + 36*t^6 - 90*t^4 + 36*t^2 - 27, 2*t^12 - 36*t^10 + 198*t^8 - 360*t^6 + 270*t^4 + 108*t^2 - 54>, <-3*t^8 + 36*t^6 - 810*t^4 + 2916*t^2 - 2187, 2*t^12 - 36*t^10 - 810*t^8 + 9720*t^6 - 48114*t^4 + 78732*t^2 - 39366>, <-3*t^8 + 36*t^6 + 720*t^5 - 90*t^4 - 4320*t^3 - 6444*t^2 - 2160*t - 27, 2*t^12 - 36*t^10 + 1008*t^9 + 198*t^8 - 12096*t^7 - 33624*t^6 + 30240*t^5 + 199854*t^4 + 229824*t^3 + 99900*t^2 + 9072*t - 54>, <-3*t^8 + 720*t^7 - 6444*t^6 + 12960*t^5 - 810*t^4 - 19440*t^3 + 2916*t^2 - 2187, 2*t^12 + 1008*t^11 - 33300*t^10 + 229824*t^9 - 599562*t^8 + 272160*t^7 + 907848*t^6 - 979776*t^5 - 48114*t^4 + 734832*t^3 + 78732*t^2 - 39366>, <-3*t^8 + 36*t^6 - 720*t^5 - 90*t^4 + 4320*t^3 - 6444*t^2 + 2160*t - 27, 2*t^12 - 36*t^10 - 1008*t^9 + 198*t^8 + 12096*t^7 - 33624*t^6 - 30240*t^5 + 199854*t^4 - 229824*t^3 + 99900*t^2 - 9072*t - 54>, <-3*t^8 - 720*t^7 - 6444*t^6 - 12960*t^5 - 810*t^4 + 19440*t^3 + 2916*t^2 - 2187, 2*t^12 - 1008*t^11 - 33300*t^10 - 229824*t^9 - 599562*t^8 - 272160*t^7 + 907848*t^6 + 979776*t^5 - 48114*t^4 - 734832*t^3 + 78732*t^2 - 39366>>;
    when "T4": return <<-3*t^2 - 48*t - 768, 2*t^3 + 48*t^2 - 768*t - 8192>, <-3*t^2 - 48*t - 48, 2*t^3 + 48*t^2 + 240*t - 128>, <-3*t^2 - 768*t - 12288, 2*t^3 - 960*t^2 - 49152*t - 524288>, <-3*t^2 + 672*t - 768, 2*t^3 + 1056*t^2 - 16896*t - 8192>>;
    when "T6": return <<-3*t^4 + 48*t^2 - 768, 2*t^6 - 48*t^4 - 768*t^2 + 8192>, <-3*t^4 + 48*t^2 - 48, 2*t^6 - 48*t^4 + 240*t^2 + 128>, <-3*t^4 + 768*t^2 - 12288, 2*t^6 + 960*t^4 - 49152*t^2 + 524288>, <-3*t^4 - 672*t^2 - 768, 2*t^6 - 1056*t^4 - 16896*t^2 + 8192>, <-3*t^4 - 720*t^3 - 6432*t^2 - 11520*t - 768, 2*t^6 - 1008*t^5 - 33312*t^4 - 225792*t^3 - 532992*t^2 - 258048*t + 8192>, <-3*t^4 + 720*t^3 - 6432*t^2 + 11520*t - 768, 2*t^6 + 1008*t^5 - 33312*t^4 + 225792*t^3 - 532992*t^2 + 258048*t + 8192>>;
    when "T8": return <<-3*t^8 + 48*t^4 - 768, 2*t^12 - 48*t^8 - 768*t^4 + 8192>, <-3*t^8 + 48*t^4 - 48, 2*t^12 - 48*t^8 + 240*t^4 + 128>, <-3*t^8 + 768*t^4 - 12288, 2*t^12 + 960*t^8 - 49152*t^4 + 524288>, <-3*t^8 - 672*t^4 - 768, 2*t^12 - 1056*t^8 - 16896*t^4 + 8192>, <-3*t^8 + 720*t^6 - 6432*t^4 + 11520*t^2 - 768, 2*t^12 + 1008*t^10 - 33312*t^8 + 225792*t^6 - 532992*t^4 + 258048*t^2 + 8192>, <-3*t^8 - 720*t^6 - 6432*t^4 - 11520*t^2 - 768, 2*t^12 - 1008*t^10 - 33312*t^8 - 225792*t^6 - 532992*t^4 - 258048*t^2 + 8192>, <-3*t^8 - 720*t^7 - 6480*t^6 - 20160*t^5 - 52512*t^4 - 80640*t^3 - 103680*t^2 - 46080*t - 768, 2*t^12 - 1008*t^11 - 33264*t^10 - 245952*t^9 - 1065504*t^8 - 3128832*t^7 - 7451136*t^6 - 12515328*t^5 - 17048064*t^4 - 15740928*t^3 - 8515584*t^2 - 1032192*t + 8192>, <-3*t^8 + 720*t^7 - 6480*t^6 + 20160*t^5 - 52512*t^4 + 80640*t^3 - 103680*t^2 + 46080*t - 768, 2*t^12 + 1008*t^11 - 33264*t^10 + 245952*t^9 - 1065504*t^8 + 3128832*t^7 - 7451136*t^6 + 12515328*t^5 - 17048064*t^4 + 15740928*t^3 - 8515584*t^2 + 1032192*t + 8192>>;
  end case;
end function;


function NormalizedIsogenyGraphCoefficients(type,t)
// Return the normalized list of coefficient pairs [A/144, -B/1728] defining
// elliptic curves in the requested isogeny graph. The ordering of the vertices
// is adjusted to match the tau-format convention used in the accompanying
// article.
  EE:=RawIsogenyGraphCoefficients(type,t);
  case type:
    when "L3(9)": // Equivalent compact form: evaluate the raw formulas at t + 3. 
                  EE:=[  [
        -3*t^4 - 36*t^3 - 162*t^2 - 252*t - 27,
        2*t^6 + 36*t^5 + 270*t^4 + 1008*t^3 + 1782*t^2 + 972*t - 54
    ],    [
        -3*t^4 - 36*t^3 - 162*t^2 - 972*t - 2187,
        2*t^6 + 36*t^5 + 270*t^4 - 7290*t^2 - 26244*t - 39366
    ],    [
        -3*t^4 - 756*t^3 - 13122*t^2 - 78732*t - 177147,
        2*t^6 - 972*t^5 - 48114*t^4 - 734832*t^3 - 5314410*t^2 - 19131876*t - 
            28697814
    ]
];
    when "L3(25)": // Equivalent compact form: evaluate the raw formulas at t + 1. 
                  EE:=[
    [
        -3*t^12 - 36*t^11 - 240*t^10 - 1080*t^9 - 3600*t^8 - 9180*t^7 - 18210*t^6 - 27900*t^5 - 32400*t^4 - 
            27000*t^3 - 14640*t^2 - 3780*t - 75,
        2*t^18 + 36*t^17 + 348*t^16 + 2304*t^15 + 11532*t^14 + 45828*t^13 + 148754*t^12 + 400752*t^11 + 
            903696*t^10 + 1709568*t^9 + 2704848*t^8 + 3546864*t^7 + 3792422*t^6 + 3217356*t^5 + 2070948*t^4 
            + 933120*t^3 + 250260*t^2 + 24300*t - 250
    ],
    [
        -3*t^12 - 36*t^11 - 240*t^10 - 1080*t^9 - 3600*t^8 - 9900*t^7 - 23250*t^6 - 49500*t^5 - 90000*t^4 - 
            135000*t^3 - 150000*t^2 - 112500*t - 46875,
        2*t^18 + 36*t^17 + 348*t^16 + 2304*t^15 + 11532*t^14 + 44820*t^13 + 135650*t^12 + 306000*t^11 + 
            438000*t^10 - 2190000*t^8 - 7650000*t^7 - 16956250*t^6 - 28012500*t^5 - 36037500*t^4 - 
            36000000*t^3 - 27187500*t^2 - 14062500*t - 3906250
    ],
    [
        -3*t^12 - 756*t^11 - 14640*t^10 - 135000*t^9 - 810000*t^8 - 3487500*t^7 - 11381250*t^6 - 
            28687500*t^5 - 56250000*t^4 - 84375000*t^3 - 93750000*t^2 - 70312500*t - 29296875,
        2*t^18 - 972*t^17 - 50052*t^16 - 933120*t^15 - 10354740*t^14 - 80433900*t^13 - 474052750*t^12 - 
            2216790000*t^11 - 8452650000*t^10 - 26712000000*t^9 - 70601250000*t^8 - 156543750000*t^7 - 
            290535156250*t^6 - 447539062500*t^5 - 563085937500*t^4 - 562500000000*t^3 - 424804687500*t^2 - 
            219726562500*t - 61035156250
    ]
];
    when "R4(6)": EE:=[EE[k] : k in [1,3,2,4]];
    when "R4(10)": EE:=[EE[k] : k in [1,3,2,4]];
	when "S": EE:=[EE[k] : k in [3,1,4,2,5,6,7,8]]; 
		      EE:=[EE[k] : k in [1,3,2,4,5,8,7,6]]; // Ordering convention used in the final version of the formulas. 
	when "T4": EE:=[EE[k] : k in [2,1,3,4]];
	when "T6": EE:=[EE[k] : k in [2,1,5,3,4,6]];	
	           EE:=[EE[k] : k in [1,2,4,5,3,6]];
	when "T8": EE:=[EE[k] : k in [2,1,3,4,5,6,8,7]];
  end case;
  return [[e[1]/144,-e[2]/1728] : e in EE];
end function;

function IsogenyGraphSignatures(type,t)
// Compute the signature [c4, c6, Delta] for each vertex of the specified
// parametrized isogeny graph.
  EE:=NormalizedIsogenyGraphCoefficients(type,t);
  EE:=[EllipticCurve([e[1],e[2]]) : e in EE];
  sig:=[[cInvariants(Em)[1],cInvariants(Em)[2],Discriminant(Em)] : Em in EE]; 
  return sig;
end function;


function IsogenyGraphJInvariants(type,t)
// Compute the list of j-invariants associated with the vertices of the
// specified parametrized isogeny graph.
  EE:=NormalizedIsogenyGraphCoefficients(type,t);
  return [jInvariant(EllipticCurve([e[1],e[2]])) : e in EE];
end function;

////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////


function FactorizationLatexString(f)
// Input: a polynomial f in Z[t].
// Output: return the factorization of f as a LaTeX-style string.

    Zt<t> := PolynomialRing(Integers());
    f := Zt!f;

    if f eq 0 then
        return "0";
    end if;

    salida := "";

    case Sign(f):
        when -1:
            salida cat:= "-";
    end case;

    for g in Factorization(f) do
        salida cat:= Sprintf("(%o)^{%o}", g[1], g[2]);
    end for;

    return salida;

end function;


// Graph types for which the final factored signatures and j-invariants are
// written to signatures_output.txt.
L:=["L2(2)","L2(3)","L2(5)","L2(7)","L2(13)","L3(9)","L3(25)","R4(6)","R4(10)","R6","S","T4","T6","T8"];
for type in L do 
  Qt<t>:=RationalFunctionField(Rationals());
  C4C6Delta:=IsogenyGraphSignatures(type,t);
  js:=IsogenyGraphJInvariants(type,t);
  fprintf "signatures_output.txt", "\n =========== %o ===========",type;
  for k in [1..#C4C6Delta] do
   Zt<t>:=PolynomialRing(Integers());
   C4:=Zt!Numerator(C4C6Delta[k][1]);  C6:=Zt!Numerator(C4C6Delta[k][2]);  Delta:=Zt!Numerator(C4C6Delta[k][3]);
   // The signatures are expected to have integral polynomial representatives.
   assert Denominator(C4C6Delta[k][1]) eq 1 and Denominator(C4C6Delta[k][2]) eq 1 and Denominator(C4C6Delta[k][3]) eq 1;
   jN:=Zt!Numerator(js[k]); jD:=Zt!Denominator(js[k]); 
   fprintf "signatures_output.txt", "\n(%o)\n",k;  
   fprintf "signatures_output.txt", "j=%o/%o\n", FactorizationLatexString(jN), FactorizationLatexString(jD);
   fprintf "signatures_output.txt", "C4=%o\n",FactorizationLatexString(C4);
   fprintf "signatures_output.txt", "C6=%o\n",FactorizationLatexString(C6);
   fprintf "signatures_output.txt", "Delta=%o\n",FactorizationLatexString(Delta);
  end for;
  
   
end for;



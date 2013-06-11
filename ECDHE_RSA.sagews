︠e194f542-0023-43fc-a593-dfce19b511fdi︠
%hide
%md

Elliptic Curve Cryptosystem
===========================


Seongjin Cho (Josh)
-------------------


<div class="pull-center"><img src="http://wstein.org/books/ent/smallbook.jpg"></div>
This is my reference book!

︡a68673ab-9568-4e09-ba05-14266098b392︡{"html":"<h1>Elliptic Curve Cryptosystem</h1>\n\n<h2>Seongjin Cho (Josh)</h2>\n\n<div class=\"pull-center\"><img src=\"http://wstein.org/books/ent/smallbook.jpg\"></div>\n\n<p>This is my reference book!</p>\n"}︡
︠9dcebf7b-f819-48e8-95a8-b3c4788c3480︠

︠ed0fdce0-3efc-4627-b8fd-f3ec4e0ec8ddi︠
%hide
%md

Elliptic Curve? What is it?
---------------------------

Hint: It is not an ellipse!
︡00e4f178-11e7-4cab-af6d-ab5871d3c9be︡{"html":"<h2>Elliptic Curve? What is it?</h2>\n\n<p>Hint: It is not an ellipse!</p>\n"}︡
︠c7e52434-c885-426c-b3b9-5fc82dbed2a3︠

︠1cf18b56-eb51-40f8-be48-c89c3226d83ei︠
html('<h3>Elliptic Curves over the Real Numbers</h3>')

@interact
def _(a = slider([-10..3],default=-4), b = (4,(-10..10))):
    if 4*a^3 + 27*b^2 == 0:
        html('The choice of $a$ = %s and $b$ = %s does not define an elliptic curve because this makes $27a^3 + 4b^2 = 0.$'%(a,b))
    else:
        E = EllipticCurve([a,b])
        show(E)
        show(plot(E,xmax=3),axes_labels=['x','y'])
︡b7448b19-b8d0-4e71-a829-dae5a86cf70a︡{"html":"<h3>Elliptic Curves over the Real Numbers</h3>"}︡{"interact":{"style":"None","flicker":false,"layout":[[["a",12,null]],[["b",12,null]],[["",12,null]]],"id":"e365f89f-f151-47d6-9a5f-6c726eb2fb17","controls":[{"control_type":"slider","default":6,"var":"a","width":null,"vals":["-10","-9","-8","-7","-6","-5","-4","-3","-2","-1","0","1","2","3"],"animate":true,"label":"a","display_value":true},{"control_type":"slider","default":14,"var":"b","width":null,"vals":["-10","-9","-8","-7","-6","-5","-4","-3","-2","-1","0","1","2","3","4","5","6","7","8","9","10"],"animate":true,"label":"b","display_value":true}]}}︡
︠690197fb-6c13-484c-b8bb-df8abd55f0efi︠

︠cf936a01-5c7b-46fd-b96a-b355afec4de2i︠

%hide
%latex

\newtheorem{definition}{Definition}
\newcommand{\K}{\ensuremath{\mathbb{K}}}

\begin{definition}[Elliptic Curve]
An elliptic curve over a field $\K$ is a curve defined by an equation of the form
$$y^2 = x^3 + ax + b,$$
where $a,b \in \K$ and $4a^3 + 27b^2 \ne 0$.
\end{definition}


︡1e038bbf-f525-4624-ad51-0fa113c48f37︡{"once":false,"file":{"show":true,"uuid":"1cee1948-2174-4571-95ee-a58d50a4002e","filename":"/tmp/tmpGGrQQo.png"}}︡
︠bdc56c32-e618-4c94-9a3e-312d7765096b︠

︠e87a51d7-2378-4251-b732-18ed3222b300i︠

%md

So we have learned in our class two kinds of Public Key Cryptosystem.
-------------------------------------------------------------------

1. Diffie-Hellman
2. RSA

What is so special about elliptic curve?
========================================

1. A 256-bit ECC public key should provide comparable security to a 3072-bit RSA public key

2. Low cost, reducing storage, and transmission requirements


︡8fec7903-b510-4b59-bc3d-e673c1731bcc︡{"html":"<h2>So we have learned in our class two kinds of Public Key Cryptosystem.</h2>\n\n<ol>\n<li>Diffie-Hellman</li>\n<li>RSA</li>\n</ol>\n\n<h1>What is so special about elliptic curve?</h1>\n\n<ol>\n<li><p>A 256-bit ECC public key should provide comparable security to a 3072-bit RSA public key</p></li>\n<li><p>Low cost, reducing storage, and transmission requirements</p></li>\n</ol>\n"}︡
︠aceaa3c3-1b52-4eb6-a292-cea4e7d6450c︠

︠134c9831-b77e-4d4e-b66d-10e04a1e2e6bi︠
%hide
%md
## Original Diffie-Hellman

1. Michael and Nikita agree on a large random prime number $p$.  (Everybody knows $p$.)

2. Michael secretly generates a random number $m$ and computes then messages Nikita (and hence everybody) the number
$2^m\pmod{p}$.

3. Nikita secretly generates a random number $n$ and computes then messages Michael (hence everybody) the number $2^n\pmod{p}$.

4. Both Michael and Nikita can now **easily** compute $2^{mn}\pmod{p}$, but nobody else can.  This
is because $2^{mn} = (2^m)^n = (2^n)^m$.




That nobody else can compute $2^{mn} \pmod{p}$ easily is an "article of faith among cryptographers".  This is the discrete log problem: given $2^n\pmod{p}$, find $n = \log_2(2^n\pmod{p})$.
︡d56a4d7d-7d0c-4777-8d6a-888d8f294874︡{"html":"<h2>Original Diffie-Hellman</h2>\n\n<ol>\n<li><p>Michael and Nikita agree on a large random prime number $p$.  (Everybody knows $p$.)</p></li>\n<li><p>Michael secretly generates a random number $m$ and computes then messages Nikita (and hence everybody) the number\n$2^m\\pmod{p}$.</p></li>\n<li><p>Nikita secretly generates a random number $n$ and computes then messages Michael (hence everybody) the number $2^n\\pmod{p}$.</p></li>\n<li><p>Both Michael and Nikita can now <strong>easily</strong> compute $2^{mn}\\pmod{p}$, but nobody else can.  This\nis because $2^{mn} = (2^m)^n = (2^n)^m$.</p></li>\n</ol>\n\n<p>That nobody else can compute $2^{mn} \\pmod{p}$ easily is an &#8220;article of faith among cryptographers&#8221;.  This is the discrete log problem: given $2^n\\pmod{p}$, find $n = \\log_2(2^n\\pmod{p})$.</p>\n"}︡
︠989e679b-b11e-42df-93fa-509ede5a0e63i︠
%md


## Elliptic curve analogs of Diffie-Hellman

1. Michael and Nikita agree on a prime $p$, an elliptic curve $E$ over $\mathbb{Z}/p\mathbb{Z}$, and a point $P \in E(\mathbb{Z}/p\mathbb{Z})$.

2. Michael secretly chooses a random number $m$ and sends $mP$.

3. Nikita secretly chooses a random $n$ and sends $nP$.

4. The secret key is $nmP$, which both Michael and Nikita can compute.

The original Diffie-Hellman cryptosystem relied on its security on discrete logarithm problem in $\mathbb{Z}/p\mathbb{Z}$. On the other hand, this method relies on discrete logarithm problem in $E(\mathbb{Z}/p\mathbb{Z})$. The bad guy cannot compute $nmP$ only knowing $nP$ and $mP$.
︡4a74b4d7-3571-449d-a4d3-b58e4b7dc1a5︡{"html":"<h2>Elliptic curve analogs of Diffie-Hellman</h2>\n\n<ol>\n<li><p>Michael and Nikita agree on a prime $p$, an elliptic curve $E$ over $\\mathbb{Z}/p\\mathbb{Z}$, and a point $P \\in E(\\mathbb{Z}/p\\mathbb{Z})$.</p></li>\n<li><p>Michael secretly chooses a random number $m$ and sends $mP$.</p></li>\n<li><p>Nikita secretly chooses a random $n$ and sends $nP$.</p></li>\n<li><p>The secret key is $nmP$, which both Michael and Nikita can compute.</p></li>\n</ol>\n\n<p>The original Diffie-Hellman cryptosystem relied on its security on discrete logarithm problem in $\\mathbb{Z}/p\\mathbb{Z}$. On the other hand, this method relies on discrete logarithm problem in $E(\\mathbb{Z}/p\\mathbb{Z})$. The bad guy cannot compute $nmP$ only knowing $nP$ and $mP$.</p>\n"}︡
︠c28d1e4a-373c-4f3d-ae2e-8aac08657371︠

︠77b0f457-b263-4db7-8396-6e3d5c2e896ci︠
%md

Multiplication is performed with doublings and additions.

For example:

$100P = 2(2(P + 2(2(2(P+2P)))))$.
︡7bb32186-b5b6-4795-b4ec-ae44a2ab8a7e︡{"html":"<p>Multiplication is performed with doublings and additions.</p>\n\n<p>For example:</p>\n\n<p>$100P = 2(2(P + 2(2(2(P+2P)))))$.</p>\n"}︡
︠7d337094-f33c-4d88-8c3a-bb11dc3a7591︠
E = EllipticCurve([-5,4])
P = E([1,0]); Q = E([0,2])
P+Q
P+P
P+Q+Q+Q+Q
P+4*Q
︡d8ee92be-c17e-4833-abe9-149a66a291bc︡{"stdout":"(3 : 4 : 1)\n(0 : 1 : 0)\n(350497/351649 : 16920528/208527857 : 1)\n(350497/351649 : 16920528/208527857 : 1)\n"}︡
︠8a7c1b61-1c5d-4dfd-8ad6-64ff73d33454i︠
%hide

html('<h3>Elliptic Curves over Finite Fields</h3>')

@interact
def _(p = (47,(q for q in range(100) if is_prime(q))),a = (4,(0..100)),b = (38,(0..100))):
    K = GF(p) # p != 2,3?!!!
    # diskriminante != 0 !!!
    if Mod(4*a^3 + 27*b^2,p) == 0:
        html('The choice of $a$ = %s and $b$ = %s does not define an elliptic curve because this makes $27a^3 + 4b^2 = 0$ in $\mathbb{F}_{%s}.$'%(a,b,p))
    else:
        E = EllipticCurve(GF(p),[a,b])
        show(E)
        n = E.cardinality()
        print "number of points:", n
        E.plot(pointsize=45).show()

︡31bdd274-9ec6-42f8-a076-a513ceddb7f0︡{"html":"<h3>Elliptic Curves over Finite Fields</h3>"}︡{"interact":{"style":"None","flicker":false,"layout":[[["p",12,null]],[["a",12,null]],[["b",12,null]],[["",12,null]]],"id":"68936385-c268-4722-9c62-61da38d6f284","controls":[{"control_type":"slider","default":14,"var":"p","width":null,"vals":["2","3","5","7","11","13","17","19","23","29","31","37","41","43","47","53","59","61","67","71","73","79","83","89","97"],"animate":true,"label":"p","display_value":true},{"control_type":"slider","default":4,"var":"a","width":null,"vals":["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"],"animate":true,"label":"a","display_value":true},{"control_type":"slider","default":38,"var":"b","width":null,"vals":["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"],"animate":true,"label":"b","display_value":true}]}}︡
︠3349c8d4-31b8-4da2-a0e5-d2f4f9bf2268︠

︠6f3497d1-6bd2-44e1-806d-d988d833d534i︠

%md

The basic reason for this is that elliptic curves over finite fields provide an inexhausible supply of finite abelian groups which, even when large, are amendable to computation because of their rich structure.
︡941f8e29-9fe6-4750-883c-e865386f23f9︡{"html":"<p>The basic reason for this is that elliptic curves over finite fields provide an inexhausible supply of finite abelian groups which, even when large, are amendable to computation because of their rich structure.</p>\n"}︡
︠6aa48702-9154-4682-8b30-bbdd163c9375︠

︠672cb9ad-e953-4234-8af6-4d0034dc02bd︠
P = E([14,43])
n = 147
m = 131
n*P
m*P
m*n*P
︡c93a962f-046b-46d1-ad63-9514ff815578︡{"stdout":"(68 : 17 : 1)\n(14 : 43 : 1)\n(68 : 17 : 1)\n"}︡
︠5422b6f8-77c3-416b-b242-2e5bbc302ab5︠

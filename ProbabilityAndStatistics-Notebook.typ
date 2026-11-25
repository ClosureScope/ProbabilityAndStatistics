#set text(lang: "zh", region: "cn")
#import "template.typ": *
#set text(font: (font-en, font-song))
#show strong: set text(font: (font-en, font-hei), weight: "regular")
#show emph: text.with(font: (font-en, font-kai), style: "normal")
#show: frame-style(styles.hint)
#show: ilm.with(
  title: [概率统计],
  author: "Closure",
  figure-index: (enabled: true),
)

= 随机事件和概率
== 随机事件及其运算
=== 随机试验和随机事件

=== 随机事件之间的关系和运算
#definition[随机事件的关系][

  包含：$A subset B$

  相等：$A = B$

  和或并：$A union B$或$A + B$

  积或交：$A inter B$或$A B$

  差：$A - B$

  互不相容：$A B = emptyset$

  对立事件：$A B = emptyset, A union B = Omega <=> B = overline(A)$
]

#proposition[随机事件的运算][

  交换律：$A union B = B union A, A B = B A$

  结合律：$(A union B) union C = A union (B union C), (A B) C = A (B C)$

  分配律：$A union (B C) = (A union B) (A union C), A (B union C) = (A B) union (A C)$

  德摩根律：$overline(A union B) = overline(A) thin overline(B), overline(A B) = overline(A) union overline(B)$
]
#definition[事件的运算顺序][

  对立优先，其次是交，然后是并和差。括号内运算优先。
]
== 随机事件的概率

#definition[概率][

  对于随机试验的每个事件$A$赋予一个实数$Pr(A)$，若$Pr(dot)$满足以下公理

  + 非负性：$forall A subset Omega, Pr(A) >= 0$
  + 规范性：$Pr(Omega) = 1$
  + 可列可加性：$A_1, A_2, dots$为两两互斥事件，$Pr(union.big_(i=1)^infinity A_i) = sum_(i=1)^infinity Pr(A_i)$
  则称$Pr(A)$为事件$A$的概率
]
=== 频率与概率
#definition[频率][

  如果事件$A$在$n$次重复试验中发生了$m$次，$A$的频率为
  $ f_n (A) = m/n $
]

#proposition[频率的性质][
  + $0 <= f_n (A) <= 1$
  + $f_n (Omega) = 1$
  + 设$A_1, A_2, dots, A_k$为两两互斥事件，则$f_n (union.big_(i=1)^k A_i) = sum_(i=1)^k f_n (A_i)$
]

#definition[统计概率][

  $n$很大时，频率$f_n (A) = m/n$稳定在某一数值$p$的附近摆动，且随着试验次数$n$的增大，其摆动的幅度越来越小，则称$p$为$A$的统计概率，记为$Pr(A) = p$

]
=== 古典概型
#definition[古典概型][

  设$E$是一随机试验，它具有下列特点：
  + 样本空间$Omega$包含了有限个样本点$omega_i$，即$Omega = {omega_1, omega_2, dots, omega_N}$
  + 每个样本点$omega_i$的发生是等可能的，即
  $ Pr(omega_1) = Pr(omega_2) = dots = Pr(omega_N) $
  则称$E$为古典概型
]
#definition[古典概率][

  古典概型问题，样本空间$Omega = {omega_1, omega_2, dots, omega_N}$，若事件$A$包含了$M$个样本点，则事件$A$的概率为$ Pr(A) = M/N $]
=== 几何概型
#definition[几何概型][

  一类随机试验若满足
  + 样本空间$Omega$中的每个$omega$与一个可度量的几何区域$S$中的一点$tau$一一对应，此时对于事件$A$必有一个可度量的子区域$G subset S$与其对应
  + 事件$A$的概率仅与其对应的$G$的几何度量成正比，与$G$在$S$中的位置和形状无关
  这类随机试验称为几何概率，定义事件$A$的概率为$ Pr(A) = m(G) / m(S) $
]
=== 概率的基本性质
#proposition[概率的性质][
  + $Pr(emptyset) = 0$
  + 有限可加性：设$A_1, A_2, dots, A_n$为两两互斥事件，$Pr(union.big_(i=1)^n A_i) = sum_(i=1)^n Pr(A_i)$
  + $Pr(overline(A)) = 1-Pr(A) => Pr(A) <= 1$
  + $A subset B => Pr(B - A) = Pr(B)-Pr(A) => Pr(A) <= Pr(B)$
  + 对任意两个事件$A, B$，有$Pr(A union B) = Pr(A) + Pr(B) - Pr(A B)$
]

#proposition[容斥原理][
  $
    Pr(union.big_(i=1)^n A_i) & = sum_(i=1)^n Pr(A_i) - sum_(1<=i<j<=n) Pr(A_i A_j) + sum_(1<=i<j<k<=n) Pr(A_i A_j A_k) \
    &+ dots + (-1)^(n-1) Pr(A_1 A_2 dots A_n) \
    &= sum_(k=1)^n (-1)^(k-1) sum_(1 <= i_1 < dots < i_k <= n) P(A_(i_1) inter dots inter A_(i_k))
  $
]
#definition[联合界][

  给定事件$A_1, A_2, dots, A_k subset.eq Omega$，那么$ Pr(A_1 union A_2 union dots union A_k) <= Pr(A_1) + Pr(A_2) + dots + Pr(A_k) $
]

== 条件概率
=== 条件概率
#definition[条件概率][

  设$A, B$为两事件，$Pr(B)>0$，则事件$B$发生的条件下事件$A$发生的条件概率为
  $ Pr(A | B) = Pr(A inter B) / Pr(B) $
]

#proposition[条件概率的性质][
  + 非负性：$Pr(B | A) >= 0$
  + 规范性：$Pr(Omega | A) = 1$
  + 可列可加性：$B_1, B_2, dots$为两两互斥事件，$Pr(union.big_(i=1)^infinity B_i | A) = sum_(i=1)^infinity Pr(B_i | A)$
  + $Pr(overline(B) | A)+Pr(B | A) = 1$
  + $Pr(B union C | A) = Pr(B | A) + Pr(C | A) - Pr(B C | A)$

]

=== 乘法公式
#theorem[乘法公式][
  $ Pr(A B) = Pr(A) Pr(B | A) = Pr(B) Pr(A | B) $
]

=== 全概率公式
#definition[完备事件组][

  若$B_1, B_2, dots, B_n$两两互斥，且$Omega = union.big_(i=1)^n B_i$，则称$B_1, B_2, dots, B_n$为完备事件组，或称$B_1, B_2, dots, B_n$为$Omega$的一个划分
]

#theorem[全概率公式][

  设$B_1, B_2, dots, B_n$为$Omega$的一个划分
  $ Pr(A) = sum_(i=1)^n Pr(B_i) Pr(A | B_i) $
]

=== 贝叶斯公式
#theorem[贝叶斯公式][

  设$B_1, B_2, dots, B_n$为$Omega$的一个划分，且$Pr(B_i) > 0$，则对试验的任一事件$A$（$Pr(A)>0$），有
  $ Pr(B_i | A) = Pr(A B_i) / Pr(A) = (Pr(B_i) Pr(A | B_i)) / (sum_(i=1)^n Pr(B_i) Pr(A | B_i)) $
]
称$Pr(B_i)$为先验概率，是由以往经验得到的，是事件$A$的原因

称$Pr(B_i | A)$为后验概率，是得到了信息$A$发生，再对$A$的原因$B_i$发生的可能性加以修正

== 随机事件的独立性
=== 随机事件的独立性
#definition[相互独立][

  $ Pr(A B) = Pr(A) Pr(B) $]

#proposition[][

  如果四对事件$A, B; A, overline(B); overline(A), B; overline(A), overline(B)$中其中任何一对事件相互独立，则其余三对事件也分别相互独立]

#definition[相互独立][
  $ cases(Pr(A B) = Pr(A) Pr(B), Pr(A C) = Pr(A) Pr(C), Pr(B C) = Pr(B) Pr(C)) $
  $ Pr(A B C) = Pr(A) Pr(B) Pr(C) $
]

#definition[两两独立][

  $ cases(Pr(A B) = Pr(A) Pr(B), Pr(A C) = Pr(A) Pr(C), Pr(B C) = Pr(B) Pr(C)) $
]

#definition[相互独立][
  $
             Pr(A_i A_j) & = Pr(A_i) Pr(A_j) \
         Pr(A_i A_j A_k) & = Pr(A_i) Pr(A_j) Pr(A_k) \
                    dots & = dots \
    Pr(A_1 A_2 dots A_n) & = Pr(A_1) Pr(A_2) dots Pr(A_n)
  $
]

#proposition[][

  若$n$个事件相互独立，任意分成$k$组，同一个事件不能同时属于两个不同的组，则对每组的事件进行和，积，差，对立等运算得到的$k$个事件也相互独立。
]
=== 随机事件的条件独立
#definition[条件独立][

  $Pr(C) > 0$，若
  $ Pr(A inter B | C) = Pr(A | C) Pr(B | C) $
  则称$A$与$B$在给定$C$下条件独立，记为
  $ A perp B | C $
]

= 随机变量及其分布
== 随机变量及其分布函数
=== 随机变量的概念
#definition[随机变量][

  $ X: Omega->RR $]
=== 随机变量的分布函数
#definition[分布函数][

  $ F(x) = Pr(X <= x) $]

#proposition[分布函数的性质][
  + 有界性：$0 <= F(x) <= 1, lim_(x->+infinity) F(x) = 1, lim_(x->-infinity) F(x) = 0$
  + 单调性：$forall x_1 < x_2, F(x_1) <= F(x_2)$
  + 右连续性：$forall x, lim_(t->x+) F(t) = F(x)$
]

== 离散型随机变量及其分布律
=== 离散型随机变量的分布律

#definition[分布律][
  $ Pr(X = x_i) = Pr({omega: X(omega) = x_i}) = p_i $
]
#proposition[分布律的性质][
  + 非负性：$p_i >= 0$
  + 规范性：$sum_(i=1)^infinity p_i = 1$
]
#proposition[分布函数与分布律的关系][
  + $F(x) = sum_(x_i <= x) Pr(X = x_i)$
  + $Pr(X = x_i) = F(x_i) - F(x_i -)$
]
=== 常见的离散型随机变量
#definition[0-1分布][
  $ Pr(X=k) = p^k (1-p)^(1-k), k=0, 1; 0<p<1 $
  称$X$服从参数为$p$的0-1分布
]
#definition[二项分布][

  在$n$重伯努利试验中，设一次试验中事件$A$发生的概率 $Pr(A) = p, 0<p<1$，

  令$X$表示事件$A$发生的次数，则$X$的分布律为
  $ Pr(X=k) = C_n^k p^k (1-p)^(n-k) $
  $X tilde B(n,p)$
]
#proposition[二项分布中最可能成功次数][
  - 当$(n+1)p in ZZ$时，在$k = (n+1)p$与$k=(n+1)p-1$处的概率取得最大值
  - 当$(n+1)p in.not ZZ$时，在$k = floor((n+1)p)$处的概率取得最大值
]

#definition[几何分布][

  伯努利试验等待首次成功时间为$X$
  $ Pr(X = k) = p (1 - p)^(k-1), k=1, 2, dots $

]

#proposition[几何分布的无记忆性][
  $ Pr(X = m + k | X > m) = Pr(X = k) $
]
#theorem[无记忆性的离散分布$=>$几何分布][

  若$X$取正整数，且在$X > k$的条件下，$X = k + 1$的概率与$k$无关，那么$X$服从几何分布
]
#definition[Pascal 分布 / 负二项分布][

  伯努利试验等待$r$次成功时间为$X$
  $ Pr(X = k) = C_(k-1)^(r-1) p^r (1-p)^(k-r), k = r, r + 1, dots $
]
#theorem[Poisson 定理][

  $lambda > 0$, $lim_(n->infinity) n p_n = lambda$
  $ lim_(n->infinity) C_n^k p_n^k (1 - p_n)^(n - k) = e^(-lambda) lambda^k / (k!), k = 0, 1, 2, dots $
]
#definition[Poisson 分布][

  $lambda > 0$表示一段时间内某随机事件发生次数的期望，一段时间内其发生$k$次的概率
  $ Pr(X=k) = e^(- lambda) lambda^k / (k !), k = 0, 1, 2, dots $
  $X tilde P(lambda)$
]
#proposition[随机稀疏化][

  设总事件数$X tilde P(lambda)$，每个事件独立地通过成功概率为$p$的伯努利试验，则成功事件数$ Y tilde P(lambda p) $
]
== 连续型随机变量及其概率密度
=== 连续型随机变量的概率密度
#definition[概率密度函数][

  对于$X$的分布函数$F(x)$，若存在非负可积函数$f(x)$，使得
  $ F(x) = integral_(-infinity)^x f(t) d t, - infinity < x < + infinity $
  则$X$是连续型随机变量，$f(x)$为概率密度函数
]

#proposition[概率密度函数的性质][
  + 非负性：$f(x) >= 0$
  + 规范性：$integral_(-infinity)^(+infinity) f(x) d x = F(+ infinity) = 1$
  + $Pr(a < X <= b) = Pr(a <= X < b) = Pr(a < X < b) = Pr(a <= X <= b) = integral_a^b f(x) d x$
  + 在$f(x)$的连续点处，$f(x) = F^' (x)$
]

#note[][
  + 连续型随机变量的分布函数是连续函数
  + $f(x)$不唯一，允许在有限或可列个点处的函数值不同
]


=== 常见的连续型随机变量
#definition[指数分布][

  $lambda > 0$表示一段时间内某随机事件发生次数的期望，任意两事件的时间间隔为$X$

  $ f(x) = cases(0 quad &x<=0, lambda e^(-lambda x) quad &x>0) $

  $ F(x) = cases(0 quad &x<0, 1 - e^(- lambda x) quad &x >= 0) $
  $X tilde E(lambda)$

]

#proposition[指数分布的无记忆性][
  $ Pr(X > s + t | X > s) = Pr(X > t) $
]

#definition[均匀分布][
  $ f(x) = cases(1/(b-a) quad &a < x < b, 0 &"other") $
  $X tilde U(a, b)$
]
#definition[正态分布][
  $ f(x) = 1/(sqrt(2 pi) sigma) exp(-(x-mu)^2/(2 sigma^2)), -infinity < x < + infinity $
  $X tilde N(mu, sigma^2)$
]

#definition[标准正态分布][
  $X tilde N(0, 1)$

  概率密度函数记为
  $ phi(x) = 1/sqrt(2 pi) exp(-x^2 /2) $
  分布函数记为
  $ Phi(x) $
]

#definition[标准正态分布的性质][
  + 若$X tilde N(mu, sigma^2)$，则$(X-mu)/sigma tilde N(0,1), F(x) = Phi((x-mu)/sigma), f(x) = 1/sigma phi((x-mu)/sigma)$
  + $Phi(0) = 0.5, Phi(-x) = 1 - Phi(x), Pr(abs(X) < x) = 2 Phi(x) - 1$
]
== 随机变量的函数及其分布
=== 离散型随机变量函数的分布
#strategy[求$Y = g(X)$的概率分布][
  $ Pr(Y = y_i) = sum_(k: g(x_k) = y_i) p_k, i=1,2,dots $
]
=== 连续型随机变量函数的分布
#intuition[][
  $ Y = g(X), X = g^(-1) (Y)= h(Y) $
  $
    F_Y (y) & = Pr(Y <= y) \
            & = Pr(g(X) <= y) \
            & = cases(Pr(X <= h(y)) quad &g arrow.t, Pr(X >= h(y)) quad &g arrow.b) \
            & = cases(F_X (h(y)) quad &g arrow.t, 1 - F_X (h(y)) quad &g arrow.b)
  $

  $
    f_Y (y) & = cases(h^' (y) f_X (h(y)) quad &g arrow.t, -h^' (y) f_X (h(y)) quad &g arrow.b) \
            & = abs(h^' (y)) f_X (h(y))
  $
]

#theorem[][

  $Y = g(X)$，且 $g(x)$ 在 $(-infinity, +infinity)$ 内单调，

  - $g arrow.t$，定义广义反函数 $h(y) = inf {x: g(x) >= y}$，则
    $ F_Y (y) = F_X (h(y)) $

  - $g arrow.b$，定义广义反函数 $h(y) = inf {x: g(x) <= y}$，则
    $ F_Y (y) = 1 - F_X (h(y)) $


]

#theorem[][

  $g(x)$在$(-infinity, +infinity)$内严格单调，其反函数$x = h(y)$有连续导数，则$Y = g(X)$也是连续型随机变量，且
  $ f_Y (y) = cases(abs(h^' (y)) f_X (h(y)) quad &alpha < y < beta, 0 quad &"other") $
  $alpha = min{g(-infinity), g(+infinity)}, beta = max {g(-infinity), g(+infinity)}$
]

#theorem[][

  若$g(x)$在不相重叠的区间$I_1, I_2, dots$上逐段严格单调，其反函数分别为$h_1 (y), h_2 (y), dots$， 且均有连续倒数，则$Y = g(X)$也是连续型随机变量，且
  $ f_Y (y) = abs(h_1^' (y)) f_X (h_1 (y)) + abs(h_2^' (y)) f_X (h_2 (y)) + dots $
]

#theorem[概率积分变换][

  设$X$的分布函数为 $F$，且 $F$ 连续，则
  $ F(X) tilde U(0, 1) $
]

#theorem[逆变换采样][

  设 $Y tilde U(0, 1)$，$F$ 为任意分布函数，定义其广义反函数（分位数函数）
  $ F^(-1)(y) = inf {x in RR: F(x) >= y}, quad 0 < y < 1 $
  则随机变量 $X = F^(-1)(Y)$ 的分布函数为 $F$
]
= 多维随机变量及其分布
== 二维随机变量及其分布
=== 二维随机变量及其联合分布函数
#definition[二维随机变量][
  $ (X, Y): Omega -> RR^2 $
]
#definition[联合分布函数][
  $ F(x, y) = Pr(X<=x, Y<=y) $
]
#proposition[联合分布函数的性质][
  + 非负性：$0 <= F(x, y) <= 1$, $F(+ infinity, + infinity) = 1$, $F(- infinity, - infinity) = 0$, $F(x, - infinity) = 0$, $F(-infinity, y) = 0$
  + 单调性：$forall x_1 < x_2, F(x_1,y) <= F(x_2,y); forall y_1 < y_2, F(x, y_1) <= F(x, y_2)$
  + 右连续性：$F(x_0, y_0) = F(x_0 +, y_0); F(x_0, y_0) = F(x_0, y_0+)$
  + $forall x_1 < x_2, y_1 < y_2, Pr(x_1 < X <= y, y_1 < Y <= y_2) = F(x_2, y_2)- F(x_2, y_1) - F(x_1, y_2) + F(x_1, y_1) >= 0$
]
#definition[边缘分布函数][
  $ F_X (x) = F(x, + infinity), F_Y (y) = F(+infinity, y) $
]
=== 二维离散型随机变量
#definition[联合分布律][
  $ Pr(X = x_i, Y = y_i) = p_(i j) $
]
#proposition[联合分布律的性质][
  + 非负性：$p_(i j) >= 0$
  + 规范性：$sum_(i=1)^infinity sum_(j=1)^infinity p_(i j) = 1$
]

#proposition[联合分布函数与联合分布律的关系][
  + $F(x, y) = sum_(x_i <= x, y_j <= y) Pr(X = x_i, Y = y_j)$
  + $Pr(X = x_i, Y = y_j) = F(x_i, y_j) - F(x_i, y_j -) - F(x_i -, y_j) + F(x_i -, y_j -)$
]
#definition[边缘分布律][
  $ Pr(X = x_i) = sum_j p_(i j) = p_(i dot), Pr(Y = y_j) = sum_i p_(i j) = p_(dot j) $
]

=== 二维连续型随机变量
#definition[联合概率密度函数][

  若存在二元非负可积函数$f(x, y)$，使得
  $ F(x,y) = integral_(-infinity)^x integral_(-infinity)^y f(u, v) d u d v $
  则$(X, Y)$是二维连续型随机变量，并称$f(x, y)$为联合概率密度函数
]

#proposition[联合概率密度函数的性质][
  + 非负性：$f(x, y) >= 0$
  + 规范性：$integral_(-infinity)^(+infinity) integral_(-infinity)^(+infinity) f(x, y)d x d y = 1$
  + $Pr((X, Y) in G) = integral.double_G f(x,y) d x d y$
  + 在$f(x, y)$的连续点处，$(partial^2 F(x, y)) / (partial x partial y) = f(x, y)$
]
#definition[边缘密度函数][
  $ f_X (x) = integral_(-infinity)^(+infinity) f(x,y) d y, f_Y (y) = integral_(-infinity)^(+infinity) f(x,y) d x $
]
==== 二维均匀分布
#definition[二维均匀分布][
  $ f(x, y) = cases(1/m(G) quad &(x, y) in G, 0 quad &"other") $
]

#note[][
  均匀分布的边缘分布不一定是均匀分布，边平行于坐标轴的矩形域上的均匀分布的边缘分布仍为均匀分布。]
==== 二维正态分布
#definition[二维正态分布][
  $ x = mat(x; y), mu = mat(mu_1; mu_2) $
  $ Sigma = mat(sigma_1^2, rho sigma_1 sigma_2^2; rho sigma_1 sigma_2, sigma_2^2) $
  $ f(x, y) = 1/(2 pi abs(Sigma)^(1/2)) exp(-1/2 (x - mu)^T Sigma^(-1) (x - mu)) $
  $(X, Y) tilde N(mu_1, sigma_1^2; mu_2, sigma_2^2; rho)$
]

#definition[多维正态分布][
  $ f(x, y) = (2 pi)^(- n /2) abs(Sigma)^(-1/2) exp(-1/2 (x - mu)^T Sigma^(-1) (x - mu)) $
]

#note[][正态分布的边缘分布是正态分布，边缘分布为正态分布的联合分布不一定是正态分布。]

== 二维随机变量的条件分布
=== 二维离散型随机变量的条件分布
#definition[条件分布律][
  $ Pr(X = x_i | Y = y_j) = Pr(X = x_i, Y = y_j) / Pr(Y = y_j) = p_(i j) / p_(dot j) $
]

=== 二维连续型随机变量的条件分布
#definition[条件概率密度函数][

  $ f_(X | Y) (x | y) = f(x, y) / (f_Y (y)) $
]

#definition[条件分布函数][

  $ F_(X | Y) (x | y) = integral_(- infinity)^x f_(X | Y) (u | y) d u $
]

#proposition[正态分布的条件分布是正态分布][

  $ Y | X = x tilde N(mu_2 + rho sigma_2 / sigma_1 (x - mu_1), sigma_2^2 (1 - rho^2)) $
]

== 随机变量的独立性
#definition[相互独立][
  $ Pr(X <= x, Y <= y) = Pr(X <= x) Pr(Y <= y) $
  $ F(x, y) = F_X (x) F_Y (y) $
]

#proposition[离散型相互独立][
  $ "独立" <=> Pr(X = x_i, Y = y_j) = Pr(X=x_i) Pr(Y = y_j) $
]

#proposition[连续型相互独立][
  $ "独立" <=> f(x, y) = f_X (x) f_Y (y) $
]

#note[][若相互独立，则边缘分布确定联合分布。]


#proposition[][

  $(X, Y) tilde N(mu_1, sigma_1^2; mu_2, sigma_2^2; rho)$
  $ "独立" <=> rho = 0 $
]

#theorem[独立性定理][

  $X$与$Y$相互独立的充分必要条件是存在非负可积函数$r(x)$和$g(y)$使得
  $ f(x, y) = r(x) g(y), -infinity < x < + infinity, -infinity < y < + infinity $
  在一切连续点上成立。这时
  $
    f_X (x) = r(x) / (integral_(-infinity)^(+infinity) r(x) d x), f_Y (y) = g(y) / (integral_(-infinity)^(+infinity) g(y) d y)
  $
]

== $n$维随机变量
#definition[联合分布函数][
  $ F(x_1, x_2, dots, x_n) = Pr(X_1 <= x_1, X_2 <= x_2, dots, X_n <= x_n) $
]

#definition[边缘分布函数][
  $ F_(X_i) = Pr(X_i <= x_i) = Pr(X_1 <= +infinity, dots, X_i <= x_i, dots, X_n <= +infinity,) $
]

#definition[相互独立][
  $ Pr(X_1 <= x_1, X_2 <= x_2, dots, X_n <= x_n) = product_(i=1)^n Pr(X_i <= x_i) $
]

#definition[联合分布律][
  $ Pr(X_1 = x_1, X_2 = x_2, dots, X_n = x_n) $
]

#definition[联合概率密度函数][

  若存在非负可积函数$f(x_1, x_2, dots, x_n)$，使得
  $
    F(x_1, x_2, dots, x_n) = integral_(-infinity)^(x_1) integral_(-infinity)^(x_2) dots integral_(-infinity)^(x_n) f(u_1, u_2, dots, u_n) d u_1 d u_2 dots d u_n
  $
  则$(X_1, X_2, dots, X_n)$是$n$维连续型随机变量，并称$f(x_1, x_2, dots, x_n)$为联合概率密度函数
]

#proposition[离散型相互独立][
  $ "独立" <=> Pr(X_1 = x_1, X_2 = x_2, dots, X_n = x_n) = Pr(X_1 = x_1) dots Pr(X_n = x_n) $
]

#proposition[连续型相互独立][
  $ "独立" <=> f(x_1, x_2, dots, x_n) = f_(X_1) (x_1) f_(X_2) (x_2) dots f_(X_n) (x_n) $

]

== 二维随机变量函数的分布
=== 二维离散型随机变量函数的分布
#proposition[和的分布][卷积公式][

  $Z = X + Y$，$X, Y$相互独立
  $ Pr(Z = r) = sum_(i=0)^r Pr(X = i) Pr(Y = r - i) $
]

#proposition[二项分布的可加性][

  $X_1, X_2, dots, X_m$相互独立且$X_i tilde B(n_i, p)$，则$ sum_i X_i tilde B(sum_i n_i, p) $
]

#proposition[Poisson分布的可加性][

  $X_1, X_2, dots, X_m$相互独立且$X_i tilde P(lambda_i)$，则$ sum_i X_i tilde P(sum_i lambda_i) $
]
=== 二维连续型随机变量函数的分布


#proposition[和的分布][卷积公式][

  $Z = X + Y$，$X, Y$相互独立
  $
    f_Z (z) & = (f_X star f_Y)(z) = integral_(-infinity)^(+infinity) f(x, z - x) d x
  $
  #definition[卷积][
    $ (f star g) (x) = integral_(-infinity)^(+infinity) f(t) g(x - t) d t $
  ]
]

#proposition[极值的分布][

  $X_1, X_2, dots, X_n$相互独立

  $M = max_i X_i$

  $N = min_i X_i$
  $ F_M (m) = product_i F_X_i (m) $
  $ F_N (n) = 1 - product_i (1 - F_X_i (n)) $

]

#proposition[二维正态分布的性质][
  + $(X, Y) tilde N(mu_1, sigma_1^2; mu_2, sigma_2^2; rho) => X tilde N(mu_1, sigma_1^2), Y tilde N(mu_2, sigma_2^2)$
  + $(X, Y) tilde N(mu_1, sigma_1^2; mu_2, sigma_2^2; rho) <=> X tilde N(mu_1, sigma_1^2), Y | X = x tilde N(mu_2 + rho sigma_2 / sigma_1 (x - mu_1), sigma_2^2 (1- rho^2))$
  + $(X, Y) tilde N(mu_1, sigma_1^2; mu_2, sigma_2^2; rho) => X + Y tilde N(mu_1 + mu_2, sigma_1^2 + 2 rho sigma_1 sigma_2 + sigma_2^2)$
]

#proposition[正态分布的可加性][

  $X_1, X_2, dots, X_m$相互独立且$X_i tilde N(mu_i, sigma_i^2)$，则$ sum_i X_i tilde N(sum_i mu_i, sum_i sigma_i^2) $
]
=== 一般情形的多维随机变量函数分布
#theorem[][

  $X, Y$为多维随机变量，若$y = g(x)$存在唯一的反函数使得$x = h(y)$，$Y = g(X)$

  $ f_Y (y) = f_X (h(y)) abs((partial x) / (partial y)) $

]
#proposition[][

  $Z = g(X, Y)$

  $Y = h(X, Z)$

  $ f_Z (z) = integral_(-infinity)^(+infinity) f(x, h(x, z)) abs((partial h) / (partial z)) d x $
]
= 随机变量的数字特征
== 期望
=== 期望的概念
#definition[期望][

  若$sum_(k=1)^infinity x_k p_k$绝对收敛，
  $ EE(X) = sum_(k=1)^infinity x_k p_k $

  若$integral_(-infinity)^(+infinity) x f(x) d x$绝对收敛，
  $ EE(X) = integral_(-infinity)^(+infinity) x f(x) d x $
]

=== 期望的性质
#proposition[期望的性质][
  + $EE(X)$存在的充要条件是$EE(abs(X)) < infinity$
  + $X <= Y => EE(X) <= EE(Y)$
  + $EE(c) = c$
  + $EE(c X) = c EE(X)$
  + $EE(X + Y) = EE(X) + EE(Y)$
  + $X, Y$独立，$EE(X Y) = EE(X) EE(Y)$
  + $EE(X Y) = EE(X) EE(Y) + "cov"(X, Y)$
]
#proposition[期望与尾部的关系][层饼公式][

  $X$是非负离散型随机变量，可能取值为$0, 1, 2, dots$，
  $ EE(X) = sum_(i=0)^(infinity) Pr(X > i) $

  $X$是非负连续型随机变量，
  $ EE(X) = integral_0^infinity Pr(X > x) d x $
]
=== 随机变量函数的期望
#proposition[随机变量函数的期望][
  $ EE(Y) = EE(g(X)) = sum_(k=1)^infinity g(x_k) p_k $
  $ EE(Y) = EE(g(X)) = integral_(-infinity)^(+infinity) g(x) f(x) d x $
]
#corollary[][
  $ EE(Z) = EE(g(X, Y)) = sum_(i=1)^infinity sum_(j=1)^infinity g(x_i, y_i) p_(i j) $
  $ EE(Z) = EE(g(X, Y)) = integral_(-infinity)^(+infinity) integral_(-infinity)^(+infinity) g(x, y) f(x, y) d x d y $
]
== 方差
=== 方差的概念
#definition[方差][
  $ D(X) = EE((X - EE(X))^2) = EE(X^2) - (EE(X))^2 $
  $ sigma_X = sqrt(D(X)) $
]
=== 方差的性质
#proposition[方差的性质][
  + $D(X)$存在的充要条件是$EE(abs(X)^2) < +infinity$
  + $D(c) = 0$
  + $D(c X) = c^2 D(X)$
  + $X, Y$独立，$D(X plus.minus Y) = D(X) + D(Y)$
  + $D(X) <= EE((X - c)^2)$ 等号成立当且仅当$c = EE(X)$
  + $D(X) = 0 <=> exists c, P(X = c) = 1$
]
=== 标准化随机变量
#definition[标准化随机变量][
  $ X^star = (X - EE(X)) / sqrt(D(X)) $
  $E(X^star) = 0, D(X^star) = 1$
]
== 重要随机变量的期望和方差
#proposition[重要随机变量的期望和方差][
  + $X tilde B(n, p), EE(X) = n p， D(X) = n p (1-p)$
  + $X tilde "Geom"(p), EE(X) = 1/p, D(X) = (1-p) / p^2$
  + $X tilde P(lambda), EE(X) = lambda, D(X) = lambda$
  + $X tilde E(lambda), EE(X) = 1/lambda, D(X) = 1/lambda^2$
  + $X tilde N(mu, sigma^2), EE(X) = mu, D(X) = sigma^2$
  + $X tilde U(a, b), EE(X) = (a + b) / 2, D(X) = (b-a)^2/12$
]
== 协方差和相关系数
=== 协方差和相关系数的概念
#definition[协方差][
  $ "cov"(X, Y) = EE((X-EE(X))(Y - EE(Y))) = EE(X Y) - EE(X) EE(Y) $
]

#definition[Pearson 相关系数][
  $ rho_(X Y) = "cov"(X, Y)/(sqrt(D(X)) sqrt(D(Y))) = "cov"(X^star, Y^star) $
  $rho_(X Y)=0$，$X$与$Y$不相关

  $abs(rho_(X Y))=1$，$X$与$Y$完全相关

  $abs(rho_(X Y))<1$，$X$与$Y$部分线性相关
]
=== 协方差和相关系数的性质
#proposition[协方差的性质][
  + $D(X) = "cov"(X, X)$
  + $D(X plus.minus Y) = D(X) + D(Y) plus.minus 2"cov"(X, Y)$
  + $"cov"(X, Y) = "cov"(Y, X)$
  + $"cov"(a X + c, b Y + d) = a b"cov"(X, Y)$
  + $"cov"(X + Y, Z) = "cov"(X, Z) + "cov"(Y, Z)$
  + Cauchy-Schwarz不等式：$"cov"(X, Y) <= sqrt(D(X)) sqrt(D(Y))$
]
#proposition[相关系数的性质][
  + $abs(rho_(X Y)) <= 1$
  + $abs(rho_(X Y)) = 1 <=> Pr(Y^star = plus.minus X^*) = 1$
]
#proposition[][独立一定不相关，不相关未必独立]
== 条件期望
#definition[条件期望][
  #definition[给定随机事件的条件期望][
    $ EE(X | A) = sum_(k=1)^infinity x_k Pr(X = x_k | A) $
  ]
  #definition[给定随机变量的条件期望][
    $ EE(X | Y) = g(Y) = "argmin"_g EE_X ((X - g(Y))^2) $
  ]
]
#proposition[条件期望的性质][
  + $EE(X | X) = X$
  + $X, Y$相互独立，$EE(X | Y) = EE(X)$
  + $EE(a X + b Y | Z) = a EE(X | Z) + b EE(Y | Z)$
]
#theorem[重期望公式][
  $ EE(X) = EE(EE(X | Y)) $
]
== 随机变量的高阶矩
#definition[随机变量的高阶矩][
  + $EE(X^k)$为$X$的$k$阶原点矩，$EE((X - EE(X))^k)$为$X$的$k$阶中心矩
  + $EE(X^k Y^l)$为$X$和$Y$的$k+l$阶混合原点矩，$EE((X - EE(X))^k (Y - EE(Y))^l)$为$X$和$Y$的$k+l$阶混合中心矩
]


#definition[分位数][

  满足分布函数$F(tau_p) = p$的$tau_p$称为$p$分位数
]
== 多维随机向量
#definition[期望][
  $ EE(X) = mu_X = mat(EE(X_1); EE(X_2); dots.v; EE(X_p)) $
]

#definition[协方差矩阵][

  $sigma_(i j) = "cov"(X_i, X_j)$
  $
    "cov"(X) = Sigma_X = mat(sigma_11, sigma_12, dots, sigma_(1 p); sigma_21, sigma_22, dots, sigma_(2 p); dots.v, dots.v, dots.v, dots.v; sigma_(p 1), sigma_(p 2), dots, sigma_(p p)) &= EE((X - mu_X) (X - mu_X)^T) \ &= EE(X X^T) -mu_X mu_X^T
  $
]
#definition[交叉协方差矩阵][

  $sigma_(i j) = "cov"(X_i, Y_j)$
  $
    "cov"(X, Y) = Sigma_(X Y) = mat(sigma_11, sigma_12, dots, sigma_(1 q); sigma_21, sigma_22, dots, sigma_(2 q); dots.v, dots.v, dots.v, dots.v; sigma_(p 1), sigma_(p 2), dots, sigma_(p q)) &= EE((X - mu_X) (Y - mu_Y)^T) \ &= EE(X Y^T) - mu_X mu_Y^T
  $
]

#proposition[期望的性质][
  + $EE(A X + B Y + b) = A mu_X + B mu_Y + b$
  + $EE(X Y^T) = mu_X mu_Y^T + Sigma_(X Y)$
  + $EE(X^T Y) = mu_X^T mu_Y + "tr"(Sigma_(X Y))$
]

#proposition[协方差矩阵的性质][
  + $Sigma_X = Sigma_X^T$
  + $Sigma_X succ.eq 0$
  + $"cov"(A X + b) = A Sigma_X A^T$
  + $"cov"(X + Y) = Sigma_X + Sigma_Y + Sigma_(X Y) + Sigma_(X Y)^T$
]

#proposition[交叉协方差矩阵的性质][
  + $Sigma_(X Y) = Sigma_(Y X)^T$
  + $"cov"(A X + a, B Y + b) = A Sigma_(X Y) B^T$
  + $"cov"(X + Y, Z) = "cov"(X, Z) + "cov"(Y, Z)$
  + $X bot Y => Sigma_(X Y) = 0$
  + $X, Y " jointly normal" => (Sigma_(X Y) = 0 <==> X bot Y)$
]

= 大数定律与中心极限定理
== 预备知识
#definition[集中不等式][
  $ Pr(abs(X - mu) >= epsilon) <= phi(epsilon) $
]
#theorem[马尔可夫不等式][

  $X$为非负随机变量，且期望有限，$forall epsilon > 0$
  $ Pr(X >= epsilon) <= EE(X) / epsilon $
]
=== Chebyshev 不等式
#theorem[Chebyshev 不等式][
  $ Pr(abs(X - mu) >= epsilon) <= sigma^2 / epsilon^2 $
]
=== 依概率收敛
#definition[依概率收敛][
  $ lim_(n->infinity) Pr(abs(X_n - X) >= epsilon) = 0 $
  $ X_n ->^Pr X $
]
#definition[几乎处处收敛][
  $ Pr(lim_(n->infinity) X_n = X) = 1 $
  $ X_n ->^("a.s.") X $
]
#definition[$r$阶矩收敛][
  $ lim_(n->infinity) EE(abs(X_n - X)^r) = 0 $
  $ X_n ->^(L^r) X $
]
#definition[依分布收敛][
  $ lim_(n->infinity) F_n (x) = F(x) $
  $ X_n ->^(d) X $
]
#proposition[][
  $ X_n ->^("a.s.") X => X_n ->^Pr X => X_n ->^(d) X $
  $ X_n ->^(L^r) X => X_n ->^Pr X $
]
== 大数定律
#definition[大数定律][
  $ lim_(n->infinity) Pr(abs(1/n sum_(i=1)^n X_i - 1/n sum_(i=1)^n EE(X_i)) < epsilon) = 1 $
]
#theorem[Bernoulli 大数定律][

  对于$n$次Bernoulli 试验，频数$n_A / n$依概率收敛到概率$p$
  $ lim_(n->infinity) Pr(abs(n_A / n - p) < epsilon) = 1 $
]
#theorem[Chebyshev 大数定律][

  $X_1, X_2, dots$两两不相关，方差存在，且有共同的上界，即
  $ rho_(X_i X_j) = 0, i != j; D(X_i) = sigma_i^2 <= c $
  记$EE(X_i) = mu_i$，则该序列服从大数定律
  $ lim_(n->infinity) Pr(abs(1/n sum_(i=1)^n X_i - 1/n sum_(i=1)^n mu_i) < epsilon) = 1 $
]
#theorem[Khintchine 大数定律][

  $X_1, X_2, dots$为独立同分布，且期望存在，$EE(X_k) = mu$，则该序列服从大数定律
  $ lim_(n->infinity) Pr(abs(1/n sum_(i=1)^n X_i - mu) < epsilon) = 1 $
]
== 中心极限定理
#theorem[De Moivre-Laplace 中心极限定理][

  $Y_n tilde B(n, p)$，令
  $ Y_n^star = (Y_n - n p ) / sqrt(n p (1-p)) $
  则$Y_n^star$依分布收敛到标准正态分布
  $ lim_(n->infinity) Pr(Y_n^star <= y) = Phi(y) $
]
#theorem[Lindeberg-Levy 中心极限定理][

  $X_1, X_2, dots$独立同分布，期望和方差都存在，$EE(X_k) = mu, D(X_k) = sigma^2$，令
  $ (sum_(k=1)^n X_k)^star = (sum_(k=1)^n X_k - n mu) / (sqrt(n) sigma) $
  则$(sum_(k=1)^n X_k)^star$依分布收敛到标准正态分布
  $ lim_(n->infinity) Pr((sum_(k=1)^n X_k)^star <= x) = Phi(x) $
]

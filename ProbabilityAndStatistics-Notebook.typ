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
#definition[随机试验][]
#definition[样本空间与随机事件][]
#definition[基本事件 复合事件][]
#definition[必然事件 不可能事件][]
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
#definition[$sigma$域][

  $cal(F)$是事件的集合，记作事件域。如果满足以下条件，$cal(F)$称为$sigma$域
  - $A in cal(F) => A^c in cal(F)$
  - $A_i in cal(F) => union.big_(i=1)^infinity A_i in cal(F)$
  - $emptyset in cal(F)$
]

#definition[概率][

  设$E$是一个随机试验，$Omega$是样本空间，对于$E$的每个事件$A$赋予一个实数$Pr(A)$，若$Pr(dot)$满足以下公理

  + 非负性：$forall A subset Omega, Pr(A) >= 0$
  + 规范性：$Pr(Omega) = 1$
  + 可列可加性：$A_1, A_2, dots$为两两互斥事件，$Pr(union.big_(i=1)^infinity A_i) = sum_(i=1)^infinity Pr(A_i)$
  则称$Pr(A)$为事件$A$的概率
]
=== 频率与概率
#definition[频率][

  如果事件$A$在$n$次重复试验中发生了$m$次，则称比值$m/n$为在$n$次重复试验中事件$A$的概率，记为
  $ f_n (A) = m/n $
]

#proposition[频率的性质][
  + $0 <= f_n (A) <= 1$
  + $f_n (Omega) = 1$
  + 设$A_1, A_2, dots, A_k$为两两互斥事件，则$f_n (union.big_(i=1)^k A_i) = sum_(i=1)^k f_n (A_i)$
]

#definition[统计概率][
  设随机事件$A$在$n$次重复试验中发生了$m$次。若当$n$很大时，频率$f_n (A) = m/n$稳定在某一数值$p$的附近摆动，且随着试验次数$n$的增大，其摆动的幅度越来越小，则称数值$p$为事件$A$的统计概率，记为$Pr(A) = p$

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

  设$A, B$为两事件，$Pr(B)>0$，则事件$B$发生的条件下事件$A$发生的条件概率记为$Pr(A | B)$
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
#definition[独立][

  对任意两事件$A, B$满足$Pr(A B) = Pr(A) Pr(B)$，则称$A$与$B$相互独立]

#proposition[][

  如果四对事件$A, B; A, overline(B); overline(A), B; overline(A), overline(B)$中其中任何一对事件相互独立，则其余三对事件也分别相互独立]

#definition[相互独立][

  三个事件$A, B, C$相互独立是指下面的关系式同时成立
  $ cases(Pr(A B) = Pr(A) Pr(B), Pr(A C) = Pr(A) Pr(C), Pr(B C) = Pr(B) Pr(C)) $
  $ Pr(A B C) = Pr(A) Pr(B) Pr(C) $
]

#definition[两两独立][

  三个事件$A, B, C$两两独立是指下面的关系式成立
  $ cases(Pr(A B) = Pr(A) Pr(B), Pr(A C) = Pr(A) Pr(C), Pr(B C) = Pr(B) Pr(C)) $
]

#definition[相互独立][

  $n$个事件$A_1, A_2, dots, A_n$相互独立是指下面的关系式同时成立
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

  设$A, B, C$为随机事件，且$Pr(C) > 0$，若
  $ Pr(A inter B | C) = Pr(A | C) Pr(B | C) $
  则称$A$与$B$在给定$C$下条件独立，记为
  $ A perp B | C $
]

= 随机变量及其分布
== 随机变量及其分布函数
=== 随机变量的概念
#definition[随机变量][

  设随机试验$E$的样本空间是$Omega$，若$forall omega in Omega$，按一定的法则，存在一个实数$X(omega)$与之对应，则称$Omega$上的实值函数$X(omega)$为随机变量]
=== 随机变量的分布函数
#definition[分布函数][

  设$X$为一随机变量，对于任意实数$x$，称$F(x) = Pr(X <= x)$为$X$的分布函数，也可记作$F_X (x)$]

#proposition[分布函数的性质][
  + 有界性：$0 <= F(x) <= 1, lim_(x->+infinity) F(x) = 1, lim_(x->-infinity) F(x) = 0$
  + 单调性：$forall x_1 < x_2, F(x_1) <= F(x_2)$
  + 右连续性：$forall x, lim_(t->x+) F(t) = F(x)$
]

== 离散型随机变量及其分布律
=== 离散型随机变量概率分布的一般概念
#definition[离散型随机变量][

  若随机变量$X$的可能取值是有限多个或可列无穷多个，称$X$为离散型随机变量]
#definition[分布律][

  设离散型随机变量$X$的所有可能取值为$X = x_i$，不妨设$x_1 < x_2 < dots$，称
  $ Pr(X = x_i) = Pr({omega: X(omega) = x_i}) = p_i $
  为随机变量$X$的分布律，也称作概率密度函数
]
#proposition[分布律的性质][
  + $p_i >= 0$
  + $sum_(i=1)^infinity p_i = 1$
]
#proposition[分布函数与分布律的关系][
  + $F(x) = Pr(X <= x) = sum_(x_i <= x) Pr(X = x_i)$
  + 若$x_1 < x_2 < dots$，$Pr(X = x_i) = Pr(x_(i-1) < X <= x_i) = F(x_i) - F(x_(i-1))$
]
=== 常见的离散型随机变量
#definition[0-1分布][

  若离散型随机变量$X$的分布列为
  $ Pr(X=k) = p^k (1-p)^(1-k), k=0, 1; 0<p<1 $
  则称$X$服从参数为$p$的0-1分布
]
#definition[二项分布][

  在$n$重Bernoulli试验中，设一次试验中事件$A$发生的概率 $Pr(A) = p, 0<p<1$，令$X$表示事件$A$发生的次数，则$X$的分布律为
  $ Pr(X=k) = C_n^k p^k (1-p)^(n-k) $
  称$X$服从参数为$(n, p)$的二项分布，记为$B(n,p)$
]
#proposition[二项分布中最可能成功次数][
  - 当$(n+1)p in Z$时，在$k = (n+1)p$与$k=(n+1)p-1$处的概率取得最大值
  - 当$(n+1)p in.not Z$时，在$k = floor((n+1)p)$处的概率取得最大值
]

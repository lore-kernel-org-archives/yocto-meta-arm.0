Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0462C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 05:47:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23896.1750052833644883855
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 15 Jun 2025 22:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0286D1515;
	Sun, 15 Jun 2025 22:46:52 -0700 (PDT)
Received: from e129527.arm.com (unknown [10.57.48.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88F7A3F673;
	Sun, 15 Jun 2025 22:47:11 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH walnascar 1/2] arm-bsp/documentation: corstone1000: Amend for CORSTONE1000-2025.05
Date: Mon, 16 Jun 2025 06:47:04 +0100
Message-Id: <20250616054705.4041036-2-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616054705.4041036-1-hugues.kambampiana@arm.com>
References: <20250616054705.4041036-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 Jun 2025 05:47:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6551

* Update software component recipe references
* Update Yocto Project release name
* Update Corstone-1000 release name
* Update release note
* Various other improvements

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../documentation/corstone1000/change-log.rst |  66 ++-
 .../images/Corstone1000SecureFlashFVP.png     | Bin 0 -> 44060 bytes
 .../images/Corstone1000SecureFlashMPS3.png    | Bin 0 -> 44733 bytes
 .../corstone1000/images/ExternalFlash.png     | Bin 64795 -> 59864 bytes
 .../corstone1000/images/FIPDiagram.png        | Bin 0 -> 16136 bytes
 .../corstone1000/release-notes.rst            |  18 +-
 .../corstone1000/software-architecture.rst    | 528 ++++++++++--------
 .../documentation/corstone1000/user-guide.rst | 437 ++++++++-------
 8 files changed, 633 insertions(+), 416 deletions(-)
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/Corsto=
ne1000SecureFlashFVP.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/Corsto=
ne1000SecureFlashMPS3.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/FIPDia=
gram.png

diff --git a/meta-arm-bsp/documentation/corstone1000/change-log.rst b/met=
a-arm-bsp/documentation/corstone1000/change-log.rst
index a98de3f9..103b7bae 100644
--- a/meta-arm-bsp/documentation/corstone1000/change-log.rst
+++ b/meta-arm-bsp/documentation/corstone1000/change-log.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022-2024, Arm Limited.
+ # Copyright (c) 2022-2025, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
@@ -10,6 +10,70 @@ Change Log
 This document contains a summary of the new features, changes and
 fixes in each release of Corstone-1000 software stack.
=20
+***************
+Version 2025.05
+***************
+
+Changes
+=3D=3D=3D=3D=3D=3D=3D
+
+- OP-TEE OS: Added support for v4.4
+- Trusted Services: PSA-Crypto structures aligned with TF-M, added proto=
buf interface to crypto-sp
+- Documentation: fixed typos, added host-level authentication section, e=
nabled fly-out sidebar menu
+- Das U-Boot: Reserved memory for RSS communication-pointer access proto=
col
+- Linux Kernel: Upgraded kernel to v6.12, updated Upstream-Status notes =
for remoteproc patches
+- Corstone-1000 image: Implemented IMAGE_ROOTFS_EXTRA_SPACE workaround
+
+Corstone-1000 components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+-------------------+
+| linux-yocto                               | 6.12.30           |
++-------------------------------------------+-------------------+
+| u-boot                                    | 2023.07.02        |
++-------------------------------------------+-------------------+
+| external-system                           | 0.1.0             |
++-------------------------------------------+-------------------+
+| optee-client                              | 4.4.0             |
++-------------------------------------------+-------------------+
+| optee-os                                  | 4.4.0             |
++-------------------------------------------+-------------------+
+| trusted-firmware-a                        | 2.11.0            |
++-------------------------------------------+-------------------+
+| trusted-firmware-m                        | 2.1.1             |
++-------------------------------------------+-------------------+
+| libts                                     | 602be60719        |
++-------------------------------------------+-------------------+
+| ts-newlib                                 | 4.1.0             |
++-------------------------------------------+-------------------+
+| ts-psa-{crypto, iat, its. ps}-api-test    | 74dc6646ff        |
++-------------------------------------------+-------------------+
+| ts-sp-{se-proxy, smm-gateway}             | 602be60719        |
++-------------------------------------------+-------------------+
+
+Yocto distribution components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+----------------+
+| meta-arm                                  | walnascar      |
++-------------------------------------------+----------------+
+| poky                                      | ee0d8d8a61     |
++-------------------------------------------+----------------+
+| meta-openembedded                         | 2169c9afcc     |
++-------------------------------------------+----------------+
+| meta-secure-core                          | 423bc85b05     |
++-------------------------------------------+----------------+
+| busybox                                   | 1.37.0         |
++-------------------------------------------+----------------+
+| musl                                      | 1.2.5          |
++-------------------------------------------+----------------+
+| gcc-arm-none-eabi                         | 13.3.rel1      |
++-------------------------------------------+----------------+
+| gcc-cross-aarch64                         | 14.2.0         |
++-------------------------------------------+----------------+
+| openssl                                   | 3.4.1          |
++-------------------------------------------+----------------+
+
=20
 ***************
 Version 2024.11
diff --git a/meta-arm-bsp/documentation/corstone1000/images/Corstone1000S=
ecureFlashFVP.png b/meta-arm-bsp/documentation/corstone1000/images/Corsto=
ne1000SecureFlashFVP.png
new file mode 100644
index 0000000000000000000000000000000000000000..c7e8467a6d97ec21ad8792957=
148d7da659f4654
GIT binary patch
literal 44060
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
a
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
D
z^1sBiL>eB#L|b?Ak=3DjSo)*MFHSh&B>MG8|aq4%9!AxBc(S<pkk02$2wsd02Zw6tg!
zb1HHh5^&)6&^aKP5v#?mYl)*}(z^Se3~An)Ym+jypc9VP(z$SJw#WSlT(i2#)#7Dt
zgT?QyaQOp^Bazdi8M2$4<$m86@6pQ*W(+~gcCDn(PT&epj&>8{MlHb;$p7B-ty2g&
zZP*QFpTyk8RQ$#1cI5-<{oh4ucn~+p<PxyH&k9=3DRU<@>zchI*f=3D4W~sJ9XYgzPCQ)
zt>54bc=3DW}f*As4Qyk1`;yuB%$XIbfn7{Ij;2jVK^{$As>z$DeL@R*PKcL{1YPTNl9
zmc!(ScOaimvc3CG%z0D8C?!98M4{>YA6V@ejg7cxa~TKW_wno6CdtU{Tse#$!$cr<
z-Dd=3D=3Ds@(EbS&H8D5#ZfuyQJL0Wj$Ws=3DV!uYf=3DxgX9elOa@8`3Tb*-%u?ah1$wZI;=
-
z6VAinW0ITJ-mnZf7C*6nFR;XidBRb1cs--958*u{y&(1bwgHo#t@4O_OH*^3RwP7B
z*HH1-gG_sSb&RauoSEP4IH>Nivt2*DAF%PJX*Hc>xWp>pcSJAjlWvZ?Q)?Q&sTI5P
zimLY@VL(9IWSE5%ynK&k_Z|WgkJXWUQUsx_#i>KPXZZunN&EJcio(vje@m*KfMbE2
z^g`U<X;qE~x0baQt&XtJkH=3D#NZaug<(=3D#h#iXzH7ztg-!st#-=3D)rCf5Z@e4bdUKp}
zkqY*FLLxtQJ^A=3DPZViq5UA5V!k-~T@SE-cfxo}hip&!qt-q}8rO1|$F>LaoS_m7lf
zQa%fq`@l)9kmijXaR?F-K+$RmTLT<Y-iR46zeThbvI?IS9G2X<dsLL~?n6aCC|Ra+
zK;_2ws|#cD5+1leW9U2N=3DQocZx-4J7W|&C)HCYph0xdfq@9)V^nCOP0mnPkRf=3DjNU
z<PS!7u22Z4{t7&=3D77|@*p&dvnIj>Xl74jJl8tL;e&z<_z6%XB;h$F}CguijM@i9HT
zJ>(4Gi&1YCsZ?a?$Bp^iNAA%vTGo5wMXD?*=3D!g8O+9woLnL{SU+gk?|<5m`uGg~#C
zM*0H<IzM=3Dw%+8tmd0)o|dt5%>(A<bnbGvGDI(tnU%u^C_gTs;OKj$3;|KuH05&F|x
zMMa8WqC0l<^Hr@;tN}vQKT_8}hThj|x}1>C`^#Kn+mqiXqGIO<t%lLv8uw%;hutA5
zwY)D2+Bdx;O4-4fWZRVm(9wCu3t{JE33F6wyS`--J4Zj^?vvJ{05LHIhg0ms2Xod0
ztEi_a(b5IASky+IbG9>JafwxHh#}YT@fCQnyL350R!nnyjoa`%vs`{#XY^zH?@$dw
zuN`@f?%iBqGPbI)jCjaF-*>R8-TMjFzs<oPZTaACYi=3DfNHA5u!Do0!YyYHpdha-6=3D
z6kY_Y^W_njrggZ#5ulFb;;ofL3D*4v#P_d>BsnfxP{KfkW~zGLEMA#A1gIug8yG$I
zAw;C)4-PvVNwO}wL$ly~v&kHf?}sSW=3D;$oll|I^*3WdYn9d=3D4XQT(Ombq^jAtL+P3
zgzJXK;d@OE;2#Xf4NneYR8&j19b{r3H*I~ZH`A^S2F%cX#SD{B;W7)x+g^m0434x*
z3thi!G-ziki`zZUv-#6G*x4nnaX2kBv$SLgyK|*5eZ>3Z9m(y|GgSc%m-Tw>C?_%V
z2RHmY8z~93){MM|lU0uAvGy9uEx9X%vl{kLh0D??hgR{ge+=3D^FAS8h@^Gk8@6nm7Y
z?Gok^6qo3S_$24MUk`?Em0wzd6(~I>!`^dS?5`7tK0f#F2fSYBjYl-~{Jd)AdtELR
zkCsiNV`6^%M@C@a^iM`W4*7OCYh?Sb50Zq$?Iyd04)L^px^g17+ofxB;g_Tl2QHmR
zFkfX4kH+=3D#|AP6Asi=3DJhl^Fk$RaAc1tBo3LDWgp(&3|CTvyW&>V6=3Du=3DOJ_B(u#iT=
i
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
O
z9P!rHRX)d__!$o8-cna!zrDhXGd?+1$}t^v1?KbG#=3DiQ8X2!K~I3Fn#G*PJ>aSW|=3D
zn-n@7DfIeuTa4Fo_hoDWSZSK)mqMVvun8eXX*-8N|BRFRo@4CS+<pDc1*FxzUGf`#
zjq5WmyrqNLcu!pA6NsYO%_X^Az%h3{<<|cu8*ujO7wZ{+3k(HI2{Q)gb$N;!%Z*@%
zRi?7I>y@oL^P3YYI<w^~3T@3^{FI!t3sxlCS%q)ru1=3D71{UR?m%~wrR&!_w3QfnYU
z)5&f3v-=3Dv}O-T{O>&dRJ5P~JTcdENSbbJ|0)VtyO@QYPnDurAB{Rrmnd8eJNt=3D;J{
z-a_)dH4&M4$7rpl?m%~~iic@p?D`|y0hHw2>&&MkmCcvQl^K}{QEr5VwN!q7g*HKE
z3vkuJYuCSi=3DRbsjQq7hrsz{}P2>FV^UbYK5zeI|h?<BYxlbGAg;W0u>b(z;Ur19DN
zTH!4pABH=3DOeMRo)ztn8s-$#YJY_Fe;zU#KKpRIC(39xYE9(A<UPIbnoDVve`=3D-%P1
z5K!vHsDtkmC=3D)0kvF|W3pE`L%%Ubxh>F#0051TZ#;tW*tzP!6yezXjx5ND#dRl$Eo
z;kzmMRR@9uef>0BkHRb-vc2{CW4GhEF{5(6amxOu`7=3DjJPn<p}#8ts5JNL6+zg`Ns
zgum}iX40tGHEeHUykiZn>BQBQ?eOu#U4zF~SA0U5XOJ7VtX5a9M0-E>jLKvtJ&&_9
zE`Hy44bE1rXB(`7739m)pI!8tkMFQ&6O36LCQs1Q%Tv!*yvpKb+}bW|)Rl|+N@eVl
zl#~JiUbOtg#NnXbUGDJ8*d^~qy;d%r`SiZjfTi~nE{CKOPFr_o_+7g7Whj17^t%<|
z-_~VZJbOkcS~XE?$!||2*7Z}imNns+-(qHdxvl1o$LuoY{UL(?03FO8*&cOJL<$di
zel8SWRV^EKY}6}Bp+@R0e85~=3D{_RJo?S|S#D_e|6MNJ6aTU%+Lm^^LaaV6t|v%hMs
zSlyL%Eq|JWySesmIm0EaUth&lxu*kGpvCUZRz?`rRYB3cHl^*)tq>75&FqP-SJu8P
zahQBpx--YWK}=3D2A{{A<;Uy_W=3DMa<(EFdDxz>-%<Brd4YdiI{Fia=3D#Rr<=3DgE+bza`=
w
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
^#e
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
HK0f(7GJJtT

literal 0
HcmV?d00001

diff --git a/meta-arm-bsp/documentation/corstone1000/images/Corstone1000S=
ecureFlashMPS3.png b/meta-arm-bsp/documentation/corstone1000/images/Corst=
one1000SecureFlashMPS3.png
new file mode 100644
index 0000000000000000000000000000000000000000..b993bbeda573885d651102064=
121ed7643c7e0e1
GIT binary patch
literal 44733
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
=3D
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
O
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
#
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
U
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
*
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
Hyxo5Q!FgBl

literal 0
HcmV?d00001

diff --git a/meta-arm-bsp/documentation/corstone1000/images/ExternalFlash=
.png b/meta-arm-bsp/documentation/corstone1000/images/ExternalFlash.png
index 46519df9c08110d9e37cd32754cd2e4e8976677e..2be201785d97a163d79de0842=
b48990428fd04a7 100644
GIT binary patch
literal 59864
zcmdSB2Ut^E*DflE3R0vhN^b&64JAQ32?-q%dJzbr69S=3DEL6qJ>>4Fpm6)6e`f`asp
zC?ZIcj)KxV$XUVi@3Z&!fB$!$=3DicX@i_5TBWzI3j9AnH;-kC@pEd=3DG+OJ`4<I6<kZ
z0z;iRK>|K;f~b`AG;l>*LCzfbMdXe`D4i(jW&U#F1R0BmvXO_gkF5jN<^+!z^ye85
zNW|X7-GfIA#sdPOU0sE&9nf}eXlHjJoQ(%?3Am58v%&p(K-0y~0gFZRfZ!5BBET&^
zBT-QvF(u$k!vW{%1N`=3DZNLomW^8;s!uC7=3DcLmMk~2cR9egcw*zOp@@5x{98r1`h}d
zoMRoFY=3DB<~8;p|+;T5R8n~O7W1uiNkDI`Mp2VB%e+oIhZ{?Y`2CU*=3DPYx9$6(VtXW
zxwu)|xc$5YyheD)%f`*!!3Fp88VC%uCqcL&rVNb!*D!&naA=3D^*<KgQ7BNhDBoP+hx
zYcOx9p0Tl=3Dx|EbP4y26GP!d%JhDm4yY~X5TE$JeT&=3DC=3DJ^VElc6b+QETmU)^TtFb4
zwwIwM&d3ODW8<u@tcG;8bFfv$d+E5Ti6az|D(ZM^cRe3%6%hwpZ4^|>11tgYG}2Yn
z5(5ZSva^Eu7<wCf>e{=3DYRq<de7ez0azNjADK-(S$vNCa1va-^G>%ibT?w)>Nq^P3~
zFjly}0b18k0^pqzz$zs*U6j2VT+vq9$ONsaXRizQ)zx%DXc|ixN*Masz|~MzMi@m`
zWjh~7C2zEYl!=3D#@6Bdj2FhXI`U@17z98TBJ1MQ6m&NSUICa%sBswNUjTB0rndg?GE
zMYsqCrHj(?v$nQ|!(iT;SU+8imx!&cCcr#6OkEoZhU+MLxG7s{11%`|`C)-iM_;76
zn;&qZ>>#Ou5pjZB`6;<*V!?hYz&nOu4K-Cw7)ld|MBzmYT<tU^@Dlc#B1TS76<Y&Q
zln5T{f$}s~vNh0h74g!BxhT2AmG!~ub}l%)r@gov++Gvoh1P(=3DeO<JSwKOHQomGKW
zZM1A{l%XarMtU$GTMv*OT2)+C%tO%~xCQk<dO+Q!G%zTvt20K#O#|&Dg0j-m(DHQm
zhC5k7G<=3Db0kRe(N423)S8jHKQ*x2EvbT!=3DY?vB17F%1z7LlLMRR8v(_#md0R&DapD
z=3DB^3SM1hRFy;YP%O+?Y&Mur%mA3rTk8<eVzJ6c&p6ZlivP0a&kC8q1^t}3dh1jqRL
zxp;UuSy_W%cx@|;r?(Ok?QLg5&=3D+5nucyAf7uwTH($+;%M9o+cg0j;UcXEQefRQ%3
z5FbZfdzhmqP85fcQc;EaYDg(#F<5J?o4c+HR7}c8(bG>6qG14c7S%@Magtb=3DpC{0&
zk)ocjConI-G+6uT;k@-EJnVfWq^#AEgg$MNzz4z^B`RWQ3#brW)Y02P4Fz{oHdZtw
z$e1QXSwzdw&{fk&-4FqYpqI6xnz)jO7QzUo?V>1-gXpR&;o*1(O({iPWe+c)NhMz`
zKTl;_WpRj_IMzeg6Y7G(OX=3DD9=3D=3D&HW(P)g5fts%mVg5ZmT=3DeZVl|hc`C<Ap}M@eT=
t
z7k#9rzK(~OsssY%MbIjox`dsk8`xdKP}~FWYiB3vCW2KrR)&B*oV+l0U=3DOsBy1FYE
zZ|vp@bZhKn4R?YX*<w`fAy{W0cRbEZM9&p!1cHiN`)a6RbY0*OZA~kJsZnx-`as=3DW
zL`)2UKTsYvN=3D|wXcn^1XH&+#eq_dQ+kBYaBHP9sR12R$*w*&OnRUe@$30K2PSnH@F
z)V;yliay#1Yb`aHwmlB%gR}P(QPdVisDPn(MO!;0p<Or}U>wL#T-;O22rB7`g{vYI
zf$`&%l@T^>Cd#^co-jBRs-=3Dw;M_a3TgMl~PRF$Qm_9%p-0a6=3Dcj6tf3Yl|8?0d#m9
zxw^x!dWJ6IB065GdXB)eTJ}gcHQ+Z=3D4Tn^NAt8=3DR5@0Wkmz}pBU~u6!2EYeK&rlJV
z9<+{xn+EW_lc$}xov4nK9azQJN*QJBt*C``vqp;<yXz7J0jjQyGQf$7DSGOAs~ZBw
z0dE4>cqI+IE^yOL)!oaPKnT`VMO0GVO&kJ|!0TZ_AbSY}$j?E-N!-v`RmIEN8tmn%
z>a45`LD}eH9HoFaV5%A>Vh{%>q>+sl603zU201FK5foL!*4M@gp=3Dl@uhN|nR>nTI=3D
zR^kqLl#7A5l%u{k*w4ws1Foy4Zvr>emb7*?bVaM`Bh(QND1@s7fn1<z!hd&NILJfA
zz|}|6Q^(6d&z4{eU0|ZR&ej+m!l{m%uOjfYjk~Isp@^i1j<N&>ut#uT9c!$<6kJ=3D%
z#MxF7?*X^9QA2~#wtluK32QL|brN6^7f-k-ND>b9QgH!UiF&I@d8r#1gOu(3Jbd7)
z`dASI6E!7qFJri)uB#4Q%GXfRR?S*h%)s7HA1&d6b<|PBD7j!Ye7)3wvHN)Gp%k@M
zZ9R2tofP4EYEoKG2*B*aT_wekULxXFx?Y+Z;^HubsHCpDl$eH-pPjXeCdLn^X74C2
zA^|L$O4?XmeFrTUum;>sOa*0+fp|;#iHRAQXiBMKQ7Tw{HA7b&D<3aicNMIy6bg93
z8wWxeTDjs~#64Z?ynqWRV^JMV9}T>=3DDA>+cUB}7~m>#$x+)3LB;sx+X$w<e|Tf);<
z*Gd%&Q!$hRRy<(Zog|RPcvqwpMqkp{04afj!QAx;V&{y|RMPT5=3DxJFIOdJRU1~~!z
zhC^Mkk{VV{aBp30bx|7=3DxDHy~R##U=3DP21UCQpH^YtEC5YBn7M|crjHCXFWq#dwp@V
z7H~})co}YF=3Di;eiWDopF=3DmF%b<zp*hB#w2rQGw_KBY*>|yO_9@EpT7VSWHm_Fjq<v
z;%FUrjJUC*9dKU+hVTQ6SR1+f=3D_rb5d3f2nA#EVGz`_sQ`@QxbI|78}k9{IwN$-Ov
zteiN(enJ(dsOMw8bnlc0Q|<c}7f~CWZmXfKT6%i=3DMU<_It}XC$!^YNDBb~!0z~(@X
zzw&6(XUtPz#BhFN!}IBfxEuN1>*FzSjy%uw2{w)!=3DT0z@C7k#d#}NBXYNgSlsU%y4
z*(?X=3Dw*eU%#M}!1I6k+NT+%c>6U7u)M-1_%WheUkQHCd`2V+NXisz811pobDzIUR9
z5@A7<CI7D|fZUXyY8@rgH+#2f*F(v)eYuDCAI-B9o#Afiraa?ut?*ybw*?DMXWE+4
z><#^U*8nlh2`9wB%x}MBf&NwRbVO1A?#-5e*XLB2tZ%YA$G@gFB#&yrLo5AX5VRBt
z5VX{hnMM9D2!gN^+2SDg-%Hv2oy7pt%Xo>qN6UC!+=3DTws90il`{ku2m|6QL^On;~)
z=3D2}^wKc}b3a8*Tx1)+`Tf9x5uWOtRNm*rD5QS6hviBbJ_^Xh_n+swwx*L!6cUt2M0
zT<kNGOx0$FFTb4a$9(0S5xm|%iY~K+Su9<DK}`388NM;pyR)@PKB&PKKP@deHJpFO
zRqGCkubMt=3DbMPL`<>KU3sgS1n=3De*Nz=3DPG^Nj)bh*v~OoAtLJ*1@rHz+6W;f=3D`{2+=
`
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
DgWrb2

literal 64795
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
H
z;MT9b@X-BOI*x=3D(>TS}R9n18gP(ryuCh4+0@0MsdetK20LaOHow8f7r@3217TG$HK
zdXvv>^;)NHqtGT<diTffcOxQqY9pqHJjIBvl^dN`mca`RrVi6?$RdR8Y_Y9pt6&Jn
zn!nAg9w;zeV6Adq;lg~rje5le)engwZGUH3;A%LYPm%xD*xRmJbaID#U+Fb3^b9zN
z`$$AY$K!cry=3Dg3)i_i4$hA#C(KXY5+6AkWPc`V?j*!ih&BXJ-Gk-%G}VRmRFS9k79
zA28vap3MvV7lcxm4si+|e=3D5UjwBUP^TBewrB;Xg^ghq!!r=3DXUGG~gAQof%6^cFUvI
z2E!0_QEco+$+Aqy5rbQ;)jWxF?+p~aox=3DJovC2hN4tsi&;w7(^_I{VlPn*y+=3DB^@w
z77in?p01{N%qkl%Kc|mbE|7yzn}z+3>3ap}>S)Q+ODza5oIk7Lo!C=3D<fb#a-y2Hn&
z>|U^ESjMB6p_)yUn^EolmqIntWT$Gf3fL~%HHA&AF}ttnGz1W$#mZh+Of9+hCWc0-
z;KCPbNFcM$n^ct?*6o8;#BQ?@tY(jQ0Rt*bdMo9m0f{uUVlRg?$?T_4mxM=3DN;V6kL
z4QwN?=3DnZ?D)MkjRiD;*9lajOI(gX=3Dbn~V-6a$OrqM<g12<;5eOOQQRg23=3DwJxjthR
zY!kcW=3D6XXJGUn}u&O+oj5qV}fcGvj%<q`7woZl&q-<HYBPOl<s5%f3=3DNgLqQo(l4v
zX0eY@XEa9|w&PhP(~Y8`QGI%IxW*}m?Byz%_F|`&(!jxup{%P-a~_)7uVcuy>|`-g
zQN-3&_FSROg<8<2!kxImY(l@B&wlJ`hqz-o10{mFDLjFDTpn*4%$utAtHd`V1MnFx
zM5fDxr;qys<j&LN6JK~q`!Emi<hcuwY~4OmNXtd0zV){bohP1x1cnaCInhCzawOof
zJdNS~M%xvhVXI%ppPO3}@<k2J=3D+x`4c{K5ojHJm@z-Mb|_^IB`zR?H0he3mqPOe*=3D
z312%#p?LEV<^;@DckkQbb3u^h(ysScT_7LeEMDj=3D#&z5jYTV{C?EE;*VqUPYwfBjk
z>9cHmw@q(|)1}d|<ir~ZYWYGOUzwJ4iU>NN3xq8VdPm0+W$?cU3tLXe@fYEPj?8DZ
zqV=3DSxrJ2R?;z-sW-A49ETPU<sjX@_66<K*kWNv1@m9r+o{HZ1KGIW+xG;LVeZDGXF
zgRc?L)v^5uw;KgLa?l%T?fH`KyB|h84xVZ{Hw49=3Dd!w>=3DD*&C;43aSCF!MswN<ue_
zg<vxq7rTXeap-o}KHdlWkFFc5x_t<b0iAKnCLNDHXhI`io_;SwkH>}0#h9$}`le1$
zx8^K+wFhp%vgZEU5)v^>r19eyq{l|Ya}N^`<&hd_D`-SUvytMOMd%@BFXs7-D{J<j
zL(<7^WYKtY>Ayoa>3Bi<*%hnmj&n&<7!FGQboUjXE5ySNIgWW+X|kJ9Gzw{O2~J^!
zfxH+WFhx0oNOv2aD=3DjpZc61Q)dkU1aK5g}>c&G6y_3`Dap?E&gkHmErBeazKbP4Md
zt0g4ax2`YDl|TcF_1QUX`71oPoL?sMV66FV-0q1<makEu6A8TfrpYa&lxu+tK7Ed}
z#LZIV&4Fnp{r#A)N{3Kc3pMscDNRa9qOVg9YIQdRZX_sR$SagD$}>8nN@Obf)&bK%
z8Iq>4cy-c9W-Myx-sL+Zc?mbgpw1~C`&sI%^NFJy3+|DK>LU474_7oD^3+3+htzet
z`}rUGsL-FqR^P&%WuZFs8-*83ZPrk0J|Yvd6iP|!Ygyc{_TGf9l8FR7jH?>w{z55f
zvDeR4PX|eYdgN+}BFJ>iK+L?$x<1FhQ_0P0AIxizX`D)K>QIi5q-}CAd;NT;%X)7X
zr|NJjU7d=3D4Aqv`Pi>f8oR=3Dy&Gti;B2UOz7<;N}QIUcB=3D=3D{^wf@FEuYnJX7+~_~iX=
o
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
b
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
F
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
?
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
F{{ai-t4II<

diff --git a/meta-arm-bsp/documentation/corstone1000/images/FIPDiagram.pn=
g b/meta-arm-bsp/documentation/corstone1000/images/FIPDiagram.png
new file mode 100644
index 0000000000000000000000000000000000000000..bfe7315ee3c1669ac2d33326c=
f87f970cec8c51c
GIT binary patch
literal 16136
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
E
zN{WWl(+5)bR^ObtS5T|QlCMmA(>Z$U^%*D>_^AVJ?mMUO54Qg3&NFFG6yinQCGlOa
z64p48R1;A|WY-Uk4j&pRRu?qaR*J}1AB^dwnKI9$7JY3SU3=3D;2sV^$DXHLE{YcZ^X
zSR;eUqh#JdmlVVCxZ-Fur>{*QE{r!H3VNUO>U>_CRY~B+hB^3h&l-nRde+?&KX&=3Dn
z!Ax+U)=3DVx({&?|@dB5OCq9ry=3D!27&G<NgmFUr<Na7<%>JG^7YhH6>;#r^&Kf>om-P
zqo*?!_;;W1-DC{gY}?#O;;=3DroZVr4vj8k1Hm6lH5U*hIIRG>pXY{e_Fxa#b1yr8_h
z(s$iG%usxN%r4jUnJUKv7mAu7<0@67uK^v;49Wx*$c0{eVRVdoORc`_W3uemmQ|ke
zk7*x#7eA0DnUsFKx|T9fy%(d?ms#^$y+96bs;|Azt2tY(718yN+8TLxd|d1zVAaFd
z2N^`cF0}*2ORea7({pZEEL+OS<D)x|+L9pAb3NgegxronLAS8V<!2Xt_4-=3DpEi8g(
zYj{Kqs0ZJ5kd491z5R8bCa`WxkLmkG0{g9ThTW~Ju$?y+{SgiJ4!h(WvU|1X$3G~m
z%WVQ0F1)f)PK#qf>T7(%w1qDOopIxO;@*`AEwUTdzKkW9pZj_A!j*aag+dYnixoyL
zW!B-IPhlUd^w;B6Q1YSWj^{<FX7>qrIX-*mC^2BnN)A$L!|p8Cw}`MC(wL{5%D%n9
z#rUIjuYiQx^2tb%*1IRpNl&FhNLDLp_*GtM|D?=3DRNTQS`@brP*F?%%?(sIk7{JQg#
z>l5_d2@Hf4l(nx{`qTY&MHKgbOA$#r1Q`>5u%81tpwwl4Z@qZ(>CxdKiXs<{X3oty
z55W;4FVYFRRC*NgyRcw0<Hqj5e58JemW(RpNTw!hGI0hYyF_*&zx{HKZakNB2*|1l
z7t!)!s}7ACIM^BwGdinzwYTIGK+G<jI9!k`=3DURl4@2^pHsy*90Ss6i+WX4r0WYOgN
z$2MWac^gX@JiA)K@w}eoBep{6E(q9{nxcg*w86J-2<@+)8mf=3DWUzPVCqzIyZf}`1<
zc$K@5wkn)_tDo_{ILiq+_+sSQS8V0|{+a4?wJbXi?;H45vC2Z&Qsb7^cab;|f|9Zx
z(<Q#14Kv>EuhpT;Mxzy>T6=3DqqN^Sm{B1k)hYCFp5(_7-6`kLC6_1&AB)i<XF-;QJI
zAfu;c&XtDA2j)B2LofVX^p;ib{B06kfoD3EcQ4hgzsW$BzsK=3DgFcT3C2)kDh^U_al
zysykevG$_Tf4?0MK7hMxk>RH?=3D~ursMjlem{Mcw@?$yKI=3D$lTlUcMpPWd$ZU`JO@5
z__{z}a3AXB%q~U1l5HJwD^U8P^}JH9x|__9&nmr>^r`sF13I~fX^^-xE?7s{s`Hca
zg97dPr<siP@PZyo1NZigb9RvoIOg`sggJ?9Y*C?C)LBlq{+k7=3DY>kVVsy*h<HYzw<
z^{INpqQbjl6#=3DWun;Q^dPc1{A?wuK)YD*dxM{gDrO}_|R%XAMf8mHGiI=3DAK_^X3!T
z+rxb%)Nr%)4RCPjy}gu(CQhumB1PNE^E)(PY}6I&{twT`O5KE_>UJmv_Q(r~e0{mG
zHc2DRJ*;G6E$V)9+NJO<Qd7m4m-tQ!DKs(1`unVgRSfdgIMKFApIDj(4%QE!_?#e`
zr(k5m7XCj`195EeVF}TOdr_6xAu{~L@=3DtLrLYUxXg{EO<;u2E~n?&$q`Lm^5MxnyS
z*t1N=3DvxQQhcpk53j!Vy9v(@?M&eOwRb=3D_3&Pdm8+=3DGCu|Cb)Q66y#fa_M=3D5flR*e=
;
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
L
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
ki|
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
VUuE8G07~1hKqM6;ip5^N{Xe=3D6D*gZf

literal 0
HcmV?d00001

diff --git a/meta-arm-bsp/documentation/corstone1000/release-notes.rst b/=
meta-arm-bsp/documentation/corstone1000/release-notes.rst
index d026cdf6..ed7e4c59 100644
--- a/meta-arm-bsp/documentation/corstone1000/release-notes.rst
+++ b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022-2024, Arm Limited.
+ # Copyright (c) 2022-2025, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
@@ -19,6 +19,22 @@ intended for safety-critical applications. Should Your=
 Software or Your Hardware
 prove defective, you assume the entire cost of all necessary servicing, =
repair
 or correction.
=20
+***********************
+Release notes - 2025.05
+***********************
+
+Known Issues or Limitations
+---------------------------
+
+ - Crypto isolation is not supported in the Secure world of Corstone-100=
0. Additionally, clients in
+   the Normal world are not isolated from one another.Therefore, if an e=
nd user wants to add a new
+   Secure Partition (SP) (such as a software TPM) that accesses the Cryp=
to service via the SE-Proxy,
+   they are responsible for implementing their own isolation mechanisms =
to ensure proper security boundaries.
+ - DSTREAM debug probe may experience unreliable USB connectivity when u=
sed with Arm DS for secure debug.
+   This issue is under active investigation, and we are working to ident=
ify and resolve compatibility issues in a future update.
+   As a more stable alternative, the ULINKpro debug probe is recommended=
 for use with Corstone-1000 in secure debug scenarios.
+
+
 ***********************
 Release notes - 2024.11
 ***********************
diff --git a/meta-arm-bsp/documentation/corstone1000/software-architectur=
e.rst b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
index 3edd2280..a2370f60 100644
--- a/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
+++ b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
@@ -16,180 +16,266 @@ Arm Corstone-1000 is a reference solution for IoT d=
evices. It is part of
 Total Solution for IoT which consists of hardware and software reference
 implementation.
=20
-Corstone-1000 software plus hardware reference solution is PSA Level-2 r=
eady
-certified (`PSA L2 Ready`_) as well as System Ready IR certified(`SRIR c=
ert`_).
-More information on the Corstone-1000 subsystem product and design can b=
e
-found at:
-`Arm Corstone-1000 Software`_ and `Arm Corstone-1000 Technical Overview`=
_.
+The combination of Corstone-1000 software and hardware reference solutio=
n is `PSA Level-2 ready
+certified <psa_l2-ready_>`__ as well as `Arm SystemReady Devicetree cert=
ified <systemready-ir-certification_>`__.
=20
-This readme explicitly focuses on the software part of the solution and
+More information on the Corstone-1000 subsystems product and design can =
be
+found on `Arm Developer <arm-developer-cs1000-website_>`__.
+
+This document explicitly focuses on the software part of the solution an=
d
 provides internal details on the software components. The reference
 software package of the platform can be retrieved following instructions
-present in the user-guide document.
+present in the user guide document.
=20
 ***************
 Design Overview
 ***************
=20
 The software architecture of Corstone-1000 platform is a reference
-implementation of Platform Security Architecture (`PSA`_) which provides
+implementation of `Platform Security Architecture <psa-certified-website=
_>`__ which provides
 framework to build secure IoT devices.
=20
-The base system architecture of the platform is created from three
-different types of systems: Secure Enclave, Host and External System.
-Each subsystem provides different functionality to overall SoC.
+The base system architecture of the platform is created from three diffe=
rent types of subsystems:
+
+    - Secure Enclave
+    - Host System
+    - External System
+
+Each subsystem provides different functionality to the overall system on=
 a chip (SoC).
=20
=20
 .. image:: images/CorstoneSubsystems.png
    :width: 720
    :alt: CorstoneSubsystems
=20
+Secure Enclave
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The Secure Enclave boots first on system power on, it provides `PSA Root=
 of Trust (RoT) <psa-certified-website_>`__ and
+cryptographic functions. It is based on a Cortex-M0+ processor, CC312 Cr=
yptographic Accelerator and
+peripherals such as watchdog and secure flash.
+
+.. image:: images/Corstone1000SecureFlashMPS3.png
+   :width: 400
+   :alt: Corstone1000SecureFlashMPS3
+
+.. image:: images/Corstone1000SecureFlashFVP.png
+   :width: 400
+   :alt: Corstone1000SecureFlashFVP
=20
-The Secure Enclave System, provides PSA Root of Trust (RoT) and
-cryptographic functions. It is based on a Cortex-M0+ processor,
-CC312 Cryptographic Accelerator and peripherals, such as watchdog and
-secure flash. Software running on the Secure Enclave is isolated via
-hardware for enhanced security. Communication with the Secure Encalve
-is achieved using Message Handling Units (MHUs) and shared memory.
-On system power on, the Secure Enclave boots first. Its software
-comprises of a  ROM code (TF-M BL1), MCUboot BL2, and
-TrustedFirmware-M(`TF-M`_) as runtime software. The software design on
-Secure Enclave follows Firmware Framework for M class
-processor (`FF-M`_) specification.
+Software running on the Secure Enclave is isolated via hardware for enha=
nced security.
+Communication with the Secure Enclave is achieved using `Message Handlin=
g Units (MHUs) <arm-developer-mhu-website_>`__
+and shared memory.
+
+Its software components comprises:
+
+    - `Trusted Firmware-M (TF-M) BL1 <trusted-firmware-m-bl1-website_>`_=
_
+    - `MCUboot <mcuboot-website_>`__
+    - `TrustedFirmware-M <trusted-firmware-m-website_>`__=20
+
+The software design on the Secure Enclave follows `Arm Firmware Framewor=
k for M-Profile
+processor <arm-fmw-framework-m-profile-pdf_>`__ (FF-M) specification.
+
+Host System
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 The Host System is based on ARM Cortex-A35 processor with standardized
-peripherals to allow for the booting of a Linux OS. The Cortex-A35 has
-the TrustZone technology that allows secure and non-secure security
-states in the processor. The software design in the Host System follows
-Firmware Framework for A class processor (`FF-A`_) specification.
-The boot process follows Trusted Boot Base Requirement (`TBBR`_).
-The Host Subsystem is taken out of reset by the Secure Enclave system
-during its final stages of the initialization. The Host subsystem runs
-FF-A Secure Partitions(based on `Trusted Services`_) and OPTEE-OS
-(`OPTEE-OS`_) in the secure world, and U-Boot(`U-Boot repo`_) and
-linux (`linux repo`_) in the non-secure world. The communication between
-non-secure and the secure world is performed via FF-A messages.
-
-An external system is intended to implement use-case specific functional=
ity.
-The system is based on Cortex-M3 and run RTX RTOS. Communication between=
 the
-external system and Host (Cortex-A35) can be performed using MHU as tran=
sport
-mechanism. The current software release supports switching on and off th=
e
-external system. Support for OpenAMP-based communication is under
-development.
-
-Overall, the Corstone-1000 architecture is designed to cover a range
-of Power, Performance, and Area (PPA) applications, and enable extension
-for use-case specific applications, for example, sensors, cloud
-connectivity, and edge computing.
+peripherals to allow booting a Linux-based operating system (OS). The Co=
rtex-A35 has
+the `TrustZone <arm-trustzone-for-cortex-a-website_>`__ technology that =
allows Secure and Non-secure security
+states in the processor.=20
+
+The boot process follows `Trusted Boot Base Requirements Client <trusted=
-board-boot-requirements-client-pdf_>`__.
+The Host System is taken out of reset by the Secure Enclave system durin=
g its final stages of the
+initialization.
+
+In the Secure world, the Host System runs:
+
+    - FF-A Secure Partitions (based on `Trusted Services <trusted-servic=
es-website_>`__)
+    - `OP-TEE OS <op-tee-os-repository_>`__
+
+In the Non-secure World, the Host System runs:
+
+    - `U-Boot <das-u-boot-repository_>`__
+    - `Linux kernel <linux-repository_>`__
+
+The software design in the Host System follows `Arm Firmware Framework f=
or Arm A-profile=20
+<arm-fmw-framework-a-profile-pdf_>`__ (FF-A) specification.
+The communication between Non-secure and the Secure world is performed v=
ia FF-A messages.
+
+External System
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The External System is intended to implement use-case specific functiona=
lity.
+
+The system is based on Cortex-M3 and runs `Keil RTX5 <keil-rtx5-website_=
>`__.=20
+
+Communication between the external system and Host (Cortex-A35) can be p=
erformed using MHU as transport
+mechanism. The current software release supports switching the External =
System ON and OFF.
+
+The Corstone-1000 architecture is designed to cover a range of
+`Power, Performance, and Area (PPA) <ppa-website_>`__ applications, and =
enable extension
+for use-case specific applications, for example, sensors, cloud connecti=
vity, and edge computing.
=20
 *****************
 Secure Boot Chain
 *****************
=20
 For the security of a device, it is essential that only authorized
-software should run on the device. The Corstone-1000 boot uses a
-Secure Boot Chain process where an already authenticated image verifies
-and loads the following software in the chain. For the boot chain
-process to work, the start of the chain should be trusted, forming the
+software should run on the device.
+
+The Corstone-1000 boot uses a `Secure boot <arm-developer-secureboot-web=
site_>`__ chain process
+where an already authenticated image verifies and loads the following so=
ftware in the chain.
+
+For the boot chain process to work, the start of the chain should be tru=
sted, forming the
 Root of Trust (RoT) of the device. The RoT of the device is immutable in
-nature and encoded into the device by the device owner before it
-is deployed into the field. In Corstone-1000, the content of the ROM
-and CC312 OTP (One Time Programmable) memory forms the RoT.
+nature and encoded into the device by the device manufacturer before it
+is deployed into the field.=20
+In Corstone-1000, the content of the ROM and CC312 One Time Programmable=
 (OTP) memory forms the RoT.
=20
-Verification of an image can happen either by comparing the computed and
-stored hashes, or by checking the signature of the image if the image
-is signed.
+Verification of an image can happen either by comparing the computed and=
 stored hashes, or by
+checking the signature of the image if the image is signed.
=20
 .. image:: images/SecureBootChain.png
    :width: 870
    :alt: SecureBootChain
=20
-It is a lengthy chain to boot the software on Corstone-1000. On power on=
,
-the Secure Enclave starts executing BL1_1 code from the ROM which is the=
 RoT
-of the device. The BL1_1 is the immutable bootloader of the system, it h=
andles
-the provisioning on the first boot, hardware initialization and verifica=
tion
-of the next stage.
-
-The BL1_2 code, hashes and keys are written into the OTP during the prov=
isioning.
-The next bootstage is the BL1_2 which is copied from the OTP into the RA=
M. The
-BL1_1 also compares the BL1_2 hash with the hash saved to the OTP. The B=
L1_2
-verifies and transfers control to the next bootstage which is the BL2. D=
uring the
-verification, the BL1_2 compares the BL2 image's computed hash with the =
BL2 hash in
-the OTP. The BL2 is MCUBoot in the system. BL2 can provision additional =
keys on the
-first boot and it authenticates the initial bootloader of the host (Host=
 Trusted Firmware-A BL2)
-and TF-M by checking the signatures of the images.
-The MCUBoot handles the image verification the following way:
-
-- Load image from a non-volatile memory to dynamic RAM.
-- The public key present in the image header is validated by comparing w=
ith the hash.
-  Depending on the image, the hash of the public key is either stored in=
 the OTP or part
-  of the software which is being already verified in the previous stages=
.
-- The image is validated using the public key.
-
-
-The execution control is passed to TF-M after the verification. TF-M bei=
ng
-the runtime executable of the Secure Enclave which initializes itself an=
d, at the end,
-brings the host CPU out of rest.
-
-The TF-M BL1 design details and reasoning can be found in the `TF-M desi=
gn documents
-<https://tf-m-user-guide.trustedfirmware.org/design_docs/booting/bl1.htm=
l>`_.
-
-The Corstone-1000 has some differences compared to this design due to me=
mory (OTP/ROM)
-limitations:
-
-- The provisioning bundle that contains the BL1_2 code is located in the=
 ROM.
-  This means the BL1_2 cannot be updated during provisioning time.
-- The BL1_1 handles most of the hardware initialization instead of the B=
L1_2. This
-  results in a bigger BL1_1 code size than needed.
-- The BL1_2 does not use the post-quantum LMS verification. The BL2 is v=
erified by
-  comparing the computed hash to the hash which is stored in the OTP. Th=
is means the
-  BL2 is not updatable.
-
-Host Level Authentication
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-
-The host follows the boot standard defined in the `TBBR`_ to authenticat=
e the
-secure and non-secure software.
-
-The Firmware Image Package (FIP) packs bootloader images and other paylo=
ads into a
-single archive. The FIP for Corstone-1000 contains:
-
-- Trusted Boot Firmware BL2
-- EL3 Runtime Firmware BL31
-- Secure Payload BL32 (Trusted OS)
-- Non-Trusted Firmware BL33,
-- TOS_FW_CONFIG
-- key & content certificates
-
-TF-M does not check the FIP signature, it only checks the Trsuted Firmwa=
re-A (TF-A) BL2's signature
-in the FIP. The TF-M BL2 (MCUBoot) gets the offset for the TF-A BL2 by p=
arsing the
-GUID Partition Table (GPT) to find the FIP offset, then parsing the FIP =
to get the offset for the
-TF-A BL2. Finally, MCUBoot loads and validates the TF-A BL2 image.
-
-The implicitly trusted components are:
-
-- A SHA-256 hash of the Root of Trust Public Key (ROTPK). A development =
ROTPK
-  is used and its hash embedded into the TF-A BL2 image (only for develo=
pment purposes).
-  This public key is provided by TF-A source-code.
-- In case of Corstone-1000, the TF-A BL2 image, can be trusted because i=
t has been verified
-  by the secure enclave's BL2 (MCUBoot) before starting TF-A.
+It is a lengthy chain to boot the software on Corstone-1000.
+
+TF-M BL1_1
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+On power-up, the Secure Enclave begins execution from TF-M BL1_1, which =
resides in ROM and serves as
+the Root of Trust (RoT) for the device.
+
+TF-M BL1_1 is the immutable bootloader and is responsible for:
+
+- Provisioning the device during the first boot
+- Performing hardware initialization
+- Verifying the integrity and authenticity of the next stage in the boot=
 chain
+
+At boot time, TF-M BL1_1:
+
+- Copies the TF-M BL1_2 image from OTP to RAM.
+- Verifies the integrity of BL1_2 by comparing its computed hash with th=
e hash stored in OTP.
+
+TF-M BL1_2
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+During provisioning, the TF-M BL1_2 binary, along with its hashes and cr=
yptographic keys, is stored
+in One-Time Programmable (OTP) memory.
+
+Once verified, TF-M BL1_2:
+
+- Takes control and verifies the next stage in the boot chain, which is =
TF-M BL2.
+- Computes the hash of the BL2 image and compares it with the BL2 hash s=
tored in OTP to ensure
+  integrity before transferring execution to BL2.
+
+.. note::
+
+    The TF-M BL1 design details can be found in the `TF-M design documen=
ts <trusted-firmware-m-bl1-website_>`_.
+
+    .. important::
+
+        Corstone-1000 has some differences compared to this design due t=
o memory (OTP/ROM)
+        limitations:
+
+        - BL1_1 code size is larger than needed because it handles most =
of the hardware initialization instead of the BL1_2.
+        - BL1_2 cannot be updated during provisioning time because the p=
rovisioning bundle that contains its code is located in the ROM.
+        - BL1_2 does not use the post-quantum LMS verification.
+        - BL2 cannot be updated because it is verified by comparing the =
computed hash to the hash stored in the OTP.
+
+TF-M BL2
+=3D=3D=3D=3D=3D=3D=3D=3D
+
+In this system, TF-M BL2 refers to MCUBoot.
+
+On the first boot, MCUBoot can provision additional cryptographic keys. =
It is responsible for authenticating both:
+
+- TF-M (Trusted Firmware-M), and
+- The initial bootloader of the Host system, `Trusted Firmware-A (TF-A) =
BL2 <trusted-firmware-a-bl2-website_>`__
+
+This authentication is done by verifying the digital signatures of the r=
espective images.
+
+MCUBoot performs image verification in the following steps:
+
+#. Load the image from non-volatile memory into RAM.
+#. Validate the image's signature using the corresponding public key.
+
+.. note::
+
+   The public key present in the image header is validated by comparing =
with the hash.
+   Depending on the image, the hash of the public key is either stored i=
n the OTP or part
+   of the software which is being already verified in the previous stage=
s.
+
+
+The execution control is passed to TF-M after the verification.
+As the runtime executable of the Secure Enclave, TF-M initializes itself=
 before
+bringing the Host system out of reset.
+
+
+
+Host System Authentication
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+
+The Host system follows the boot standard defined in the `Trusted Board =
Boot Requirements Client <trusted-board-boot-requirements-client-pdf_>`__
+to authenticate the Secure and Non-secure software.
+
+The `Firmware Image Package (FIP) <trusted-firmware-a-fip-guide_>`__ pac=
ks bootloader images and
+other payloads into a single archive.
+
+.. image:: images/FIPDiagram.png
+   :alt: FIPDiagram
+
+The FIP for Corstone-1000 contains:
+
+- Trusted firmware-A BL2
+- AP EL3 Runtime firmware, BL31 image
+- AP Secure Payload, BL32 image
+- AP Normal world firmware -U-boot, BL33 image
+- Trusted OS Firmware configuration file used by Trusted OS (BL32), TOS_=
FW_CONFIG
+- Key certificates
+- Content certificates
+
+
+To load and validate TF-A BL2, TF-M BL2 first parses the GUID Partition =
Table (GPT)
+to locate the FIP. It then determines the offset of TF-A BL2 within the =
FIP.
+
+.. note::
+
+    TF-M does not check the FIP signature, it only checks the TF-A BL2's=
 signature in the FIP.
+
+
+.. important::
+
+    The implicitly trusted components are:
+
+    - A SHA-256 hash of the Root of Trust Public Key (ROTPK) -=20
+      For development purposes, a development ROTPK is used and its hash=
 embedded into the TF-A BL2 image.
+      This public key is provided by the TF-A source code.
+    - TF-A BL2 image - it can be trusted because it has been verified by=
 TF-M BL2 before starting TF-A.
=20
=20
 The remaining components in the Chain of Trust (CoT) are either certific=
ates or bootloader images.
=20
-BL images authentication using the FIP certificates:
+Bootloader Authentication
+-------------------------
+
+The FIP contains two types of certificates:
=20
-- The certificates are categorized as "Key" and "Content" certificates.
-  The key certificates are used to verify public keys which have been us=
ed to sign
-  content certificates. The content certificates are used to store the h=
ash of a
-  boot loader image. An image can be authenticated by calculating its ha=
sh and
-  matching it with the hash extracted from the content certificate.
+- **Content Certificates** - used to store the hash of a bootloader imag=
e.
+- **Key Certificates** - used to verify public keys used to sign Content=
 Certificates.
=20
-Verification of the certificates:
+The Host system bootloader images are authenticated by computing their h=
ash and comparing it to the corresponding hash found in the Content Certi=
ficate.
=20
-- The public keys defined in the Trusted Key certificate are used to ver=
ify the
-  later certificates in the CoT process. The Trusted Key certificate is
-  verified with the Root of Trust Public Key.
+Certificates Verification
+-------------------------
+
+The public keys defined in the Trusted Key Certificate are used to verif=
y the later certificates in
+the CoT process. The Trusted Key Certificate is verified with the Root o=
f Trust Public Key.
+
+
+UEFI Authenticated Variables
+----------------------------
=20
 For UEFI Secure Boot, authenticated variables can be accessed from the s=
ecure flash.
 The feature has been integrated in U-Boot, which authenticates the image=
s as per the UEFI
@@ -199,82 +285,74 @@ specification before executing them.
 Secure Services
 ***************
=20
-Corstone-1000 is unique in providing a secure environment to run a secur=
e
-workload. The platform has TrustZone technology in the Host subsystem bu=
t
-it also has hardware isolated Secure Enclave environment to run such sec=
ure
-workloads. In Corstone-1000, known Secure Services such as Crypto, Prote=
cted
-Storage, Internal Trusted Storage and Attestation are available via PSA
-Functional APIs in TF-M. There is no difference for a user communicating=
 to
-these services which are running on a Secure Enclave instead of the
-secure world of the host subsystem. The below diagram presents the data
-flow path for such calls.
+Corstone-1000 is unique in offering a secure environment for running tru=
sted workloads.
+While the Host system includes TrustZone technology, the platform also f=
eatures a hardware-isolated
+Secure Enclave, specifically designed to execute these secure workloads.
+
+In Corstone-1000, essential Secure Services=E2=80=94such as Cryptography=
, Protected Storage,
+Internal Trusted Storage, and Attestation=E2=80=94are provided through P=
SA Functional APIs implemented in TF-M.
+
+From the user's perspective, there is no difference when communicating w=
ith these services,
+whether they run in the Secure Enclave or in the Secure world of the Hos=
t system.
+The diagram below illustrates the data flow for such calls.
=20
=20
 .. image:: images/SecureServices.png
    :width: 930
    :alt: SecureServices
=20
+The Secure Enclave Proxy Secure Partition (SE Proxy SP) is a proxy manag=
ed by OP-TEE that forwards
+Secure Service calls to the Secure Enclave. This communication uses the =
`RSE communication protocol <https://tf-m-user-guide.trustedfirmware.org/=
platform/arm/rse/rse_comms.html>`_.
+While the protocol supports shared memory and MHU interrupts as a doorbe=
ll mechanism between cores,
+in Corstone-1000, the entire message is currently transmitted through th=
e MHU channels.
+Corstone-1000 implements Isolation Level 2 using the Cortex-M0+ Memory P=
rotection Unit (MPU).
=20
-The SE Proxy SP (Secure Enclave Proxy Secure Partition) is a proxy parti=
tion
-managed by OPTEE which forwards such calls to the Secure Enclave. The
-solution relies on the `RSE communication protocol
-<https://tf-m-user-guide.trustedfirmware.org/platform/arm/rse/rse_comms.=
html>`_
-which is a lightweight serialization of the psa_call() API. It can use s=
hared
-memory and MHU interrupts as a doorbell for communication between two co=
res
-but currently the whole message is forwarded through the MHU channels in=
 Corstone-1000.
-Corstone-1000 implements isolation level 2. Cortex-M0+ MPU (Memory Prote=
ction
-Unit) is used to implement isolation level 2.
-
-For a user to define its own secure service, both the options of the hos=
t
-secure world or secure encalve are available. It's a trade-off between
-lower latency vs higher security. Services running on a Secure Enclave a=
re
-secure by real hardware isolation but have a higher latency path. In the
-second scenario, the services running on the secure world of the host
-subsystem have lower latency but virtual hardware isolation created by
-TrustZone technology.
+Users can define their own secure services to run either in the Host sys=
tem's Secure World or in
+the Secure Enclave. This choice involves a trade-off between latency and=
 security.
+Services running in the Secure Enclave benefit from strong, hardware-enf=
orced isolation,
+offering higher security but at the cost of increased latency. In contra=
st, services running in the
+Host Secure World experience lower latency, but rely on TrustZone techno=
logy for virtualized isolation,
+which offers comparatively less robust security.
=20
=20
 **********************
 Secure Firmware Update
 **********************
=20
-Apart from always booting the authorized images, it is also essential th=
at
-the device only accepts the authorized (signed) images in the firmware u=
pdate
-process. Corstone-1000 supports OTA (Over the Air) firmware updates and
-follows Platform Security Firmware Update specification (`FWU`_).
=20
-As standardized into `FWU`_, the external flash is divided into two
-banks of which one bank has currently running images and the other bank =
is
-used for staging new images.  There are four updatable units, i.e. Secur=
e
-Enclave's BL2 and TF-M, and Host's FIP (Firmware Image Package) and Kern=
el
-Image (the initramfs bundle). The new images are accepted in the form of=
 a UEFI capsule.
+In addition to always booting authorized images, it is equally important=
 that the device only accepts
+authorized (signed) images during the firmware update process. Corstone-=
1000 supports over-the-air (OTA)
+firmware updates and complies with the `Platform Security Firmware Updat=
e for the A-profile Arm Architecture <platform-security-fwu-for-a-profile=
-pdf_>`__=20
+specification.
+
+As defined in the specification, the external flash is divided into two =
banks: one bank holds the
+currently running images, while the other is used to stage new images.
+
+There are four updatable components: **BL2**, **TF-M**, **the FIP** and =
**the Kernel Image** (the initramfs bundle).
+New images are delivered and accepted in the form of UEFI capsules.
=20
=20
 .. image:: images/ExternalFlash.png
    :width: 690
    :alt: ExternalFlash
=20
-When Firmware update is triggered, U-Boot verifies the capsule by checki=
ng the
-capsule signature, version number and size. Then it signals the Secure E=
nclave
-that can start writing UEFI capsule into the flash.
-
-Once this operation finishes, Secure Enclave resets the entire system.
-The Metadata Block in the flash has the below firmware update state mach=
ine.
-TF-M runs an OTA service that is responsible for accepting and updating =
the
-images in the flash. The communication between the UEFI Capsule update
-subsystem and the OTA service follows the same data path explained above=
.
-The OTA service writes the new images to the passive bank after successf=
ul
-capsule verification. It changes the state of the system to trial state =
and
-triggers the reset.
-
-Boot loaders in Secure Enclave and Host read the Metadata
-block to get the information on the boot bank. In the successful trial s=
tage,
-the acknowledgment from the host moves the state of the system from tria=
l to
-regular. Any failure in the trial stage or system hangs leads to a syste=
m
-reset. This is made sure by the use of watchdog hardware. The Secure Enc=
lave's
-BL1 has the logic to identify multiple resets and eventually switch back=
 to the
-previous good bank. The ability to revert to the previous bank is crucia=
l to
-guarantee the availability of the device.
+When a firmware update is triggered, U-Boot begins by verifying the UEFI=
 capsule by checking its signature,
+version number, and size. After successful verification, it signals the =
Secure Enclave, which then
+starts writing the capsule contents to flash memory.
+
+Once the write operation is complete, the Secure Enclave resets the enti=
re system. The update process
+is tracked using a state machine stored in the Metadata Block within fla=
sh. TF-M runs an OTA service
+that is responsible for verifying and updating the images in the passive=
 flash bank. Communication
+between the UEFI capsule update subsystem and the OTA service follows th=
e same data path described
+earlier. After verifying the capsule, the OTA service writes the new ima=
ges to the passive bank,
+updates the system state to 'trial,' and initiates a reset.
+
+During boot, the bootloaders in both the Secure Enclave and the Host sys=
tem read the Metadata Block to
+determine which bank to boot from. If the trial boot succeeds, the Host =
system sends an acknowledgment
+that transitions the system state from 'trial' to 'regular.' If the syst=
em fails during the trial phase
+or hangs, a watchdog timer triggers a reset. The Secure Enclave=E2=80=99=
s BL1 contains logic to detect multiple
+resets and can revert to the previously known-good bank. This fallback m=
echanism is essential to ensure
+the device remains available and functional.
=20
=20
 .. image:: images/SecureFirmwareUpdate.png
@@ -287,13 +365,15 @@ guarantee the availability of the device.
 UEFI Runtime Support in U-Boot
 ******************************
=20
-Implementation of UEFI boottime and runtime APIs require variable storag=
e.
-In Corstone-1000, these UEFI variables are stored in the Protected Stora=
ge
-service. The below diagram presents the data flow to store UEFI variable=
s.
-The U-Boot implementation of the UEFI subsystem uses the U-Boot FF-A dri=
ver to
-communicate with the SMM Service in the secure world. The backend of the
-SMM service uses the proxy PS from the SE Proxy SP. From there on, the P=
S
-calls are forwarded to the Secure Enclave as explained above.
+The implementation of UEFI boot-time and runtime APIs requires persisten=
t variable storage. In
+Corstone-1000, UEFI variables are stored using the Protected Storage (PS=
) service.
+
+The diagram below illustrates the data flow for storing UEFI variables. =
U-Boot=E2=80=99s UEFI subsystem
+communicates with the Secure World using the U-Boot FF-A driver, which i=
nterfaces with the `UEFI System Management Mode (SMM) service <trusted-se=
rvices-uefi-smm-website_>`__.
+
+The SMM service provides support for the UEFI System Management Mode. Th=
is support is implemented by the SMM Gateway secure partition.
+The SMM service then uses the Proxy Protected Storage (PS) provided by t=
he SE Proxy SP.
+These PS calls are forwarded to the Secure Enclave, following the commun=
ication path described earlier.
=20
=20
 .. image:: images/UEFISupport.png
@@ -301,30 +381,38 @@ calls are forwarded to the Secure Enclave as explai=
ned above.
    :alt: UEFISupport
=20
=20
-***************
+**********
 References
-***************
-`ARM Corstone-1000 Search`_
-
-`Arm security features`_
+**********
+* `Arm Developer <arm-developer-cs1000-search_>`__
+* `Arm Security Architectures <arm-architecture-security-features-platfo=
rm-security_>`_
=20
 --------------
=20
-*Copyright (c) 2022-2024, Arm Limited. All rights reserved.*
-
-.. _Arm Corstone-1000 Technical Overview: https://developer.arm.com/docu=
mentation/102360/0000
-.. _Arm Corstone-1000 Software: https://developer.arm.com/Tools%20and%20=
Software/Corstone-1000%20Software
-.. _Arm Corstone-1000 Search: https://developer.arm.com/search#q=3Dcorst=
one-1000
-.. _Arm security features: https://www.arm.com/architecture/security-fea=
tures/platform-security
-.. _linux repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/l=
inux.git/
-.. _FF-A: https://developer.arm.com/documentation/den0077/latest
-.. _FF-M: https://developer.arm.com/architectures/Firmware%20Framework%2=
0for%20M-Profile
-.. _FWU: https://developer.arm.com/documentation/den0118/a/
-.. _OPTEE-OS: https://github.com/OP-TEE/optee_os
-.. _PSA: https://www.psacertified.org/
-.. _PSA L2 Ready: https://www.psacertified.org/products/corstone-1000/
-.. _SRIR cert: https://armkeil.blob.core.windows.net/developer/Files/pdf=
/certificate-list/arm-systemready-ir-certification-arm-corstone-1000.pdf
-.. _TBBR: https://developer.arm.com/documentation/den0006/latest
-.. _TF-M: https://www.trustedfirmware.org/projects/tf-m/
-.. _Trusted Services: https://www.trustedfirmware.org/projects/trusted-s=
ervices/
-.. _U-Boot repo: https://github.com/u-boot/u-boot.git
+*Copyright (c) 2022-2025, Arm Limited. All rights reserved.*
+
+.. _arm-developer-cs1000-website: https://developer.arm.com/Tools%20and%=
20Software/Corstone-1000%20Software
+.. _arm-developer-cs1000-search: https://developer.arm.com/search#q=3Dco=
rstone-1000
+.. _arm-developer-mhu-website: https://developer.arm.com/documentation/k=
a005129/latest/#:~:text=3DAn%20MHU%20is%20a%20device,that%20a%20message%2=
0is%20available
+.. _arm-developer-secureboot-website: https://developer.arm.com/document=
ation/PRD29-GENC-009492/c/TrustZone-Software-Architecture/Booting-a-secur=
e-system/Secure-boot
+.. _arm-architecture-security-features-platform-security: https://www.ar=
m.com/architecture/security-features/platform-security
+.. _linux-repository: https://git.kernel.org/pub/scm/linux/kernel/git/st=
able/linux.git/
+.. _arm-trustzone-for-cortex-a-website: https://www.arm.com/technologies=
/trustzone-for-cortex-a
+.. _arm-fmw-framework-a-profile-pdf: https://developer.arm.com/documenta=
tion/den0077/latest
+.. _arm-fmw-framework-m-profile-pdf: https://developer.arm.com/architect=
ures/Firmware%20Framework%20for%20M-Profile
+.. _platform-security-fwu-for-a-profile-pdf: https://developer.arm.com/d=
ocumentation/den0118/a/
+.. _op-tee-os-repository: https://github.com/OP-TEE/optee_os
+.. _psa-certified-website: https://www.psacertified.org/
+.. _psa_l2-ready: https://www.psacertified.org/products/corstone-1000/
+.. _systemready-ir-certification: https://armkeil.blob.core.windows.net/=
developer/Files/pdf/certificate-list/arm-systemready-ve-arm-neoverse.pdf
+.. _trusted-board-boot-requirements-client-pdf: https://developer.arm.co=
m/documentation/den0006/latest
+.. _trusted-firmware-m-website: https://www.trustedfirmware.org/projects=
/tf-m/
+.. _trusted-firmware-m-bl1-website: https://trustedfirmware-m.readthedoc=
s.io/en/latest/design_docs/booting/bl1.html
+.. _trusted-firmware-a-bl2-website: https://developer.arm.com/documentat=
ion/108028/0000/RD-TC22-software/Software-components/AP-firmware/Trusted-=
firmware-A-BL2
+.. _trusted-firmware-a-fip-guide: https://trustedfirmware-a.readthedocs.=
io/en/latest/design/firmware-design.html#firmware-image-package-fip
+.. _trusted-services-website: https://www.trustedfirmware.org/projects/t=
rusted-services/
+.. _trusted-services-uefi-smm-website: https://trusted-services.readthed=
ocs.io/en/integration/services/uefi-smm-services.html#
+.. _das-u-boot-repository: https://github.com/u-boot/u-boot.git
+.. _keil-rtx5-website: https://developer.arm.com/Tools%20and%20Software/=
Keil%20MDK/RTX5%20RTOS
+.. _ppa-website: https://developer.arm.com/documentation/102738/0100/Pow=
er--performance--and-area-analysis
+.. _mcuboot-website: https://docs.mcuboot.com/
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index e1e68f56..b7fb8d84 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022-2024, Arm Limited.
+ # Copyright (c) 2022-2025, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
@@ -50,25 +50,32 @@ The Corstone-1000 software stack can be run on:
 Yocto Stable Branch
 -------------------
=20
-Corstone-1000 software stack is built on top of Yocto styhead release.
+Corstone-1000 software stack is built on top of Yocto Project's `Walnasc=
ar release <meta-arm-repository-release-branch_>`__.
=20
 Software Components
 -------------------
 Within the Yocto Project, each component included in the Corstone-1000 s=
oftware stack is specified as
 a `BitBake recipe <https://docs.yoctoproject.org/bitbake/2.2/bitbake-use=
r-manual/bitbake-user-manual-intro.html#recipes>`__.
 The recipes specific to the Corstone-1000 BSP are located at:
-``$WORKSPACE/meta-arm/meta-arm-bsp/``.
+``${WORKSPACE}/meta-arm/meta-arm-bsp/``.
=20
 .. important::
=20
-    ``$WORKSPACE`` refers to the absolute path to your workspace where t=
he `meta-arm` repository will be cloned.
+    ``${WORKSPACE}`` refers to the absolute path to your workspace where=
 the `meta-arm` repository will be cloned.
=20
-    ``$TARGET`` is either ``mps3`` or ``fvp``.
+    Consider exporting it (e.g., ``export WORKSPACE=3D$(realpath .)``) i=
f you're already in the workspace directory,
+    so you can copy and paste the commands from this guide verbatim.
+
+.. important::
+
+    ``${TARGET}`` is either ``mps3`` or ``fvp``.
+
+    Consider exporting it (e.g., ``export TARGET=3Dmps3``) so you can co=
py and paste the commands from this guide verbatim.
=20
 The Yocto machine config files for the Corstone-1000 FVP and MPS3 target=
s are:
=20
- - ``$WORKSPACE/meta-arm/meta-arm-bsp/conf/machine/include/corstone1000.=
inc``
- - ``$WORKSPACE/meta-arm/meta-arm-bsp/conf/machine/corstone1000-$TARGET.=
conf``
+ - ``${WORKSPACE}/meta-arm/meta-arm-bsp/conf/machine/include/corstone100=
0.inc``
+ - ``${WORKSPACE}/meta-arm/meta-arm-bsp/conf/machine/corstone1000-${TARG=
ET}.conf``
=20
 .. note::
=20
@@ -81,64 +88,64 @@ Host Processor Components
 `Trusted Firmware-A <https://git.trustedfirmware.org/TF-A/trusted-firmwa=
re-a.git>`__
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-+----------+------------------------------------------------------------=
-----------------------------------------+
-| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-a/trusted-firmware-a_%.bbappend``   |
-+----------+------------------------------------------------------------=
-----------------------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-a/trusted-firmware-a_2.11.0.bb``        |
-+----------+------------------------------------------------------------=
-----------------------------------------+
++----------+------------------------------------------------------------=
-------------------------------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-a/trusted-firmware-a_%.bbappend``   |
++----------+------------------------------------------------------------=
-------------------------------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-a/trusted-firmware-a_2.11.0.bb``    |
++----------+------------------------------------------------------------=
-------------------------------------------+
=20
 `Trusted Services <https://trusted-services.readthedocs.io/en/latest/ind=
ex.html>`__
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/libts_%.bbappend``                   |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/ts-psa-crypto-api-test_%.bbappend``  |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/ts-psa-iat-api-test_%.bbappend``     |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/ts-psa-its-api-test_%.bbappend``     |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/ts-psa-ps-api-test_%.bbappend``      |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/ts-sp-se-proxy_%.bbappend``          |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/trusted=
-services/ts-sp-smm-gateway_%.bbappend``       |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/libts_git.bb``                           |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/ts-psa-crypto-api-test_git.bb``          |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/ts-psa-iat-api-test_git.bb``             |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/ts-psa-its-api-test_git.bb``             |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/ts-psa-ps-api-test_git.bb``              |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/ts-sp-smm-gateway.bb``                   |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/trusted-ser=
vices/ts-sp-se-proxy.bb``                      |
-+----------+------------------------------------------------------------=
-----------------------------------------------+
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/trust=
ed-services/libts_%.bbappend``                   |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/trust=
ed-services/ts-psa-crypto-api-test_%.bbappend``  |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/trust=
ed-services/ts-psa-iat-api-test_%.bbappend``     |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/trust=
ed-services/ts-psa-its-api-test_%.bbappend``     |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/trust=
ed-services/ts-psa-ps-api-test_%.bbappend``      |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/trust=
ed-services/ts-sp-se-proxy_%.bbappend``          |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/trust=
ed-services/ts-sp-smm-gateway_%.bbappend``       |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/trusted-s=
ervices/libts_git.bb``                           |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/trusted-s=
ervices/ts-psa-crypto-api-test_git.bb``          |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/trusted-s=
ervices/ts-psa-iat-api-test_git.bb``             |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/trusted-s=
ervices/ts-psa-its-api-test_git.bb``             |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/trusted-s=
ervices/ts-psa-ps-api-test_git.bb``              |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/trusted-s=
ervices/ts-sp-smm-gateway_git.bb``               |
++----------+------------------------------------------------------------=
-------------------------------------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/trusted-s=
ervices/ts-sp-se-proxy_git.bb``                  |
++----------+------------------------------------------------------------=
-------------------------------------------------+
=20
 `OP-TEE <https://git.trustedfirmware.org/OP-TEE/optee_os.git>`__
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-+----------+------------------------------------------------------------=
----------------------------+
-| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-security/optee/o=
ptee-os_4.%.bbappend``      |
-+----------+------------------------------------------------------------=
----------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-security/optee/optee=
-os_4.2.0.bb``              |
-+----------+------------------------------------------------------------=
----------------------------+
++----------+------------------------------------------------------------=
------------------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/optee=
/optee-os_4.%.bbappend``      |
++----------+------------------------------------------------------------=
------------------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/optee/opt=
ee-os_4.4.0.bb``              |
++----------+------------------------------------------------------------=
------------------------------+
=20
 `U-Boot <https://github.com/u-boot/u-boot.git>`__
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-+----------+------------------------------------------------------------=
--------------------+
-| bbappend | ``$WORKSPACE/meta-arm/meta-arm/recipes-bsp/u-boot/u-boot_%.=
bbappend``          |
-+----------+------------------------------------------------------------=
--------------------+
-| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t_%.bbappend``      |
-+----------+------------------------------------------------------------=
--------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t_2023.07.02.bb``   |
-+----------+------------------------------------------------------------=
--------------------+
++----------+------------------------------------------------------------=
----------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/u-boot/u-boot_=
%.bbappend``          |
++----------+------------------------------------------------------------=
----------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_%.bbappend``      |
++----------+------------------------------------------------------------=
----------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_2023.07.02.bb``   |
++----------+------------------------------------------------------------=
----------------------+
=20
 Linux
 =3D=3D=3D=3D=3D
@@ -147,13 +154,13 @@ distribution which is a Linux distribution stripped=
 down to a minimal configurat
=20
 The provided distribution is based on `BusyBox <https://www.busybox.net/=
>`__ and built using `musl libc <https://musl.libc.org/>`__.
=20
-+-----------+-----------------------------------------------------------=
-----------------------------------+
-| bbappend  | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-kernel/linux/li=
nux-yocto_%.bbappend``             |
-+-----------+-----------------------------------------------------------=
-----------------------------------+
-| Recipe    | ``$WORKSPACE/poky/meta/recipes-kernel/linux/linux-yocto_6.=
12.bb``                            |
-+-----------+-----------------------------------------------------------=
-----------------------------------+
-| defconfig | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-kernel/linux/fi=
les/corstone1000/defconfig``       |
-+-----------+-----------------------------------------------------------=
-----------------------------------+
++-----------+-----------------------------------------------------------=
-------------------------------------+
+| bbappend  | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-kernel/linux/=
linux-yocto_%.bbappend``             |
++-----------+-----------------------------------------------------------=
-------------------------------------+
+| Recipe    | ``${WORKSPACE}/poky/meta/recipes-kernel/linux/linux-yocto_=
6.12.bb``                            |
++-----------+-----------------------------------------------------------=
-------------------------------------+
+| defconfig | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-kernel/linux/=
files/corstone1000/defconfig``       |
++-----------+-----------------------------------------------------------=
-------------------------------------+
=20
 *************************
 Secure Enclave Components
@@ -162,11 +169,11 @@ Secure Enclave Components
 `Trusted Firmware-M <https://git.trustedfirmware.org/TF-M/trusted-firmwa=
re-m.git>`__
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-+----------+------------------------------------------------------------=
-----------------------------------------+
-| bbappend | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-m/trusted-firmware-m_%.bbappend``   |
-+----------+------------------------------------------------------------=
-----------------------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-m/trusted-firmware-m_2.1.0.bb``         |
-+----------+------------------------------------------------------------=
-----------------------------------------+
++----------+------------------------------------------------------------=
-------------------------------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-m/trusted-firmware-m_%.bbappend``   |
++----------+------------------------------------------------------------=
-------------------------------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-m/trusted-firmware-m_2.1.1.bb``         |
++----------+------------------------------------------------------------=
-------------------------------------------+
=20
 ************************************
 External System Processor Components
@@ -179,9 +186,9 @@ An example application that uses the `RTX Real-Time O=
perating System <https://de
=20
 The application project can be found `here <https://git.gitlab.arm.com/a=
rm-reference-solutions/corstone1000/external_system/rtx>`__.
=20
-+----------+------------------------------------------------------------=
--------------------------------+
-| Recipe   | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-bsp/external-sys=
tem/external-system_0.1.0.bb``  |
-+----------+------------------------------------------------------------=
--------------------------------+
++----------+------------------------------------------------------------=
----------------------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/external-s=
ystem/external-system_0.1.0.bb``  |
++----------+------------------------------------------------------------=
----------------------------------+
=20
 .. _building-the-software-stack:
=20
@@ -192,7 +199,7 @@ Build
=20
   Building binaries natively on Windows and AArch64 Linux is not support=
ed.
  =20
-  Use an AMD64 Linux based development machine to build the software sta=
ck and transfer the binaries to run the software stack on an FVP in Windo=
ws or AArch64 Linux
+  Use an Intel or AMD 64-bit architecture Linux based development machin=
e to build the software stack and transfer the binaries to run the softwa=
re stack on an FVP in Windows or AArch64 Linux
   if required.
=20
=20
@@ -200,8 +207,8 @@ Build
=20
     .. code-block:: console
=20
-        mkdir $WORKSPACE
-        cd $WORKSPACE
+        mkdir ${WORKSPACE}
+        cd ${WORKSPACE}
=20
 #. Install kas version 4.4 with ``sudo`` rights.
=20
@@ -211,18 +218,18 @@ Build
=20
     Ensure the kas installation directory is visible on the ``$PATH`` en=
vironment variable.
=20
-#. Clone the `meta-arm` Yocto layer in the workspace ``$WORKSPACE``.
+#. Clone the `meta-arm` Yocto layer in the workspace ``${WORKSPACE}``.
=20
     .. code-block:: console
=20
-        cd $WORKSPACE
-        git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1=
000-2024.11
+        cd ${WORKSPACE}
+        git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1=
000-2025.05
=20
 #. Build a Corstone-1000 image:
=20
     .. code-block:: console
=20
-        kas build meta-arm/kas/corstone1000-$TARGET.yml:meta-arm/ci/debu=
g.yml
+        kas build meta-arm/kas/corstone1000-${TARGET}.yml:meta-arm/ci/de=
bug.yml
=20
     .. important::
=20
@@ -241,22 +248,22 @@ Build
=20
         .. code-block:: console
=20
-            kas build meta-arm/kas/corstone1000-$TARGET.yml:meta-arm/ci/=
debug.yml:meta-arm/kas/corstone1000-extsys.yml
+            kas build meta-arm/kas/corstone1000-${TARGET}.yml:meta-arm/c=
i/debug.yml:meta-arm/kas/corstone1000-extsys.yml
=20
 A clean build takes a significant amount of time given that all of the d=
evelopment machine utilities are also
 built along with the target images. Those development machine utilities =
include executables (Python,
 CMake, etc.) and the required toolchains.
=20
=20
-Once the build succeeds, all output binaries will be placed in ``$WORKSP=
ACE/build/tmp/deploy/images/corstone1000-$TARGET/``
+Once the build succeeds, all output binaries will be placed in ``${WORKS=
PACE}/build/tmp/deploy/images/corstone1000-${TARGET}/``
=20
 Everything apart from the Secure Enclave ROM firmware and External Syste=
m firmware, is bundled into a single binary, the
-``corstone1000-flash-firmware-image-corstone1000-$TARGET.wic`` file.
+``corstone1000-flash-firmware-image-corstone1000-${TARGET}.wic`` file.
=20
 The output binaries run in the Corstone-1000 platform are the following:
- - The Secure Enclave ROM firmware: ``$WORKSPACE/build/tmp/deploy/images=
/corstone1000-$TARGET/bl1.bin``
- - The External System Processor firmware: ``$WORKSPACE/build/tmp/deploy=
/images/corstone1000-$TARGET/es_flashfw.bin``
- - The internal firmware flash image: ``$WORKSPACE/build/tmp/deploy/imag=
es/corstone1000-$TARGET/corstone1000-flash-firmware-image-corstone1000-$T=
ARGET.wic``
+ - The Secure Enclave ROM firmware: ``${WORKSPACE}/build/tmp/deploy/imag=
es/corstone1000-${TARGET}/bl1.bin``
+ - The External System Processor firmware: ``${WORKSPACE}/build/tmp/depl=
oy/images/corstone1000-${TARGET}/es_flashfw.bin``
+ - The internal firmware flash image: ``${WORKSPACE}/build/tmp/deploy/im=
ages/corstone1000-${TARGET}/corstone1000-flash-firmware-image-corstone100=
0-${TARGET}.wic``
=20
 .. _flashing-firmware-images:
=20
@@ -269,6 +276,13 @@ Flash
     machine does not require any firmware flashing. Refer to `this <runn=
ing-software-stack-fvp_>`__
     section for running the software stack on FVP.=20
=20
+.. important::
+
+    When preparing the SD card for flashing, ensure that it is at least =
4GB in size and formatted
+    with a FAT32 partition.
+    Using smaller cards or unsupported file systems (e.g., exFAT, NTFS) =
may cause the flashing
+    process to fail or the device to become unresponsive.
+
 #. Download the FPGA bit file image ``AN550: Arm=C2=AE Corstone=E2=84=A2=
-1000 for MPS3 Version 2.0``
    on the `Arm Developer website <https://developer.arm.com/tools-and-so=
ftware/development-boards/fpga-prototyping-boards/download-fpga-images>`_=
_.
    Click on the ``Download AN550 bundle`` button and login to download t=
he file.
@@ -302,9 +316,9 @@ Flash
                 =E2=94=94=E2=94=80=E2=94=80 ES0.bin
=20
 #. Depending upon the MPS3 board version, you should update the ``images=
.txt`` file
-   (found in the corresponding ``HBI0309x`` folder e.g. ``Boardfiles/MB/=
HBI0309$BOARD_VERSION/AN550/images.txt``)
+   (found in the corresponding ``HBI0309x`` folder e.g. ``Boardfiles/MB/=
HBI0309${BOARD_VERSION}/AN550/images.txt``)
    so it points to the images under the ``SOFTWARE`` directory.
-   Where ``$BOARD_VERSION`` is a variable containing the board printed o=
n the MPS3 board.
+   Where ``${BOARD_VERSION}`` is a variable containing the board printed=
 on the MPS3 board.
=20
    The ``images.txt`` file compatible with the latest version of the sof=
tware
    stack can be seen below;
@@ -341,10 +355,10 @@ Flash
         IMAGE2FILE: \SOFTWARE\es0.bin
=20
=20
-#. Copy ``bl1.bin`` from ``$WORKSPACE/build/tmp/deploy/images/corstone10=
00-mps3`` to the ``SOFTWARE`` directory of the FPGA bundle.
-#. Copy ``es_flashfw.bin`` from ``$WORKSPACE/build/tmp/deploy/images/cor=
stone1000-mps3`` to the ``SOFTWARE`` directory of the FPGA bundle
+#. Copy ``bl1.bin`` from ``${WORKSPACE}/build/tmp/deploy/images/corstone=
1000-mps3`` to the ``SOFTWARE`` directory of the FPGA bundle.
+#. Copy ``es_flashfw.bin`` from ``${WORKSPACE}/build/tmp/deploy/images/c=
orstone1000-mps3`` to the ``SOFTWARE`` directory of the FPGA bundle
    and rename the binary to ``es0.bin``.
-#. Copy ``corstone1000-flash-firmware-image-corstone1000-mps3.wic`` from=
 ``$WORKSPACE/build/tmp/deploy/images/corstone1000-mps3`` to the ``SOFTWA=
RE``
+#. Copy ``corstone1000-flash-firmware-image-corstone1000-mps3.wic`` from=
 ``${WORKSPACE}/build/tmp/deploy/images/corstone1000-mps3`` to the ``SOFT=
WARE``
    directory of the FPGA bundle and rename the wic image to ``cs1000.bin=
``.
=20
 .. note::
@@ -427,7 +441,7 @@ Corstone-1000 FVP software image.
=20
 A Yocto recipe is provided to download the latest supported FVP version.
=20
-The recipe is located at ``$WORKSPACE/meta-arm/meta-arm/recipes-devtools=
/fvp/fvp-corstone1000.bb``.
+The recipe is located at ``${WORKSPACE}/meta-arm/meta-arm/recipes-devtoo=
ls/fvp/fvp-corstone1000.bb``.
=20
 The latest FVP version is ``11.23.25`` and is automatically downloaded a=
nd installed when using the
 ``runfvp`` command as detailed below.
@@ -439,14 +453,15 @@ The latest FVP version is ``11.23.25`` and is autom=
atically downloaded and insta
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
         -c "../meta-arm/scripts/runfvp -- --version"
=20
-The FVP can also be manually downloaded from the `Arm Ecosystem FVPs`_ p=
age by navigating
-to "Corstone IoT FVPs" section to download the Corstone-1000 platform FV=
P installer. Follow the
-instructions of the installer to setup the FVP.
+The FVP can also be manually downloaded from `Arm Developer <arm-develop=
er-fvp_>`__ to download
+the Corstone-1000 platform FVP installer.
+Follow the instructions of the installer to setup the FVP.
=20
 #. Run the FVP
=20
     .. code-block:: console
=20
+        tmux
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
         -c "../meta-arm/scripts/runfvp --terminals=3Dtmux"
=20
@@ -478,6 +493,13 @@ Tests
     following the instructions `here <building-the-software-stack_>`__.
=20
=20
+Reports
+-------
+
+Reports for the tests conducted on the `Corstone-1000 software (CORSTONE=
1000-2025.05) <https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE100=
0-2025.05>`__
+release are available for reference `here <https://gitlab.arm.com/arm-re=
ference-solutions/arm-reference-solutions-test-report/-/tree/CORSTONE1000=
-2025.05/embedded-a/corstone1000/CORSTONE1000-2025.05?ref_type=3Dtags>`__=
.
+
+
 .. _clean-secure-flash:
=20
 Clean Secure Flash
@@ -489,12 +511,12 @@ Clean Secure Flash
     This is to erase the flash cleanly and prepare a clean board environ=
ment for testing.
=20
=20
-#. Clone the `systemready-patch` repository to your $WORKSPACE.
+#. Clone the `systemready-patch` repository to your ${WORKSPACE}.
=20
     .. code-block:: console
=20
-        cd $WORKSPACE
-        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git -b CORSTONE1000-2024.11
+        cd ${WORKSPACE}
+        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git -b CORSTONE1000-2025.05
=20
 #. Copy the secure flash cleaning Git patch file to your copy of `meta-a=
rm`.
=20
@@ -513,12 +535,12 @@ Clean Secure Flash
=20
     .. code-block:: console
=20
-        cd $WORKSPACE
+        cd ${WORKSPACE}
         kas shell meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.y=
ml
         bitbake -c cleansstate trusted-firmware-m corstone1000-flash-fir=
mware-image
         bitbake -c build corstone1000-flash-firmware-image
=20
-#. Replace the ``bl1.bin`` file on the SD card with ``$WORKSPACE/build/t=
mp/deploy/images/corstone1000-mps3/bl1.bin``.
+#. Replace the ``bl1.bin`` file on the SD card with ``${WORKSPACE}/build=
/tmp/deploy/images/corstone1000-mps3/bl1.bin``.
=20
 #. Reboot the board to completely erase the secure flash.
=20
@@ -534,7 +556,7 @@ Clean Secure Flash
=20
     .. code-block:: console
=20
-        cd $WORKSPACE/meta-arm
+        cd ${WORKSPACE}/meta-arm
         git reset --hard
         cd ..
         bitbake -c cleansstate trusted-firmware-m corstone1000-flash-fir=
mware-image
@@ -544,11 +566,14 @@ Clean Secure Flash
=20
 You can proceed with the test instructions in the following section afte=
r having done all the above.
=20
-SystemReady-IR
+SystemReady IR
 --------------
=20
 .. important::
-    Running the SystemReady-IR tests described below requires USB drives=
.
+
+    **SystemReady IR** has now been renamed **SystemReady Devicetree Ban=
d**.
+
+    Running the tests described below requires USB drives.
     In our testing, not all USB drive models worked well with the MPS3.
=20
     Here are the USB drive models that were stable in our test environme=
nt:
@@ -572,10 +597,10 @@ A storage with EFI System Partition (ESP) must exis=
t in the system for the UEFI-
=20
     .. code-block:: console
=20
-        kas build meta-arm/kas/corstone1000-$TARGET.yml:meta-arm/ci/debu=
g.yml --target corstone1000-esp-image
+        kas build meta-arm/kas/corstone1000-${TARGET}.yml:meta-arm/ci/de=
bug.yml --target corstone1000-esp-image
=20
-#. Locate the ``corstone1000-esp-image-corstone1000-$TARGET.wic`` build =
artefact
-   in ``$WORKSPACE/build/tmp/deploy/images/corstone1000-$TARGET/``=20
+#. Locate the ``corstone1000-esp-image-corstone1000-${TARGET}.wic`` buil=
d artefact
+   in ``${WORKSPACE}/build/tmp/deploy/images/corstone1000-${TARGET}/``=20
=20
 ****************************
 Use the EFI System Partition
@@ -605,7 +630,7 @@ MPS3
     .. code-block:: console
=20
         sudo dd \
-        if=3D$WORKSPACE/build/tmp/deploy/images/corstone1000-mps3/corsto=
ne1000-esp-image-corstone1000-mps3.wic \
+        if=3D${WORKSPACE}/build/tmp/deploy/images/corstone1000-mps3/cors=
tone1000-esp-image-corstone1000-mps3.wic \
         of=3D/dev/sdb \
         iflag=3Ddirect oflag=3Ddirect status=3Dprogress bs=3D512; sync;
=20
@@ -622,7 +647,7 @@ It will be used when the SystemReady-IR tests is perf=
ormed on the FVP in the lat
=20
=20
 ****************************
-Run SystemReady-IR ACS Tests
+Run SystemReady IR ACS Tests
 ****************************
=20
 ACS is used to ensure architectural compliance across different implemen=
tations of the architecture.
@@ -643,20 +668,31 @@ See the directory structure of the ACS image ``BOOT=
`` partition below:
=20
 .. code-block:: console
=20
+    =E2=94=9C=E2=94=80=E2=94=80 acs_results
     =E2=94=9C=E2=94=80=E2=94=80 EFI
-    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 BOOT
-    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 app
-    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 bbr
-    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 bootaa64.efi
-    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 bsa
-    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 debug
-    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 Shell.efi
-    =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 startup.nsh
-    =E2=94=9C=E2=94=80=E2=94=80 grub
-    =E2=94=9C=E2=94=80=E2=94=80 grub.cfg
+    =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 BOOT
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 app
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bbr
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bootaa64.efi
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bsa
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 debug
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 grub.cfg
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 Shell.efi
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 sie_startup.nsh
+    =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 startup.nsh
     =E2=94=9C=E2=94=80=E2=94=80 Image
-    =E2=94=9C=E2=94=80=E2=94=80 ramdisk-busybox.img
-    =E2=94=94=E2=94=80=E2=94=80 acs_results
+    =E2=94=9C=E2=94=80=E2=94=80 security-interface-extension-keys
+    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 NullPK.auth
+    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 TestDB1.auth
+    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 TestDB1.der
+    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 TestDBX1.auth
+    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 TestDBX1.der
+    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 TestKEK1.auth
+    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 TestKEK1.der
+    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 TestPK1.auth
+    =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 TestPK1.der
+    =E2=94=9C=E2=94=80=E2=94=80 startup.nsh
+    =E2=94=94=E2=94=80=E2=94=80 yocto_image.flag
=20
 The ``BOOT`` partition is also used to store test results in the ``acs_r=
esults`` folder.
=20
@@ -674,13 +710,13 @@ This sections below describe how to build and run A=
CS tests on Corstone-1000.
=20
     .. code-block:: console
=20
-        cd $WORKSPACE
-        git clone https://github.com/ARM-software/arm-systemready.git
+        cd ${WORKSPACE}
+        git clone https://github.com/ARM-software/arm-systemready.git -b=
 v23.09_SR_REL2.0.0_ES_REL1.3.0_IR_REL2.1.0 --depth 1
=20
     This repository contains the infrastructure to build the ACS and the=
 bootable prebuilt images to be used for the
-    certifications of SystemReady-IR.
+    certifications of SystemReady IR.
=20
-#. Find the pre-built ACS live image in ``$WORKSPACE/arm-systemready/IR/=
prebuilt_images/v23.09_2.1.0/ir-acs-live-image-generic-arm64.wic.xz``.
+#. Find the pre-built ACS live image in ``${WORKSPACE}/arm-systemready/I=
R/prebuilt_images/v23.09_2.1.0/ir-acs-live-image-generic-arm64.wic.xz``.
=20
     .. note::
=20
@@ -693,7 +729,7 @@ This sections below describe how to build and run ACS=
 tests on Corstone-1000.
=20
     .. code-block:: console
=20
-        cd $WORKSPACE/arm-systemready/IR/prebuilt_images/v23.09_2.1.0
+        cd ${WORKSPACE}/arm-systemready/IR/prebuilt_images/v23.09_2.1.0
         unxz ir-acs-live-image-generic-arm64.wic.xz
=20
 MPS3
@@ -717,7 +753,7 @@ MPS3
=20
     .. code-block:: console
=20
-        cd $WORKSPACE/arm-systemready/IR/prebuilt_images/v23.09_2.1.0
+        cd ${WORKSPACE}/arm-systemready/IR/prebuilt_images/v23.09_2.1.0
         sudo dd if=3Dir-acs-live-image-generic-arm64.wic of=3D/dev/sdc i=
flag=3Ddirect oflag=3Ddirect bs=3D1M status=3Dprogress; sync
=20
 #. Plug the USB drive to the MPS3. At this point you should have both th=
e USB drive with the ESP and the USB drive with the ACS image plugged to =
the MPS3.
@@ -757,12 +793,12 @@ Run the commands below to run the ACS test on FVP u=
sing the built firmware image
=20
 .. code-block:: console
=20
-    cd $WORKSPACE
+    cd ${WORKSPACE}
     tmux
     ./meta-arm/scripts/runfvp \
     --terminals=3Dtmux \
     ./build/tmp/deploy/images/corstone1000-fvp/corstone1000-flash-firmwa=
re-image-corstone1000-fvp.fvpconf \
-    -- -C board.msd_mmc.p_mmc_file=3D$WORKSPACE/arm-systemready/IR/prebu=
ilt_images/v23.09_2.1.0/ir-acs-live-image-generic-arm64.wic
+    -- -C board.msd_mmc.p_mmc_file=3D${WORKSPACE}/arm-systemready/IR/pre=
built_images/v23.09_2.1.0/ir-acs-live-image-generic-arm64.wic
=20
=20
 .. note::
@@ -794,7 +830,7 @@ The results can be fetched from the `acs_results` fol=
der in the ``BOOT`` partiti
=20
         sudo mkdir /mnt/test
         sudo mount -o rw,offset=3D1048576 \
-        $WORKSPACE/arm-systemready/IR/prebuilt_images/v23.09_2.1.0/ir-ac=
s-live-image-generic-arm64.wic \
+        ${WORKSPACE}/arm-systemready/IR/prebuilt_images/v23.09_2.1.0/ir-=
acs-live-image-generic-arm64.wic \
         /mnt/test
=20
 #####################################################
@@ -822,18 +858,18 @@ Generate Capsules
 *****************
=20
 U-Boot's ``mkeficapsule`` tool is used to generate capsules. It is built=
 automatically for the host machine during the firmware image building pr=
ocess.
-The tool can be found in the ``$WORKSPACE/build/tmp/sysroots-components/=
x86_64/u-boot-tools-native/usr/bin/mkeficapsule`` directory.
+The tool can be found in the ``${WORKSPACE}/build/tmp/sysroots-component=
s/x86_64/u-boot-tools-native/usr/bin/mkeficapsule`` directory.
=20
 ``mkeficapsule`` uses a no-partition image which is created when perform=
ing a clean firmware build.
-The no-partition image can be found in the ``$WORKSPACE/build/tmp/deploy=
/images/corstone1000-$TARGET/corstone1000-$TARGET_image.nopt`` directory.
+The no-partition image can be found in the ``${WORKSPACE}/build/tmp/depl=
oy/images/corstone1000-${TARGET}/corstone1000-${TARGET}/corstone1000-${TA=
RGET}_image.nopt`` directory.
=20
-The capsule's default metadata passed can be found in the ``$WORKSPACE/m=
eta-arm/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image=
.bb``
-and ``$WORKSPACE/meta-arm/kas/corstone1000-image-configuration.yml`` fil=
es.
+The capsule's default metadata passed can be found in the ``${WORKSPACE}=
/meta-arm/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-ima=
ge.bb``
+and ``${WORKSPACE}/meta-arm/kas/corstone1000-image-configuration.yml`` f=
iles.
=20
 Valid Capsule
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-An automatically generated capsule can be found in ``$WORKSPACE/build/tm=
p/deploy/images/corstone1000-$TARGET/corstone1000-$TARGET-v6.uefi.capsule=
`` after running a firmware build.
+An automatically generated capsule can be found in ``${WORKSPACE}/build/=
tmp/deploy/images/corstone1000-${TARGET}/corstone1000-${TARGET}-v6.uefi.c=
apsule`` after running a firmware build.
=20
 The default metadata values are assumed to be correct to generate a vali=
d capsule.
=20
@@ -850,26 +886,27 @@ Run the following commands to generate an invalid c=
apsule with a ``fw-version``
=20
 .. code-block:: console
=20
-   cd $WORKSPACE
+   cd ${WORKSPACE}
=20
    ./build/tmp/sysroots-components/x86_64/u-boot-tools-native/usr/bin/mk=
eficapsule \
    --monotonic-count 1 \
-   --private-key build/tmp/deploy/images/corstone1000-$TARGET/corstone10=
00_capsule_key.key \
-   --certificate build/tmp/deploy/images/corstone1000-$TARGET/corstone10=
00_capsule_cert.crt \
+   --private-key build/tmp/deploy/images/corstone1000-${TARGET}/corstone=
1000_capsule_key.key \
+   --certificate build/tmp/deploy/images/corstone1000-${TARGET}/corstone=
1000_capsule_cert.crt \
    --index 1 \
-   --guid $TARGET_GUID \
-   --fw-version 5 build/tmp/deploy/images/corstone1000-$TARGET/corstone1=
000-$TARGET_image.nopt \
-   corstone1000-$TARGET-v5.uefi.capsule
+   --guid ${TARGET}_GUID \
+   --fw-version 5 \
+   build/tmp/deploy/images/corstone1000-${TARGET}/corstone1000-${TARGET}=
_image.nopt \
+   corstone1000-${TARGET}-v5.uefi.capsule
=20
=20
 .. important::
=20
-    ``$TARGET_GUID`` is different depending on whether the capsule is bu=
ilt for the ``fvp`` or ``mps3`` ``$TARGET``.
+    ``${TARGET}_GUID`` is different depending on whether the capsule is =
built for the ``fvp`` or ``mps3`` ``${TARGET}``.
=20
-    - ``fvp`` ``$TARGET_GUID`` is ``989f3a4e-46e0-4cd0-9877-a25c70c01329=
``
-    - ``mps3`` ``$TARGET_GUID`` is ``df1865d1-90fb-4d59-9c38-c9f2c1bba8c=
c``
+    - ``fvp`` ``${TARGET}_GUID`` is ``989f3a4e-46e0-4cd0-9877-a25c70c013=
29``
+    - ``mps3`` ``${TARGET}_GUID`` is ``df1865d1-90fb-4d59-9c38-c9f2c1bba=
8cc``
=20
-The invalid capsule will be located in the ``$WORKSPACE`` directory.
+The invalid capsule will be located in the ``${WORKSPACE}`` directory.
=20
 ***************************
 Transfer Capsules to Target
@@ -887,10 +924,16 @@ MPS3
=20
   .. code-block:: console
=20
-    sudo cp $CAPSULES_PATH/corstone1000-mps3-v6.uefi.capsule $ACS_IMAGE_=
USB_DRIVE_PATH/BOOT/
-    sudo cp $CAPSULES_PATH/corstone1000-mps3-v5.uefi.capsule $ACS_IMAGE_=
USB_DRIVE_PATH/BOOT/
+    cp ${WORKSPACE}/build/tmp/deploy/images/corstone1000-mps3/corstone10=
00-mps3-v6.uefi.capsule /dev/sdc/BOOT/
+    cp ${WORKSPACE}/corstone1000-mps3-v5.uefi.capsule /dev/sdc/EFI/BOOT/
     sync
=20
+.. note::
+
+    ``/dev/sdc`` is the assumed path for the ACS Image USB drive.
+    Replace it with the actual device path as enumerated on your develop=
ment machine.
+
+
 .. important::
=20
     Since we are using the direct Capsule Update method, the capsule fil=
es should not be placed in
@@ -900,7 +943,7 @@ FVP
 =3D=3D=3D
=20
 #. Download and extract the ACS image `as described for the MPS3 <mps3-i=
nstructions-for-acs-image_>`_.
-   The ACS image extraction location will be referred below as ``$ACS_IM=
AGE_PATH``.
+   The ACS image extraction location will be referred below as ``${ACS_I=
MAGE_PATH}``.
=20
     .. note::
=20
@@ -911,10 +954,10 @@ FVP
=20
     .. code-block:: console
=20
-        fdisk -lu $ACS_IMAGE_PATH/ir-acs-live-image-generic-arm64.wic
+        fdisk -lu ${ACS_IMAGE_PATH}/ir-acs-live-image-generic-arm64.wic
         Device                                                 Start    =
 End Sectors  Size Type
-        $ACS_IMAGE_PATH/ir-acs-live-image-generic-arm64.wic1    2048  30=
9247  307200  150M Microsoft basic data
-        $ACS_IMAGE_PATH/ir-acs-live-image-generic-arm64.wic2  309248 134=
3339 1034092  505M Linux filesystem
+        ${ACS_IMAGE_PATH}/ir-acs-live-image-generic-arm64.wic1    2048  =
309247  307200  150M Microsoft basic data
+        ${ACS_IMAGE_PATH}/ir-acs-live-image-generic-arm64.wic2  309248 1=
343339 1034092  505M Linux filesystem
=20
=20
     Given that the first partition starts at sector 2048 and each sector=
 is 512 bytes in size,
@@ -925,14 +968,14 @@ FVP
     .. code-block:: console
=20
         sudo mkdir /mnt/ir-acs-live-image-generic-arm64
-        sudo mount -o rw,offset=3D<first_partition_offset> $ACS_IMAGE_PA=
TH/ir-acs-live-image-generic-arm64.wic  /mnt/ir-acs-live-image-generic-ar=
m64
+        sudo mount -o rw,offset=3D<first_partition_offset> ${ACS_IMAGE_P=
ATH}/ir-acs-live-image-generic-arm64.wic  /mnt/ir-acs-live-image-generic-=
arm64
=20
 #. Copy the capsules:
=20
     .. code-block:: console
=20
-        sudo cp $CAPSULES_PATH/corstone1000-fvp-v6.uefi.capsule /mnt/ir-=
acs-live-image-generic-arm64/
-        sudo cp $CAPSULES_PATH/corstone1000-fvp-v5.uefi.capsule /mnt/ir-=
acs-live-image-generic-arm64/
+        sudo cp ${WORKSPACE}/build/tmp/deploy/images/corstone1000-fvp/co=
rstone1000-fvp-v6.uefi.capsule /mnt/ir-acs-live-image-generic-arm64/
+        sudo cp ${WORKSPACE}/corstone1000-fvp-v5.uefi.capsule /mnt/ir-ac=
s-live-image-generic-arm64/
         sync
=20
 #. Unmount the IR image:
@@ -945,8 +988,8 @@ FVP
 Run Capsule Update Tests
 ************************
=20
-The valid capsule (``corstone1000-$TARGET-v6.uefi.capsule``) will be use=
d first to run the positive capsule update test.
-This will be followed by using the invalid capsule (``corstone1000-$TARG=
ET-v5.uefi.capsule``) to run the negative capsule update test.
+The valid capsule (``corstone1000-${TARGET}-v6.uefi.capsule``) will be u=
sed first to run the positive capsule update test.
+This will be followed by using the invalid capsule (``corstone1000-${TAR=
GET}-v5.uefi.capsule``) to run the negative capsule update test.
=20
 .. important::
=20
@@ -972,16 +1015,17 @@ Positive Capsule Update Test
=20
       .. code-block:: console
=20
+        tmux
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
         -c "../meta-arm/scripts/runfvp --terminals=3Dtmux \
-        -- -C board.msd_mmc.p_mmc_file=3D$ACS_IMAGE_PATH/ir-acs-live-ima=
ge-generic-arm64.wic"
+        -- -C board.msd_mmc.p_mmc_file=3D${ACS_IMAGE_PATH}/ir-acs-live-i=
mage-generic-arm64.wic"
=20
       .. warning::
=20
-          ``$ACS_IMAGE_PATH`` must be an absolute path. Ensure there are=
 no spaces before or after of ``=3D`` of the ``-C board.msd_mmc.p_mmc_fil=
e`` option.
+          ``${ACS_IMAGE_PATH}`` must be an absolute path. Ensure there a=
re no spaces before or after of ``=3D`` of the ``-C board.msd_mmc.p_mmc_f=
ile`` option.
=20
=20
-#. Wait until U-Boot loads EFI from the ACS image and interrupt the EFI =
shell by pressing the ``Escape`` key when the following prompt is display=
ed on the Host Processor terminal (``ttyUSB2``).
+#. Wait until U-Boot loads EFI from the ACS image and interrupt the EFI =
shell by pressing the ``Escape`` key when the following prompt is display=
ed on the Host Processor terminal (``ttyUSB2`` for MPS3).
=20
     .. code-block:: console
=20
@@ -1018,7 +1062,7 @@ Positive Capsule Update Test
     The software stack copies the capsule content to the external flash,=
 which is shared between the Secure Enclave and the Host Processor
     before rebooting the system.
=20
-    After the first reboot, TrustedFirmware-M should apply the valid cap=
sule and display the following log on the Secure Enclave terminal (``ttyU=
SB1``)
+    After the first reboot, TrustedFirmware-M should apply the valid cap=
sule and display the following log on the Secure Enclave terminal (``ttyU=
SB1`` for MPS3)
     before rebooting the system a second time:
=20
     .. code-block:: console
@@ -1093,13 +1137,13 @@ Negative Capsule Update Test
=20
   The `positive capsule update test <positive-capsule-update-test_>`__ m=
ust be run before running the negative capsule update test.
=20
-#. After running the positive capsule update test, reboot the system by =
typing the following command on the Host Processor terminal (``ttyUSB2``)=
:
+#. After running the positive capsule update test, reboot the system by =
typing the following command on the Host Processor terminal (``ttyUSB2`` =
for MPS3):
=20
     .. code-block:: console
=20
         reboot
=20
-#. Wait until U-Boot loads EFI from the ACS image and interrupt the EFI =
shell by pressing the ``Escape`` key when the following prompt is display=
ed on the Host Processor terminal (``ttyUSB2``).
+#. Wait until U-Boot loads EFI from the ACS image and interrupt the EFI =
shell by pressing the ``Escape`` key when the following prompt is display=
ed on the Host Processor terminal (``ttyUSB2`` for MPS3).
=20
     .. code-block:: console
=20
@@ -1126,7 +1170,7 @@ Negative Capsule Update Test
             EFI/BOOT/app/CapsuleApp.efi corstone1000-fvp-v5.uefi.capsule
=20
=20
-#. TrustedFirmware-M should reject the capsule due to having a lower fir=
mware version and display the following log on the Secure Enclave termina=
l (``ttyUSB1``):
+#. TrustedFirmware-M should reject the capsule due to having a lower fir=
mware version and display the following log on the Secure Enclave termina=
l (``ttyUSB1`` for MPS3):
=20
     .. code-block:: console
=20
@@ -1230,9 +1274,9 @@ Follow the instructions below to create the install=
ation media.
        =20
         For openSUSE Tumbleweed, search for an ISO file with the format:=
 ``openSUSE-Tumbleweed-DVD-aarch64-Snapshot$DATE-Media.iso``.
        =20
-        ``openSUSE-Tumbleweed-DVD-aarch64-Snapshot20240516-Media.iso`` w=
as used during development.
+        ``openSUSE-Tumbleweed-DVD-aarch64-Snapshot20250509-Media.iso`` w=
as used during development.
=20
-    The location of the ISO file on the development machine will be refe=
rred to as ``$DISTRO_INSTALLER_ISO_PATH``.
+    The location of the ISO file on the development machine will be refe=
rred to as ``${DISTRO_INSTALLER_ISO_PATH}``.
=20
 #. Create the installation media which will contain the necessary files =
to install the operation system.
=20
@@ -1256,7 +1300,7 @@ Follow the instructions below to create the install=
ation media.
=20
             .. code-block:: console
=20
-                sudo dd if=3D$DISTRO_INSTALLER_ISO_PATH of=3D/dev/sdb if=
lag=3Ddirect oflag=3Ddirect status=3Dprogress bs=3D1M; sync;
+                sudo dd if=3D${DISTRO_INSTALLER_ISO_PATH} of=3D/dev/sdb =
iflag=3Ddirect oflag=3Ddirect status=3Dprogress bs=3D1M; sync;
=20
     - FVP:
=20
@@ -1279,7 +1323,7 @@ Corstone-1000 on-board non-volatile storage size is=
 insufficient for installing
=20
             .. code-block:: console
=20
-                dd if=3D/dev/zero of=3D$WORKSPACE/fvp_distro_system_driv=
e.img \
+                dd if=3D/dev/zero of=3D${WORKSPACE}/fvp_distro_system_dr=
ive.img \
                 bs=3D1 count=3D0 seek=3D10G; sync; \
                 parted -s fvp_distro_system_drive.img mklabel gpt
    =20
@@ -1323,10 +1367,11 @@ FVP
=20
     .. code-block:: console
=20
+        tmux
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
         -c "../meta-arm/scripts/runfvp --terminals=3Dtmux -- \
-        -C board.msd_mmc.p_mmc_file=3D$WORKSPACE/fvp_distro_system_drive=
.img \
-        -C board.msd_mmc_2.p_mmc_file=3D$DISTRO_INSTALLER_ISO_PATH"
+        -C board.msd_mmc.p_mmc_file=3D${WORKSPACE}/fvp_distro_system_dri=
ve.img \
+        -C board.msd_mmc_2.p_mmc_file=3D${DISTRO_INSTALLER_ISO_PATH}"
=20
     The Linux distribution will be installed on ``fvp_distro_system_driv=
e.img``.
=20
@@ -1389,9 +1434,10 @@ Boot Distribution
=20
     .. code-block:: console
=20
+        tmux
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l \
         -c "../meta-arm/scripts/runfvp --terminals=3Dtmux -- \
-        -C board.msd_mmc.p_mmc_file=3D$WORKSPACE/fvp_distro_system_drive=
.img"
+        -C board.msd_mmc.p_mmc_file=3D${WORKSPACE}/fvp_distro_system_dri=
ve.img"
=20
     .. warning::
=20
@@ -1486,29 +1532,32 @@ Generate Keys, Signed Image and Unsigned Image
=20
     .. code-block:: console
=20
-        cd $WORKSPACE
+        cd ${WORKSPACE}
=20
-        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git \
-        -b CORSTONE1000-2024.11
+        git clone https://gitlab.arm.com/arm-reference-solutions/systemr=
eady-patch \
+
+        -b CORSTONE1000-2025.05
=20
 #. Set the current working directory to build directory's subdirectory c=
ontaining the software stack build images.
=20
     .. code-block:: console
=20
-        cd $WORKSPACE/build/tmp/deploy/images/corstone1000-$TARGET/
+        cd ${WORKSPACE}/build/tmp/deploy/images/corstone1000-${TARGET}/
=20
 #. Run the image signing script (without changing the current working di=
rectory).
=20
     .. code-block:: console
=20
-        ./$WORKSPACE/systemready-patch/embedded-a/corstone1000/secureboo=
t/create_keys_and_sign.sh \
-        -d $TARGET \
-        -v $CERTIFICATE_VALIDITY_DURATION_IN_DAYS
+        ./${WORKSPACE}/systemready-patch/embedded-a/corstone1000/secureb=
oot/create_keys_and_sign.sh \
+        -d ${TARGET} \
+        -v ${CERTIFICATE_VALIDITY_DURATION_IN_DAYS}
=20
     .. important::
=20
         The `efitools <https://github.com/vathpela/efitools/>`__  packag=
e is required to execute the script.
=20
+        ``${CERTIFICATE_VALIDITY_DURATION_IN_DAYS}`` is an integer that =
specifies the certificate's validity period in days.
+
     .. note::
=20
         Consult the image signing script help message (``-h``) for more =
information about other optional arguments.
@@ -1517,7 +1566,7 @@ Generate Keys, Signed Image and Unsigned Image
=20
=20
 The keys, signed kernel image, and unsigned kernel image will be copied =
to the exisiting ESP image.
-The modified ESP image can be found at ``$WORKSPACE/build/tmp/deploy/ima=
ges/corstone1000-$TARGET/corstone1000-esp-image-corstone1000-$TARGET.wic`=
`.
+The modified ESP image can be found at ``${WORKSPACE}/build/tmp/deploy/i=
mages/corstone1000-${TARGET}/corstone1000-esp-image-corstone1000-${TARGET=
}.wic``.
=20
=20
 ****************************
@@ -1743,7 +1792,7 @@ The tests use the `arm_tstee` driver to access Trus=
ted Services Secure Partition
     Ensure there are no USB drives connected to the board when running t=
he test on the MPS3.
=20
=20
-The steps below are applicable to both MPS3 and FVP).
+The steps below are applicable to both MPS3 and FVP.
=20
 #. Start the Corstone-1000 and wait until it boots to Linux on the Host =
Processor terminal (``ttyUSB2``).
=20
@@ -1825,31 +1874,33 @@ For more information about this, see the followin=
g resources:
  - `Authenticated Debug Access Control Specification <https://developer.=
arm.com/documentation/den0101/latest/>`__
  - `Arm Corstone-1000 for MPS3 Application Note AN550, Chapter 7 <https:=
//developer.arm.com/documentation/dai0550/latest/>`__
=20
-The Secure Debug Manager API is implemented in the `secure-debug-manager=
 <https://github.com/ARM-software/secure-debug-manager>`__ repository.
+The Secure Debug Manager API is implemented in the `Secure Debug Manager=
 (PSA-ADAC / SDC-600) <secure-debug-manager-repo-readme_>`__ repository.
 This repository also contains the necessary files for the Arm Developmen=
t Studio support.
 The build and integration instructions can be found in its `README <secu=
re-debug-manager-repo-readme_>`__.
=20
-The `secure-debug-manager` repository also contains the private key and =
chain certificate to be used during the tests.
-The private key's public pair is provisioned into the One-Time Programma=
ble memory in TrustedFirmware-M. These are dummy keys that should not be =
used in production.
+The `Secure Debug Manager (PSA-ADAC / SDC-600)` repository also contains=
 the private key and chain certificate to be used during the tests.
+The private key's public pair is provisioned into the One-Time Programma=
ble memory in TrustedFirmware-M.
+These are dummy keys that should not be used in production.
=20
-To test the Secure Debug feature, you'll need a debug probe from the DST=
REAM family and Arm Development Studio versions 2022.2, 2022.c, or 2023.a=
.
+To test the Secure Debug feature, you'll need a debug probe from the `Ar=
m ULINKpro family <arm-ulink-pro-website_>`__
+and `Arm Development Studio <arm-ds-website_>`__ versions 2022.2, 2022.c=
, or 2023.a.
=20
=20
-#. Clone the `secure-debug-manager` repository to your workspace.
+#. Clone the `Secure Debug Manager (PSA-ADAC / SDC-600)` repository to y=
our workspace.
=20
     .. code-block:: console
=20
-        cd $WORKSPACE
+        cd ${WORKSPACE}
         git clone https://github.com/ARM-software/secure-debug-manager.g=
it
=20
 #. Navigate into the repository directory and checkout the specific comm=
it in the listing below.
=20
     .. code-block:: console
=20
-        cd $WORKSPACE/secure-debug-manager
+        cd ${WORKSPACE}/secure-debug-manager
         git checkout b30d6496ca749123e86b39b161b9f70ef76106d6
=20
-#. Follow the steps in the `secure-debug-manager`'s `README <secure-debu=
g-manager-repo-readme_>`__ for the development machine setup.
+#. Follow the instructions in the `Secure Debug Manager (PSA-ADAC / SDC-=
600)'s README <secure-debug-manager-repo-readme_>`__ for the development =
machine setup.
=20
 #. Rebuild the software stack with Secure Debug.
=20
@@ -1871,7 +1922,7 @@ To test the Secure Debug feature, you'll need a deb=
ug probe from the DSTREAM fam
=20
 #. Connect the debug probe to the MPS3 using the 20-pin 1.27mm connector=
 with the ``CS_20W_1.27MM silkscreen`` label.
=20
-#. Create a debug configuration in Arm Development Studio as described i=
n the `secure-debug-manager`'s `README <https://github.com/ARM-software/s=
ecure-debug-manager?tab=3Dreadme-ov-file#arm-development-studio-integrati=
on>`__.
+#. Create a debug configuration in Arm Development Studio as described i=
n the `Secure Debug Manager (PSA-ADAC / SDC-600)'s README <secure-debug-m=
anager-armds-integration_>`__.
=20
 #. Connect the debuger to the target using the debug configuration.
=20
@@ -1882,14 +1933,14 @@ To test the Secure Debug feature, you'll need a d=
ebug probe from the DSTREAM fam
         ...
=20
         Please provide private key file path:
-        Enter file path > $WORKSPACE\secure-debug-manager\example\data\k=
eys\EcdsaP256Key-3.pem
+        Enter file path > ${WORKSPACE}\secure-debug-manager\example\data=
\keys\EcdsaP256Key-3.pem
=20
         Please provide trust chain file path:
-        Enter file path > $WORKSPACE\secure-debug-manager\example\data\c=
hains\chain.EcdsaP256-3
+        Enter file path > ${WORKSPACE}\secure-debug-manager\example\data=
\chains\chain.EcdsaP256-3
=20
         ...
=20
-#. When successful authenticated, Arm Development Studio will connect to=
 the running MS3 and the debug features can be used.
+#. When successful authenticated, Arm Development Studio will connect to=
 the running MPS3 and the debug features can be used.
    The following prompt should appear in the Secure Enclave terminal (``=
ttyUSB1``):
=20
     .. code-block:: console
@@ -1899,15 +1950,13 @@ To test the Secure Debug feature, you'll need a d=
ebug probe from the DSTREAM fam
         ...
=20
=20
-Reports
--------
-Various test reports for the `Corstone-1000 software (CORSTONE1000-2024.=
11) <https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE1000-2024.11>=
`__
-release version are available for reference `here <https://gitlab.arm.co=
m/arm-reference-solutions/arm-reference-solutions-test-report/-/tree/CORS=
TONE1000-2024.11/embedded-a/corstone1000/CORSTONE1000-2024.11?ref_type=3D=
tags>`__.
-
-
 --------------
=20
-*Copyright (c) 2022-2024, Arm Limited. All rights reserved.*
+*Copyright (c) 2022-2025, Arm Limited. All rights reserved.*
=20
-.. _Arm Ecosystem FVPs: https://developer.arm.com/tools-and-software/ope=
n-source-software/arm-platforms-software/arm-ecosystem-fvps
-.. _secure-debug-manager-repo-readme: https://github.com/ARM-software/se=
cure-debug-manager/blob/master/README.md
+.. _arm-developer-fvp: https://developer.arm.com/tools-and-software/open=
-source-software/arm-platforms-software/arm-ecosystem-fvps
+.. _secure-debug-manager-repo-readme: https://github.com/ARM-software/se=
cure-debug-manager/tree/master?tab=3Dreadme-ov-file#secure-debug-manager-=
psa-adac--sdc-600
+.. _secure-debug-manager-armds-integration: https://github.com/ARM-softw=
are/secure-debug-manager?tab=3Dreadme-ov-file#arm-development-studio-inte=
gration
+.. _meta-arm-repository-release-branch: https://web.git.yoctoproject.org=
/meta-arm?h=3Dwalnascar
+.. _arm-ulink-pro-website: https://www.arm.com/products/development-tool=
s/debug-probes/ulink-pro
+.. _arm-ds-website: https://www.arm.com/products/development-tools/embed=
ded-and-software/arm-development-studio


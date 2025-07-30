Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14373C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.33482.1753876443778599444
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 740AD2681;
	Wed, 30 Jul 2025 04:53:55 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B71273F66E;
	Wed, 30 Jul 2025 04:54:02 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 13/13] arm-bsp/doc: corstone1000: Update architecture document with new PSA FWU implementation details
Date: Wed, 30 Jul 2025 12:53:27 +0100
Message-Id: <20250730115327.3671160-14-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6650

Update the architecture documentation for Corstone-1000 to include
details about the new PSA Firmware Update (FWU) implementation.

The new section describes the bootloader abstraction layer (BAL),
UEFI capsule update flow, FWU metadata handling, and the integration
between TF-M and U-Boot for managing trial and accepted images.

This documentation helps align the platform with PSA FWU requirements

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../SystemArchitecturePSAFirmwareUpdate.png   | Bin 0 -> 47522 bytes
 .../corstone1000/software-architecture.rst    | 117 ++++++++++++++----
 2 files changed, 94 insertions(+), 23 deletions(-)
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/System=
ArchitecturePSAFirmwareUpdate.png

diff --git a/meta-arm-bsp/documentation/corstone1000/images/SystemArchite=
cturePSAFirmwareUpdate.png b/meta-arm-bsp/documentation/corstone1000/imag=
es/SystemArchitecturePSAFirmwareUpdate.png
new file mode 100644
index 0000000000000000000000000000000000000000..75cee8be7d6873ab03bfd2b79=
0772dccd4b67458
GIT binary patch
literal 47522
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
i
zPc~w1yIVPhTlLm>xm&|^6LR2r4$7&#3|C9FBR1|QGyd@I^H`5>jz$vIM8t@%ZGf>l
zbkw@;#aCGwLiUqO#1NO!(yO!_2jj;6gC5g<3VVgm$=3D@mKXSRI*a;@ETNY~hJK_Ned
z$9VC3Pz}bVr8iG*37B<YSwHmtxCKpr5k*<#_w@_Lis-`#i}Gu=3DvDj7>*Pn@C)RBQb
zZ(N7O(q5EiR=3D$@TLCSgsXkfW57<1&Q-8G5t9(P7&&2|Rv%V-sA++TXv=3Dy3;C)OAV2
zpvnw`PRu=3De?Oh|QE*sUIG65#633^n+wmbOz;Z`MA3O-7jrrj?fLLu(C%S!mfVS4Jk
zp+$d=3DWdD39CdyoT0$ZW!^E)b&hDxo6-*=3D61NLiwvSED0jt(K#y_(cs_i!q-iSfCNs
zy)ui#kdcu>1Z1+L0ry!Td#X{FIN25dggpie?Ocr1RFhYU{kw*dTsV4;*Cp@ma7o@q
zkM%`7&&$c2v#ECZ&tIkR(5t2kL^vu5BvP8p--%OSpL(|cJR~Y$xZtva$g@y#)G<iB
z%!mvpj^PB%qPx|u)eZ~36pTr@XpJt)F6St!ra3B8MJ;&KQ(y|_353N<iOPi0-X>Ze
zePgPrzCP=3D+!}S=3DHFR!7}*(CIrJk|`UFFG^PN%&4E*aIhFrX8DsQd{<>@_p+IBPTv5
zzju4SrAl&dXWZE4>z7YtlDB=3DoB=3D+V=3DN|JLK+!OU!`*=3D4RH|#a^-Gt0z`*-O|pYGt=
(
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
t
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
q
z6ea~I0Brlm&~(Lb78X^^2-%@%K*m;)YZ+R^7;+CKvofIQ3h42Jvkzn?oSY(qx)c<#
zczptpkEIocaB3CONLLF{H2DfjJzl4o$x2h1n{OVMEN>+ch@%Grv^os@ae~)6Uv4;=3D
ziB$h?BCEO@;BR*EmV4MRP$?M(TKxSReD`4tQJG}77@-F}>COq7X>kE`J4u82ZN4Rn
zaaN2b+ukMGB_x0uQshjv!WoqL8YH&`n5D-S2$JVkCSr-$6xTuO*KqrL!`qtf+gp9Y
z+u!zGM4jJb`5k@V<$MePz~&wLHC&tFLP3@IR{|klV?QtUT?Y7fR|_AtwJv0Lvfd?g
zh&r&XwOT%gS^)4Tw<*k<JvSM}Z-1L8@wp2K5P7{;Oaj_m+KbM<e1?WlT)A)`)bEtr
zm@l^hS+xY%S>Jv_LkX~{uDElTJmZ}gdzC=3Dy`hiLP@G>Bd_w2Qwgb>iBgP<(~V$-<Y
zvV{A`vu+<J622nI0^nM4k!0-B;yzzo<(asBDD-JbSyZ~K@A(KAovB&8Q#F;~+lF(X
zyv5|IEt~xO_V<I$XBFM9SnmQJ7Uo)Ki~GoHK9I++bTgD&kUVd8mqqmk2wf8W51y6j
z*9-wbgXe+j?AinG1FVw|nV7q6PT>Y$EPw=3D~6~;N<yKA3rP(Jm36?@QgW5|Rf@TEnw
zRBQK6&@%*p7&rDmFFci^o{ntx`}*0C=3Do(Jh$XiB0d@2D7eKtQVoNwEx^2qjebwSRw
zsruKge#zk`udQMr@Y{!X*83moRxAM;<Y{YPn$owu`8Z^yKspxdeB>uZD*%j&Ef9$z
z_+gE>ii_YFVfR1$_Sn3O;9P8y5{n{b_}k2jF2z=3DT>6rp&^otUiFLy@b@EE=3DCPDmU0
z^tz^t-E${irJHQ=3DYbY+|=3DQy22?9ib4OP(76ANH1qSsUC|lgm*&_o{-mLAsZmE_ka`
z|LyIAW!9(X3>KP8Kuq7L(<wJxzSsNSbo_ika0IX|J!#|m+fQ%%w8Ci!rlrapQ$sz7
zS&OG{f8|=3Du@IU&VqGXlGq_l@~VH)Eo2T)g%Em}&86)lI#B9Ghej{u~_=3D6A5|`uV+5
zO;HzS1iX)siJFO&-j(+K>=3DCkX5U$?QGH`xM?_*&_G!y<*-MJ>aSMrZ2X&o7YKLVw=3D
zeR3*`l>9O@(Qg`ivn`O307}O&3QYr8WbR|>K<&*o@kEi#4v%gcC6+|g1;pJj{(fqw
zXAzGS7XbidlMcc9R`pbRku$!RlIQwH1TKYNC=3DPiuG!1$SNq68Q08!g@^!+7I%Z7KD
z;|0J6WK@O`(tno6rMVJcmL=3Dxl+z5VH4GDOCwumHQ#sNuNjMAqE3UL#d{%@b!sT7*j
zhhUKNsF@@qdB2SaNfMSo$M!1$7#>Rl3{MRi-SNhFGpl!3Mx!DMADH)NUaX<N%u-g6
z%K8Sff34C4m02}?8}~BHbx%DyVTY;S`9T>N{Bf>^MnE56-r+YSEqm^5?@s$~DN#DU
zcoXP`&7+^nYq}@Fzy`AoINJX}e?cP`CFY!XI-tXsyGT&yBKsJHTJ|VCi1qJF-O-~t
z>w`R-d6}q!L1}6`>9sT*4~xL6P(4S@ZFOv6&Gd!glbhtzJJkGEDlBOt9c^Ff4K<Zm
zE-6%7All>RWvO+p(8e=3DJP<c~aCtAW>zilFlS5!Cf2&i+`pZGQ^UAX9g?f|LB+9Z;{
zBvvFg%ko{N+@_oS=3D4gVM7(uuX4BV?p5e4I2FuKI_6lGiAJ2n5>jAmG*z=3DTpKETxs0
z_vSMwK@Hf;(`SVpScwtqy(L;j6JqKMcoVy`8YEw@J20i`rEU1i40Q)w!p-vYu#<zq
z(JD>#8{Hq(h}6CJith#SrG|!Wa#m{2(K)Z-r5QR#P;ehvIGvhSrI)5K2N8h~qu#fP
zXw!K}V#EjHu24z{w=3DNaTA~#Pi3dR?bM9lr%ak`^K4Zx$N?_YPDN`h7)Lh6ADDgh{Y
zxYd|1Z#}*-xCAs{&4HW9)+QR(N2b;}6SUkr0Uy)$(9a|(P|Hg1ik*gEFMav&NDhB@
z{Hfhr*dThzFi_->sUV7J7@kz8>2g36MP~>;(*`I!wWJ1^xnNJ`7AwS1%Yih?%9ltO
zvTHQM>woAw<!Z){!@)~%ky_wJE5g0<^%G@wqXq$bN2r8Mq##jcdNYiMylypk51!I0
z2O!7CZ|9_~^NQE12Nd)gZwBh3y9OQ2<ye?K2zV}7r`8sOqcoFCb6?9zL%{icx0IXS
zed$m(^Ui1$rdfN!p`wPR=3DeJO~^-H@j6=3DyqRX!a`!%lB?#+uts2EK`ON8w5V*d>mKx
z<mPCPZGv8*q}VdY1I1v=3Dkn`wH>}c|3ly$LY{#fc9jTGk<S)yt7re?(Qr>Jm(vA*0M
z*q>5{Rau#gz~#+$Q1n(stH}|Nv*F8CK@T}0Xo*zk<?&eJ95c{NpO-{{g^t4eNQTY?
z7Y9t5$Y6}~ao)zlWPRs&K6v_~5Dc2OaarNYd0S}{&9_f(QGVZePT0iWE|0;}Ir}{9
zbtF!T>UOa8Am#y1qy->~`gpKN6q&*)Ig0>ez3A@Lj>=3DJ@d`L^z=3D-{DW*A_Tqx^?Cj
zy-@I3F)YAIU|)$X3l_1F1}^u#g$X(doeF;#V%8>4`JM!0w-f~R<h7}1FLk8!0^rq}
zQaXGNdgcr?(`(gxVs9{(J0hB>d2)9!1WV7AaX~*PqI9##?$o0DVVEuSQ5`uF3E2!W
zJ>_kmM_b38oZr0Nrgc6yRb@$=3DsG(KS%4GebA`3yk$?FaVO0}E8LoEYh(2RlSmEqFr
zGr73yzTfsX^$BM*NXJwzVP<`5fe1=3D^QtZVdv{&0*Fhq&Ne5VXP=3D2t{R@uwOHnw+M9
zCTI)i=3D|0of+Ou9lKc9AJ4y!8alo<05Y~*wm`jQG=3D*kEisN6Emsci6f$kfFpvz}8wY
z@~n33i8)7NgeqiG#7WsM6v@g`GN@rion>9!Na`xQxiV7HG^i;oewJVDs??g}9KkFU
z%LDLVm*|o#g0KRK+OCoptwJR|69AvwsUzBS7FpKm;|M1b(q8H(PAo|jsq1KmMW$Y9
z3PJMwDOYUEO};+|)rG3BENPAjq0AJXt<`5PGjax05*)CmK^-T2OIe*)_M|3EG34Md
zhPusm@2D8DGKQONd$aC$=3DtrgT7-Kil{p(%=3DiodG$nW}hhKnBdQ%ZdU*T4cCHg8`u_
ze-e*b#&oE}QkLPhH860}3*eZ7alO*l;J%3q{#;Z{4cRTIiJ;$tn)V39W`kBr1>cpB
zpy_elOX=3D}BM|>T*C5#;(l%`ozl!q+Jj-q(|Gmb=3DVQXzxo1_Rt?tfr4TP^qT8Xge`<
z(9-E$L)KGOM&vlzUE^-{xfQ8QzOK#MP9n~4%c_oV?vs;R_eOP+hS7x3P1K9rLWCUZ
z>`G3ko5kUknLvVS8NLiopwDd(LWbWev5XNA_-<z5th}X|q^=3D=3DH$jWOo38O02NN=3Djb
zW~oE#&gs=3DkrAr-1UGZgogL+Xm5myi2lrO|ls$Hs6Ba<Obq^%tr!kJ##-NxKUoQU0y
z;bCYy#CyHNb#9HeF2T&@P9MFY$9Gn29Q%)e!955N(;hE3y0}KnBYc3<oro<LbP<Jz
z%vPdOzay`!lK^83jYy@giqVv~`<_9rKzvNEFrs66X61}73XyyVcPlxSeR(Pe&PGra
zcemi=3Ds>!2PQ`E?nQoLR3y5T^JJi2I9jEUBFXg#1Zp`oJ}N&6Ltk!~O&oB7OAXfQH<
zU4w|^OLJZ%=3D*cDYT@_iPS(4{s8um~rT)zl+kcunT8JKZREp>2;4}p+Ya+j`Eio6e^
zgqStX(gg_3Zq779ge8|WkNDE8UbdEgf30M^%#5#-lo0(=3D5NpYZXJWjyrf>It>Mi+|
zDV;3lv_pl51~6hm!rn^Bb_sHM+K^Oi1k<5JFsNldd@>Pf5ro&8guRxlgJiZlgSEVg
zILK_>dDUzMX3vG<lXo*I(ou-dxo*d+FuiP35>upo^BfVga);(#BWLFsN(mw{!8@d^
z`zz#}dwb8x(e1?e-KUvI!%!+W0t4FC>Bdm%zMYYURiVDPLmD9#fEiAcNcyhH>n?)M
zu*ZZ-o`l?%J3(p4U$cT&(;Q}c6$Spn08ZEOxZUUrNaiv}u<|LBal0YkA8tN!d>&A?
zfp-vyK`vrC*-DY2tjA~q?~KA8zwwZ)PR;ydYU59%wiLSH>EYNK>~VHXYz9@=3DZ*n-)
z(|U<AUIobOEGyRel>=3D^6=3DEKeJ9!E_4Y;<Sdp@|3YVyuf{F%VRZsNA`E1AWqZ_5!Z-
zN(&HjW;QMY&vW#rgsoaqhH`v}2O6(eu6Ll;U9EoGh@*NQI9juaNC+#m=3D_o$UP?2Tu
z)7#pM+Oj)`gN&E2C8#{(DWX6LE}hQ-@xpXIgh^^eJgu@f@CKYcz%y`S#+6o%5CPc?
z%HSv~bi|dRWj&;c!l0=3DQSVL%kK)Vu#PhM71SvseUNh8%EZE9XfVcofQghOia_QfK;
zUh4(y@sWV)m!;T&@yobtt!&WXO0uBtwl`QFf_fb2E_c89tFv@-aVAahmcsicCfYG5
z>=3D*}07Gpd$EzB|6<oq2UO8JMghAxnN4tmIAh!cQ;_Q~lJiXz8GDEX-Ji<|3VNtI4r
zda~y_xIYf44*0X}<<3G0lKXPk5FyrR+lA*6BN_sic|(k(icIDM^KC^Q2Y(gY7HU$}
z7-{sGRU+0iwA0wy%Gv9pyEV|`_h#XH<;zQDO*$V1gv3`d_JwoRtKzDB_!2G590&*{
z&XSm<5-09YuLNGD&CCTrDn0pLyoze25;H%s)HhPj5}osQsHP~e=3DuNZXXmkt?a&dYd
zj=3DtyI=3DEPo}Pni<js3XQ5H>{E-ZuQHLtS^1~e0#$3oV&p_o$RRWouEtP-3+rwD6e|9
zlB)D+P?@S_MX;I<9+NSo8ED)UEo2O^ka9E*j-oa@|H#k;5rUgZj$M@<my*P{J5m*K
z>C#o_4kba8*^cE}Vvh(fZjy4EdZQ`A#@^>{iOI=3D+=3DX0%}L0K`Hq~gouBB3S_G)2bH
zTW5%$mlj|lMuO5u_~=3DlHR5AzjnWuz!QQ~c}sXU!haz-P;{YMwg!ZyP%UDAzI{2aV@
ziwP%KEP-sExbo#!(-g0>Jf=3D2$P{?)}B|?w;R?iK{w$%YeqRnI3d~tYd9@f&nr@pK5
zIdRT}Foh`fGwWuMk3XK7o1#|W$RBwb)76la(5v=3D(MEAWV(7gHma1q<z1fl#y5L#)e
z{;rqz3Endl5fOQbV5D672v~q0>S?mwueWRP9*e5A=3DJd!Iu$`=3D$Qkj;9*)@q++zbkE
zfNc9VL6qi+iM-Cnl{~&df4t@wef_cQi0qxbqVgx234`^dsN$>2iiKj#tbVv?ER4Ad
znyDfx70b%+X9e?;BW_Bya<7LOE#8NRT#-XZ1B+!hP~W+5wF&a`vJ_5|v_dGj2+O<k
zJoGc~IW3z(iR1l!tf?*&Clz0nQ#ZQxfboF~E4Vx<Ud2OM?SKNJA}bY_$Lo}OeK@K6
z`7K#4($Ro`A9|7r#wv(BgOrK5n;_oRQqVE;<1!w7CYUO`l}gTOeM-D}U5l%j1{6$7
zjawvk*4}0KKeOtiUKy{T&l2}ZZVw|=3Dzv%ov7an{@^UY%$zZHfXv>w<<iV#q(@{)&p
z<^e&e7hPCJ0ht@sve1{2qMUR=3D4z%PHfLu~zzB2~NZ~GcwD37lLG~&1oC_GK80zSgq
zpx&8THB%%3+1a9BZ86(2FOB5!hCx1CZ1y4&HP-ZHGMDz_8=3D5$P;(1r^5?0X*-v>yX
z-FBk#_R5Sy>PrCq*;P_`M~c+xJ26scvSA95{GT23#l7T-DoN4Yy(BN0p37S|s#vG<
z6W&3JfQ~Nb(g#1RC4F6K*fWP`-O<m;P_4;A8<rIl7%_}Le*5^E-=3DM*j9TYl(k6x?;
z>e7cL8xY9_fVScbMBi_4T}~uq&)~Nv0Og7(;tJ5?&<9#W6ce$f)5Lw;bF4|26s4&6
ztt_f1K)*|K3Xv>H|NTi2^1I^2JnRnu1+WZQpOI!iA5|vOPwH8sNpCTf>_&<c=3Do9zf
zc}#DfmGIq@suR1pyY_Ab)M-{gV;Eqf{faE!l*_bI`7JbPE;+m=3DU1T_z+BujSOv<-@
zwp6mZwD<nvx{OqR14*Jy!jALuA-nhfB9*xR_YTJMiKcrB&?^(gWbB68%IEl>DFn?&
z=3DV=3DJjfvoaAC=3D74;f}B_dbU57yU0lT7^krdyYuK%lYLAQ%YXJ0u9H>Ws5UpGR>|<2K
z9N0Rt>j<=3Dn)$wd-as6obara9BrNF8M5~g*a3|n!dI!6X%F&^|pU0&!(dI03gcM)_z
zhzZ&Zb=3DV~CfBAIn>13hO-8*WTB5ihn8yzJ?^rrE%ewuE{@yEOpvsv8n`YmT#UPW02
zT9cBozCQJ<B_oeMneAt*JI@|ekJen@9>KrqYh5l;Xw7p}P{cDWB8u<z$^w!nizlOb
z{!YQ;hzC?tHQ8>=3DOv8>&B2zPsgbp_IX`!wwV{q@I*{pf;1*KX>BA6_jGCdC_x%#yv
z=3D}@dsV^t!<_56|TM}_mCj|JHvh=3DvW=3DET(HPQ&nJJ42=3DUp_bmI;lkybe*7%w9$l;S=
0
zu9nJzsn)vVt&>-;f>Z(*Rz#r(hu^q0R)%1rT&u0jY&Y{>o4jbh`yt2Q%2~vu6~+DG
zs5A_o57%K;P4AE;_X|`Enk-$bh9;$=3DbEbKoS*u$ed-Q<*_FfwYQUIA=3DZ_BpIgqJv0
zbH6VrW)3#4rH3u~jIa7ASU&urcYj}pX}{b8G4A2nt=3D*+}U*lp4jI&+%(e6v%R(*Zt
zMP4LEqUMqY10Ge(4`~n)i%fTiHg=3D_%NcenD<xq$_o52_s2RD_GcWmY>F~vc1m^zZ_
zHx|!V;8}O}*KC(F&r5^3vuGWRzl{K*@sEyuBW$Pzs4b<zJh=3Dy;agmQ*43Ok)Z;-80
z{F)i!K0<QQXA@Y|vwOLV!e7YRGMljx6Jm4ZACc&(uuNWoGnvvo(kdcAmfDa_E8L|Y
z`g4kqoXI*|fRIj97UUMgvanf_CeQ;J`yzyfvoqqXI?-5w8I12Xk)56xT;h{Gg3PaA
z_Y;3hv+y#<)}ULHg7tR!{3GhG`9CGYT=3D+vWKEA9xlKIRyZN8u9Y8GH>(TZf^H)SJ<
zxbHm}j{l${Ka(>KtaUiW^}{Ug+J1(jX-T5A06$aIeIKSD!SUUO*mUc`@YZto6S^GZ
zDYghUt#&jr2^EVEG>O#q@R`w;{^h+LI@b@c1=3Dl2R<)LZAjNEFYU!<vJX_6h9yLvu4
z%walssslPLoZCw=3DJ@lFSsU&<wki0Yw`GpP&Nj=3DJhvo}D;**0j(Qkx7u+BFJtPI=3D+t
zu|BnMm|%!08Quaxgxs=3Dw=3DDl+R6bQCAW@T6!N|{MR$i}YT0}iMKNHes@`OV%tk#|W0
z&(;ERe&Yyq<mLxq;0^)y!B?>mneKjC1Y8&b6uUA2^Dbw6aVuGWT_3RaV=3D~`ch%Y|y
zcqd3WxLZEH8{4DP?>(rcOE;ZomvUn_;@Y>Ch&lNOX!>`rSiHd3inNAq7&_TZIlad*
zYW)5>U`M9YQ@dc`!v^ysIb_T!A$N<}F(KA-wLlwx6%VCnj$5G8;f)!7;`Ze7ZtO6E
zrqMI@YPC>RliV<s9I-}ptb=3DLnS-v2yB$+UR9YkS+)4coz%{<68D)_d^?AN``%fd8u
zdF`QN9@wD!OTWXd9fQ&-3;J}t!r1y2<D|`Od6c`Rl(eb-c2-l7^Fogb@9xLf&)*Mt
z1X_|;B^}~oaa4~3o;rz?YM&*|QwW?Z+n_~@rPlq4MPzez98OJ5b9ME-6L*?JSJquQ
z@u;ZHwxElaJ2vNTHghVmY4v!<5?sr!Ig8fCGnr@PfB53TO+BG3?x?~a?$i+)m|BP}
z=3D3Nz4Mx;U-=3DwYh6(urSQql&X#<r-bcAIVs!idh!Yy@XS%UzaQ&OPi)N`Q+C44Zt$H
z&a|T5eAggIDw(9gNNNj`ee4jz@{(7Hy?~D$0*B74kk2!1!5{OY4&mD~Prm}f$oZ}!
zZ-{lg2^L>Aw6Ic$@%A>T9vbUuI+0_Siw8dBG~?Bb*TCYgbHtYKWmhbuz8i5nj!taR
zg&B7;@RK4?e!YfMU5QQO3WsppvPLZksbSQvZ8ATPM)C|KeBn0Z{n~%2m%Cb;mo6#!
zNsd+oi=3DlPnIHK^Pyw;DSWsX|k#aW21u`0~S!lj7K+N^&liGz5;!->4{)$JT8PZDBd
zzkz^*!kSFZF@vDj;rSi>%w=3D+?1hzVQ((<ZqwhRtkZg-o|BtnQbSEc;*X5Ta;tMjsZ
zJckp+ms#fMqX5MZxK+!~VOPrZ_*mlozwb~ot7T3U(bv^~0qp6#0$hlA9NS}xNhxuU
z7{A;KwW^~|%5XHuX?|C61s(U%kq@i|w4>XTdU!C_C(tPsE^%-)zc}c!Q1C0DCm(+@
z6FuejjxESu|MXFk)v}NFNz4yC(o6Ea_3~Q^U0nV8q=3D8q(URAEzuDLoDdk@}AKT~3D
zgpC-1)IU`Y9uxk+S<TEpl5|$Zj>w>z!Yq3%CllU1H&O6j?{X}0@X!M`PBC`EbE%^X
z3<o{Il)6MRlzx`whK~-jGotQnQ_%hdeRf?R=3DQyj~URvHg+dC8T9`3IYy%>Ep3|rqi
zthT$z=3DKYT_q#7?~jJ?~#B_fbq(@mjh^kV-^{+$Bi2`77E>#Rq~&+0AL2S>nq_|0Ji
zuX;Wc`7PX!>S;5LYIY`KLqAvZ*~h+hJ0Clkc%bI`<FOawsieA@?>VcJqLi|Ug5_4e
zEK)d#zS6g*(e2J%KBxL<Rawy9x8PeCiPbjZlhhJjz&Ysl7dpf555_%)-)On84c0ER
zUCxtk6X*8d<%PsvpO)8M&#?k=3Drq7^CZ~uEG<Mr}$cas+GuRQGF8`fM5$*VAYM$v0;
zyq)9~er;b|m=3DI$bp@{^dkKA^%8&q+h8s@tq<}~hqM9|WeUi!d*Wh>^Ire@qMGa8kj
zKe;?FB7PI>NwIKP<5orGR{PC2ZZ`M@u^GWb9WU=3DcV<@pvg1nj%Rs3L2pYMx!sd0GE
zlIx<pcw~Db>E{i&zW%wqic7vu82rA2x{HYMp7nY!HbwPVMv$-Ec+_Zrbk)FrMsz_j
zM`~YbX-Q+@A|ZTcrexK1V+8*~8b3o)&yMjLjzU<48_>HenJIeqUDXU!s6id}>&N<f
zA{2D#=3DU#kTVUK8b7HnU$Lq6f&AD%GOLi7S%zpt8NA>4WRAc$(jFTSt4un+IvyYVpF
zHxlO4d2+baVqaR`D}aNv06>ia(37z*arqu_|Lh8?P2&cS^;fTNCe)Mfnw-1n9Fikf
zqFZsUFO@G?Ek~kH-xhSh^rjhUI=3D)Z@U9jH;JQjM$(*Y{I-$%qCy|+(OJu+8HJ|g3_
zyG93sPHe^1{f$|4V?@yAK|kBA?G+L~OM$$h><6G)?@Y%2y<dM{d|a~e$Y3MOlxAEU
zV8aN&K1*p8s%&~;HPG!67z04(zBZ|ZfkT!HDyv(g+RZN|kG{$Dr3*elqR3Ir8;zhD
z<r`M@-T8)6P#bZkuWP<w+0(Djzo{y9t@vnIU2+hK)d3^qx;n<y+(@;{q!2+83i{Mr
z^?M%a{jiEq3j-(Sv%)M4X=3DhAJb};yhzd|#J6K&4)tgXrj+2vH}DzOMrZqB_hzf$MA
zd<Enf<i>76xD{|(rzhe5W~n^J63DKIyDF1@5ggL)A1B&A9k8SoUjxOzgM}1hHh|-r
zsx;OSzFUj<)20#lIEOEe=3DBe(ns%H;?&dw5@M+Wy;RH@&z_)8w0%OII-ix33_bJ2a7
zuq&W4;AuYJ!+6k>w50qN&HxIrO*^IwyOWA!(M-rXR30dvRuOdGpD8zLT<VA*y(j8+
z^AI({_U%)y7%KidQ!W1e`Q+m|v&s)aEo}qNL?GrAAHG`dI1pj&_+ktc1+jK7%@gs1
zj(B-#6UA#FEgWl*hT#)uS<(Oj#NT+_Y;wkphiMoO%Jl}A&$q;0aN2K#y%XMqyzW?r
zDYA64a)zUl|EO?PUUdRxN#CGP85VP7)E)+N+?SiSz^g>2L*aehagv9MpyhSLW=3Dt5N
zjo>&;<+oO&2ZUkd=3D3KezJ%Gdc;hpRa98pUgx_KOSxQNG{)RiENFiFcNs4(4+2CW~+
zF8G}zfPB;RfF-0vQu3_LQw^71<wzHCV!Xx%m!{;@YdwlvM{^Z#rrBeeA<&3d^ObR|
zESW;!^(O&div~N8!ERZf$6yr)At39TY$pqRBySMuBhTVh_ya&{Ee%6wO)I^2Z-oGm
zcU3kUMl)zTpK7N+pJDLcUb@Go$q151(Q8sp)sGrpBH#J}r7uLXauTluc)Nhxs6iHq
zqqOX8rN+vQR=3DW}-?tTR2d03lDGG`hgA``R(HyZb4iKT$1S_P2#nARHU2^;Cl8rPE;
z*<4dB6dVgknszx)j1z9rekD9u^2zr4bdDKlzt0D3x>xjBzG6_ULcX>!HaqZgBQ`Lp
z8nit4#_KivdLcVek~sAfWzKJ81#<gu%%Fl+vzX`SkZCfgk_tCY=3DFNCTlgg4|CV9TP
zDF;B8fv#fVs7_$jJWw-Hwt+Eka04Z<_;`v>GKy9+Ok1GWN`e*P7>L8kq7_pML3FU7
zC#zq=3D^%w&!|NHSOwgPiqaq6H&VP0+4442XS=3D+G}`R1>s>Nxc4IhtNL4ddZ4awgNhz
z4Q%g7No!VO2VLgIs`v}_q9*hPya`*wzraGexh(?uI8=3Da(Pb(6iA(e{J&CHnw%>W%*
z7UOz5D5Ts~dsd(&CJ9-Q2Sqd!;n&FeFUZ=3DvW~tdWJll>^*tPCZa2s~d66<gr8}g&4
zIMH-*@hZU^BY#q}qouTOfx~4h$F=3DGS-c}ek?mTE1VRx8ndJGr{_nOcGVy9%qZvlw_
zJhU(Gf=3D(F01eH3=3DHY1ApkWexN8))_IqB*NeF{oQEtNR9UL@|OUNXHDJbxL{BW&~Pv
zf|=3D4PWdVx53#bcZdx3RcIFl_tjgSSU!4mSdhAW`fo@zTcKzyA|L{GMN0a<meGJ7#c
z-(fRHM2xsI0t0<LrACcHq<Td956J=3Dla?6MzP3Ia$XRHFST+f?+ZFno!6$`1P3?36Q
zqy^qpv89NA<Obf*`PlwmQKb-+x76=3D~_aVIZKQlAvU^0=3DWnar+0%p!vDo`%=3DMzr`42
zR#}*#2i<jH3X(!)kZ@fh0<b^QT*Bz;$Gi$|<2sdvE!|uq21)Bp{7pA3<>V_>vfJw_
zX)YFv)8F|P2@PN#?BYJ3qZ9KLrLW$+djIp)p8de5)^D>PyH3Fj>Rm9#35$DkBy!HU
z(kU8;?Y-&G5&N>HXsw=3Do6{d72U*fq0tF8C`9P@%&R#?NAb>-0&orUSFy)DRSxkebl
z^-EHHtB-T5lX}?Z+17{0rpFHphrC`6ATn4DnZKaC?aSoF{Ulx+)*edu;lnylc8m6!
z5Qmb_t2H6lOP~uWl)t;P>{~WXM35#EY1Ljg%C$O2Q<l4>ta$AlQZT1ttj`haJ$sw;
z7fophux3eo<~#9YUqjgCR2IRTV2JDN(0uT=3D9(WrPl<})sRX{t`gjnZ4avQ>GDg^hf
z-_DAfmyCBv=3D>2So7W;Gh*%xPrB3EV6q7W*HOxQW{57(+IE%NZF1;W*fHKkw)R76U&
zj(PaP7wTTjZ5upGg!EsOfh9y^VY3XdaHfT?wk?a8i5lqxg-F33rj)|NDrn8>vL(Ef
z@5-y>?QjSWe3^fH<Mp=3D%0gn|!YTjze0_Bv*a-({AF0!EULLZt7hSj{|aFSx*<<D9}
z_mtQbrf5g<%(qbPV<IM7R#9TIC03$ZD)j1t3S%<V9=3Dbnz-(ojim-R+?P09=3DB{ifIL
zvG=3DbZ+w`%d*W45mEFKzg{K2B&(1|`Cez`a>C3BD2T4&+=3D#^r2K@1URZ&#h=3DajGT_j
zja=3Dd=3DlFP3T0@1ARE>3P9(19xGw@jJmgfqdR_qTWq>!g(KvMiv(X~7$i7~b^jG>K2!
z<}o%8p!Y!A&SGy(H_23^hlBfFjCxtR5Phh&8E6U2w3+-TDqu*n%Kg|ZVKMxL%I9d;
zg0Y#H^<`ZJXPplW{&B3r_y_|bYshSNGajNC^HvrOd$Q%u_6{^<VrK8DsHhAKyw2IX
zyaD#uMP<iFpm&{_#pM|Bea&PRsRU*1xq7kMHH`#LIhzj%IsvQhvyo)XBu~~~PZdSr
zKNK384~r}A<PqHS5EJ^8i+E6|G3>5-!(<o!*xtAmBFUEMwYq*y`;rg#8~@w%yTX-k
zp*Zvmm$*{-a=3Dv80dzn1;CFYIRH`&dSt0_8a3B5iZYaIQ;x!N{bLu+=3D8?47lI#WFdu
z_gWMs(#0(a#OrngxN}-$o#wk9l%qEc)J=3DB{e#Us|Wp8;QdEu}yI$K(}d@48a0p`ZK
z=3D~X+U7JNJLhEQjwex*jWPZpP1!Z)I^`S)5M+|0Tl;P(yhsYSb;qhde9W4G@@k;MFG
zMs2jidaiQ6v|CU~i#i}&SMU?teX#I0S##Ur0VX>?z_flGWlcPMBp9FulUOTgKbhKs
zxp9+<*966<Eq7*vxV%R3+nvfYzL-*sno<`4#_3%rAYgE!BPS4Ynt0vh<?=3D-X?jr(u
zlJ}5v@dqa6U>fcgZu7RoMhGaf{5Xh!NBvUgqQpn>C)SNi9N<-lv0B7=3DR(7Ua7@xGm
zhsSoV6)R+9YuDVyzo6O7#H^n55m)$qtg4u1GOd2`mA=3DS(k}|02)sC<NwVVUo!83BO
zO~=3D8q7sb2l&)C%4E@^)Wa~7D3n+<vDgSVnKZGDt|G-Z9mp~nbXJIquwup3(J{@~3>
zxzDwrg(|mTp~thW-Uf}nbTRaz+4B8oRrOu0?q7}49qd)AxzQ7Z_&D~q*xUStcpd0T
zO^#Ukt{ul0Sm4wVkN|mU%^F%}bvZptX>obJ=3D=3DFgpI2|KNc?h1APN%=3Dhy41zw^1fBm
zbzzSDz;ABd_2`wj``1u8VVOld6&Nl#kK(&C?hmkt&qKZ{hd1L;Fg`zr1Vs}}1q{!L
ze&kl<i8iTwoUh}-5!aE2M6NzSawvehw-~n4Y}519b05^bslt-TcfaXqBb$UpO;J2-
zJJ+_pW^+B3PE>x2Om{rkhrrpEtJ~svGXCqKy~Q1x3z_v;k0dK&85JT_{KR$^-b3wt
z9^=3DPb9K<11;&~+=3Dy>7gd^XW}>hM8*g<s|=3Ddm8+4urk7VLo1e3()KzLfaVNi!S%5`X
zSDEwGt<#7ixi?QgsX>{ObtO;W;k(SpWNvBbC^XBQEHPr}u@3)*l6adApS;$ajjmHy
zShAR1lJeTjF*Q3msnQ^X)co;7mdYPwU}3xTaLosD1y-Lj4ra#k>@TyVwceP>zptXB
z>Fu%fJfvEt;)@E*nltOwT6Zkjpl)ogMK8b3?f#gw`;X0-kclr6*2dh+-FXA3>UfnO
zu$JC}-wYvuZn?X|kRh~dx?UpwR?ZmXJvYrgl~{TSwU%8v<%mS4Jk$pV{Mf4#`N7h>
z4;%&S6#Pj)(Y*1s7^dulSc9Ol_{Q=3DUIpru!`Qzg4&;k5K|1LbL%Pj(5LknZGlq)1h
zcTRc%w#NJB-9eyCiqy`3XMK3NmA|gb<bcInfF)}@No05}xY4B%h_WEoPn1okuk70q
zYg~4Iww=3D#lB;CujjXOAWk$3UG8$2VnyHppLqsf&9MPNiO>?+B-9<BKuln@=3DflcSom
z%<n*ue2u8(G^{3ivNRH;wAkRc%4V?bK<iB>YkU!Mmw^yuT*4MXL*e&9DdHy-)(%O&
zr2+s2<L{twwM|X23Fjrw#-)cdidI#&FKqVinc7xqy$pPZS*-hYN~PLh?3SDt`R>?-
z$O7Vp`L4Kol76?T#cpw4`{tW6qsTG`gZF%9uS)bHOPRpA%HhaqJ|!TjQG&zFt~|mf
zK{50c|E*?W8P#hH9j>C-EHhkYLtQ`0(L}F}A$Sg6<ynuzy#3`-$qJFN>bI@^h!PWo
ztTD8KEo0oaP_BlOox4?QX)l3vL_H#d^E>z-#rD5pJoz}8m;+kK3~xNRO&XehIGtGU
zvZb~%Rw{N4w#A;x`MN39tTPtjW`Df}5hAFQsiy*)ZJ^o7I4Zx1b#pnY8K%ys_j|VB
zuX5?LHVE6{TrNBP+Rz%T3(bIYdaXysqoq<0%f)4_Z7p2im5^E9t{Nuey8?-Qy)0Cm
zk%Qm;?ybi~J_Wvlb3y@u<hHM}C4KJPaLrL*l#7&&65?XAJy-kxwf9z0RYvU}pdhG#
zfFdCv0&?imLy2^I=3D<YBM-CfcmA|V{QyHmPTKuQ{<l`a8E>DdRx@B9B})|xdpb1`eU
z;Oaf^yZ5u7+E4r*vdONv2l(-WMe1b;E+Z2>!uZiFHO?q!tfdUu-e*IZt)ypmBh}7^
zi+21N942RZBCiAyL6cqLB}%ih`05iLek6(yTi)Ts)#K-c@n}-_FT;m2Nrj6{n^=3Dw+
zo+2=3Da`l(Jn$~WG18^=3D3b7`V4KmLVYa@otc&qj~FFn|k4pS8YeqiSjQ70`NGXjmr&E
zpzW^j(I%e16XyeMxli-$OKbfieg_W}=3DV&Ap8d{EiJDNrorYQJ`m!jhlo0Ic7efg9I
zQ-bVM2Aa%L#Jum!A1h-iUmcA+=3De2rUB&bpE%3+wdF9QwTHryO`-s?!EH?u!2*QBDU
ztrABsY(Zxuc(uNqZA=3DyMd$_NrgO+CZGx1vTXZTkT^qhM`<d?iIM;|G#E-xgj*XSa`
z=3DdljM#m6!%*eU1cXVWUo7ltzD^8s&9>po`@SuBVsmKWZI><;>tDnIkMp^r;~(D%#B
zM`THhfJBAz+|S+ZEt()=3D;ecgXrNR=3DI{FQNK<$}>7<&+Pzw;QJ?7#v^s#fh6bCN3PK
zL{txTD9siYghwCtjTz)*NNvro_H@3+hbq&NJT}9-I9?1`4rjKPUP}o~6Q6EBt)2IH
zm`*}~*`Gv2uCTN)VASn}g}+t%mj9>K1tZ~LpqTq%Uc(6kf-S?Q=3D{LfGys^16LtBMp
zlu1fysc>|pE<{>q`%Fz^9m_!eP>Az2duLBH_4N^R#V9Ujs}A8Q+0ujFY?}hf_?N$y
zZ*Z)3tO+QpQxjs0V^lJv+cm#K=3DPy(}t;N<_oyxH-JK1ANdP;Q>cC9nM<~Ocn4qRnV
zuQ<kZHjj*eRV)5NImbx9#^s2iSBotwspFeXMwbj#=3DIv$Iyg-^5uZ%NC<wUC})8Wj!
zmV<kQlrb)M_Zp6YA!!bkUhy)X&wP?|qV=3DhvIaWPg`K51uc}h?o*I=3DFTu5n6g+?yz7
z)5?BNi|gFGxm)W`A5g|nWPh2eIk>QnHF8|~9K)VJ`*<P?o)~nWK2=3DT)%YbQNUBzOy
zt{`M)MOpEaAgB54+u`4e`$8eopPeF)Kj9ZB;hlLxDz?Uhi(WK0M_D2;q?n*<g~~Wn
z@{$+onv_EYZku<14t-)J<8un%x~>u+2@TaDd@VLd0soReTgPAfd(H~y&>d&xndgDo
zZ1<tp`CvZ(x-)(nb4;bh^jz&NKWwbiYl9<}`4O|YhD#Pv&QIA4omF}Mm<;jIo~{g=3D
zp<j%0&O35Rys5vaZVXOD1Q>l3{v6qpBwLyloY72`rLbm4yt)>FHJmOhw$|@PK|p_W
zR5%Ah0g9V;zryqK6_pC>e6v+LW>8Qu5Y>)jsw4t#t3)1p6;?E7Pb}^iOxhzZD(vS?
zOeU)`=3Df)L>myd|UBnIAbNEtWh>VzNH7R!e94AGvaXWBDDQy#Lv!d&dplCN#@$?^Y{
zP<te<b|MV5Z$8x1FJO%pn!Y(6nD;z$!uW8M@0)$DbzHlo_xl#R?Lm|zCZBJ6WhdqJ
zHmEZ`uM^}Mhze58-e?Y}Q;+a-G8C_%D|<hRF*BFft_>mk)j3bA%xTHZpqWXhcXwNA
z$VK`oBmQaVJ@a@0w;6iG(T`RM5<Vw(LzCMDJy<N}9P48X*a;?`d-YFv^3^48(5sR2
zx@^B^<DDxbkJB)dWR0)?0w*DbRn6|pGZA%1)SjHnb6OT>QdnTc(C&wSf1YVJv6pPx
zSF<^)1`@vWd0OBqeu&;AzQ)M&92ZjRlC!o^{n8IFy1_f~7{p_KcTsBZZ+~yTUMVv+
zz2&EHud<srutj77g9H>aP#4#L#*Sogfl~lk&FdRe1dw}V(+&1Mm~fb|tK3X_sE7-_
z^`Syem<@KA=3D4gRtzP7%7lKXiE@rB7`CI`FqFonrXA?^OwOf2V59-{9~K96E5&l|*j
zOK7uNm&vU>&T7h4anPv->xl2I^pCqr-`3*F6~e%y&Zy8iHhvW2<KmdypCVjJxwtyi
zG3>D-nq*z5(ct+Gd*iELn!ZP_?9IcU$w!Qi3@=3DG7jgoC1SL>fiE@I}YD;Ft{=3DE@%#
z7DiFYn3+uFvdJVpMF=3Dxu?5%N_h;giQWVDwvKBl2p%*a@b!)5df_&VDhc;E{sNw?pt
zi@$+Q*>4ayRo3h)Sq@KaWuxs=3DWTVE(77Dl_eV-BkcW5d5sL5}(#h$2uM`Gt&3lIDB
zF4muos3@*l9@z%G5{vF2Chz$A;NJIdV6)FlJ{gU^imh~Dq22nHeHxwv<jeu<o62nu
zJzm!*y(&y`UszTHsci@H#mY24y$MX>OWd5Umg0~cOJDtfMa*;!ltI2Klw4qf%^L=3D#
z1!}O-TNJkvc)JF*(?8Jx)$d8gb1m3~D)pn`oUch_BVWFwR^l`-bT8$tbaPzK11&&M
zf1~jdYS4x;fIH5vsOMbx_MEhO8kT9vM?fizHpAN+&m9J`;0v6;s!z@yo6I@H_$fF&
z=3DMh5I1fi)CZ5<*JP(Z49zE<=3DsOa`<u5%nbvybbj+TJ<I_+Ztw`sB=3DfRHy;Wy8L^bj
z=3DvGq@Mjv#yj!>!1ET=3DOKu2ar1aO+C=3D!4unHbv*-i!5vqzg@@ny*%rN&CZnNIE}0yY
zFbyG)o;BdXl<pwokvZejuDG;OeYACk|0-JTlf^SoZ)wq!#Qj7@uPkw<-c6#Mks!kj
z)Bjz-W-qB)j!6u;(dLf%o=3Dl)+PVi2p)eox2pcJjn<`)xo(o?nZp&7*~d#n<Dj@L^Y
z(ooxluX0r3jbwZ!Nt3+4#@O1L@ZNRMMoI@5Ve_$O<z>BC$i#-+D=3DefGdAk51PHBCs
zs;wHJP&Dg8kHrU}P4&e3b`Zq#%{%J+WY4U;C!UH;&bFl(L(;6zRMyk$TLvDtWPk8I
zp5Lgp7u3noJwj<WOBV0JI3<@^MEnXLq@(EEpj%*Ot_>sjqAm|p{^S?pc6anMXBP}n
z3b_ZVvY3A+nc0TQ3%T>dsY`5mGD2$dEUX6^lsG0>fBNYLCg)o*E0yN9Gcyd|xQFjq
zx=3Dx9)R*C{Vta~CDVL;-w&%~YGPk_jS=3DyQsm`;o8xEf#@88P1?#wM15Wc->jl!Pb-n
zdPFVVPkCi2gV-<CM*C%C(sUrok1Uy=3DTg`YL>J2JFzK`bAAo*bDfAE1yrSt9*vUQ?`
z5>NYAt^N9v2xrhE;G5jON5dp{M@@rTGCtmgF{WN9Sw8sTgoG`)3SD=3Dt*cDRM_m$?f
z824um0+>awb}EjVoIl_#lCF*9#Mnfrz}Na;_Y--d<A=3Dpiyi}a1I=3Dn3~nX|~+<^F_H
z<*XXzOqutlmZHb{qy`2#mc)qZh2&8QBvXKucflRF{(iU{nUo(6XAt`*)kS#DLkeot
zS}qO3)JAK+U)t?%tq)82?@MT~FXL)9IB|wa_n3c9cMj*)Vma6Ph$Dk<+4_9AddyN9
z>KByMn@&V+IPtXXWuGziM@c&n7F4|NqARP`*ZM^!&O^#T{&feLh14=3Dj%8%>f{l{nP
z(b+%TD_pzuXF#_lXT5;iPWbW1jgC(G)2L)n077UT(<t{lh?Q4jgGO85gGDVMmd>J9
zB;r1uwsvBrylxhZW;2YG!yc0HJglWJ1l1-gf#3aEhke_7;?};>s(vyI1WRIV`kn2>
zBt4flVVBiY{isms@v`b;nG(4Z)qXXAJCP3hm7&=3DTo!OueBjPOMT7p|cl43`%kn!AN
zG42ZVp12@&3}3hG(pD2_KXnVi$cX<k{~d)?AzwklU4A@tIo^2*gk0b5uS%0K^4D7Z
z5YE-DuhC!rfjO?BfRhN#1dV<DptXxkm$hM$h{HtL1wgrY+HXx&i@*?&U(S6$I(Igw
zd2nLBXjf$--u(QNf;(bG31(Zv^Y?hu0l%Skxbou+^VfQ|wtj^7jgPUCRte@~3x;i2
zTei=3D~;<$<kx=3Dn9SxG!`O$)I0e{MPh$bF|w?%H;f~Pu(`8&m9*+5{HX5ZpQK+aB0?A
zkXNoVb#6>ob2BFh_+T(#;$cM`eImgo<_nsBnZ`)iBhJjTJL_PfBX>^%H`AHXL4M8Y
zB^|6p`2*=3Ds4;Xtuc)nl(&;Cn9wLypVG3U~<sJ$~j<K{#H?OXVb%J)6zwFI2zUcKW?
z2!HrJQdNs|4BL(qVod1WIq#itOk<JEHZt0ZlPZR$wQAdLmRQ~kTTYf)>Zb_*s-EH>
zE&YYewFHNgz1jqkgSD9cI@MOx$Y|<oks|FnVUF(Mh3+1=3DsCJInV*6y1guXGNY;@6b
z>veHyc?B!%Yb+W9xmDB0mGDB%y4bIY&!pVm9V{6N)LjTxeYh4C*{X9ecqG-;w!IY6
z)5K{mzXX~&86Vw|<(_ssJ1+0*R~{U2+%FP_7SKJu-i{wn&E~wbV7E3*U%~lw$A^-8
zC!VdZDHeHpt&{c!x5at2KpSi<mt|rGIO`)~uLQ1&U!W4tcEvl*_K>;OuuJCJmveG;
zod+~OEE}*8P#UQSFU;YGbBYL!$68PlK7B8n$tDkf!o#f@@##sf%z~S&ibF14BTDE2
zN*ry2@4bBrLCSaFvj!ub5@F-b1mNU;){kTkkHN&JZyRk+${qa?{XC?4kRTT{%n!U_
zN-rjn)heF(sI?hxom4s;tjzSWq1*3pi(an%H@n9Oj%56vEwl%DyC}CgT4{>mk(6G%
zRpWSwv;W}fhl_Vi<rH<r@K-F1;Z<GHpXPUF&l}F85E9hvZNa-_AF<M*?UhNECU+3V
zO%h)TWNvjrT%0Z_wHUPQjoW^OeiH<SHmas#MI4KZ<@^0EL%Ae{ty$Nj_tz|niXUw9
zR=3D3hV2|4aSUcOmeE4M@z8KN>8T2E{^;12mpDJ+K3Dy8C&LgkK57gulkva9B41r6<5
zYS#N7Gmhg$S!lEns?O?1B6O_%Y$P7M65FC*JvI%`74o2q97L8vC3UssZkHNE(^LFg
zX`#dk4R)HvkkUj%3fD&)iKH34sZ5!vzP(3gjmJRZH_PC%B-}BjB{=3Ds-W<OeCx#>l}
zlOb7ChO#)Bg)7gMSSP{dGhn@$dJmeoYf4-ye!`@dndkG1I~8ec%VLN6R*BQn5{~3f
zuOFU+zRH1gSlBmj|E+d_g#w`&QV{fU`ii+#jWQHMBMs_mT`+PBNuqLOTg{}F`p<P%
z`_B{D<vZIk17_wWaI@v22tO>c(v&M5cu~Bpl7y(nUmSQ_xd!3wleUqKSVpb`dM&-L
z>OMK#?2q&zqLZEa&HM9sM2fz!hR5hMFeALt3U;nj=3D@1m29x@goUExNj^RCD4ctOEr
zJek2>h4+_ac+QH%T5Y9es{8ZjWrz7mvuQ;ZT`D^MVKi!U^a1o5rj87*tM`>FC9P=3D?
z6fwn~4et9Nj!!v*H)rc*M!Jc<-|yL|-a(gwj{KG`kdnu{FcSN!#|I3&kjSkv;!>uV
z`%UGHW8qF;D7#=3Di#14K<@3LcTsvTLVG45<uZ17jb_32ozd3q?9G^rM;O)m@E?H>Xz
zzN1`*5vB3@b*iWQ5-iM*VI)60{m6352ZIII59?=3D=3DB#n9?qsoMG`~*3n#Kq!S?IFAJ
zFIx#=3D$}i=3DKh=3DPiPqH@$;mH?@4KZXx0&1W~mSzbT$-9AXEnr*{Iz-5)D%&c{;6{;)D
ztCSaB2T204udeIWT6&Z;r2xAPSzYE*6yMKjGW<SF_&fgeb2ozMx6?vUwl`6svNOCt
z_ELQsx}sPb5t;(@vpM6buWhp?t;)PdpFEr3PsCyXJz$*FwfSuCZ=3DC1X&f2~<pe%^?
z^-SEyQ=3DSINa%*WC%>1bLoo2J=3DyXQUG(LKpi`Y(lieXT|Yoj(w4F=3D*Wjh|CrIS%aO7
zofp*~Z#-|jdZRJXB5sr=3Dt6^GmpfGLhR9k=3DXRwtSe-@!79z}q{K?X$=3DBAnS0KN^GgR
z(S0A+uwlB&AjU?jMdU-$<0m7gQ|}m5^G<xf@Kol?4WxQVk-6d=3D>~g`2(T#5ye^y~O
zV$Br}4q$}rS3%$9?2diXGM_DE#t<cdd6RIO%9WFreRuFKfw#1{9{)}%+wT_x>7r4o
z`|1KngZ*(jP$n*Knd0ZoU{A9Nxc$=3Dr&)WTnSe;R>YUSk@?;0?J;q5AQq$JA5$q&Rc
z(x)dK7z;(8WcwhjC_O^o@b+kg84iJf{<obQj;>Q@pq&$^0YpSavOXrLo)dcG_Qf*z
znf01*WsynF6))r<hUR($e%GWW{&X1_zh^kUj*8I*BCJHo_Z2L6vgwD*bncO4!}D}2
zEerZ=3DtGH~_=3DN|4y;F&6k!`?d>&AyDSw;{YBOS!e(B`@0*jxF)TWT+mSJeIQXVG33^
z5tG_f)eOU-IbkYDODJ@^FrNk9{S{hBXS0Z4l*g`;aco>(>Q#1uqW-z0<r1)g#=3Dtir
z*$657I`I%`s-?|U^Co*jfA?n$FjmTd^A8OYfd*ltI@8ZMKEX-Q8WW?2k}1(90*T`|
z)%t`c924QW91Drk8hqz>ttuOA4*6n&LwbZ~iRO50LIpQKdTO{vh;+j01z(3#rR9`Y
zCUcCW^;}zu>b}-cb=3DYz=3D+`)7tq14QAb=3DG&2&T(FqLD8S{;lvmJ<~Ldxcd2x<MJW#u
z*Zen%;9qpBZ5N5u_=3DPN<n?+Jf5FUK}l9b|!=3DyXA*7BpcR9s#d=3D4Ox<e2Eut9J#v)w
zU>fAXu%!mFlWe)H26odn>BV8*M;vF>F@t(SxoPm;8=3Dbr!OT2m)d#m%b4RXILe~Hj7
z<8q$`4yahlSV4wV&Ylew)`Dn6JIQeA|8Qwl#{ylUVujmtCxTQr_LI+CE9hs0w!+t8
zHu9D3t!~iG8Z0VM!a`ZJyvS~JOBkwyoh~*RB@-ux{`$vD=3Dh_CFw{XJV4|(r#=3DweP=3D
zN+B<Um^5o{B`D;71fliC$Jg++Lx(Rz>v9hTek=3DoM5iz1Z-S0eJ)^Zke>HcqSJ<vX6
zWLU6W&Pn*Nu72Ml%`Oo-tWXW-@fhe^Js8>flR0>gaI+?x6_`?^3<ltD3yjGx_<R@3
zPLeH7e<Qf1j52J@@tzw*5$e!cmq7MR^WL3usq?;c)+sZ-8`kp{hPN}KNM}x3k%m~5
zk{^JI`NGf1ofsR*zh)DF#*Y~8?$U`rHDv@+nGVj*!ZKjHFxcOK8C9e-o4kV_DB_s*
ztIs;v_<7uQ7om~!Tx`N^sS(a!<$4&mGO%*Gy4yuobCmNYVu$JcMAD`>2~!1*a6bNR
zTp`Ktycdngl5Os6Sz;g*nT6~Y;}OlMcb1R|D4+^-XQ@O*>P`9jS8WH&JflNn!xT7K
z>Lry8sW|#VLo#T4OY1Rd#i=3DyJ(R^A=3DN&KQ2a&O@v^3|%SgL(Pqz<Xh(PCjsN`N-UD
z?jzBgZ46q{)>#CIqok+#r|wVFY&W1F`oz>{A_0uqWo^d)+MO`8_u62p8$fuu49Z)M
zsqGpvCD%_L+Nc_pQ<%FQz`2b+z50n&q)mb&wbU$ia~z!@L%&|t%(%{K$=3Dk+H9Y45S
zRA`R1s?!_Z@@TwR|2j=3D_Q<YON9=3Dr97r~qVlZ86V`V4qCOd2^UsGUTZjxnlM~j9RCl
zPR7BqY2@Q}K((Q78n4HF56`D>zS&~IEa`hR&-vWoMEqw=3Dair=3DTyMh(@lM)ZAyQCmj
zP}26z#s3jxx0`6BYs-(#q>W|Q%HZoxzQdmyJYTp;R21znK1jrb|L;T$WXSECt4ZHX
zVUd*^EMiV2Tj!&LvZ%EeHt{1!5IMgW&IZ3=3DcLj_7&b#Oy7nyYinDfM7(#>G`-Dk{3
z`<o+n^Ap%K25gZs%j+S66S8D{ovMAjIlF_~^sP^^m^R169xU(t?4}o6TiE#EvQX3-
z&vYxYkEBsK>jMYlK;lo=3DY^74!vY#ue<YU_TjM_n{!qvL|*Ml<DDM!3dywXI2q$5mK
zmY()-=3DNXiqSokntM}+UEM8jK9pE(c1W7F?UJ^mnN!Q*RZ@b!R?LjiFUT>|<<d`fLC
z7Zh-*e3^)1it~$hJWOA%O)f7Ck#;TO2JG9ZcFDef4;WPHrFwtbE(RDjTBs7(4`rhI
z^b8(FQpq`(jFpnL1(U`B53mn{uSP|g2<lUQMl=3D$zXhdgxSobqvh|v<dzs^-8r_>>v
zA>+q2nA?_T9Breb2%#RwVe)6yI~M`P7mGZuFEM<1ezuE{J~ft0I;dZ584tkp3e13D
zuJwE#cGRdgqVA33oLz3v+qcvjwMapkzA-qOriI_VC`rNw4-|fuM#oYl1~yLnjhc}D
zBsA0k#DVs<;yk!l<vvpKg|qLactc_uI#vodN>rW9k?igBQD^B#PyC|B&#Ro%Fbk_(
zHa%pBg5LOl7O@Z#1p4|>A2S&J@Pw<fsw7m9O`2%X>+(9nD9ahgNwA!86brfh38|hT
zb0GR1fnNR~ZNm#PeZ3+=3DE;jhUvRoF)1WR_XCEWuIHub*>*q9jZW8q5eMJ$K);F9wX
zW(%dQd{6X|>^eRSr?kDXHdPdcC^@%n*USTTJxj3m|5?2WGSv#JPD{3+Kn@W%O4O6Q
z=3D?jlVNf$c_`Kx378!$DWTH+H8o$(yHh5j6Ad9)v$f?T2U|MM04`o7-1{B6_!|J(n&
z)BOK7tw5f-!(t<agVs<f)pAHNQq;G1Me+FYU9YsU%7KxStQ@=3DJBzoHxa_NonUxi3{
z<HtJTHP&~|K4!4)vFmbSfs^;^(*%01Fzyl}YjSqwLlPf|T^bt4*&H5rk8X6yC?*_&
zuEd^!lrGzc-c1!EQLB54Jjw;nF}uR}3y0E1YYO}CuDNHNp1|m39nH!yT|BM!wOOVG
z#ISIJGFI-sR`MEF(Vk8yvxK7Zd}U4rjXa9w8@=3D?-J$p2Vo9d3L?g9_uyy_E6N_a)}
z#!U;3l7hf$7ED3G94~%4t;8Rr&S$&-L`K^hG57hsXheX%ja~LmydOoe(~xz|?lw9{
zVTjitP4LoQc6lKqWsIyyK~YQce(&m;pQAEVL<f_crlg@gy+Z$v)BcvNriaZ9-`jUT
z)Pz4Ujj=3Du=3DfB#VI<v7fFyD6UqcR=3Dl7U6uF!niWRdMU(x*DQ))j%J0Z>ioIcT9s{C!
z*Nf1#$Zqjas(08H(L0WyK>Mhhi~aS;OH6_tQ<9lSNtp`k8fvfpl;vAR`I2hJgFYR{
z4>l7dp_-8*FJ{|Rko`Hw{6e}6VJVS|?O8a_Kc*I&MS8hk)dFm!^E$myjq(F<P`cVe
zw{`X+s%^@TT`gEh2DPk^O44QR>+Bn^gM<bVWJ8P%`rr*N>7!ae43iGx8i$i7i?T$1
zxkNHK#>0Q>^-c5kHe0n~i_?hsK#vs^@<pQawZE1(C!|1WeXxGsZl|5)10D+r2YtUE
zXgf1cXg(tK|KBu0B?dIv)ko6gjc9sD@*kSGoors;PjZe<taB0p!ORqC`g#9k-UnXu
zL>2>u0vD;4k9;#W?MsjiU+lflFZ*&ZY<@<tO!3JE1WSLv@z%(sV*rz51e>&7k=3Dpd0
zB=3DO{g-whXhUxMw5$@{!Qpj>{VbPW{2N<=3D1ZC)VC1Ugfy#zvZ)k5*ZdnJ{Ufd<*Y8u
z&gbfui*~QnNS%{R|2d(^?%Tb5zyz@`$8@dFR*&o!CU7jS6_&=3D}5r*8C`Dqoad+&)%
zN72>`B8~8Te@yvKyAc_3zf!U_1^llE)O|NUdS-nQ*;CmrDciZ1S~SH-Cg<EY9e~&?
zM3(8V<m4SR8ckA9xXlq>uxcA(!DSep#6B$Jz3Wpw|AoLIRP2cIHE*sWU3DSxWjm+6
zP*FXU35~Rm2|lKQ4^IffXSv~vMIhvwrZ|*wtIqupp<CzvSp%-{{gD>0xk|Uz<DlP8
z)%fbH=3DGq_UI7y)cY6et=3DjRFH|$4}T((dAtFf})GcQgD&ROipJu?VXryXK?q%vjFe>
z(t%X*<o7@FNpaF~?fZ((cJ{SgPWK`ZVh7xEH&{v{Fd;+w&FrtX=3DpaKurdUtpC}OiL
z$QJTT6?w0tz(Zv~-{C!JMo@JkF_euPV)(rCIBk#J`F%slc`T+8Xq%W~<dSm*goxZL
zyzFKpcm8a|qVj$Tboo79&!6r}31Xvj{Z-=3D-M`#$@8_7VZqI@fJ^u9FJVKB(SmwdKj
zoemh2TWyQWA|wvI-70_@+Uh29w^jVp248eDtmg}^yp>z$tdB%f80b)8a5}0v!5C26
zjBHvy=3DR4x7yx~2=3Dfr;Gmbh3OqU#uJfR}bj3EDw4txhyMedU&QEcO<G(nBb51BrwzU
zvCnlOB&!iWsM&E8YNENdqJYoo)ucFd$5~zS0rY+V<%_7pR+io3Z#%_5tuA|z&9RIq
z?%m6O5LNXs|1JDka49eSEhlzVz=3D;xaQ>i{g&g#mKp-fT~e}DKnb=3DzC$QW9NI%G@*Q
z)VW!#`P9chz>ytQ09IZs^pTj&13qWPJKLyex^+%Mpg$mOxliDxuava_K*F11y-w`K
zakn_EVX#!FG}8{QTqugvxk_UZwk5A7y(8uo2Yez5o*U$XWIX6s4TtJWb_|5kqNA`1
zeg_re%Al<Kna6n@QO_t_Cf#ut+X5twog4)q;qZ~N?}kP_oDKpJ5zzcyyKL@o0bU1+
zMY~iXr7xPjhx61}0XUQA{7Pq-w<i%rF@Wz{8_L2ppKX}NGFT^8!gpIFwm~Swe)I&O
zA&J<rM_;5qZi@d|-SjSJtw(d0_2>N;`iuyTN(-H?P^z2A9$M?Y1(;A1)}8wT?z{lN
z>OGh-@&mneKal=3DI!_IB)PP$%+CfQ@jz8k%77BVCpk;ypFBE0DwH{JMR@#&mPF+k$c
zE`ejnB=3DIL8>*Jrg?4(nCN52)$q7w_inj`>H?2h-iOFO=3Dpp7XnSc=3D!_43tG1fLmvbF
zox!wPq=3DncUwm+=3Dv-P9|#dGO~bke%S5N4&37=3D8<^d%2RLf!WXa6K!X=3DdAyqU5Op)+=
w
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
e
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
f#0
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

literal 0
HcmV?d00001

diff --git a/meta-arm-bsp/documentation/corstone1000/software-architectur=
e.rst b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
index a2370f60..c5bfea33 100644
--- a/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
+++ b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
@@ -315,15 +315,49 @@ Host Secure World experience lower latency, but rel=
y on TrustZone technology for
 which offers comparatively less robust security.
=20
=20
-**********************
-Secure Firmware Update
-**********************
-
+**************************
+PSA Secure Firmware Update
+**************************
+
+The Arm Corstone-1000 platform necessitates a robust, secure, and flexib=
le firmware update mechanism
+including partial capsule update to ensure fielded devices can receive c=
ritical patches, feature enhancements,
+and security fixes without compromising system integrity. To meet these =
requirements, we have implemented the
+Platform Security Architecture (PSA) Firmware Update (FWU) framework on =
Corstone-1000, leveraging Trusted Firmware-M (TF-M)
+for the Secure Enclave, U-Boot as the host-side client on Cortex-A, and =
the UEFI capsule update mechanism for payload
+encapsulation. This design supports both the Fixed Virtual Platform (FVP=
) and the Field Programmable Gate Array (FPGA)
+targets, providing consistent behavior across simulation and silicon-bas=
ed deployments. The Corstone-1000 supports FWU
+which complies with the `Platform Security Firmware Update for the A-pro=
file Arm Architecture <platform-security-fwu-for-a-profile-pdf_>`__
+and `PSA Firmware Update IHI 0093 <psa-firmware-update-ihi-0093-api-refe=
rence-website_>`__
+specifications.
+
+To standardize and streamline capsule creation with multiple FMP payload=
s, the `EDK2 capsule generation tool <edk2-capsule-generation-tool-reposi=
tory_>`__
+tool has been integrated into the meta-arm Yocto layer for Corstone=E2=80=
=911000. This integration involves defining
+build rules for generating UEFI capsules as part of the firmware image b=
uild process. Configuration parameters
+exposed in the recipe allow developers to specify the number of FMP payl=
oads, target image GUIDs, version numbers etc.
+This capsule ensures that all update payloads conform to the UEFI FMP sp=
ecification and are ready for
+validation and delivery by U=E2=80=91Boot.
+
+The FWU solution for Corstone-1000 is composed of three primary domains:
+
+- Host System
+- Trusted Services intermediary
+- Secure Enclave
+
+Each domain has distinct responsibilities and communicates through stand=
ardized interfaces.
+
+
+.. image:: images/SystemArchitecturePSAFirmwareUpdate.png
+   :width: 690
+   :alt: SystemArchitecturePSAFirmwareUpdate
=20
-In addition to always booting authorized images, it is equally important=
 that the device only accepts
-authorized (signed) images during the firmware update process. Corstone-=
1000 supports over-the-air (OTA)
-firmware updates and complies with the `Platform Security Firmware Updat=
e for the A-profile Arm Architecture <platform-security-fwu-for-a-profile=
-pdf_>`__=20
-specification.
+On the host side, U-Boot functions as the FWU client and orchestrates th=
e update process from capsule retrieval to
+payload delivery based on `PSA FWU DEN0018 specification <psa-fwu-den001=
8-specification-website_>`__
+via Arm FF-A framework. The Trusted-Services SE Proxy secure partition s=
erves as a gateway between the non-secure host
+environment and the Secure Enclave. The `PSA FWU service <ts-psa-fwu-ser=
vice-website_>`__ running in the Trusted Services
+implementation forwards the data to the Secure Enclave via MHU-based PSA=
 calls. Within the Secure Enclave, the PSA FWU
+Agent, conforming to `PSA Firmware Update IHI 0093 <psa-firmware-update-=
ihi-0093-api-reference-website_>`__ specification,
+orchestrates the actual flash programming, metadata management, and roll=
back protection mechanisms. The agent relies on a
+bespoke `shim layer <tfm-shim-layer-website_>`__ to abstract hardware=E2=
=80=91specific flash operations and bootloader interactions.
=20
 As defined in the specification, the external flash is divided into two =
banks: one bank holds the
 currently running images, while the other is used to stage new images.
@@ -336,23 +370,55 @@ New images are delivered and accepted in the form o=
f UEFI capsules.
    :width: 690
    :alt: ExternalFlash
=20
-When a firmware update is triggered, U-Boot begins by verifying the UEFI=
 capsule by checking its signature,
-version number, and size. After successful verification, it signals the =
Secure Enclave, which then
-starts writing the capsule contents to flash memory.
+When a FWU is initiated on Corstone-1000, the following sequence of oper=
ations takes place:
+
+#. **Capsule Retrieval and Preparation**
+
+   U-Boot on the host system retrieves the firmware capsule.
+   It validates the capsule header and parses the FMP (Firmware Manageme=
nt Protocol) descriptor list to identify the payloads to be updated.
+
+   For each FMP descriptor, U-Boot:
+
+   Splits the firmware payload into 4 KiB chunks.
+   Invokes the PSA_FWU_Update API for each chunk, transmitting the buffe=
r address via the FF-A (Firmware Framework for Arm) shared memory interfa=
ce.
+
+#. **Secure Transmission and Forwarding**
+
+   The PSA Firmware Update (FWU) service, running as part of Trusted Ser=
vices, receives the chunks through Secure Partition Client (SPC) calls.
+   It forwards these chunks to the Secure Enclave using MHU-based PSA ca=
lls.
+
+#. **Flashing Within the Secure Enclave**
+
+   Inside the Secure Enclave, the PSA FWU Agent dispatches each chunk to=
 the shim layer.
+
+   The shim layer:
+
+   Erases the corresponding sectors in the non-active flash bank.
+   Writes the received firmware chunks at the correct offsets.
+   During partial updates, it also copies static partitions from the act=
ive bank to the non-active one to maintain consistency.
+
+#. **Finalization and Boot Preparation**
+
+   After all chunks are successfully written:
+
+   The shim updates the firmware manifest and the EFI System Resource Ta=
ble (ESRT) entries to reflect the new image version.
+   This step enables the bootloader to recognize the new firmware for a =
trial boot.
+   The platform then performs an automatic reset, booting into the non-a=
ctive bank in trial mode.
+
+#. **Trial Boot and Confirmation**
+
+   In trial mode, U-Boot evaluates the new firmware and issues either an=
 accept or reject command using the PSA FWU ABI.
+   These commands are sent to the Secure Enclave, instructing the shim t=
o update the firmware metadata accordingly.
+
+#. **Recovery and Fallback Mechanism**
+
+   If the trial boot is successful, the host sends an acknowledgment, tr=
ansitioning the firmware state from 'trial' to 'regular'.
=20
-Once the write operation is complete, the Secure Enclave resets the enti=
re system. The update process
-is tracked using a state machine stored in the Metadata Block within fla=
sh. TF-M runs an OTA service
-that is responsible for verifying and updating the images in the passive=
 flash bank. Communication
-between the UEFI capsule update subsystem and the OTA service follows th=
e same data path described
-earlier. After verifying the capsule, the OTA service writes the new ima=
ges to the passive bank,
-updates the system state to 'trial,' and initiates a reset.
+   If the system fails or becomes unresponsive:
=20
-During boot, the bootloaders in both the Secure Enclave and the Host sys=
tem read the Metadata Block to
-determine which bank to boot from. If the trial boot succeeds, the Host =
system sends an acknowledgment
-that transitions the system state from 'trial' to 'regular.' If the syst=
em fails during the trial phase
-or hangs, a watchdog timer triggers a reset. The Secure Enclave=E2=80=99=
s BL1 contains logic to detect multiple
-resets and can revert to the previously known-good bank. This fallback m=
echanism is essential to ensure
-the device remains available and functional.
+   A watchdog timer triggers a system reset.
+   The BL1 firmware in the Secure Enclave detects repeated failures and =
reverts to the previously known-good flash bank.
+   This rollback mechanism ensures the device remains operational and re=
coverable, even after a failed update.
=20
=20
 .. image:: images/SecureFirmwareUpdate.png
@@ -401,6 +467,11 @@ References
 .. _arm-fmw-framework-a-profile-pdf: https://developer.arm.com/documenta=
tion/den0077/latest
 .. _arm-fmw-framework-m-profile-pdf: https://developer.arm.com/architect=
ures/Firmware%20Framework%20for%20M-Profile
 .. _platform-security-fwu-for-a-profile-pdf: https://developer.arm.com/d=
ocumentation/den0118/a/
+.. _psa-firmware-update-ihi-0093-api-reference-website: https://arm-soft=
ware.github.io/psa-api/fwu/1.0/api/api.html
+.. _edk2-capsule-generation-tool-repository: https://github.com/tianocor=
e/edk2/blob/master/BaseTools/Source/Python/Capsule/GenerateCapsule.py
+.. _psa-fwu-den0018-specification-website: https://developer.arm.com/doc=
umentation/den0118/latest/
+.. _ts-psa-fwu-service-website: https://trusted-services.readthedocs.io/=
en/stable/services/fwu/psa-fwu-m.html
+.. _tfm-shim-layer-website: https://trustedfirmware-m.readthedocs.io/en/=
latest/design_docs/services/tfm_fwu_service.html#shim-layer-between-fwu-a=
nd-bootloader
 .. _op-tee-os-repository: https://github.com/OP-TEE/optee_os
 .. _psa-certified-website: https://www.psacertified.org/
 .. _psa_l2-ready: https://www.psacertified.org/products/corstone-1000/


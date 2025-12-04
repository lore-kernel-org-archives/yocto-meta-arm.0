Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CA0D206B5
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 15:25:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46553.1764861919421893607
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 07:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A53BA339;
	Thu,  4 Dec 2025 07:25:11 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.43.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60E723F59E;
	Thu,  4 Dec 2025 07:25:18 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 6/6] arm-bsp/docs:corstone1000: Add Corstone-1000 with Cortex-A320
Date: Thu,  4 Dec 2025 15:19:53 +0000
Message-ID: <20251204152500.78818-7-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251204152500.78818-1-hugues.kambampiana@arm.com>
References: <20251204152500.78818-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Dec 2025 15:25:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6785

- Document Corstone=E2=80=911000 platform architecture based on the Corte=
x=E2=80=91A320 core
- Add test specification and guide for Corstone=E2=80=911000 with Cortex=E2=
=80=91A320

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .../images/CorstoneA320Subsystems.png         | Bin 0 -> 55372 bytes
 .../corstone1000/software-architecture.rst    |  13 ++
 .../documentation/corstone1000/user-guide.rst | 126 ++++++++++++++++--
 3 files changed, 129 insertions(+), 10 deletions(-)
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/Corsto=
neA320Subsystems.png

diff --git a/meta-arm-bsp/documentation/corstone1000/images/CorstoneA320S=
ubsystems.png b/meta-arm-bsp/documentation/corstone1000/images/CorstoneA3=
20Subsystems.png
new file mode 100644
index 0000000000000000000000000000000000000000..d3022a16379ce149c19d63b6a=
29c34a036fb159f
GIT binary patch
literal 55372
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
R
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
Q
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
6C
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
o
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
r
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
t
zX-%YGkxGHriHPy_Wd7mo_hJ&4^*2$^mc)$ws<MBUEJ_RrJUl$)x|c}9Ln#+SEC}j|
z2k;g{ahKTAAo^xdukPN~kLp(4p4sL%5*Yslxk?0on1$+<Oe>RN*(Ac_IKHxeW4dMs
za{m`9S>ThkhB;;6y3oSjOsC}S?fc@2<yzNW<u@BUkx)dzKtc15$1Vx^F(>x$8&a!c
zaEbSTx3Uj9B<T?2-?Q7ouE)A8xbHH$cI}XzC9Z7qOb>KJVma7p4!Uyv;C53u>bL*i
z9dxjdx0(kpuan<rHQmU_I%-_idZx2m|Ds&Z(JLcjNusn;ND^X6?yy8lXR-r2UZU1>
zmg{*KeM*2BioZzuzkpGG6ym?s5`<_!099zXB#?z7!tz>Gq$(76=3DAdHqke3iAfg*DA
z*<9uF6V{{UWJ$If$}Q3Ce{|9f7_dLijo<&U6KCpLr<NRsD(_P)=3DE()qkHdoe61~bw
z%L}sJe^TD?psN7ps}4PM38Hp5OVy7v=3D%r*SI(Mo6{?@@j=3DLKMVhGB^XBZ=3D_Ke-L$V
z!Zoc^4Ce<9G{J;&VvVIe`{8VaIV0Tum(RQ*_U~6oo(3PA)Xr5+_vk37{|zsY1^9Wu
z;4|zBEJu=3DQCJ9MNd7_&oS`Ko9wvH37gE%m|$W>|~m$txjLOnool3=3DtE$iFnbEGaQ2
zm2)-!y|ZqJ$nxj7JVYN#f0cG*T6^l-FTQj5T|HuxP>9f4XLWkEDl(RN&fVUoXJ{09
z<~nkEN8KQxBuyMxJ0mGa$^LsmlArzo$uxIfaC>5xmaPX2o_gkiS=3DCDafLYZ=3DLVKC*
zBpBveEH+Wk`;M2hsv9twrF`S)UZgxKB`f;xPt1h*eb*_&(Zb~})DP)FU*ca|6HPnd
zDahH%g`StE!&#9;_H5)Wn3lh-U=3DY?5_K?|->`|GaInO$(9P0e1@$@mQ<2w2;we)Yg
z>OkM>U<pU!D^*wKI*Tj_Yx7sIyCo`<@8@0*2_|+hBkz78<_Qcw-G{~hAJhg8-^vPE
zvl{Y81lmtiv*#~VKiDKxgk8B9^SGP8mX*iT+@`Da-6u3jYOPk8)v7HW%?(ebzog%^
z$DADP)zXH`Hp%y;NO{t&I>O9%(a+H4_&%0*qBJ}lV6cptUPQMT*sUsN{kMU*`MbrZ
zr-V+sJL$!}{*^Ukw%$R@3E3Basd-rNo;3!?kkxnLDu1@6g7rJ4%V)a1aJq@`dp+)l
zW?z@ig%R|*efq4viF)~hU8%x{YeL3vYys|WU;cP;gWJ$~<P3>T8xY`#I*-cRzhz|W
zjuIOgct8E1tX|#=3DU&4nBb9jzi7UtWfhsu1SIS;Fnbi|l)qt(a2L@Fp+&x(?>RZe64
zjB!sG+Vt5+Pu9d+-m$}6oe<!v*RMK%sBJ<B(YjuvZ2yiHLFGAr^hBrZYm{Ah{IEK%
zYznWmL{WEjLnxel-5{s$zF$^&Twz>G>3DceZH0)3#%X;=3D7$kMBU?_{|Tl)Ey)^=3DT_
zww@QmnZ}m`ioAxcH0&n|UV9qF(D#V94^WX{m#P`c4RT*Q%hi0**2B3j1>Bs^v1WAV
zAP675LBiJAlo>8hG&34!K_9t7wj5?YE7YAl!8Xua!k5=3DtSL}|dD!A-yGC4gK)E7Qa
z_red)y!IeRa4^aq;Q1P(k|;6HwF2|B@9nhK&|B+~dXg_3vtLtwA8%B4;ohn}>U(d9
zD!5Rez<bynQyh(P@`=3DR<k%erpcB2K2)g!e<he%+<$-moeQYe%!&;8oK^bnkReZDhg
z(Os2{u;`6c$vzR>A-j3KH&M7BW?lzXE!41k**R5BJodfS+p!U=3D$G>|Ws!?AH_R}$J
zZ3J{@TWL+So41v<CcVd6N{J-<I(>jV#UXxrJTJm_tA7;FB?NWy&+~4zy@>s{n23b=3D
z1%HcEI}sLHlxuUgbbSU35Dj%1Mm1z4=3DO8%2dztFN%Sfp1Kiv7!l6dicn&xSzJd5Ao
z-u!#@gr*z;0u`EwMLd&R5rhIc<4*~JED|35#~cPC2OSjM*7w#4-%S~6EJ~b$+^aeH
zU5iM(6M|6vGc5b9g5b|z1Efh6#EVwCC#LoLE4x!)ti%NuM-jY`s#jLmU(?nf)5aG^
zeD+s7$4dL!ds*g%Jiv8p`-M(=3D{5e=3D<TTX4eC=3DV*eZ~{>J#A)p_dSmk)E5fcVWxlOg
zR&K9))Q4)o{i=3DBF)bB#|#Jh7J+r+$8S)hp-nZlMgckQ4LoJdV!R^PW2{1agj)`t~`
zJwB_t>AEH=3DE~0H-vt?k34#N4)R6iNX+;vye8M-h08la0*bu_l6gyI-18x8gwoToRD
z_F5$U6E6cK?7H(FRzx%lX?-1zoEta^^|*PbmnDlN&T-7Fd;nUPZ5A(Bqr&CG+Ho&8
zN_Ee9x3%O5`xji23i%!{iJlWuFFj^4V$vy4OVfAmGnk%{NJgV9I>?OB{-WKHuNylu
z_FZUp?}zAKT!GOjjHAaN9W_~wcpbW$d5PNKnRE0<PhiG7HCb8|5gT463V!Qn%wx*X
zGaSLnb+*e{na_(M4Y#a?ihs?yOZ)mz7f#0oL8PS0J;K(L`8HjB(L&&M6k?EqFoz9u
zfme*l<ohAj=3DU^%jdHf8n-3?E}x>Mqz9hG!R32N92g?TZeDRS3*3CFFh+&&6C(Y~^9
zUE`CSLEaQnw=3DqqL>+O$wW74DRVZUjTJ%IkVcjrH5h|DC{Q7=3D|<6gk_;-HsUnPFJ|B
z=3D$}tgueko8PfN?jHE|)rI#%jT?Rj%Zp{d`@fU-6nX--KQ@ZNybq)eQ53Fr3V1MH!M
zuz+$;b*z49q@QPLXrok5%`tNFDq23V%ZzQY-@PsC0m?G?XESg^B@4gzzZ1^<f}z>*
z5ZTvLbFw0mBt0Rv2;Dv>B>1nl%(bO_c3NnJn{{1>iynu1#gCJJG)8QJxwI=3D85gJ+6
zva^x@n%X`l&|OGKdQ`48vHj>(sh9R~jG{_`nHepyRgc6+gdk!)P52hvHPb=3Di8;R_%
z?n^I%6Rx+gB^aX(uOkJwI1kdZUcsKW%8%(jVRpP}0Z+I-V9)vYlSV4MPPdU=3D47g<(
ztBBWZd7*mgP}5mPh3N@lLj{-}8zstyqMv<1P4+n(=3D<Xh|&qQ?_2<))y{uERn&C*k&
zpI{Cv!syhErMopS$7sg{N4=3DR1IPJuD8X@<*L*%{ptqWg9!47b6(6wd~qZRl(3eDe{
z+{%tau$YAQ2RzZzAuh!zpETGkz)F_+1fnsoP!tqk_KlD_S)U28qVa@Yt}XQ+=3DY1OT
zWzgOCIv7kzwtM0AZ}L%7ad{!y)3!Rl{YKUiG#`^~#Jxvqf}*gL+sb?W^l&9jMNSqe
zG&bQL`b~7Z*W2=3D9?VgZ?ET0bpT1!$I_8b0kM9UN(i6-=3Dpm=3Dd9YXhztA*5#+U6Na9m
zCFTa(iBmVXivY@Eu1IbaN7u*sqzO-W0^F3y2XQD}jJn8v(ByhLrJ<=3D&k`ZN{SG!7&
z7d|BMgrg#%sOgol*Y1nvP7MadN`d{npR_Sja=3D=3DwEEZLq}L3>AJ>r@Q0F};VDXVygr
zXN%{~`GKWe$99q9&p9LXH9iHBB@g^tL9c!Iv`FmNd?VjkpArnF=3Dmy!)acnoQgPcP2
zY9IHmyUQXStX0PbMZUol2oAKzy{t&_n!a$KF#(S*golfn{w`PiKe(2Re76E4cy>^T
z&4@<M79Zb~oY9q@SAP_UzQdBDie)c-M(!<rzj#RgJ20&&1(?UF7R|rEe4hS8_U1a_
z2N)i^&j&|e4ou`OS*oiw#>ZH;%*Qb~dff_%>WaZ%v>t~Px}(;AY#Fu04MFHLbu)D)
zHh*N=3D&YjXnkLo`w)w0<ZB-8PWzA-3WhNnX%{hzANJetj{kK@xc-h(ofl%b{8)V>rg
zssuGbYpbP$P*Q7DwZu|XL&~cOt!2i(L`zb8BRvUH?U<5@-OQ9&qNydsUd(ICF}zR4
zcINrx`QzT_xz9cK{O<Rj^Ly_7e&)ftrC&~=3Da(yqBsnwJxa@e<YgG9W?-8i#J(s$+3
z)i<*DQijFy5(JT#R&$FIqKXqaW&^g@Res+lx(wRsX#uF9B7l8K>hf<1xS2139`k`H
zwyF@teqsseU!bcCbUt)>P{C@yyI!gEwI6?F$fO_w9zLNSbmdWwo7-v9i)^^fSXXPG
zJv_V#=3DY;srJs(pqi-PiuAq2CUjNOX)DAiwpdS{likNtzG34w{OR->RhM~FLsJM{#>
z68hM#T{J$#iUCDs7@|OFB*%>>^IBk^g~q@0hQWr~yjCMmsM8_F5eD*CB7|CAh=3D>%c
z`ye7IddV7eD+hyc@3lI3!e0TXmQLHH2uTPkCg;_rT91fZ?|&XK&2KJFY{F=3DFd1+;W
zRJORH%-rFF=3D?LTEgKr3nmmq~|$DKkeo^XiJVy7Zn!~a+h6=3D=3Dt?OD>O?ghtfb?p-g9
zsFhznz%Ic+ld9rwgGTAWPw#ztE5qeZSuV}tcl^(rCmMhMTt0JZ3K<ZDo2&BDT9_yN
zI$*JPuBxia*3Ql{KHju9D9YJFwo&8+tta!vdx-k;uA3gYg7r}8Je5s{U$kkTGHAXD
zwW%=3D5*j?t^C}H5Yzqg7)DxxKBW%<IC3E6eE2+Am&9tMe99KiiB3_)<)%t8!(ZHY4Q
z3pcWTdQDBYk%cD`q0A^CYvcSZf1zic+moG}i^buDwLF`^EiElsR@tg(aAn*^{M%Oz
zHH_g*Z<p;pb1uaxqxc+sNYmqGzYiWdsr+|QM*&Vl`b?Xz?vu%&IxniQ&EroHbkOPx
zd&48RAX+AwV1SNHV}uwY+fxJp{1+-45g4dCBbJm<1$buL*x2wm?=3D67S=3DovsZ*m~H(
z-X7JcF>o82{EDY$ma`#P5?u1CrUr20IjbMqeJ#+#5jWrb)tGHDH<y)!THDe|+C(`x
zh;FX1u^jEcuX<?vJoTgmM~Czd6&%JL5K#FrXUhw&S@}P3RbA;54FQnTrz_G8a=3DSiO
zh;ZvlO8PX_)!P9-1w8;R*wNV;{i<Q1;}OqILe9cInV4<}91twG__CWAZPK%CJt}se
z)!g|N1kFAD;F&S+&prC8BW|noO3aJBpLd&0rlB))?@}hpml-3)3~DoCd@X}#cNnhX
zC{Vbtsk$&=3D-=3DL86=3DSfgMbcI#~q$+N@x?*Q%(55aP9z;YL9U!AA3J^-Nz27IbDQPe=3D
z&q}|M&zw~L95duMP7K$x!RepD=3D_rz=3D@0G@AK6@N{E*>kdPu5S5?m)6EVk%;9MsUqr
zyJ${~G}`6#(RXOycu|fsS@mEd@gT{U1WMceoL7Ddd(`DFO!MOc=3DHlH*p@$|hz@~P7
zqFz68#ufsBsGZUR(2dXhKcuM}M7J;eAr%h_BBuv_bb_~|C>nUxO51z`a_8z9%~Q&0
zB2G4q9bkQYtnBxS%-A27oUgHe!@?gdG4&CDy<9ZDF1_uKJasTb21EIyAY<p76z1br
z3`y+6Bf4ZIC0`a)I>*fx2EPvZP3cCNnauArGC3PbFnO&L7a>*a4$qLUU|W;!!IgrM
zr2di`wsJ6K{EN#P{5!pnZ-~9(wFUK3ou5WVFk;js%#zJ$_Y_XYw$x!?d!ArmJ0}~{
z6f~^UZ~&cQdR#=3D#ZLsTnLQAWWva)pxx@K4&*d7=3D(P*z`(JD$f(m26_x-^kPP5q?<h
zu8o)0WdKkDzAeHJ^&SC%fj|<*^J?FnbRjU<yGOOICf)V<MFEqSrh0*doJ@Aj3}E#3
zoe@;D8cB7;#cmb-SeTrDoB3h1n*!KyfBRroWM96-zXh#R)$(fpi*ej(rtJ)^`f&n`
zqNxp7chlv(^77{=3De-%>*v-BV>Hi3lDswYg&77bq(9cox;xPc8nP%vfi80T@NsCb1`
zRJh@FgJZGEf@y;CwRv8hlkj8xR7lqOM=3DV!93vVi5b*wsrj*zFeuwuR#zImGAdBls&
z!cYO!b7+`Zf#`9=3DX#R>u$|fH|ae;Xrf(KBBR0ekRXwGNBNB|@>T2@B$xCm%0#A|S?
zQ<jB4Z%)+4^rnHwRDRZtC=3DQ8B`G+m~xmyAdU3!yGprM4|<r5mM_a%c9_z`ozo?kI-
zj%F>e)-~q;;$C%M)tEP<@3XDN9YIA>=3Dt*!p^$2HYOQ7@La9ypKj=3DDo%WG#;MdH3s3
z4*CLX7QFVPwxTB#-pEpp9o3kr@1>V4Anj6bSCe*|sk@1umRDS=3D+cw8cIe9+et!*1}
z|D&^w<?2bZYkTtEG}d;M_uBYI*y>wZ+ST`jxzsX>R~<@F{$MB-D#7R^7ppN4_TOt9
phN#<;_GV7x2tW)2-4aUP12wz#6zYbYee?}*+1WT=3DYq0W5`9DSpC@=3Ds3

literal 0
HcmV?d00001

diff --git a/meta-arm-bsp/documentation/corstone1000/software-architectur=
e.rst b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
index c5bfea33..e4f407d8 100644
--- a/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
+++ b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
@@ -116,6 +116,19 @@ The Corstone-1000 architecture is designed to cover =
a range of
 `Power, Performance, and Area (PPA) <ppa-website_>`__ applications, and =
enable extension
 for use-case specific applications, for example, sensors, cloud connecti=
vity, and edge computing.
=20
+**************************************
+Corstone-1000 with Cortex-A320 Variant
+**************************************
+
+This variant of the Corstone-1000 platform replaces the Host System's Co=
rtex-A35 processor
+with a Cortex-A320. In this configuration, the optional External System =
(previously a Cortex-M3)
+is replaced by an Arm Ethos-U85 Neural Processing Unit (NPU).
+The Ethos-U85 runs in the direct drive configuration, where the Host Sys=
tem is responsible for managing the NPU directly.
+
+.. image:: images/CorstoneA320Subsystems.png
+   :width: 720
+   :alt: CorstoneA320Subsystems
+
 *****************
 Secure Boot Chain
 *****************
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index a6834a34..e22406a0 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -223,7 +223,7 @@ Build
     .. code-block:: console
=20
         cd ${WORKSPACE}
-        git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1=
000-2025.05
+        git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1=
000-2025.12
=20
 #. Build a Corstone-1000 image:
=20
@@ -243,13 +243,28 @@ Build
=20
     .. warning::
=20
+        **The External System Processor is not available on the Corstone=
-1000 with Cortex-A320 FVP.**
+
         Access to the External System Processor is disabled by default.
+
         To build the Corstone-1000 image with External System Processor =
enabled, run:
=20
         .. code-block:: console
=20
             kas build meta-arm/kas/corstone1000-${TARGET}.yml:meta-arm/c=
i/debug.yml:meta-arm/kas/corstone1000-extsys.yml
=20
+    .. warning::
+
+        **The Ethos-U85 Neural Processing Unit (NPU) is only available o=
n
+        the Corstone-1000 with Cortex-A320 FVP.**
+
+        To build the Corstone-1000 image with the Ethos-U85 NPU enabled,=
 run:
+
+        .. code-block:: console
+
+            kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debu=
g.yml:meta-arm/kas/corstone1000-a320.yml
+
+
 A clean build takes a significant amount of time given that all of the d=
evelopment machine utilities are also
 built along with the target images. Those development machine utilities =
include executables (Python,
 CMake, etc.) and the required toolchains.
@@ -442,9 +457,14 @@ Corstone-1000 FVP software image.
 A Yocto recipe is provided to download the latest supported FVP version.
=20
 The recipe is located at ``${WORKSPACE}/meta-arm/meta-arm/recipes-devtoo=
ls/fvp/fvp-corstone1000.bb``.
+This recipe supports selecting different Corstone=E2=80=911000 FVP model=
s via MACHINE_FEATURES:
=20
-The latest FVP version is ``11.23.25`` and is automatically downloaded a=
nd installed when using the
-``runfvp`` command as detailed below.
+- ``cortexa320``      use the Cortex-A320 Host Processor with Ethos U85 =
enabled FVP build
+- (default)           use the Cortex-A35 Host Processor with Cortex-M3 E=
xternal System FVP build
+
+The latest FVP version is ``11.23.25`` for Corstone-1000 with Cortex-A35=
 and ``11.30.27`` for
+Corstone-1000 with Cortex-A320, and each model is automatically download=
ed and installed when using
+the ``runfvp`` command as detailed below.
=20
 .. note::
=20
@@ -496,8 +516,8 @@ Tests
 Reports
 -------
=20
-Reports for the tests conducted on the `Corstone-1000 software (CORSTONE=
1000-2025.05) <https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE100=
0-2025.05>`__
-release are available for reference `here <https://gitlab.arm.com/arm-re=
ference-solutions/arm-reference-solutions-test-report/-/tree/CORSTONE1000=
-2025.05/embedded-a/corstone1000/CORSTONE1000-2025.05?ref_type=3Dtags>`__=
.
+Reports for the tests conducted on the `Corstone-1000 software (CORSTONE=
1000-2025.12) <https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE100=
0-2025.12>`__
+release are available for reference `here <https://gitlab.arm.com/arm-re=
ference-solutions/arm-reference-solutions-test-report/-/tree/CORSTONE1000=
-2025.12/embedded-a/corstone1000/CORSTONE1000-2025.12?ref_type=3Dtags>`__=
.
=20
=20
 .. _clean-secure-flash:
@@ -516,7 +536,7 @@ Clean Secure Flash
     .. code-block:: console
=20
         cd ${WORKSPACE}
-        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git -b CORSTONE1000-2025.05
+        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git -b CORSTONE1000-2025.12
=20
 #. Copy the secure flash cleaning Git patch file to your copy of `meta-a=
rm`.
=20
@@ -838,6 +858,33 @@ The results can be fetched from the `acs_results` fo=
lder in the ``BOOT`` partiti
 Capsule Update
 --------------
=20
+.. warning::
+
+    The **Corstone-1000 with Cortex-A320 FVP** becomes unresponsive when=
 the Linux kernel driver for the
+    Ethos-U85 NPU loads automatically after a software reboot.
+    This behavior results from a power reset control issue in the **Cors=
tone-1000 with Cortex-A320 FVP** model.
+    To prevent the failure and complete the test successfully,
+    rebuild the **Corstone-1000 with Cortex-A320** firmware image using =
the following steps:
+
+
+    #. Clone the `systemready-patch` repository to your ``${WORKSPACE}``=
.
+
+        .. code-block:: console
+
+            cd ${WORKSPACE}
+            git clone https://git.gitlab.arm.com/arm-reference-solutions=
/systemready-patch.git \
+            -b CORSTONE1000-2025.12
+
+
+    #. Re-Build the **Corstone-1000 with Cortex-A320 FVP** software stac=
k as follows:
+
+        .. code-block:: console
+
+            kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debu=
g.yml:meta-arm/kas/corstone1000-a320.yml:\
+            systemready-patch/embedded-a/corstone1000/disable_module_aut=
oloading/disable_module_autoloading.yml
+
+
+
 The following section describes the steps to update the firmware using C=
apsule Update
 as the Corstone-1000 supports UEFI.
=20
@@ -866,10 +913,10 @@ Generate Capsules
=20
 `EDK II's <edk2-repository_>`__ ``GenerateCapsule`` tool is used to gene=
rate capsules and is built automatically
 for the host machine during the firmware image building process.
-The tool can be found in the ``${WORKSPACE}/build/tmp/sysroots-component=
s/aarch64/edk2-basetools-native/usr/bin/edk2-BaseTools/BinWrappers/PosixL=
ike/GenerateCapsule`` directory.
+The tool can be found at ``${WORKSPACE}/build/tmp/sysroots-components/aa=
rch64/edk2-basetools-native/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/=
GenerateCapsule``.
=20
 A JSON file containing metadata about the capsule payloads needs to be c=
reated using the script
-found at ``${WORKSPACE}/meta-arm/scripts/generate_capsule_json_multiple.=
py``.
+found at ``${WORKSPACE}/meta-arm/meta-arm/scripts/generate_capsule_json_=
multiple.py``.
 This JSON file is required by EDK II's ``GenerateCapsule`` tool to gener=
ate the capsule.
=20
 The capsule's default metadata passed can be found in the ``${WORKSPACE}=
/meta-arm/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-ima=
ge.bb``
@@ -1712,7 +1759,7 @@ Generate Keys, Signed Image and Unsigned Image
=20
         git clone https://gitlab.arm.com/arm-reference-solutions/systemr=
eady-patch \
=20
-        -b CORSTONE1000-2025.05
+        -b CORSTONE1000-2025.12
=20
 #. Set the current working directory to build directory's subdirectory c=
ontaining the software stack build images.
=20
@@ -2011,7 +2058,7 @@ Symmetric Multiprocessing
=20
 .. warning::
=20
-    Symmetric multiprocessing (SMP) mode is only supported on FVP but is=
 disabled by default.
+    Symmetric multiprocessing (SMP) mode is only supported on Corstone-1=
000 with Cortex-A35 FVP but is disabled by default.
=20
=20
 #. Build the software stack with SMP mode enabled:
@@ -2035,6 +2082,65 @@ Symmetric Multiprocessing
         nproc
         4                  # number of processing units
=20
+Ethos-U85 NPU
+-------------
+
+.. warning::
+
+    The Ethos-U85 NPU is only supported on Corstone-1000 with Cortex-A32=
0 FVP.
+
+
+#. Clone the `systemready-patch` repository to your ``${WORKSPACE}``.
+
+    .. code-block:: console
+
+        cd ${WORKSPACE}
+        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git \
+        -b CORSTONE1000-2025.12
+
+#. Re-Build the Corstone-1000 with Cortex-A320 FVP software stack as fol=
lows:
+
+    .. code-block:: console
+
+        kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-a320.yml:\
+        systemready-patch/embedded-a/corstone1000/ethos-u85_test/ethos-u=
85_test.yml
+
+#. Run the Corstone-1000 with Cortex-320 FVP:
+
+    .. code-block:: console
+
+        kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-a320.yml:\
+        systemready-patch/embedded-a/corstone1000/ethos-u85_test/ethos-u=
85_test.yml \
+        -c "../meta-arm/scripts/runfvp"
+
+#. To verify you are running the Corstone-1000 with Cortex-A320, build a=
nd run the FVP and inspect the CPU model
+   reported in ``/proc/cpuinfo`` as shown below. Inside the FVP shell, c=
onfirm the core type:
+
+
+    .. code-block:: console
+
+        grep -E 'CPU part|model name' /proc/cpuinfo
+        # Expect: CPU part : 0xd8f  (which corresponds to Cortex-A320)
+
+#. Run the `delegate_runner` test application inside the FVP shell as fo=
llows:
+
+    .. code-block:: console
+
+        delegate_runner -l /usr/lib/libethosu_op_delegate.so \
+        -n /usr/share/ethosu/mobilenet_v2_1.0_224_INT8_vela.tflite \
+        -i /usr/share/ethosu/input_data0.bin \
+        -o /usr/share/ethosu/actual_output_data0.bin
+
+   The test completes in approximately one minute.
+
+#. Run the following command to compare the generated output binary with=
 the expected output binary:
+
+    .. code-block:: console
+
+        cmp -s /usr/share/ethosu/expected_output_data0.bin /usr/share/et=
hosu/actual_output_data0.bin
+
+    The two binary files should be identical.
+
 Secure Debug
 ------------
=20


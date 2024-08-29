Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E46C83F05
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 11:05:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10177.1724929517132920861
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 04:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCAB7DA7;
	Thu, 29 Aug 2024 04:05:42 -0700 (PDT)
Received: from e126523.budapest.arm.com (e126523.budapest.arm.com [10.45.26.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E05923F8A4;
	Thu, 29 Aug 2024 04:05:14 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 1/3] arm-bsp/trusted-firmware-m: corstone1000: add Secure Debug
Date: Thu, 29 Aug 2024 13:05:03 +0200
Message-Id: <20240829110505.55826-2-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829110505.55826-1-bence.balogh@arm.com>
References: <20240829110505.55826-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 11:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6007

From: Bence Balogh <bence.balogh@arm.com>

The Secure Debug functionality can be enabled on MPS3 by using the new
corstone1000-mps3-secure-debug.yml kas file. The kas file adds the new
secure-debug machine feature. The TF-M recipe adds the needed TF-M
build flags and patches in order to make the Secure Debug work.

This way, the Corstone-1000 will only boot fully if a debugger is
connected and a debug authentication is initiated.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ci/secure-debug.yml                           |   8 ++
 .../corstone1000/images/ExternalFlash.png     | Bin 54896 -> 64795 bytes
 .../corstone1000-flash-firmware-image.bb      |   8 +-
 ...m-CS1000-Increase-BL2-partition-size.patch | 111 ++++++++++++++++++
 ...-Add-PSA_WANT_ALG_SHA_256-definition.patch |  42 +++++++
 ...m-CS1000-Add-crypto-configs-for-ADAC.patch |  39 ++++++
 ...orm-CS1000-Fix-platform-name-in-logs.patch |  27 +++++
 .../0001-PSA-revert-header-versions.patch     |  41 +++++++
 ...nk-psa_interface-instead-of-tfm_sprt.patch |  35 ++++++
 ...-Fix-psa_key_handle_t-initialization.patch |  32 +++++
 .../trusted-firmware-m-corstone1000.inc       |  13 ++
 .../wic/corstone1000-flash-firmware.wks.in    |  10 +-
 .../trusted-firmware-m-2.1.0-src.inc          |   8 +-
 13 files changed, 366 insertions(+), 8 deletions(-)
 create mode 100644 ci/secure-debug.yml
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0014-Platform-CS1000-Increase-BL2-partition-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0016-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0017-Platform-CS1000-Fix-platform-name-in-logs.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0001-PSA-revert-header-versions.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0003-Fix-psa_key_handle_t-initialization.patch

diff --git a/ci/secure-debug.yml b/ci/secure-debug.yml
new file mode 100644
index 00000000..33cf00a3
--- /dev/null
+++ b/ci/secure-debug.yml
@@ -0,0 +1,8 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
+header:
+  version: 14
+
+local_conf_header:
+  secure-debug: |
+    MACHINE_FEATURES +=3D "secure-debug"
diff --git a/meta-arm-bsp/documentation/corstone1000/images/ExternalFlash=
.png b/meta-arm-bsp/documentation/corstone1000/images/ExternalFlash.png
index 578f0389969ecebbd284d78e062a0df1af4067fe..46519df9c08110d9e37cd3275=
4cd2e4e8976677e 100644
GIT binary patch
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

literal 54896
zcmeFZcTiJX8#hW3l`bF%ND&dF_Y%6)0HG6llM(^}5?TtOD}qY10RjRdDqWDG(vczv
z0)iCjAOg~RZ+8bh?>X<8JKx-Y?##V2@8~u=3DD|@f<tfxP}<vk+<Ff|1$1rZSuwT`xi
z2@w%#H4zbU(fPAL3od<75cnYWGXbj+z3F6|BO*F~?5}C*?}c-9_k<DgNUHz7<B<?^
zL;3mhNNVs%NH}_Xi@3Nu!hIdR{6vs2f1nBY-3#U7?&=3DP6`TdN9n1rOTxP-8nEL2>Q
zM^aTvn(&W|h^&~n_3!5$;V|T%4)sxZcTZ189tkaJ5iy`EK1*?N9!WLePR|{Q#sQx=3D
zkc@+j6hCmM>h0|bvw%54+<|emq$OoVBxMM%K(wLydOQ;9z`dut2MqWC!<;=3D(gjdwv
zd{JINi<Y>An8@iLpwZOP)zR1eA6*dE0P}Z*|DL}p6bIMQw{`@(z`am9z_9LaCco#6
zf%*EmqmX}=3DDIp>*0*p_1*+0M=3D_Pf;uhH-ZW29)5D)C5TQhgQHNNJn5Er!+JImM<*+
z`$hLZG}FMUL#?df5IH#)q=3DY6|Pfc7CSUaH;S#xg}Pid4C*hoqoi8g>qs2XT$s!MD8
zNJtpz%ebPU7*{{MfvlK`DgvVJXKdi?0_Bka=3D%?l(2G`Nm&_`%HsaYWWEp@@an*)sW
zL8dO!AQydAlmt=3D??yM&P!s4VLhEh&mvQS^RtFtrK1)||3tFP}5lh8KN18Z4(=3D&M5g
zQATb?7<VuTg;z(zJwTpX#sOw1oCeq@z}LjhRa@Uu*BfVSrHgg(_c3q-#?lrycd~TW
z(e%K|is>24A!W>gMhz2d3rBG%OdJl7U&>t_2i3(`xVUJV!l8J)KEzlL0@n5qFoS}%
zT~*z|YWjZS>SACSurW&772)A+;bf$1K;RWMH#L2zgcsaU-&jx5+A;v>SrcgX11>K|
z86DsQXXuR=3D)6i8j2VtQa2$(xSO*JjF3_d^;4pTFbbvJ;yyEv<1(O4`B?J1|>DdU0$
z!!Y{(J|-psU>zBNm$baqz&g@ccTG=3D6EkB$%9%wO;_OmiJ#b`o2wY0>XRCQd<^{t_@
zI!?Y4ZmMotXlY$tIYU1UtQ*+fS|1oMz+KA}4kmD)zOSx^v6nRx>Zc)LEbR?<$II$!
zS`c<g2ce~^V{NW&=3DIW<zs%C8J>@BA5>u-$qw+_&Al955f{jJ2L{U8Bgl%cq<mW7(X
znv=3DSOuQO6r3vTG<Y@s1;?1WJT`tg;<pdnHa3&OaL782HaSS=3Dq7Z7lH3PaNuq^+o$h
zLA=3Dz})J*VjEmNd46oM941y~E18&VymVT|-P6f<>G3-I(1_X6uknp>)?Vtidd26%`Q
z%30M%%u&@C?WZN~Wv1?{=3DY;i?hRNwz;Vg|@9G%7eEe%|NVVqn*dN5yOJy{G!M;fFL
z#T&wrI9G%df$&bw2qzN>1aODZcXtALV*z5SA&m@y(anGh?c)h|bCd*0=3D>`OdNkOz^
zrNL4<Rvt)%gsP;QCf46t-%!^W=3Dts-I18JsfriTZE49s;*4J;%b^>tjd(HbZiRM*;D
z*2!Db$3WXqSHs#ErU{X8Hj`GDhFQu4$e2j#;*6kb*4A>K*2ZR*7+Ebdb%?CDw}Fwq
zw3msgnYz24S%9{<3`|E>Ox3{2*vZA*#K%-Z!_X1w1~HO?$e2T1w0$sQ(w4@~;?^>H
zI-Y1BM;)A@hcymi4ab0>D0gE6h?Su+Qr$~W%tt~StZyX^H$j`Z`GbHdg5><Ibq$Q&
zeEfa<tbN=3DuE&zk7S;66&u4pxNcW+%UcPl*|Id5~A8_d$t(NIQG+QY-h#{+6@tf7rS
zx>!K*1ZnXJfXli#83V6kojkCrzBnIMOKEpB8sjggY6<oBmeUu<BD6ihY6wSh6D<!J
z6Blg{ZLAnp6&~PeXy^&Zh*p4{mz1?7O3P4J-_QqU2?v-}Uqj2!QAbK&-yMv%vNRO~
zSWny+E2ZmZtgWtt)ioB=3D){vI-vIM!pWnkK>XeT)dO9W0|N<+%m6D5oB2ALazWdhXH
z#RH@<rq(W!`X+j25F=3D|eFiWr)${l1TWr8u2MoXFCJxxr-0I5=3DQ(}1|*tkivh>9~5D
z8p#@|LGVTh2{Roj;7509gh>EI7Ydg10pUD=3D230_xY3X51T%4TXzPhS_ebPsvthKeh
z%+&!6s%9;t1~KwR>47CRt&P>eNUXV@n3p+H)7Qcq;ijW);RbTIK)WK;oG?<Z`iAb(
z5N#7<cXJD<rGdY>99rDkL=3DA;AGc)xONBLub2^mXD20(qpadI#(q>q>!&|)SB(vyK3
zid(yg2Vgu6<m5~YrLf*0U}#`=3DS}1)O6oXd>i35+SIU)^wfDe=3Dt2I7U$a<$Zj$y&HN
zp=3DI$BFejkh5)*)y@{ly~H^bo2W@r}=3D8FMQ`F?TFN!$8l>Man|jT3X5vWsNhjHnPCr
zfZ3?Ys0Vmre4Wiv1~OPZ4NWgiV>}dMiZt@TV{lS9aV=3DdPCy-Hqm76ABL)OJZ3$R04
z-V)+ijFgOH076esN=3D!rA6KI3__{;bref_Mo!Df<{(r$3DI?i1SX<-df0|Re*NoxDT
zu^2T?T{D=3DPG)4{SspX?1<Kqbtx0V9wd%5_7e2u(~3^hTH;s!EqGOl`Pls3Z2!oV7@
z36Md{80K%_<YbHjZh^lTEolR!sw>7{+Q;>G3);h5+6V58wUUwqHcZRX%|+MUP1n-R
zLI&*;;DwNI_fnT~a+T53clMVw)Hfhd${LFXOobLo7Z4AmxERI*0XNe`csuIJcw1T-
zx|+L7c<UNUxxmDb7*kmdM>8WyNguG6oFmN4%-6>UW(BqI(lRjyVLW8@#bq!Ws$eOC
z?pDPTtS{j&LAU>9mrso}@coagBdJ+_R?eS@=3Dn9dJ2H*zRFOHHvWrG~ZtSY?o8h+=3D6
z@>Cf7jwyK?;57Ws&uJKA5VH~}u<|7|?Tx3X>&)_k{J=3Dr_U`qNMhk?zxz`RNUBaPXL
zqYJ+*LcOzy$oOs$Qy7JjTzvlf_WQ#dSIDaqO0pLn#BBr=3D@|g0~{_A(((Kw;v?IxJm
zs=3DP1d%~Ae;y`D=3D%T9lS<X&(Kb9#1<D%c2Bcz*F8l`rix06yN{fq0$G2-L)wNf$Q=3D6
z;3N!p_H*q7>rf%MAldO~9Rn$=3Dx#mhT<YA$=3Djv?*vUH$bKD{(}h0rTMa_>e6KbD;*2
zp!r_s<O(*IBDCuA7fxv+g(T7X53%Ry<h1mHa2u@cys=3DGdb~bDCgU%YUEa&9zCq$Yq
zh@58^sowId4cd?Bll(MQ|H%w@{7d;NIQm}99z~XU6vy2QJShURLwSwA-1(rnk=3DZQ)
zF2iT3P-YfKUR&jt&eLDZN!_s?yU6E#GlHCxSjQwATya+TVPWfv-{$-rLz(E~b36!{
z8)*i?$3wSJFHc$Y;Ns1R@~(|GYh!?GcRh$9Mmi}X4EN=3DZXs)Jv&H2u#KWq9-6&e@u
zd9#A@xyiS8k>gWIWU*(U+%j}oTHwwfFw&q2rMH2Cky1r>LP{;Jm>yr<-Jh1MR7hxQ
zv>7mdjWk6gQO{Ij3n4RCedafrYw(w@`5*7^0VK3&tWZCIw(32S;a;|{is+zp<ucAI
zW3KQ$M{<tbiMmkrHW@g@vqH@Kqr9QvY;hvm+i6GUaQC=3DFeL_D`SyH#x?fKZw#w@L3
zAda)jLe!k=3D{qWDdR=3Dbkw{o&l2VeuSy>doYei&hj&JMFHGT`vgB4JQ(*ufJSxc!4$^
zkf<;RN=3Dr4nF^Pn3SOc4>vb~x~;TLi<!%Rccl`c+|RmwW3;q&BFg9&LTXP3~>z(eJw
z$)n>XL2IVZFB%X#{FJ?pi#G4sL^?aZqJJp<<hSd_yY*03BZe%g>`GYNOJ+aK9aVj;
zb7YkIrQF(4VJi-!Vv1vlaBP2f72W@=3Dzdlt4%wenObEcHmUgHV#+Y#tq9TsJ*0`^6-
zSsW|PaINBJ4mXeOq(q;Q&-qQa)bDu|9$fCJ=3D3Tb0iO8)oNFI|p-d0=3D-KGii7CnQwW
z$DuU1GlZ`sPr?i)5>^La=3D^9rD9??I3$Dw}LC=3D+U@9D<8C*DSs2dZ>{zP$7!%6<T^7
z*F*XAs;NxS@h&G*{N?-VsRKW@HsE)ec?3!>2^U7bj*PuvTm#0hoRz^eJioK>*0+t>
z78JtFZGmiwdXM^A6v9JgQ%QDx$Fp%+8nU)_WYeVoh$I$I6MjaxeS7^gw~#MOjAYdI
zkD~>PyKG9lzKML%tV@;L(5J<DPalTmIZq89$FN1QwWmu%-a3v+Dc1TisDvIvYYL}X
z%Zh0z-<`21&!<J&HzsP9u1zj^nC(O=3DomIt;*9^ZrEUQfu!!(BU1qu#Nn}U5NzjHA<
zy|U;pxwrJ3x34drll}(Ep*HN>IZUQ@-_YF)dnb{#87g?98jqygu-%g8JlBI|OF6U<
z0`n_ephMw<T!9y4)^R2b$v0liW3JB$=3DUZ)~VV%|~RJMs5FR@eE5tX+Ph>>aJ#Vbf~
z-3T7UiTx)10zmp&gD<oMoqyAYL_X61fmzvS^cPCvWK1nn9qkM@gTZMQ<CfZI91mZs
z15{uV;ZVs@^VriWH2Pqo-(>LQ;>TO(z(qqapM#!&-ubT#_rAH*1Jf*a8!>8%NxHyo
zv1Fu#hSM%-j^i24;_b`6`#cm!acx!SY|iM^>ptQomAE7n*^uDzV_~+7dHfX*$9T;h
zxhPR?|L@)pjK<zUMXEzLSj!c*HOfG1S0>%&BIsHj-U!IYB`;qOANb|dYBcpx-y<ip
zn!YXcX#Wnk&46>uI@vFAbSA5a7kRb2-%rh7-jhZ-PSinrhdNuuZM4LG@wUe39mIlp
z;Th$l9S#N=3D&SU4PCs*V{T|&2>6;WAjBZg}?IrWzNI2w~snt4Je1C2IC9-+1h!6fm^
zBTY?(;L++DaIDFBPH_qPR|Zi$Q&E>GsyWB&)YA%d9@N<~GQP1x6-L9OsQ5Wca8sNM
z&A(0H1T#SGIG=3DPY2*J)qk_m;&g1dX%<ZuPqE0pw7d=3D23HPDiO!@B|{ckZ-C%2m6ej
zj1<ou<3Hxj8oYzkE@!%jZz3Z<a*S1Sa9a<kXZw^wSIa!l$rgUf!NeAHxmD6&-`tLw
z-g?&D_PnJ`vwvsBu8PW8LE56xPVy)J-RnCmIb&bc81u7kkX`qvc<6O`;(J_&rO(=3D1
z{7morKwK<G)F!UYuT)S}$++u_^}8*<?5mD#QUbd+^CId|u=3D8(WkBt;_!8RVFN(uq=3D
z%pP!^h?1?8OrI6U^z?CA(e%mD1q&cjFG~3?;4moQrV#Wf$?Mlr{-t?ve9qe+H=3DFJ+
zoxjNU0Ils;BXZPB%O)Y7(7qo$e~zM$mtzcEN;21t?opX<iGIbPc-EeLr!XqcVmdVF
zBrbbr<>uN4#}DYWXB7QDkFR0<^u8Tn!_TZ}o{VX=3Des!dJAHej-9xwv-VBD`g<<uSs
z5_3z^wO<(KS1_>L5nY)xsmPf(ds2TH<b7r9OEyn&023~Ib3SaTeb#yMv(0%9iI->x
z2bEy8(M28O5?6I8PO%}@<!d(}q9w4>2xWfLN&|+4h1s}8aEAOepmc423Y&h0+`c1n
z`>oTu+ZUxE%?_gi23+YS;X6#EpKz5ZmaD>&td|Ef7VD3E3X<jMHX?Ua%gxh_GJQNE
zqL~L9XD#Q)3dXgc<PLn<$3jpau;`@Bb_uxztmO6g0*U(i_B`sT&DEF|`*|>NmkfE;
zZB~U`BEg#V9)%*3`4iWJ#CpN4oD9i3``wv38I$uXg4vZh$>}F@7=3D7x1ZJ|~Cc7OzB
zS;Wmf)lWz7Jf^Se{px4U8d!|f!!^hLX2<&acA4Kk8}f{hs%Cn4Vb6=3DKY<VvAC^H6z
ziZQ^h#n8Yut{OeBe_DOS?8Kw(c~lAyw}=3DF_Z&cWO(YxUd96YJ3(>`@-9Iy8kG}okj
z_`HsvT`M)~dg%#%k81i9`g&@tynT0b{G7C&<vf35%q&}F1fRI`Wr`fF5UK}oFP>gt
z6Jpt-f<A55ruD@W_m~QN6!ysc!Dn75a#b@vcRtG$yHg9sdNvd@m3O0-bzM3gdQC$H
zPZnkk&AJx)oBik%jOjNs-VZg3%>hH+ype@KM8fu}7C0;h!Yzg#Zk9lbjz_qY`i!>T
z@%ZIsb`?g(m^LOWQC3U14CkWZ3*xn*8x$6X8AeJI0T7E@La{triAzmy3YkX=3D&hB^G
zcMhfm*!^~mc>r=3Dn{w7!YS$lxBszRnFg%_?gM)2tA8lgu?XRRg@?mc)3?#Z7OhIN>c
z8--F}mj_;;IdNSaV^JaNRNl)ZdG953zkmQ|=3De&&Y(|dr|aBMcApC)`sK-Oc$z5O1G
z3fB)F{W-2xRwbHt13=3D%0F;u;q*!(yOstJ8RPnL8gNy0BqCFKLn!7{Dy&OFb&+$^2o
zdv4h4#Zb>9S<z?Ves^x=3DjJ*~_pcmbRLys2uH&IYV@gGg#46F76#}SkI;E9CiL*)o@
zGa26)OT_sym=3D?T<q{za{d-zes)1IoVDD+*?G!RLE$oHdo?$Cm3l)qi}Q3|oup`~0{
zGa*DcObc6nX|~Sav(aCPqiNkJlL&ZpW>Ci_{;Fq__WTt^%4*XCkn_S1IZNDpVs;}&
z7`*bWULn&%aB;ktg3|D_Us`4%AN|v7pd)?SqKBNMBRhoUc6AO#x6t-cHIbj3yfi+V
zeY0*nq4dsAGO}&IY8j6+TpA9arCrH#Db(Vi$+Vt-+WM^S?v|B1%d$}83x=3D24v15`+
z`2FgFgL**)FDofQ6WHfW-bDFgA4b<jrF^^_nzTsIzdzGf8R|9XnZ~ETjhdTGFiI;o
zx>t8VvTAo~3~yQh>KTKUw_+ivXXQ(~sr3r4)frk#OV@2zc2>r(bcMO{8&P$NNQRsn
zi`way3YBk-sY!h09_KmyoLAxzPsC3a!**WCPOFJ#&uxJ&iUX<DHn{f6{3FSof{eBO
zL54E^1WL}a>Q7&eX6cj+6brdJLKz5Z_e+_O((^YNkVMiIt5PZD(8Kdd=3D)e=3DVA9l1w
z1z5pSsjAROZ2$9R1pl?2t~%>Bn@B`^N?V!$Q$tsVikMR~&4LMZ*(Mzxj@|od{JqjG
zZlCKKxLYD;X#`TEFS}};?uQijrqb<0dLFqgNLJ@#xvV0ElusnQX@9SK16a3AD23H&
zcsD~~dF%d{*Mc5}_;Sryb_;5ocbm+WG*$|U9W5`@mkQKV>i{30mF34(ouL?k);7;Z
zi3;O*)>nP>s%AF+8hHhBYx8r?(#hS~@h6V!@0=3Devb|_O<U!FCz@Th5<Z7ZmwMUB_b
z&rLn7(bg&7&W~8V#rVv7XNZT&&C+bk(pAv5=3DNn?-ka?mu3NY>k846^VXY|3-u1io<
z4i#OJG;*LLy#Oyc9q?Tx8FvZSSE6i1pQTsx8tLkuXpfuIJYL&~N)glR?D}>N`xdsw
zcDTE(-%-q_;7DJt_~^?S;m0r@-8rA+7a*NS`Lk7kB1lY5er2#eb@%Z3q}@cqY!WPh
zw|#s30Q-QezXa(QgCp-1x9T@el#o2@Z`Q>osvI0uDwP^&H8Dnzh3^GGklT?i&jBJt
z&*OAr65@}8d?QE5dLK!6>CQlj%_E1bWwzK*9X+_9*+jJ4Mu`shTh~u#7&WYES>io4
zb@RwyzLd4-PY&K%<Ol43L3(-Nx7_%7bi$J1<g#JcYFmUZU^tq?WAoS68WpbT^0aeP
z-#B#1?e**|Q7-s$jZISZssnYkR=3Dhf12)6BHWj{CA7<irybT@^l02jN@XIz@eN^*Fe
zVTGjVDZZShsKB8*sE4ooWS}d9%Vd*zK6x@_sVcu%Fcrr4!J@F}si|EVi%j>odcl=3DB
zvwR^SoXf#K5>B;Hs$N!6cO_0jKk-Z8qn-1ixy<z<^=3DcvH=3DZz*lV{w-?-tj$O@1o!A
z<VRp9Y#Xlr^y>}c402B^DVvTIMPwuKHQlsMxB}&smD+$cp=3Da%vZlq>17!}}ah<u@n
zRHxa8RTS}A`x9l-!=3DT^Eh%ipdpp$Jz;b<4t9{=3DR8Uh6?B$NuAcAS=3DY&b^_(o%8hHc
z&QQ-Na5mJK5ONn`9pr$n8sVQJHvOH-2oeE8FLSDggDLQ$8?O&FgKE`7M;d|XM(nwd
zG!SGxSy<Vh3YY*B9zTB<m^$%V!Rk}O<^oC}<ce5mFVUiHEzy(=3DhsIB4@uLZbj+489
z!FaAdSUt}I57<t<{5x?{Urt0SI!yZe%kQC2Iph_<A$IBJ=3DJ$Ua-QWEZD8q~!Jo{&u
zKZK$%suuy8m)6TlO#ajKr>nn>^*?^W@YmOSBxNTgoCb*h%+8#(fA`O?r=3D%=3D~0F<p#
zEG)SA?@5ZSmQbH+`rnzK-%8((p!BERVXyu@$*}MwufG@g=3De<Rfu<!v9LqS2!e~(L5
z?MeENIiKF%Od_b-0BbA$-<$mRxHl(Ym;WT7{+?0Q#q(doWjABfF!wrj3C`U=3Do+t)~
z$LmC&%|Vdu*4s$6wG)wjx}EuVf4`rMCsA<FA|@@;YJb3Cf7YH_jOo>XKQdtmOekd)
zxNZs=3D{Pzm#GtMyMq$gQ$(jP6K{nyaX!&CrfLo`UPB5u7s)d2rkO(^}%iM|N<MBf=3D_
zpMNwHZjZ0k*XNUW0oSJ=3D|6B?%*F&AKa0`ZX;EHMfSAJ~wF~CW@ionGj{fD>z+L_hs
zz|QL9fJ=3D-i`+p1jvtu1J)ea4j{fZ<^J6_=3DzIF<Le!MN`#!{Hf^H%I~6Dlko;N8$`c
z^0kO5KoMcd13qW%J9wuqhs$a#LQ}vWf7J4<0*?OEJu*rBGkV-0O$_2K8$oi4$Z+iN
z1p;H;942vfXaP85m=3DxHSr?HH(2b8X5`&89huPoyLRtei7sg5hXLtx}$FXGaoDS*G0
z!hy~G^67r+5t*cQ@LBsT6Cp5x;r<9!m=3DfjFV3p4L{6TAg>pprGd>C{P%j$zqNDDOk
z5}4&Lweh_)Y;cFrVd0(sb@)FT{>?Ur0;|g-er(MGWep>_M_->~<Yd9g5)ej>SbDm1
z@4L3Qf5ABUA79rP0d<!nSj3U4wxD+-!#lwz$E5A%D6m(yN#u_33OSS9IkkxMaW}%l
z9&o8$v6<<8y4XYg`B76#vfqGFInrVTRMo$#Y<Ee@cO-P^?Vv-kN^tu0%70j&U<^++
zQ6Q7pLCCXki_-F4*o0Rvp2*}HB#eFGwPpPJ=3D3qYGLND<>`le&&i9(}B7A1LUjZV+G
zGKBjzP@B)@FBNi|0X?Z|6l9_%G@z8?8>dRJR?D);hrpG$L$stQfyP83?Neo)4hT(_
zOK-A@Eo*|496`s195nKf7P&@mwAU*j4ufo~d}zU#4$Uvj#=3DQ?QOOnL#94akof$;_5
z*w!35%VK{95;BU2t7N5(FgI{aS~c@gqyhMuWw#i@I}j>halTXOlhf$yn%%vPOB6Hh
zx2zuTUvc|-<@>vZ^F#iu_pYdt<a5|0=3D|p=3DU|B_(TofRF7;L38H8h*cWms6CN=3D?inj
zUAjgt{cQy9XkW?K1rnXMkd3nzu^(YZ`j4Ko-<#SV1$V#O(6&9omZ#PqY|I*NvP)14
z_Af#YS`+1{U&k!Ptxh&f{Ft_J>v6rXtP*s;iF|4zV~(_!mgvoGd{MZm_i_Wez(!uH
z55E7b??LeWsawgndk++caak|-?%X^zK*V}s18YPWH5`bbMx@BT)W!jZE1js0s=3DBeI
zQ@yfR=3Di!wQJ%2Yd%DRvvwH_))@q*CHdQaa$$;QyB+nKXrpF!1rG!2pDg^_12wPi3a
zS@+%;Vlxov)ummD6h7##8Nc>ysLqJ`dZ&GkG9DzWQLd{=3Dr-EkrlH7BN=3Dl;)zUMs=3Dw
z*Bja+H6Q3Q)uS|?UF7ju+ofQ<koul8Z%o0<*08{~in8?BDj)CaP!lo>lN+dBCS8d-
zQGTI$;CPo&GLK^VO&~7m%}CtCsgsZ4UZof0q1wIfJz%ocNz$RK>dPt2UrQ?}*0@_b
zT9$*a_xf0ptYl`v#hgY|zSp67l|zs3|4bH`T7DIK{*sK;jPOucJf}*Q**65BL%lLi
zt?l<)VS}=3D|S_@w|{!+{Jfq&GtaAy%|QN(b6XQNNhN)Veoo{2Q73)=3DW3kT&H72`bB+
zw6Ay;$-a=3DE;yHx5kab<CK3)IYD3JecKM6j3srJ^B-kzZ;`d-^KB{zKXEN<gw5#El(
zDd$&(BMav6xDm{F5oS~3dwE90GJa`+w~D-aUACwVNRGTpGRJ4}tnwPB5P2lUsII?6
zW=3Ds|imx)TeghX~O&F9%^i~8?`FqjQeRUoY6E%51eK}UJ>JmJ{mnDAe{enQ*G^f=3DJl
ztf_C=3DqIc7(U+zD=3D(GdKkm9AQ8$~E+3jEv|QAIo0?69@=3DU>VVH5dsL4)wN|Igrn;2K
z(WWoh;@Hspsx?JUn!YI-MqLfdN7r{V%oeI{w{&sdr4yzwSaz7;T~!WUW3|J_w@l~1
zH~apCtJ^EZ3_M9PXq0a(I#TiBqW~SRmc4Wn2vd;rOU3i-yCuaJ$J_fIfzkz5ai7t&
zMO2L2dC%bC1N5&$4|neY5}IjW8UhOTrb|}}^-3$t(`c5-F)jzO_VX8Ee142Wa-jK=3D
z{X!hEdFaYK4x63SGxl=3D{iD4l#U+E(#7}Xdb&c;Snd})pwZFwN=3DC-CLzR~zc^ZBOTk
zzC*QQg2xt4#9P0BBU0c}WFu&elt1>|Ff8<peE^fJ#_G+dawy?W4y#+CUAAw}+6N>`
zd(B@%w3Z%pY&~$D>poha7IZaS&QI@4*x`xcylf_LQR~fB>O!U0JqxTN<{^EJffKFn
zRP0J%YQZ>WE;c5S;h2DE8T|R`o{a@FIUp*VMzL)4s;!8`K9urN^q5HC81r|3^ui+w
zpZ7hHJ*qo!;$nflB87XYMaythARWm2X3)_-_4{Q-XsIy-c=3D{#_LRhI{3XH+1U#<B_
z8rfA}K`C1tl1vFGzhU^P;J>?ab367?w|r^TK+eT>g8RH`U%$8jI#rMH^?_Uab{F{v
z=3D;caYH|O2qe!El8?=3DfLl7f{DKQw`tn?<<vaUPhdu<<Jv`J>f?QOFwz<(mf)eJ=3D2!X
zkv7!-ad2Y*ipn*ec4F?W;`#BC@6Mj&*&JU9HtR^5@rq(P57{NNnySl*@y!deD@KL(
z*r452Ixx1&w2Ouoo1C4_p04P3CuzExvbsl72+i*>%92eZ1Z|8LZl@P^s8Qc);}{Y@
z$EAJ-ymeOTfq>@Ktwm(zv%Wqfc<$70E~FTC;3(U*sw-Ob#7fFTOf8b?P5OqNV&L8V
z6AAL9#lWfiKEI{AgYf~Z@xFy;VQta6XV9*<qw#AEdp(YC9rE(3I}B)7`6SMVLui&e
zEr#}2EaLnvL4IOR8u5#B;I=3Db(S`KAXm8+jicO_6^wu0%SLz#)%kG&Q;8~IGjNpF!+
zB1T(&aj}1Wo%}d87;hnhTKk0C{UwJ?bI8_uVJWj`tgrQ=3DHD*hb5*GDDA!Po=3Dez&08
zgDcvJQXG-n9=3DA=3DJeVzL%N9V1AE08{Zdc>uuCouvNtE>qn8NSEC>^t-L#bmLfsqJse
zY?-{jolToqfH~!wg!blr1t;nL!UE*LvH9jgKX_N$#$RH$GMX><>9wuv73keyR4|uf
zjA+rbz56lPh70lunln&PR9VrP&O<GbD10|k_*~9&!BQFQFBvWU`+YA%H1*PI=3D%X-S
zw4Q#=3DH0sRFN_nEo8}n$@_O0u6sXQBEuT%?goZ8mf)U2U2+hD%0`u@8TiYogk3wtVh
zkQn{-`?qUHQ}Sj#?8XbK(qHWjh+YXz*PC~>iJLoYzML1ezkJk^SDW6^BcyVsY(<_G
zP9yp$%u%vezj)KL{fw35^=3D+;BC-(?0wQ_W-;1yY2VR@?ZHwwZZO%v%K&(2pV$nNIT
zO0wd{tApdO%?aL|t9ImjDjRL>v^aMAy5(_~H*H4XRDbZ3f?o5&4q+A6&(c?%_b)Ol
z`ZA@Dd`D7OOLULqZB-RJ9iK<Vk5>88yG(-;zp&g_l#{gF;TE}W=3D<rG9+gVFeRP-k^
zqino;YZjdZBzU+pYju7M$@pP9s?_(@dR9nbN$7N|?BKgob0N))i`5-8lsl=3D8i+*7-
z;JnjN9XD*4>h~n&X)rqw0D8)WFyf?Xqnq{V#en!=3Dvly4<0&NRvtEe-6l%mr$*KUCl
z4-PWiB7I^3xu<#GLc7DV7BMO!{j$z@bp6+0#luw2*q`T$ofxe%{nx7d!K6ZXi8ja1
zTU-6;vhmu3Fw4)n6I(S(=3DjpC~xa<<ZrpEip4{2&sBa$iay#Mn&D}PmLy&xnsZFlEI
z3d>kk2e4?|^x7G@vvYHa`V9e}M#>*t^RbmKt$r0XK#zMBqxgnS!WyYq`OfSpho`1)
zope0GG=3DDMsV=3D-?e5ctUIHQ!RcxZ1Vw0Sm0O?+1D$>Us)l$M27s%zp6iU}W30^C<Qa
z6^n>nIlBuqV$%R${^Y6N43o4YofHbHnGn4Di-kVBC~RP7XJTk8u)l@G8pHNFlC%Bp
z*`3sa(WA{lh#qra^Zs@6>XIiGCD+ypi*$a)C6`55Q;r-B^#Lxz-M1$>M8|92;MKT2
zEv2jCKK>R9LMw@Bcnbp(RMPg=3Dm6ni|9^P_;4`((cXW#r7X<qm>`s!X(y&(FT44iRB
zbS%fU^u6bL&Zju^;~KUOM-}0F(mtZ~3!vc$2lCxn^az@L)FIyPBzC~34ncj$Ci$1^
z#7+pfFAE~KFMV;_V)@Mk6~+R_xv>-xzUu4CN1^k^q*m7L>nU)^Jsrb0fJsT0HjTVU
zan1LzVP0<cJxV2~Ua;#!k?ng*8w*2dX7^FQ$Hc|0^G&U)O9i32Pu?k-i?YH-vkxZ$
z2XWqqf<<64#4q%AIsORArsPAMHr%KB^|`8XsiR@}$kPb>fmH1DwN>4&tzvP%?#g5a
z-Ai3r_}p{bh|Ea4Dw=3DAEgGwrg<HKn|wL4Uq99<7MDTGqLm>Om35pNZ!$hOb};qcqe
z_o4m$Dn(OTq@qPr$AfCSgQ0>qx6y$AzM%)CI&KYG`jpn))XMLw_c&$Y6_y7&!=3DLo6
zV)_<#CYoyZRuTMf$LucW*9$&w`TS+3#OnB{G0G63c0ItpCTNbtQq1r9{y~I0q)+mw
zWNT>*s;_*#tIgo@z&8qk%)RgF0Z2R!=3DH@;6I=3DEK?7D`dQd=3DfIT>RxWJyCvySt>pfu
z-HN10F{3VEm@9^TIYzOWH9z>G(CC+M9QJ!}Cx&7J`5bDvT^<QRetGpH@2<c7vWZj?
zj*{McOjI-#O8;ZLgC1a9TosdaLEq||sH6d((oUJ3siZ$fzl-DFLHuI&Gk90X=3DZ(De
zpyiEW1+JRnbYY(D?0TEBAjn~$H{Jb2k2`dv!!JxK)E=3Db&*jZ5#sP>*zb6$w!ehLca
z2Yjzg`^V&^k6d$dA~oBaFo{dwKU2<IS#pP4^zX)9P%cOjGkm9XVEDo-=3D^>&-kg$D1
z;THHeFcaaqj*#_D9>72>!6wQVZFt8Hj;GG?9u<L;!v{iY1uLZ|(Y6*b(<kQjz-CF@
z%Z6=3D;tgg!+zlSHSY#9ELMfl_Yds&PaUNcR~yCTq4WS&3J@$FTUOKTBUsXFmh4Gp_e
zexz)MLdnJM7h1lgI|Rqn`%))s1WABImNV_8>cE|ha`1N(OWvlol)5*WTpjdZ4by64
z5-7npT+Ok01MDn4Jf`YTcn-DhGu!K9rtRb)6CJ67+z6TZdw{=3DuvptU-p^q%W<EAZP
zXL}^fhVy4bVXp%QU9|o7diJ`D4FV3_r3&tG5!<&=3Di@$w9PI4T;jt$-&BeS<}(Fb*p
z+{pj}J%UbEyc2g32h)ZDoU%62Z7N$M<yw%C`*|7O+;M!1Mai3xR{=3DE7)_$x>{)LaX
zxgf8h-YoM4w<af@XRB>>^%5^`Ahb()R@;=3D*0zc$rwhLa0*(7=3D&I8I*nON<JL4Z-2n
z$$h1b##h1KrUsFeU<eedf0pO5`Ddyg36>|G^k0P~<;Q_YX0q{)s^IM8_YYfPc%)@I
zm_xFRTP=3D#>9xHX=3DRj<5j560YCDwoXUfMO)?(xX|7uu{`9X%URwUM`Wj`)ZbIn(wdi
ztYq}j*av<{KK$vo*9J~1v60f^*XkEOaPcxps1mk!%r4%pD7SOr1Nrros@4B!+ONhW
zMVmy^LL)>l$V~HVuX9Rg>?Ql#dSC85{y}i=3DIiyI7jQJBcJc!8$dKwW{iLFH{Cn)8W
zpL39$!QuhV49?@!;0+~W2OumA3ys4?ga`toj^j7J1&RC-`DY;AiKEqV@Ydq9!*4Gd
zjcCIMV#+0?=3DZ;>UW~I(`09xSw^r7{{{8km>L-A%=3DB-I=3Dy*1k@eDJ$c8%?L2BDXI>w
zkBbFtMN=3D4zniV@I<*NL$v)Xcf{9iis2AI5>De*SA6UU0{uog6ZJU$RjNR8p^Pg4n<
zDrdCfQj7Wz*i}kOLxZaO;cX@063ogc#;LNgmWFL^V9H0&ApK2>0Lyfg{!9;Y`0d)x
z$T?5kvEFVf0Oq?FT=3DRRrUry&s$eQ8^`rYO{A)Pl2Bq-zw2{#UA+=3D=3DLF%3Jf-ymdvF
z2&ufyFoIV9o%Q=3DGqrNS4bNh(kJ9{`z9M#o(e6mhXIjprGSrmQRP3ro8Ow;Y0kQA|a
zz!2*P_){%P`!xJ7kNmH+_suR6*YS8DE`P@a5XM7hQME&>=3DE}nR;Dc@UkGIdM-*+MR
z-d?2#s(AFc;L87}Gxd2=3Dpa0oO_Ea|RIQ}2!_`lrb|I)GlU(G<*2ZkHcig5L|7>0B<
zEqwSZkI(og!I-(L1sH}iOgpgCZ2$W8!?B}DKUq3?7jG9m4qD%=3Drr*GqAQ3TK59=3D4J
zcbEI3VRxeaq{|!cwQuJvcrCioT~I)1xM*_>%yRxj(pJZ%8nm$kWknjHn=3D_{}uP&jm
ziU?7R9uB`zXkS{q)v9?dhLH@dI~(D*^a5ifXdVt^{cqG?Amj-->TuCu(XlHw^AYpU
z_x0?ez+ItriPzOlHj%d0HOe<XX)S^<<ZrVyHP&~<#XgvkZS5~JSoC_V8}5p6k!m&L
zE}qtgRtczt6i?u~Nn>k^{P6R&d)MduyO+7?_hkjMrI@_rA{z!xuA29rrzvR6BNT>K
zL&I%o9VWUrWal$3p_HGSmEW3wJ``^s=3D>-<adoWTLAh$sKc$Bx`ljxyIO;eA}B2*|}
z;AC$>HiC-d%ZXqUH=3D(p~gP4{uZtN|B4-tMpbbnp{&TvmaPoA~txDS0h=3D9$K10lzVy
z2gOSRw)Su-OEW_HWSeVsxvs0<evB+N{&-m_<d})&af{|{-wHFHR2uuR^1!Yfj>$wb
z%IBI1hx1#xf;&e=3D*}FSN^Pq0-p>q@-sz5HcK9W#vGh`yTVx$+x@w->GgulPR`@NdQ
z4D`m)7<rgKJgvdmQYwZXjmdjfLYK!?g5I&cYu&d_s%$P)Y5+$06cz6P74><usbf^6
zXJB@`SblE4-0filUDD~hdZ(p17oap(TKXdirSb`&``d$`j0LQNYJJP?11sOrKkm;r
zQ#0ODA6i^|QYuf_2)#=3DnpSjMJD~E^FkDBA-UJRP%cJU2jNDS<1Dd)`WrAy@6W*|lO
zD`Kt{=3Dmuf(ru8WSSprQiitz$P+Ap82@1J^O(d}QQ2fBuMMaCgy!wrK!IhCV4rm~Zw
z41u*@xk1q?`H}uEL(9FqIMm1wJ4AzUK%rSVNo$(&J$%iL(r(=3DTdK#<DXtoZ^*7)_o
zpAT8vU)s<=3D*bDLrQ|wUW1E?2Ipk5}SR_R%WoAnXw+xQ@n`8ko?>!GBb)8#^P+SF4D
zESlZG-x7X|)T!4`7JHqSXS&035_lwR9*@jStb1Gtts?IyfB$j^1Rm0u--_xQ%i;KW
zBb;PVkZ}Ph?}CbfLgdV6LTR%!{6`7L8!FSzbY8CevwDSbxYfmuyh{V?f|b<J+fl!h
z^A}gmZ?;cT_Gk8Pwa=3D&>K7D8wz*6IX&`sGVSdGPBmj<AQs--ek*GKPPR-*6WiB)$b
z&`st#P$Ug#BNV|%ZmvPzbJ)Q3kg^DVn)Hgy$m{JYi7bhv6OJ1X2-X~Uyq0%$VL+5I
zk~@;}j##EzPM1$j$XbJHEFF&;v&W4@4oC7<=3Dd`qfQbWHZCkF+k5pgoU2~tAU6aX9Q
z7ZaJ-_Scr{$(YF-%Ihtgo3bY#!2L;EC)dUPbWdzDaS)&JVdrN8nh#z6!m2<$lk&ay
zTbfrPmCj}8t1a@uGgl1C?jj7R=3DB(l_DwpM59uTE@kp1+WCUF%5PzY9hMG)X)Bim!r
zyoRNFg3P0tdGaKCCjj>uH$E}t`GNm%>}|dK@Kod{!bsMityKoY3)FL4uy5X6tPMGc
zTO}Lf_RP7Em%TgEQ)|xNzTZs$K=3DN92G~nIJKWEF=3DBc^x?K-BX2KLcgunU-cl`^sp~
zt;oE|&k{DUl~1pZcF*tnoc0dTi<z;wz~LEJfbCY|b<uIh`WWi|t!Tq9E4lWe8^_%D
z%Q@g_{vL?<p?UP)!-M&>Y}>l;e4uvYdSamZC~YWDkWEp>I?M_`hOMTczcFF(iNg|y
z$I&&KhwD84%ZaBf#s`$tB_5Z-+<B9eD`9;k^V%-bcXZRT^D=3Dug)z7w!#y0jYtgmp-
zqTau8u+8?T*{a+GMbR?!WFS7q1I776b)XP#nnsYBmp|4E3aKD(EXA_W60y9uXHHQ1
zwr`?5=3Dq0i0r+a^~*ot^S1=3DoI8H2Fyn{i91Xh?n!|$r<jSNYD@Lg*Ya<s%*LZ0n|un
z<Ts0z{MndkbUSOSO!P-mpjKXRs^thZ*+tQ4K+AQ=3D4{G*Ts{3qw^xHc0x?NIXEE2k3
zHzGI=3DREY`F{2VyHV%aa6Xg_sz&{QDq=3D)}I|<#b?gN>d4Y$~Uv4m9=3DQ>SL_fTNH_i{
zR23G?8R)VL4dbJ0@I7(@qx1^u^v?rfbUH5~a}fI@amyQa*LR8{z$o7ZvxN*uTbM-L
zDB&Y$U&3Io&p)f#uJ16KSJrRKIYKH0(Z!zYuu#vAb~U`iZYrNMu#;XHNt#_`GaxFG
zpis!)@-Yo~D^wI<1NRmJ8|bgKzvs+95wlEhd`PxD9<u9_<}Coddvhk3c}L^VdH~JF
z1aJe}b-YITY_m<g`Z9_`IrR34a&U8rqki8)J~l%u+efhAF|v@k+qR~5?<*N#CpJTg
z<*sIk%IqC_V=3DrC+<fsEfz%<P0tgS&Xj)#v%=3DS3y-0?ae;%H#YyzgI(GK9Za;MTf&*
zdo~OE%?8aSdE9B`+s`RJ_n1Bt45t6GWZ_U#>%AfFspQ)&KW83gt=3DYTqp0ma%GZ`XH
z_LZTdk>UYix3ceq4}hL70JM8_w~%2tS2m+=3D?Sd-FIj#97TiSsSypU5M5MaY5_(&v-
zvng6d$0p|5vCQAzrsVBMysGL(HwZ*fveVP2T*v0;+Go7oC#pT!4F`-+?t^E-Xf<%A
zlM??bnE33N3Vns}mGGq00g_9icA6=3D@{Lt|1u5{<kr~Iu?#DyhX^`d%nA3Y{i`cEw;
zpns!CP~)|Y?MX!sKx->EtGv5)w^l?QYP5c6kbiw1LcO)$1M~2nm@wA3N6+Fj)udMX
zx(?jOuHwULoTXt>1ipJ=3DEDGHC-t@`@Wssh=3D)D8BZLkvlDd@nXeLjD}Y$|FL1D>BEE
zaE{e}e97VEbNq`~Bc6ftHq#sM_w#ibu*tvpl(2pk644ChPl9{1gA7}BuMo24=3DOj=3D#
zhiA&gl%g4mTFty(M&;8h)5%Qn?DtQ`>eK;z6CID1(8U5vyPD&*#=3Dr=3Dg%blSD9}QoH
zu>)A3vlEZ^0Sx0ag%XE5Hrf4l7nG1e=3D(2-;Ver1~9vwga3sKOfqSS98IVHyci9=3DnG
z*6IbWJ_vwOe;YYvNlu@s(GfYn1)#5PcFptLW#dky=3Dm5@27!?&|C@?<EYJnC(wBuOf
z)pG|c`EF_eh@!iXI1~2v_ar$+EAB<`f6Fl>fJoIMDGD134;f_VRwmm=3D{s;?U4;C$M
z-~)tfntf^ch6_|jPcA*kc&^cLmJd1yI2q)l)>B)h*#c*>Tc1)ldmN_6EbI@O-er?~
zNAWqFgsj9ts6U1z^uo;vY9f6X07wbK?qUs*Q)7)rwT|sX-cZFef3Gb(OvL+Oova$q
z+nAei#iZ<4t94F<{Ljn|kIDVL(7uIH-Y)R+qv^f{01BJ$%_g_MlKw-8>^|A1!1^xV
z1UDcroNIG+dmm%-5l`0-WQ&YyykyI7djaQ+5CtIZBuSN9QHM%j?)-t45!4P5S&+b$
zg-h*z&FjyKJ#Cme%(*PpN)%<EiNKY&@OAqMtGmm>j1l?e%P!Onf&D^ejXBdt>vci3
z-?QNnD?1**kPb{qv);m8L(AjE^pq`BCYP94(oLS<dMp|$k0rPtzlQ;8Vk(ra8_jjs
zNAS0d92>3z=3DbGmAfrCN?jrj^ODffS}gcf;>RADN{yBNUnx%h-{Gp$+np}r?^_>T30
z^$e9{9=3D?exKu&8X0)4w=3Dq!q0q`P(HKL>6{(4FfiQuw2!OU8c-vwfjp*3Cf{<<%~<y
zi)p#3XU*+bF%8$|8*P$W!>?me`RNlMqh+qB-tV2?(iBk-p?!7iply(-TsqD!r1Civ
zFh}~JBjCW%YhVn$wvynzP4a~qJ(HRb{F1X`lMEjy|6UaU){Ltkwh+All+XbDy%qZ=3D
z0L3g+&$XfQe@pWgnWDnp0FKLR@Sd_)r;`l1YIfXP%icd5!>tjAP+**Wcosz1wDd<q
z$qad0-rr_B<A3xma2xz^Q6AwQ|1ZQ?%LUxt&+e7X-mdg3reh8Ld!A>d3J_^A9z)Ba
zbi6@l$RtX<NEg=3DiBuvpS-Nbtr2<JwC6DsVavE{vhV=3DCRs<1wx)`sVN(a4^d<((yxx
z*1*IY%b35F46sjMFYaz{QN}HO_q40~pt=3D*@uhgr}X>k<FBBA8C!F7h3$@ZvfVJn*9
zwKi}l!5vB4%z{&ri!R|<-pe|m6VlL@7P5NxHZ6r)^HYI#k{~AlI(Mg?O-KKw#!l_r
z=3Dy|}-#id@W$omEymMV5R^sWv$4wQH^+5SFnVA{S8l5n-3>zh}Up-EADOuuYr#ye&B
zm#yffEO)WhN`?4u2k1{TcS@mO6TCeFL<W=3D%WKaG3znF};h3Ua;v@k^S^9hq*Uj7Yx
z<=3D_Iqtn#FW9Pi!>jk7Z?YWIBsaOt}@4xaocdsE;DD)ynb;$F|UX)fc07be>-O!J95
zWx3bU&HJYfRk6?cPR~N;WxnD9?*2y`17odH6VEM`Z?2Bj;K`E=3DINnCOK;l=3Dk6lA;K
zK#?97-fdo~!yR6@6vtk+ebEO0EO-i3(WOEO(wj&C4kwIQ_tz@<dDGG$t&gg%%fgix
ztSdr!oyq^nQ-IKf0faV%cjRinNt3%5y8+LErMf&VZ?CMG-x^L5y}3QX(SOA=3D;OyRH
z;lg=3D(A?5+m?N?`EJK;Nk@&O?C-08|6@*BK>6L~@R9##Dtl~_@KJ9VId0r|P0HzBp$
zf~<>EDeR9P(@x})j1(SyVPEIF4>DL9%)~$7){MUgoc+leu-j4ow%<j9VI)v0UB#CO
zFc0th?d@mrA3~8-LWDT$Kl?zjn*rElPb=3D*1YX8=3DU(5d^Zy24pzfd&o*G>bpey`GNb
z*Pwd}?Y|`ft_*OFVP(7)aAmOBU9U-t6r(OH*^?}6yz88%%(?eEgx0hZW!KVvk|Ly%
z{9o+)JS>2ur!l`@BxK+62o?9@RbS^$fz^HBSY4jZ`ybaKcMPUna|dX>?4#9f`mF~<
z-)#y(;!B05F3Nj?HfThMmOt~7t~4!sK?mwQI}YO25^pt=3DUJ<6f_pd=3DtC~V~edRgOm
zuGyrskG*pdnW0(8q7gwQ>$*vLzSutj4q6&R<Tc|sOv#+uOFtjmMAw~c60zf^xmGv8
z+xeegKYHCB5d_Q6NkQ6+JzkhRK9ZYN_!kP3FFbx_Jog5htUJZlN<KWMrTuzO;32d4
z58mRlKezl|-<)l`BXFig=3DLwbm0gc6U{L+Xgb<4x7<{QuJ!%3fbhS5|HAIyCGOxg8N
zQk}}B>jHJMi6*rXPLcVaTLSD(+?Cb&rAvyTd*ogA!40KJ8OE<Pu9_{8Q;JMXe7-)v
zh2UYx+O1b7zR!K*+}Q5yWp3w54q}R!bALSIza^Q2OoW3uJe41QmM;ZZ>tj2wNN7OS
zSw1lis=3DxfqzXS$%@k5aJwKv&M>7KhW<4AkwCO-ayPYAcg`UF>R;}ggKkC3LI2RFWI
z55DzZ7K0XAHiZKfyxld1X2Ew_aRu(;Wey%yxd%Yy#;Dj|@}l4q(j&Z7X)6BhRRT@e
z2w>a|&%fclp-kT^W<mGO++a%g0n8V-b+2}7vM~GE9rrs@x%8=3D+2>Eb}2551soER3N
zB9&v;S>`O}2L|9&4M2_Zd6ge23OkH#mGT@%Ujz#5;k#{^gJo_hq|$}J?Tn_Wh2aa5
zS{E0TE4R|Z9!|{!exJRSOlk}ip=3Dpakj}I9$U(9Z=3D;vZ@F_)INYZ{b%|O~qV#**53;
z&yWU|uNs;0x0n2d1;G6JCHG6(n*xt^f7w~pjai$RlziDS8PON5mFXSs>ALRgaJuIc
z=3DLr6ED<L#JMLpMNkO_U9X?;_1_p-v-ki)}ppx*O5u<qW6lU4p@yCIh$x*?khrNCoW
z-;2nwt}fa@_s!kUl-E8R5noP<FFo5(etGAGW>hAhLnV=3DGr_B`Cs*INc^LnlO6uxp0
z^|N)74nS<tW^Ao?OE&3Su~y0GX|BH{F9@Y&mAWgf4Vg#-pf&)W;(pa7S?k;HFD6c;
z3pw*t2cB@INEiI%U1fE@q_l6?0AP8%eNRZf4N+i!$1ow>K<F{|<v(!hL#ujv9Lm8m
zK4Q(;Cf@aPn^#U>&ZRNM@6qQc8}kP2c!e9v2J^jFJ~9v>k<$5z^{d2QW;l7@LpI+_
zUJ<0ju9=3DXPHQf5<D+-G#Eq}GS9|64wcIWKLt+rBk8k08$ic#%U8uyvUVj~`Mi~+Eg
zOlRyRHf0RWcx^Cvzf5OR;)@kE``FuAW?iUf79PZKJ;r$yyRohAbNqvvZA|W*sC}*K
zto>B6$GA^*=3Dm}k}$+d<DwS@&Ar2uGHD^M-dqMf@L96I(R)@%hk_-N0l#MdThZ=3DKOm
zE$UW#ahzL!aY<CEocFGtkV7fyr8wdD$6np*!U#@!#72VK53W`7+;5CP{ciIDt_C4s
zlCfEVz<rNjSf|IGDEX1WMQvNke3XpdKtmQXb~r$HfJ)UByOfu0odEdiA%<&<027nn
z`SItFpeL9h0=3DDA+LAZx9tqPrDyr``=3DTV_Qa%!)ESdjzcjK&YpUB>A2%yrH@My%A6!
zl~#O*mc0H<F_?UiqE~%-{f>C(Cn83Ys_o=3D3001>H*Kv9p6o4j#+LSuRQ|P>j+OP)2
zoEg&#@ZeIdwtOm`OAFvnY3AH*D=3D^nN>__hd`jg8&@_x=3DVl>RpUJ+vwz_>-PB8~53F
z>Qi{e-i_=3DM;b(HpK*6p)CLq5%ch>UR$omT{->yet!!6WS8(^v3FFS6c0&yD`JzlE4
zJma%7{E-{3NL_uWO$xkv^W*AK3oS6xIUi>*7{Gpf1xk^IHtn^yPx31LJ?$t{-?29h
z6pcSr0OQTNKKQ)I-_f2>Lhs*aeG#(sNvXhL#%a_7s72Co<6WM~`>_Q0x~@vB;`>E}
z6du;w)%u5Q*&|OS?xq4k;${iCz~2D>-O@0g)kw<Atl^~R%o&7&cUQ6~+<|Ij+1b}c
z4t0}#3s_`>`zz}-IvG8;*3wsr^;Mw@dW?5r3jUiyFTqd})TZ0R!tkBRDLAuq2r&&Z
zWBRqlp!A)G^#|*HHWBCP^w@8EN;H9-)2;I?EYcm=3DWn4vGf3ePtT-6<wL8+X{#*eQ3
zoRJx+IAEUhHIJeiOc*n7=3DjEzUOD18KEX(2#msNX4@>DF3a(+O-1GLH{JWj!>90cte
z)_p!+xlzpOB%=3DN-wYTV(qssaYfFyeEep@%k_KnyW080_6X_*8B1{CVgLcnE_tb7g?
zbv|tEoKGHBxFmDMVDVR;XMqckH{wLCY!Rfl^|f+&^2oHRm@Ot^W{2~*afrwHutIZV
z>eK+=3DAn+lWl5hgz_vwdKI57Z!OE;gRKHQ>2<gC1a*<5K%fqn34`$=3Dwgo<q#@^}Onn
z=3DPY~|pq2urSBoe<0mo&#4nIX-R_|+DPk~t$P`SS`$vkgfFnF)IH0rrl-w*r#G3|-b
z@*PlQTrwrg(BX8u?BU^_DSK5!by@D?iMdjXyGeOc{laL~T&D`IOua~}uH+tzElbGF
z(BM$ot6JybN^vF$!?_oPKXzm*Rj+fa-p#2fcAv&A6e9-!RAbbD<i+HP`JZ#`pg`Qc
zOeVjRkETtAc3S$pX1TUp9uuRLu2(6ZAR=3DFomFC}2g3VC0UhqgZg5d9so*Ppsr)>WS
z+VTGQ_VK0OkPoLvV8WJ8Q%Qn^RMP3GkBKf4d!<Ifs029&FPG0xDF|4q;ZE+i$PH!2
zGm>!a+_<6K5G<pF-MO)YBw3rlJHY9;o^OIREwduFEpzJ8bjr5OhGfS;T^%#=3DGg&Yb
zZF-&RSD&r^jQ?Dl@XOCYU|C(_9Kc~7DJ%L^{CqdVrRKywhQ4Au$OQT*rsPS|Y>0Xk
z%{}R8a3CvgS`Nk{;^{&tu_NuJRmqS$!2d;&Fq;kIoxX&{upq^OI(*C5W3N-xT)m+B
z+d$f9_ibheavgtpr6}Z1_N0^9?{uwJqAn%gehANv&v2TM4)V2p0C;>ii0B9jRl0v#
zEyASTR`2g|_Zm&!3MkFd$#HpnBLx7xZx!SlOxOX?K!GRxcNg!>=3Djyyj?6|yb5k64L
zVI5#^8M$o@AWm9_G3=3D_%DQRLpP>Y!KVj>HJLX!;a-n`e#PIKTOc7k9aek(=3DqWdg{K
z3}hyfmmZn`cmMXvATRQojZ89ig;v6kNRpyzaHNzW+bH7}B2gTe&ONT#bP)vq>qV;`
z%W>{5X!}Mr0DIgh=3D6nkRK!B;zAuD5{F%j-<j_vd0d{$EL0Zo{}^;qx!;_WZvqH4Q0
zVE7^=3DMLGl|C8WC%1PK8_x`*xt=3D>`F%k?!v98cL+QySs-RnrEZeegE(G{XL(bPkdlz
z_TKAUajav-Mmty$NAvXZFi3XW)}VoC%m-}g=3D0LT?VS3SD{G~eDot`=3DV5#0YZ1?T`)
z-x}EK{FSt-m8xJcmT|EXZ72$7$`pGho7oiLrbqK8ByrpQ5Yh9}{A(|^9}9z=3D_ZIaE
zG%CNNq^O_IC`a>h+HBf68Azj_6m%RZyUu7fROn5Pe;S8t(YsOOEYUDFisQ6%KH=3D9x
zbB)7De(U+-^4@M_IBc|5RPdn8@IlYj*tIVu)0}!Ac_J=3DrWVMjT!L$-(!-_9L>Fy5N
zPH{<m_<L_)6zFEXEGfBwl!4laln<N~M_vw;Or>3_Xc{{@2~JcG>M~yPpPq;*l`V-K
z=3D}f<Wg-xB4RNCYcFzs@&*_aec4@x0WYjYKvcYO1rGTMP$wBH>qrNph?$ao7bNUqrS
zeTE4t0K4!;(%Qrqm?%$IdgOR2onZ`JDF)cVY&q(6SK1QApX!TL7=3DrgUyqUc>)mLj7
zq&JnDD|GwMM{x)6YGg6CM~0F}|I#4{0Kb4Hq8|Le(XRp?G!sOgN$=3DSIad)w-428Ao
zQ$wuLH$$gwpv}5)E|F^U)9S#_cesJ*rrCi#gn-G6@S;v<JLa$Pw3@V{SeJ22uU>{q
zz*fnuPI}M2lu4`93YcCOv)2!ncAm7FM`TlSnG@<%8p*Q+dLp`g*4QU28`Cf~{7mkw
zvn#E3FgXiji95ghT9rnt_1)H8YF_ko4RB8}3_BLZs|XgJZgeXNF4-)%N_315**$a%
zUhGa{v@~;F**5r#5B>r=3DAC<q?S+cQC4=3Dtbz#Kb0MQ*BD|oJ>2za#;&z#7Rp<F~BrA
zmZ0bNcTKt<FS>vGXf{w>!8}0ON8JKekh>u#SIB|vzg~*+pD*nDW#~ZavL(>JsoVn{
zmZ%#nRDL}Idy+mMaKBW=3D5GBw?-`Udm|L&-SVRZ0K=3Dbb8&bS-X#Iz1n%7rlMH?F0H@
zFi`Y^Hj=3DwK-MdxCLw5uwy3zp3nlj71!u&ow{cqMv4KR`B`fUHjBPiEN?LBhoQxyit
zV73}nW9zGk&u&@uCwxWI#ILa4R(KQpm3!vNkWhCf8gcE4+*IGr@7VVIMZbSyaoK<U
z2v9_#AnQ!&?CuZgjiP7=3D20@g{*DtXoTkZcTbE4}}$WkEUM4lS;D)qeExVL;_JJbsN
zfd4mTIIkYrLj3!%uFnBJ?tgyt&$a%rT>sw>5-uOMyF-Tz7G3XpJLTVoVh|xybe}=3D^
z2A-%ZaY=3D`^FMHMnp6VPQ9Y<zJiT?RJ?Eja^Hhms!w1Y85TxP77-PnA<CJCpo09!_S
zFWM-?ZDm@*HjQLEM?iLuM03K4CniXlIg-=3DphOf>vhwz5mi1UY`Q{3|dQ}s4ad5Ncj
zK+z->CFeUvM@`b{tv(^uGj4aG(A~ZSU{Ljs#5XP@tsa2~<)rRB!Mkhg6y^;)Bp~n8
zNAk25@AfmURfoMXRxK}=3Dmp9nPAAI3~QR1YXt~rob^Xvw+lY2g7G4c@!uQR5u=3DehV%
z$B41HpqSta*LM(NRgXv__yV@dXKn@vl0(&2POF}ejI^7i)>kyEL@<FzU61oWa>ZN6
zKrW)@ZASr|**;}JLvJLwbvF$r4yX-<q9k~>0D*_@sm=3DcRKwoJsa>KraD}UgkT`^?_
zlh>|X{YsJ-R&75dk_72|9r<SfD8GvXolPKCpn)5xkH+ZRtst?y1Ya$bd1SXh0w=3Du|
zP%Xq^w1F;fGFQ(rK{y7$(GURr3vOLNXA&^=3DsTkblN!bp}-P$ytg<bt3Qn<5XE_wap
zEAX4Xo0nqHmlXoQ)S(j4;sm&Vc~>1IaFt<SuBsdcwTy=3DxO~JST2OhdEEL+E{_tO%)
zRh)5M{69{9pWhQ#FN6@2*hqeU|7r2f3rn@XH*DF!3K@Ne(f;>_&C_hz)7O@qp*UA7
zya7sf_GFHS#7Ppr*6YYH7-yY(g^VqM9dfh?hn@*@Ab=3DgXYTO=3D^Z!dqoGsD%(1NPpL
zY@ZFJKLVSw<o_cs(Bj}fo$VG+VSR&Fzkt7hh;w|xpGEu<%y-Km4TG}#?-#}p|5T4w
zyM|sqi)$re(31K2FGx-F&u8F(s%G{`6`)AK*Pl=3DG4KO+RnGuhh{aIMv?rha9fBx#B
zz007~y+V5nS04U;0HB!pfZon>0vE@NBLN7>oHzXElqCJ$>y84omMo&gD%XAr{TNBL
z1}|T?hlgf#0->+OPS$e)_2nxRviCd%V;Knh9EGKipiE&g9_aCR*e(<`=3DsDz3G^Sr2
zWrrlKGZs~KH1m^$rC^iT`AZjVkE5zulJJF^)TgcR!RH6@cEz&XwKA^5M*tD=3DoxbN$
z8gS&7jBK~QT34DuZV7^lugL_ky3Ly!4oAIq?4Rknnb^VP89k|z&z4Z0IlN`uzgtDR
zR?);{xkLErJEJlz5D^VqN27c7$8gXRcyo9&hMMTPWn1_!K4j(mV6nK7DIVN9j~^?t
zw!k%~f;<9D$0gmQ*e*-vSgyC~Z#f)N{NWVUlTxK@tR!dC?Hym}Ot}tiWGmTK`bxg5
zxMz98T=3Dg+R&DFZQeR!iu^#U+OVo*cbXpO$hH#$Iy4j|F}%c5+psVbD6{jOqDjqKM5
z5k%ka#m@K<65wXW0XskdAzI6n@V)R*|Er|i$n5NpehI`JN9C<<v*DP=3D2KRF&JR6N1
zuZMW6!FE=3Dcs|((oAQjk?GREdfwCSsj1q?PN$>P;o=3D^4oNn!!}DMNUw?fuacxojlUQ
zw2dePqk~oVtGD4u^c!H+*6*CC=3DnAV&r`nU6*ArPIkYywyCWbQY)^HeY#MR4z8K5Vg
zXC7)A;n#(lrQLZo+v3Rm^R1lUo^&3$@nJ%e$@KktYh{_ausQQ~2=3D5h%=3DN}_|T!@i_
zE#G~4!cOc9R2A!Cw2w#!IxI{9wJK+RwVa{miE^FwuTzOOI`MU${yis|M)z93D=3Df@y
zXkWxlR(hKuAiRZ7f2|~d4idi0jdijNRuoNdnGb~r<^P;g?u`YlIS$O|-8Q_Q^>D%F
zDqr&Bjo#7iXu6^M;%u?>hSi`;I0*DcDbjjx5jK}TwmYnt`%AOs8%x0}ceSr;p<=3DeT
z%WX*}lhEKhaUVUP`Tu-t#r^7!!+3gM-1>9_Y}^oadnH!zg?w$XXAX)Um%dsKG!_b<
z-L9ACN0Z9JGy_eKfYT|S(;_B^I2}&G_&1?<SCvZJ-Cmo?*d+!VA0_GELy+kp{i9pG
z@|49UUp;}T0oN*nnTQW*f_Jx<^lUV}esK6ugO4kil2LqAgmvZ_PTr;?<P9%hhuBqj
zXW2*5@px?z0ArOok1EA7Rvcyv1c_B9`oKKI00T({fMMaLZz^K5quLk1#tt7tiTj4g
z>-Q&7I0=3D=3DYkeB5~lGXPKt~bAoILgO}nX0=3DfG|Nir6pToAbO5IexP!ZR8b2FgGtVRK
zA9H|4Y+9r8h^(fz=3D;KN4F!>jv=3DIgGNh)E{1qUra9S)qaB$cHJZ(V+_E3Yk)-3#E)G
z@eG!X4$x_BB?h%mm%sXRl&$vbyM`6{OT0&Z($cG(XasZ!24#HhQYhL{twS|o%Fym~
zvQ6a0OHFomI!}wM)y$OKqo7qNVgXt~HH}YwfaVLLis7JA;xPDSuhiS(o-bN9XGq^e
zBTucziwG(WGUST`ZHsmc>8G~rZiSycFi=3DlQdD$8Z6e(2x+KREiLrgor*`y&bZADCv
zU-o-{shA8~Ro%@6dbAi}UD{k|;?gOBWP=3DNKe8A%>UC!~dKG$H3q}P$<FuiGxSK)HK
zavmhZ=3Dd@IZwRw<2v%Q$doYK5ITHrPePJbQ5MEbj8xigYM*`C9CNwVdn{TMER#ganH
zI9y&3+*3v>w%Xoi^14*Mh+5;TW%x^Vb^rm?8R4O;0e}YPz+<+5?E0%@b?Ibu&mPc&
zY(w_i#nVf+0THO)J+~yQ0v?}nXt14V)OabDh{iQg)y>6b1?=3DCgOhm4|eL*1PPAp6O
zUJn?+DOAd)3saIj;;q5|`BpkKWQQqB^=3D`Rfq2`r2cUhPfQJtPkI;L$RD}ot&Zr3IK
z%vi0Ms#2+<a)2%}cq*7*?@$IGhfxuSNY(21AaZqu^@;{i1Vdw|8T_4vhB{@alA7cw
zzP|ZmEKl0v@@4rTtahIL>)Hr$Wujse7q}NFp#p{W#pL6eB0=3DK<#jT2qhw9F78t!BA
z(WLBN_t$016xAM@abG?qQd7lQg8VM**wu8Z54q*Xe-{ZhtQgYXSNDum99^p%j5@um
zb{#VQYBr}l#F9qu&6L`SieWTl&8+ZlITGQ!;z2QDNBcoB*s0dxPqaTx-Cmn>ZYp=3Ds
z0lVE0ZtR3YAuCeV5&DmzFB<H&_z;?2PA)qFo}^-LRQ&gMT)49M;K67*X5c1DR4yUb
z(Y%_5xfpxB5bN`OhZ^+Rb|M5v(r;nKTza#=3DGp)rL30>$zt^u`r1_s-GEbI`38b@V-
zwA3q98ASfP!2RL0stcG$y;;bQNN3TzhUbhvOIEdsB(w9tHKgZJt_UtutAKULAMVV)
zi@*>x{;E`d@=3Dd&ys4&w0bdl=3D9ask^FWviq0%^jKC<|{&eNx_f<w>V?hVFrs~hF#W%
zAe5>&^`tF!(Qhw(hduczoqbo<^2{#t8onO0<uRrOe@z@WOH*HYXT9B21XJ2_A2!>v
z0G*7$E2F``JADX30XNH?C_F{oPf+_pPyKrc1g&Dsnd3eO_UZ_@V~Wzetn34pov}Oz
z`Nu-4xt^8RE=3DL;zw_=3DQc!AENK_9MUGkP+dlL*DOm^v0Biy%>S-m5#F+DA!)LbSRUj
z!!N5cgUIzazwf^vxm1WUMg*0=3D?@>TYpIm8CJ&ti@u^AHJ%%taT!~W|PU5^iWA?6Ad
z4KOh5a4+FbY;2LiKccA>M33FkPf9`VPggC3$0W>p0vuK|-+ZCoR?*x!2(38`A~1-5
zV)YFEiWyHCTzQEutNS=3DHgPIU2CWUx~S4N3>rCygC*%z|S!FcQ?1Shcy-Hu2>vsafZ
z?Q?+tAK6=3D?jVWYFad-S3{+ZwQ=3D@?F_O#SuHJh$>)RL?{=3D+UpP-oi=3Di7KNkWHC$g-=
r
z?+7EX<@ah!8TO)=3Doi&zl&1gz*Fxa9BElUq-KjiM?j<r~!Pj%8)w>5+4s-&WdOeadw
z;)b<@cjVHGUttZ{HK=3D@D>TK5C7SU?{imTJ=3D(e=3DO&J>9r-4ozm49eQW5x90f7yLGN=3D
ztN4^WW38_{<Ld%6p#z+(?{cSG;TE$I+8N1_8->oA2aoGTj)rT_NpEX{kmq~D*2Kfc
z>cTrz^)vgCIzh=3Du+V@QtCw`hUHU>9-TSW%qamU20W<2ZE-w*iFIy#`{f8orB=3DPaAo
z1z5sSkJes70!lPB(XIb5>u62`?Dz4TlAbOgKRzSv*?yDE4p6In*RerU`92c=3DI->ko
zz~!|?d5+CArlT~o8uZk7CBXODiS`(bb&Darq2}P@+A9#zN~NwPZ;6VvP!`F5pQ^-M
zd{M$TRUCLFIKQ#CVL}_#@-2yftMd+>Hn}`S<B?Up-!OsOkwi9~r!-K;eX3LQt%E$n
ze8ZPFA&Nit_g(O;)iV5?9&2tYPe;WiUjrlCJV^(+6k9w}$_xP@QTO%mr1lz$aBcn~
z>gjVj2vb@$LA1nY`3SC04aB34WEA4T8T<Okz+R;u&j+I%{nR|iFCB$ow?ni3-FN#u
zTdd7=3DVnw=3D-^EbT-jM;9)`?p&MYIRocydGfBa{KbPlcPxgv8NvS;dnP)$QL`TEdDu#
zklK=3Df)9`L0f23e8Bk+U+9&x4kZ|Z{pM0(`yRiFzX3~{+vo`QVziJCInx$n#6TC~70
zJQKiHhSUn2YgfyoZ8HBP1weAv=3DNYd38FPf?C-xn*LVq0}0Q58f<BJGCpLH9A<wEsa
zJe*MMQa}n|^)wih8PF1G%|tk?C)8Tr3f4O04|aj49F*Hrt8CfW4Er)3sh^n6HFBil
zr5@bNa2hN1dr(sN+)x0$>b~fj0D2&v?!KqIvtPSdno#3#kIEl`Tv^Uw--O@^m)-M@
z)p-Gnui}t!Q|ZV&enWQ0@(|-}bdHTMVmA^RJrES~rH{6G*1ID%tX2iVCrH!}?5EBR
zX|+i4!+i$QqAd@^GnY^IHz6pSY&PF781RQQUYeYw%lp>rZHe=3D^?D@<?e`8{wZeJ2z
zyk3@ga4*!#og(H~H%10yQiy%*c=3D=3D+i(nKPLR)-jqQtToXp}mFf-)M&x^4y%*5yB2>
zvifKF5>mEUDe{nHK4*A6*3t|e1D2FsDhzw@vKV(0aOSAPo@66NRCv$8d?lSls~wo?
zh@(s%%TRzr0I6<*$sHl67{zihs{dj%{vm1Da+&Ey;}P@Prmmlj(v_A63RB7Sn#Fvj
zwpWw92W?N+r*QJwV)DL<ez^?tab$L|%F_?k)p6b{wMN|35ow{4Wz#2KPmh9JB(pw4
z7WKe%O|FDuAgswiDjE<0RHA?Mf7Dp(3{n&gPrc)DC;F%@r?EA~-clCCA&p)>IZ*|l
zci;^LIBU;`TqfylrVgmh%2eboJ%0J>Vy6Qgq^@X!kYCnXRW@2ePCm0ux@~xWWnlYV
z2&SSq+2=3Drx>2`XD(B5FGGlRRehoC4fQH=3D}ICDLQj=3D93zfo`rw4lFQI|wRTJ0nRAY~
z>N)S27j++dGtTf7^;1XND0=3DN<)yp_wK#RGY%0A{}_0<q$eGc{O?%XoacrbS)Hs~U{
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
T
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
bA90zX)!`kTO<`BSzZcRkpB6qg@cTai!N_3V

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-=
image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-im=
age.bb
index 4a32192d..73cc32aa 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
@@ -53,9 +53,11 @@ TFM_SIGN_PRIVATE_KEY =3D "${libdir}/tfm-scripts/root-R=
SA-3072_1.pem"
 RE_IMAGE_OFFSET =3D "0x1000"
=20
 # Offsets for the .nopt image generation
-TFM_OFFSET =3D "102400"
-FIP_OFFSET =3D "479232"
-KERNEL_OFFSET =3D "2576384"
+# These offset values have to be aligned with those in
+# meta-arm/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
+TFM_OFFSET =3D "147456"
+FIP_OFFSET =3D "475136"
+KERNEL_OFFSET =3D "2572288"
=20
 do_sign_images() {
     # Sign TF-A BL2
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0014-Platform-CS1000-Increase-BL2-partition-size.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0014-Platform-CS1000-In=
crease-BL2-partition-size.patch
new file mode 100644
index 00000000..7c2a6325
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014=
-Platform-CS1000-Increase-BL2-partition-size.patch
@@ -0,0 +1,111 @@
+From ddd4abdb3893e284a35303e4a5ac7b6ad2ed8320 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Tue, 16 Jul 2024 21:04:49 +0200
+Subject: [PATCH] Platform: CS1000: Increase BL2 partition size
+
+Enabling secure debug increases the BL2 code size considerably. This
+patch increases the BL2 partition size to enable secure debug feature
+on Corstone-1000. The TF-M partition size has to be decreased for this.
+The RAM_MPU_REGION_BLOCK_1_SIZE had to be aligned with the changes to
+fully cover the S_DATA.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Backport [https://review.trustedfirmware.org/c/TF-M/tru=
sted-firmware-m/+/30406]
+---
+ .../ext/target/arm/corstone1000/CMakeLists.txt     |  9 ++++++---
+ .../target/arm/corstone1000/create-flash-image.sh  | 14 ++++++++------
+ .../arm/corstone1000/partition/flash_layout.h      |  4 ++--
+ 3 files changed, 16 insertions(+), 11 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index b13dc26c0e..3ba26e0de7 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -44,10 +44,13 @@ target_compile_definitions(platform_region_defs
+         # The RAM MPU Region block sizes are calculated manually. The R=
AM has to be covered
+         # with the MPU regions. These regions also have to be the power=
 of 2 and
+         # the start addresses have to be aligned to these sizes. The si=
zes can be calculated
+-        # from the S_DATA_START and S_DATA_SIZE defines.
+-        RAM_MPU_REGION_BLOCK_1_SIZE=3D0x4000
++        # from the S_DATA_START and S_DATA_SIZE defines the following w=
ay:
++        # S_DATA_SIZE =3D RAM_MPU_REGION_BLOCK_1_SIZE + RAM_MPU_REGION_=
BLOCK_2_SIZE
++        # And the following constraints have to be taken:
++        # S_DATA_START % RAM_MPU_REGION_BLOCK_1_SIZE =3D 0
++        # (S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE) % RAM_MPU_REGION=
_BLOCK_2_SIZE =3D 0
++        RAM_MPU_REGION_BLOCK_1_SIZE=3D0x10000
+         RAM_MPU_REGION_BLOCK_2_SIZE=3D0x20000
+-
+ )
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform common defs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+=20
+diff --git a/platform/ext/target/arm/corstone1000/create-flash-image.sh =
b/platform/ext/target/arm/corstone1000/create-flash-image.sh
+index a6be61384f..06f0d1ec9a 100755
+--- a/platform/ext/target/arm/corstone1000/create-flash-image.sh
++++ b/platform/ext/target/arm/corstone1000/create-flash-image.sh
+@@ -1,6 +1,6 @@
+ #!/bin/bash
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2023, Arm Limited. All rights reserved.
++# Copyright (c) 2023-2024, Arm Limited. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -65,6 +65,8 @@ FWU_METADATA_TYPE_UUID=3D"8A7A84A0-8387-40F6-AB41-A8B9=
A5A60D23"
+ PRIVATE_METADATA_TYPE_UUID=3D"ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42"
+ SE_BL2_TYPE_UUID=3D"64BD8ADB-02C0-4819-8688-03AB4CAB0ED9"
+ TFM_TYPE_UUID=3D"D763C27F-07F6-4FF0-B2F3-060CB465CD4E"
++SE_BL2_PARTITION_SIZE=3D"+144k"
++TFM_S_PARTITION_SIZE=3D"+320K"
+=20
+ # Create the image
+ rm -f $IMAGE
+@@ -81,10 +83,10 @@ sgdisk  --mbrtogpt \
+         --new=3D3:48:+4K --typecode=3D3:$FWU_METADATA_TYPE_UUID --parti=
tion-guid=3D3:$(uuidgen) --change-name=3D3:'Bkup-FWU-Metadata' \
+         --new=3D4:56:+4K --typecode=3D4:$PRIVATE_METADATA_TYPE_UUID --p=
artition-guid=3D4:$(uuidgen) --change-name=3D4:'private_metadata_replica_=
1' \
+         --new=3D5:64:+4k --typecode=3D5:$PRIVATE_METADATA_TYPE_UUID --p=
artition-guid=3D5:$(uuidgen) --change-name=3D5:'private_metadata_replica_=
2' \
+-        --new=3D6:72:+100k --typecode=3D6:$SE_BL2_TYPE_UUID --partition=
-guid=3D6:$(uuidgen) --change-name=3D6:'bl2_primary' \
+-        --new=3D7:272:+368K --typecode=3D7:$TFM_TYPE_UUID --partition-g=
uid=3D7:$(uuidgen) --change-name=3D7:'tfm_primary' \
+-        --new=3D8:32784:+100k --typecode=3D8:$SE_BL2_TYPE_UUID --partit=
ion-guid=3D8:$(uuidgen) --change-name=3D8:'bl2_secondary' \
+-        --new=3D9:32984:+368K --typecode=3D9:$TFM_TYPE_UUID --partition=
-guid=3D9:$(uuidgen) --change-name=3D9:'tfm_secondary' \
++        --new=3D6:72:$SE_BL2_PARTITION_SIZE --typecode=3D6:$SE_BL2_TYPE=
_UUID --partition-guid=3D6:$(uuidgen) --change-name=3D6:'bl2_primary' \
++        --new=3D7:360:$TFM_S_PARTITION_SIZE --typecode=3D7:$TFM_TYPE_UU=
ID --partition-guid=3D7:$(uuidgen) --change-name=3D7:'tfm_primary' \
++        --new=3D8:32784:$SE_BL2_PARTITION_SIZE --typecode=3D8:$SE_BL2_T=
YPE_UUID --partition-guid=3D8:$(uuidgen) --change-name=3D8:'bl2_secondary=
' \
++        --new=3D9:33072:$TFM_S_PARTITION_SIZE --typecode=3D9:$TFM_TYPE_=
UUID --partition-guid=3D9:$(uuidgen) --change-name=3D9:'tfm_secondary' \
+         --new=3D10:65496:65501  --partition-guid=3D10:$(uuidgen) --chan=
ge-name=3D10:'reserved_2' \
+         $IMAGE
+=20
+@@ -93,7 +95,7 @@ sgdisk  --mbrtogpt \
+ # Write partitions
+ # conv=3Dnotrunc avoids truncation to keep the geometry of the image.
+ dd if=3D$BIN_DIR/bl2_signed.bin of=3D${IMAGE}  seek=3D72 conv=3Dnotrunc
+-dd if=3D$BIN_DIR/tfm_s_signed.bin of=3D${IMAGE} seek=3D272 conv=3Dnotru=
nc
++dd if=3D$BIN_DIR/tfm_s_signed.bin of=3D${IMAGE} seek=3D360 conv=3Dnotru=
nc
+=20
+ # Print the gpt table
+ sgdisk -p $IMAGE
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index 9fc1d9fa63..73c430ce57 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -92,7 +92,7 @@
+ #define FLASH_DEV_NAME_BL1              FLASH_DEV_NAME
+=20
+ /* Static Configurations of the Flash */
+-#define SE_BL2_PARTITION_SIZE           (0x18000)    /* 96 KB */
++#define SE_BL2_PARTITION_SIZE           (0x24000)    /* 144 KB */
+ #define SE_BL2_BANK_0_OFFSET            (0x9000)  /* 72nd LBA */
+ #define SE_BL2_BANK_1_OFFSET            (0x1002000)  /* 32784th LBA */
+=20
+@@ -137,7 +137,7 @@
+=20
+ /* Bank configurations */
+ #define BANK_PARTITION_SIZE             (0xFE0000)   /* 15.875 MB */
+-#define TFM_PARTITION_SIZE              (0x5C000)    /* 368 KB */
++#define TFM_PARTITION_SIZE              (0x50000)    /* 320 KB */
+=20
+ /************************************************************/
+ /* Bank : Images flash offsets are with respect to the bank */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0015-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-CC312-ADAC-Add-=
PSA_WANT_ALG_SHA_256-definition.patch
new file mode 100644
index 00000000..63737a0f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015=
-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
@@ -0,0 +1,42 @@
+From 756cfad0cc05e7f4c02faa74aea14962aa54420c Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Wed, 31 Jul 2024 13:38:09 +0200
+Subject: [PATCH 2/3] CC312: ADAC: Add PSA_WANT_ALG_SHA_256 definition
+
+The bl2_mbedcrypto_config is linked to the psa_adac_cc312 target so
+the MCUBOOT_PSA_CRYPTO_CONFIG_FILEPATH and
+MCUBOOT_MBEDCRYPTO_CONFIG_FILEPATH configs are used for the ADAC driver
+too. The MCUBOOT_USE_PSA_CRYPTO is OFF by default, that means the
+MCUBOOT_PSA_CRYPTO_CONFIG_FILEPATH is not included during the build so
+the PSA_WANT_ALG_SHA_256 is not defined for the ADAC driver. Because
+of this, the PSA_HASH_MAX_SIZE is not set correctly for the sources
+of the psa_adac_cc312 target. This caused runtime issues.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ platform/ext/accelerator/cc312/psa-adac/CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/platform/ext/accelerator/cc312/psa-adac/CMakeLists.txt b/pl=
atform/ext/accelerator/cc312/psa-adac/CMakeLists.txt
+index cb0553b40a..d7f5a54f3c 100644
+--- a/platform/ext/accelerator/cc312/psa-adac/CMakeLists.txt
++++ b/platform/ext/accelerator/cc312/psa-adac/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2023, Arm Limited. All rights reserved.
++# Copyright (c) 2020-2024, Arm Limited. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -32,6 +32,7 @@ target_compile_options(psa_adac_cc312
+         -DCC_IOT
+         -DUSE_MBEDTLS_CRYPTOCELL
+         -D_INTERNAL_CC_NO_RSA_SCHEME_15_SUPPORT
++        -DPSA_WANT_ALG_SHA_256
+ )
+=20
+ target_link_libraries(psa_adac_cc312
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0016-Platform-CS1000-Add-crypto-configs-for-ADAC.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0016-Platform-CS1000-Ad=
d-crypto-configs-for-ADAC.patch
new file mode 100644
index 00000000..a56a6f8a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016=
-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
@@ -0,0 +1,39 @@
+From ea0f0236f1dbe9ff7640c90311a3116e6db33aa2 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Wed, 31 Jul 2024 13:38:27 +0200
+Subject: [PATCH 3/3] Platform: CS1000: Add crypto configs for ADAC
+
+The psa_adac_psa_crypto target needs the MBEDTLS_CONFIG_FILE and
+MBEDTLS_PSA_CRYPTO_CONFIG_FILE defines in order to build correctly.
+The default crypto config files are used here.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ platform/ext/target/arm/corstone1000/CMakeLists.txt | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 896961306d..d3652ff40c 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -409,6 +409,16 @@ if (${PLATFORM_PSA_ADAC_SECURE_DEBUG})
+         PRIVATE
+             platform_bl2
+     )
++
++    target_compile_definitions(psa_adac_psa_crypto
++    PRIVATE
++        MBEDTLS_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/ext/mbedcrypto/m=
bedcrypto_config/tfm_mbedcrypto_config_default.h"
++        MBEDTLS_PSA_CRYPTO_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/ext/m=
bedcrypto/mbedcrypto_config/crypto_config_default.h"
++    )
++    target_link_libraries(psa_adac_psa_crypto
++        PRIVATE
++            psa_crypto_library_config
++    )
+ endif()
+=20
+ find_package(Python3)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0017-Platform-CS1000-Fix-platform-name-in-logs.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-m/files/corstone1000/0017-Platform-CS1000-Fix-=
platform-name-in-logs.patch
new file mode 100644
index 00000000..cc20eae2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0017=
-Platform-CS1000-Fix-platform-name-in-logs.patch
@@ -0,0 +1,27 @@
+From 8f0cd9710be508adab91d8b5ab5aa2d39e89c287 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Wed, 31 Jul 2024 19:57:33 +0200
+Subject: [PATCH] Platform: CS1000: Fix platform name in logs
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c b/p=
latform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
+index 8aacd877e4..f5baf08cb4 100644
+--- a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
++++ b/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
+@@ -192,7 +192,7 @@ int32_t boot_platform_post_init(void)
+         }
+=20
+         result =3D tfm_to_psa_adac_corstone1000_secure_debug(secure_deb=
ug_rotpk, 32);
+-        BOOT_LOG_INF("%s: dipda_secure_debug is a %s.\r\n", __func__,
++        BOOT_LOG_INF("%s: Corstone-1000 Secure Debug is a %s.\r\n", __f=
unc__,
+                 (result =3D=3D 0) ? "success" : "failure");
+=20
+     }
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/psa-adac/0001-PSA-revert-header-versions.patch b/meta-arm-bsp/recipes-=
bsp/trusted-firmware-m/files/corstone1000/psa-adac/0001-PSA-revert-header=
-versions.patch
new file mode 100644
index 00000000..5bc65c40
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-=
adac/0001-PSA-revert-header-versions.patch
@@ -0,0 +1,41 @@
+From 3a53a6ad7b91770a8514082e411e277c03764eb0 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 9 Aug 2023 17:16:03 +0100
+Subject: [PATCH] Revert ADAC cert and token version
+
+Align ADAC certificate versions with versions in secure-debug-manager
+[1] repository. The versions of the certificate and token are checked
+during the authentication process. The debugger connection is refused
+if there is a mismatch between the sent certificate/token and expected
+certificate/token versions.
+
+[1] https://github.com/ARM-software/secure-debug-manager/tree/master
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Inappropriate [Add newer dummy token and cert]
+---
+ psa-adac/core/include/psa_adac.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/psa-adac/core/include/psa_adac.h b/psa-adac/core/include/ps=
a_adac.h
+index b190992..b026607 100644
+--- a/psa-adac/core/include/psa_adac.h
++++ b/psa-adac/core/include/psa_adac.h
+@@ -30,10 +30,10 @@ extern "C" {
+  *
+  * Current version numbers for certificate and token format.
+  */
+-#define ADAC_CERT_MAJOR 1u
+-#define ADAC_CERT_MINOR 0u
+-#define ADAC_TOKEN_MAJOR 1u
+-#define ADAC_TOKEN_MINOR 0u
++#define ADAC_CERT_MAJOR 0u
++#define ADAC_CERT_MINOR 1u
++#define ADAC_TOKEN_MAJOR 0u
++#define ADAC_TOKEN_MINOR 1u
+=20
+ /** \brief Key options
+  *
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/psa-adac/0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-adac/0002-=
ADAC-Link-psa_interface-instead-of-tfm_sprt.patch
new file mode 100644
index 00000000..fcfe892e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-=
adac/0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch
@@ -0,0 +1,35 @@
+From af71103845498eef4f859deba4b904a195f2817f Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Mon, 22 Jul 2024 17:33:23 +0200
+Subject: [PATCH] ADAC: Link psa_interface instead of tfm_sprt
+
+The tfm_sprt brings in other functionalities that are not needed for
+the Secure Debug.
+
+The printf() override in tfm_sp_log_raw.c can cause problems because
+it calls tfm_hal_output_sp_log() which triggers an SVC. The SVC calls
+tfm_hal_output_spm_log which relies on an SPM, which might not be
+initialized at that point.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ psa_crypto/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/psa_crypto/CMakeLists.txt b/psa_crypto/CMakeLists.txt
+index 3e70624..58d95f7 100644
+--- a/psa_crypto/CMakeLists.txt
++++ b/psa_crypto/CMakeLists.txt
+@@ -18,7 +18,7 @@ target_sources(psa_adac_psa_crypto
+ target_link_libraries(psa_adac_psa_crypto
+     PRIVATE
+         psa_adac_config
+-        tfm_sprt
++        psa_interface
+ )
+=20
+ target_link_libraries(trusted-firmware-m-psa-adac
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/psa-adac/0003-Fix-psa_key_handle_t-initialization.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-adac/0003-Fix-psa_=
key_handle_t-initialization.patch
new file mode 100644
index 00000000..d620cc19
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-=
adac/0003-Fix-psa_key_handle_t-initialization.patch
@@ -0,0 +1,32 @@
+From 972bf711ad884607409c225f9338bf25206e29e8 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Wed, 31 Jul 2024 15:56:51 +0200
+Subject: [PATCH] Fix psa_key_handle_t initialization
+
+If the MBEDTLS_PSA_CRYPTO_KEY_ID_ENCODES_OWNER macro is defined in the
+mbedcrypto configuration header file then the psa_key_handle_t is a
+struct. In this case, it is defined in the used configuration header
+so the struct cannot be initialized with -1.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ psa_crypto/adac_crypto_psa_mac.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/psa_crypto/adac_crypto_psa_mac.c b/psa_crypto/adac_crypto_p=
sa_mac.c
+index 046fef7..93ab8f9 100644
+--- a/psa_crypto/adac_crypto_psa_mac.c
++++ b/psa_crypto/adac_crypto_psa_mac.c
+@@ -198,7 +198,7 @@ psa_status_t psa_adac_verify_mac(uint8_t key_type,
+                                  size_t mac_size)
+ {
+     psa_key_attributes_t attributes =3D PSA_KEY_ATTRIBUTES_INIT;
+-    psa_key_handle_t handle =3D -1;
++    psa_key_handle_t handle =3D {0};
+     psa_status_t ret =3D PSA_ERROR_NOT_SUPPORTED;
+     psa_key_type_t type =3D 0;
+     size_t bits =3D 0;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 970399cb..4ba6659d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -11,6 +11,8 @@ TFM_PLATFORM_IS_FVP ?=3D "FALSE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
 EXTRA_OECMAKE:append:corstone1000-fvp =3D " -DENABLE_MULTICORE=3D${@bb.u=
tils.contains('MACHINE_FEATURES', 'corstone1000_fvp_smp', 'TRUE', 'FALSE'=
, d)}"
+EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SECURE_=
DEBUG=3D${@bb.utils.contains('MACHINE_FEATURES', 'secure-debug', 'ON', 'O=
FF', d)}"
+EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SOURCE_=
PATH=3D${S}/../tfm-psa-adac -DPLATFORM_PSA_ADAC_BUILD_PATH=3D${B}/tfm-psa=
-adac-build"
=20
 SRC_URI +=3D " \
             file://0001-arm-trusted-firmware-m-disable-address-warnings-=
into.patch \
@@ -31,6 +33,17 @@ SRC_URI:append:corstone1000 =3D " \
     file://0011-Platform-Corstone1000-switch-to-metadata-v2.patch \
     file://0012-platform-corstone1000-Increase-flash-PS-area-size.patch =
\
     file://0013-Platform-CS1000-Fix-Bank-offsets.patch \
+    file://0014-Platform-CS1000-Increase-BL2-partition-size.patch \
+    file://0015-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch \
+    file://0016-Platform-CS1000-Add-crypto-configs-for-ADAC.patch \
+    file://0017-Platform-CS1000-Fix-platform-name-in-logs.patch \
+    "
+
+FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"
+SRC_URI:append:corstone1000-mps3 =3D " \
+    file://0001-PSA-revert-header-versions.patch;patchdir=3D../tfm-psa-a=
dac \
+    file://0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch;patchd=
ir=3D../tfm-psa-adac \
+    file://0003-Fix-psa_key_handle_t-initialization.patch;patchdir=3D../=
tfm-psa-adac \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
diff --git a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in b/meta-a=
rm-bsp/wic/corstone1000-flash-firmware.wks.in
index e0ceca14..6ab4f048 100644
--- a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
+++ b/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
@@ -15,9 +15,11 @@ part --source empty --size 4k --align 4 --offset 24k -=
-part-name=3D"Bkup-FWU-Metad
 part --source empty --size 4k --align 4 --offset 28k --part-name=3D"priv=
ate_metadata_replica_2" --uuid 3CC3B456-DEC8-4CE3-BC5C-965483CE4828 --par=
t-type ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42
 part --source empty --size 4k --align 4 --offset 32k --part-name=3D"priv=
ate_metadata_replica_2" --uuid DCE9C503-8DFD-4DCB-8889-647E49641552 --par=
t-type ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42
=20
-part --source rawcopy --size 100k --sourceparams=3D"file=3Dbl2_signed.bi=
n" --offset 36k --align 4 --part-name=3D"bl2_primary" --uuid 9A3A8FBF-55E=
F-439C-80C9-A3F728033929 --part-type 64BD8ADB-02C0-4819-8688-03AB4CAB0ED9
+# The size has to be aligned to TF-M's SE_BL2_PARTITION_SIZE (tfm/platfo=
rm/ext/target/arm/corstone1000/partition/flash_layout.h)
+part --source rawcopy --size 144k --sourceparams=3D"file=3Dbl2_signed.bi=
n" --offset 36k --align 4 --part-name=3D"bl2_primary" --uuid 9A3A8FBF-55E=
F-439C-80C9-A3F728033929 --part-type 64BD8ADB-02C0-4819-8688-03AB4CAB0ED9
=20
-part --source rawcopy --size 368k --sourceparams=3D"file=3Dtfm_s_signed.=
bin" --align 4 --part-name=3D"tfm_primary" --uuid 07F9616C-1233-439C-ACBA=
-72D75421BF70 --part-type D763C27F-07F6-4FF0-B2F3-060CB465CD4E
+# The size has to be aligned to TF-M's TFM_PARTITION_SIZE (tfm/platform/=
ext/target/arm/corstone1000/partition/flash_layout.h)
+part --source rawcopy --size 320k --sourceparams=3D"file=3Dtfm_s_signed.=
bin" --align 4 --part-name=3D"tfm_primary" --uuid 07F9616C-1233-439C-ACBA=
-72D75421BF70 --part-type D763C27F-07F6-4FF0-B2F3-060CB465CD4E
=20
 # Rawcopy of the FIP binary
 part --source rawcopy --size 2 --sourceparams=3D"file=3Dsigned_fip-corst=
one1000.bin" --align 4 --part-name=3D"FIP_A" --uuid B9C7AC9D-40FF-4675-95=
6B-EEF4DE9DF1C5 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7
@@ -27,8 +29,8 @@ part --source rawcopy --size 12 --sourceparams=3D"file=3D=
Image.gz-initramfs-${MACHIN
=20
=20
 # The offset has to be aligned to TF-M's SE_BL2_BANK_1_OFFSET define (tf=
m/platform/ext/target/arm/corstone1000/partition/flash_layout.h)
-part --source empty --size 100k --offset 16392k --align 4 --part-name=3D=
"bl2_secondary" --uuid 3F0C49A4-48B7-4D1E-AF59-3E4A3CE1BA9F --part-type 6=
4BD8ADB-02C0-4819-8688-03AB4CAB0ED9
-part --source empty --size 368k --align 4 --part-name=3D"tfm_secondary" =
--uuid 009A6A12-64A6-4F0F-9882-57CD79A34A3D --part-type D763C27F-07F6-4FF=
0-B2F3-060CB465CD4E
+part --source empty --size 144k --offset 16392k --align 4 --part-name=3D=
"bl2_secondary" --uuid 3F0C49A4-48B7-4D1E-AF59-3E4A3CE1BA9F --part-type 6=
4BD8ADB-02C0-4819-8688-03AB4CAB0ED9
+part --source empty --size 320k --align 4 --part-name=3D"tfm_secondary" =
--uuid 009A6A12-64A6-4F0F-9882-57CD79A34A3D --part-type D763C27F-07F6-4FF=
0-B2F3-060CB465CD4E
 part --source empty --size 2 --align 4 --part-name=3D"FIP_B" --uuid 9424=
E370-7BC9-43BB-8C23-71EE645E1273 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB=
228FFEA7
 part --source empty --size 12 --align 4 --part-name=3D"kernel_secondary"=
 --uuid A2698A91-F9B1-4629-9188-94E4520808F8 --part-type 8197561D-6124-46=
FC-921E-141CC5745B05
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.1.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.1.0-src.inc
index f804bf04..fb4ddcb6 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.0-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.0-sr=
c.inc
@@ -5,7 +5,8 @@ LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
                     file://../tf-m-tests/license.rst;md5=3D4481bae2221b0=
cfca76a69fb3411f390 \
                     file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1ef1=
630d341e026d \
-                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
+                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8 \
+                    file://../tfm-psa-adac/license.rst;md5=3D07f368487da=
347f3c7bd0fc3085f3afa"
=20
 SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
@@ -14,6 +15,7 @@ SRC_URI_TRUSTED_FIRMWARE_M_CMSIS ?=3D "git://github.com=
/ARM-software/CMSIS_6.git;p
 SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://github.com/ARMmbed/mbed=
tls.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
 SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dgit/tfm \
             ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dgit/tfm-extras \
             ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
@@ -21,6 +23,7 @@ SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${=
SRCBRANCH_tfm};name=3Dtfm;dests
             ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
             ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
             ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dgit/tfm-psa-adac \
             "
=20
 # The required dependencies are documented in tf-m/config/config_base.cm=
ake
@@ -45,6 +48,9 @@ SRCREV_mcuboot =3D "9c99326b9756dbcc35b524636d99ed5f3e6=
cb29b"
 # QCBOR v1.2
 SRCBRANCH_qcbor ?=3D "master"
 SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
+# PSA-ADAC (intermediate SHA, default value for PLATFORM_PSA_ADAC_VERSIO=
N in TF-M)
+SRCBRANCH_tfm-psa-adac =3D "master"
+SRCREV_tfm-psa-adac =3D "5f5490cebe66ae997f316f83c3fbf1f97deef625"
=20
 SRCREV_FORMAT =3D "tfm"
=20
--=20
2.25.1



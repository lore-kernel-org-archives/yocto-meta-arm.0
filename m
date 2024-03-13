Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7859C54E69
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 20:13:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6180.1710360822394727199
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 13:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A818D1063;
	Wed, 13 Mar 2024 13:14:18 -0700 (PDT)
Received: from PW05BKJD.arm.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96DF93F64C;
	Wed, 13 Mar 2024 13:13:40 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>,
	Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 1/3] arm-bsp/trusted-firmware-m: corstone1000: update to 2.0
Date: Wed, 13 Mar 2024 20:13:23 +0000
Message-Id: <20240313201325.27043-2-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313201325.27043-1-ali.oezaslan@arm.com>
References: <20240313201325.27043-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 20:13:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5434

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

This change upgrades the trusted-firmware-m version to 2.0
for Corstone-1000.

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
Signed-off-by: Bence Balogh <bence.balogh@arm.com>
Emekcan Aras <emekcan.aras@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |   2 +-
 .../corstone1000/images/ExternalFlash.png     | Bin 40835 -> 54896 bytes
 ...ware-m-disable-address-warnings-into.patch |  26 ++
 ...e1000-Increase-BL2-size-in-flash-lay.patch |  27 --
 ...orstone1000-Update-MPU-configuration.patch | 274 ++++++++++++++++++
 ...-Corstone1000-Increase-BL2_DATA_SIZE.patch |  31 --
 ...m-corstone1000-Cover-S_DATA-with-MPU.patch |  76 +++++
 ...e1000-Calculate-the-new-CRC32-value-.patch |  69 -----
 ...e1000-Fix-issues-due-to-adjustment-M.patch |  76 +++++
 ...ed-firmware-m-disable-fatal-warnings.patch |  24 --
 ...ne1000-align-capsule-update-structs.patch} |   0
 ...orstone1000-add-unique-firmware-GUID.patch |  35 ---
 ...1000-fix-synchronization-issue-on-o.patch} |   0
 ...m-Corstone1000-Enable-Signed-Capsule.patch | 102 -------
 ...rstone1000-skip-the-first-nv-counter.patch |  33 +++
 ...tone1000-increase-ITS-max-asset-size.patch |  29 --
 .../trusted-firmware-m-1.8.1-src.inc          |  46 ---
 .../trusted-firmware-m-corstone1000.inc       |  26 +-
 ...trusted-firmware-m-scripts-native_1.8.1.bb |   2 -
 .../trusted-firmware-m_1.8.1.bb               |   2 -
 .../wic/corstone1000-flash-firmware.wks.in    |   6 +-
 21 files changed, 501 insertions(+), 385 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/000=
2-arm-trusted-firmware-m-disable-address-warnings-into.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-platform-corstone1000-Update-MPU-configuration.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-platform-corstone1000-Cover-S_DATA-with-MPU.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0003-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0003-Platform-corstone1000-Fix-issues-due-to-adjustment-M.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0004-arm-trusted-firmware-m-disable-fatal-warnings.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
008-platform-corstone1000-align-capsule-update-structs.patch =3D> 0004-pl=
atform-corstone1000-align-capsule-update-structs.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0005-Platform-corstone1000-add-unique-firmware-GUID.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
009-platform-corstone1000-fix-synchronization-issue-on-o.patch =3D> 0005-=
platform-corstone1000-fix-synchronization-issue-on-o.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-Platform-Corstone1000-Enable-Signed-Capsule.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-Platform-Corstone1000-skip-the-first-nv-counter.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0007-platform-corstone1000-increase-ITS-max-asset-size.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m-1.8.1-src.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m-scripts-native_1.8.1.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m_1.8.1.bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index a25a214e..a82d0076 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -3,7 +3,7 @@ require conf/machine/include/arm/armv8a/tune-cortexa35.in=
c
 MACHINEOVERRIDES =3D. "corstone1000:"
=20
 # TF-M
-PREFERRED_VERSION_trusted-firmware-m ?=3D "1.8.%"
+PREFERRED_VERSION_trusted-firmware-m ?=3D "2.0.%"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
diff --git a/meta-arm-bsp/documentation/corstone1000/images/ExternalFlash=
.png b/meta-arm-bsp/documentation/corstone1000/images/ExternalFlash.png
index 399f87568fa16af62a12aeebfad913d38a7577df..578f0389969ecebbd284d78e0=
62a0df1af4067fe 100644
GIT binary patch
literal 54896
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
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

literal 40835
zcma&MV{~Rg(>8i%!ijB9%!#duZD(TJwr$&)*fu7%ZQI64=3D6&9C)~B<+-aq#0+TFXm
ztE#KIuIdmODPb5$Oh^C#03#|QAO`>dBLe_Hwh&;S6!Yrz4*&qwz*RxTUQWje-`dv7
z(8SyT-`>UA0N=3Dpb#1H^*UOr0|wk6`Q7d%i2NCa>`?sW+ngR6Cnk5QyDZycFr`=3Dn0k
zS0{hJ8D$!@J?MPDY5CaHs^0uPT%VvBdZ2Y&ys{~HQ|a~ggzN6w(djA5-Ldhu<)M7`
zCdcD2bV9E+@Y3J?@^lgy#n$tB<*~5tReg_p_y!K<`7StCw(#;o=3D(3@C5p;|DCu<>W
zTK%nK_6gUxoz^|^`aO#~>FzmaV-3zqA-9eJNw5})|90ZxUX5?|109?PY9qo-<>Dqa
z>)fTZ4g3c_kNL$;(ZdGtEq^qRW^-1a){0TMCqzfY1IksAN}^M^^VJHE|Le@lm7V7c
zx6P|Y%-bV45C5A1$Hm9Px#NY)nPvVjfsxkSOzog3ohEC<>&I24$CB5Hwu%YmgVLuh
zH1ZA4r=3DbN%E_Bsqn*6F>2$uAN1IRF95)Pq))TNrowgugKOYx@=3DQLQbt2(I%*k@=3Db(
z5#!MN=3DETd<m8>Tv<Iy(YBsJ}-?D&tVq?cNr_c&Uo3%OulU)2>P%6Wqlv&5XyBM#-5
zXzLA^5ovFpj`gF54ahJ#V!x;Fc6xrj6ASPRL6ys)(wRRN3_Ls3$eLO<fZ+-E$EipJ
z=3Dr_fK+2S`#RbhNsnGqRPn*Zv@LHnm$)QX7Hp#lq~npmC}Z#B=3D?pv<gjBZUmw%M-J3
z!Nw-Y6?&SQ&Q1=3D}6{Xt^F|j1M;Swh**pe5Z`mFw`E=3D)Bmu5VaAF|IC1R5z)wpI<qg
z|AC(Dc2wWE{(`;_h6K}(slnrHv>eVb#yL_}JH|bb>#n5clAx%p?h#?ZVX3W~^xJ90
zBMNC1h+K;ODPCTh<1Jjge9d`gtZ~(K<;=3D<5@GN6atK*$-zK6r?USDisZldg}qV!HL
z7@u`$7z3jgdC*xAjLcYm+#QNMg}x~Li6(xepRm?;$5EzVM2Efm8YZjxWq5UCIBn$2
zYH#eF!cMCAWn(b?hePN78H?)5cJrP7>0Cf)ag_bWm|IP*ZO^F9IkqWDN#gQkXF2XX
zuGIxyc{^o9DVAHr!+g6%1}0eRWk}!pDScePH>k6j3qzEXs;mTRKlQEtrJYgAP9fK*
zUTn7@HmSBE&7F^C%g9?MftUMh_ysYyeRsV-OqIiZq_iX*ObHA=3D7oH2Jn9jIPu4U%g
z=3DdL+TR<th=3DZZDkuXBO|QFS|WiVCR<S&Ic)tweyupW-oTBXBrC|i;0eV@A~RF;Vz*W
zMreaU3*00Ouk3ZrzcS&TxK3YA3_ycPG714pB6iUc(bB7N>{Yesz9d8Kd=3D!*2`ZIin
z0kNuVHcwXu4#(bz>U;PUy2>$+kc6|{Jw2Hw<_)oG8w_>C=3DQ{3Y=3DgW&46PCR#;qhnn
zw6U4vYCoz4CY_>k>C1I8qMrlirG{;0fA=3DgE-EM{ljCKqbkwpOJ<Y3*(O84oI+L%dX
zxQ**^nOD9a#jnnO2-A~ffG7n8Ode|?xRm?M297f?5}tX!=3DG>v#5>5T`*mJ%fS6azF
z(#sc!<zZ{7Co>D7A<NkybW|D0q#-tGL`{@)5?O6|S@IlTLXuoYdvj4@9Z`<Bcx{~4
zQ!Xg;ph_tG$Z*HOj1D%u+<lz1<T@xp=3DK?ApKCa6slWLrO;qc}+vqV28f2=3DE%0jM;8
zL#>?4(MAm=3DGEa_SQZp*=3DOW|mq8+AaIQqk|FwdH(<yIWl9>7*QdSw4SU|FOZhyMSx+
za&bS{DD|N-{g9LK<`DG?1JAbhcHup^dhP`v46y|^(aBBh%^r7ySnHnHImK0?`*z*T
z0#RCBBigEEp(k6l*M&Wk)dUMVKOkDI1QR*3Of%+2!qHSTwdm(do5%sLPH~nz=3Dd9rx
z8!&aUmXLkbs?9wUXkJBQ$^hMhXWpbR9jI(Sq9h(6f|TXpIMke>!BKEbzzBs(8w!KL
zDSi}(OTu7x2aJ37Yn>15UUs2wa&ynrq%NHX#uVl{5=3DuLV>71`<%$|Lvti4fiBA(X{
zuCc-#>}eGtycig@Mo6>k&#-kZQy;!5-5qd4c!}jvA|gU6KH({k_Eg4NQyO>b#CTd)
zY~OtbJc!u=3D=3DqBF`Yf!gqsMy_j^y2e=3D?y9!iS;a;Z_Mhkr)fDbD#e_$P8GswK%@mBw
zw-(;l?1W04+9SS%?C%_#b<3P1Z;t-Slki+=3DS!sPg`sfhLK*XD1G=3DxhTa{=3DoyNp`%A
zEx!vUBl?J9$L714&CFd&+B#8FdxwqFd20jdS@^E=3D9Ch^0`ci?ge^8lbA$zTOJTj*%
zUDt=3D@sCd31Z1esBDgt&AU^g`w@e7x{TR!R|LCA>^DFxua1d<w3=3D#eYJT=3D9{6LJ3;V
ztz|gd!RE!*v7j5Q@<{Rm%4@RlpxkLE-jJchStN|Da^qEq4a@x_qB(eH7J&ueE5eXb
zsdmZP;^$MH=3D->@Fks0SU@cN4J`=3D5{Z<UV*APJs$xLL<*pC2*mf>nMOSUdk+uwG~Lw
zt{&c4<Wy&Y&EsHG&uM$En$@u3M?)o#8Nz;wpDEk{gq6gNkWT$f+ZT-cf!uwfZVigR
z-*&~Gldc5=3DuY;-egBI|o0`RVxrM`*WEt?RqZ?ley2Yc#Hn;uU1Li!A6>PWjB4n{HH
z4o<Z4cqd--_Qn5_c3l8rxYQKq0}W`6o;7Yobwv$hVV3P67aPDrLBdDRH!T-rl?xGv
zk#V-iaO)reLwxdpKGQGgDN|Ho=3D1n%f8x7*<{nOx{hN-PPN}NNu-2UevG!2Z>?<MHk
zd)^wi3qlOaGkf7EGh)3lu;e&^NggBLt|9mvFK)bF;}ue&5Pt)m4b?#igm~u?oQN&8
zNI)TL{6*U~0>1+mqo0aNR;7@t&vq!T-RKIQ86*$Q_lYXZc*d+%LCBqz6YlnNj|jWK
zu%jUntGmR85FExU-KtKN9%)Kz9>G05Ag!4X_U8R}14E~er9Q7FhlkTfJ}qODwjIHR
zsVIU|U<{rqFGSfG0|kQ9z^3)wd<|lVP}ULSZ_2yBg@LDOG4ICJ1~HN>hzOY;E>G8=3D
zar;Mk^jX?!(y|O%9@wvnFTcZ_qm`va{h?Qcs~}Yb_I2X^4#=3Df3Z=3DDK;%J%4I^l+-o
zDGjWcn7m@LrKhY-;6GWFU7R;MG#j-e$S0Q;o1O&iHgp0b5_uYo!cvE3#|ZO5`=3Df&W
zAe`z+j<6r70D<W3^X#~FQ*eiBsMw0&YV1Te?PHDKMb@iLe<&fBw%@OF4>9GnJNuTd
z0P$Q~+_~(QAAU-mBftt4?|oQJaO*IA+N<j%!gea~Rxo>g;dJQ%Y)`(OuFTGEgYF&b
z!*?kU1Dr#M8lbNhZ7%l~ul%O*3VbFGg(o@`3ylVaIJU0svxBcOj}S~C0b#uir5L0W
z_-zo}TQ`FuKxlkGN`w~3E(1=3DeLxBF?knoL@L5Jy4U3fx9)~KYjuRb_NVw1irB@B*B
zmZL+k562h%;3i!@ZX>#VrWrQ%lv~W^o89vg*kr^IG8S|xJYpuDy%IirUVzGwFB9Q3
z89J{9YMT%m9Rp*;#K<Gn6wkLp*~&pI)~t#vjCKxke?R}M>8L-jAU52!Kesc?VSpw|
zM1TvXV3&?<9?*qxNu0SHodq?ltGOX=3DWfx8mX_uMw#jxW-UhEfXff>hNjE@yGNMiap
z0s&7Ctki@OTYqF6DyX>92>sDwgdNfL_x_ZoKY7Lz_v!c|Rz-yZlSS8Mg`+0$QsBZY
z#~Kwo@Jc5`U>O?=3DT@eofT2Pr}Qzrx@vC&eYx%<2|RvC#Qsdvv!gsF(QB5Xntzh9+P
zjWk9|RGA?A|H@_zoz&+R&KB=3D+*T*BU-NhyZB`;_2_S4H{EuusCp002j5saoU*$xaj
z`fh3KgT!}koE85}96YV?b3@l5EUUd*8FlJs>*7n-<DsnF+L~a$e84n%U<1H(QN8#F
zc1`EcN%I|z9$zfH66j6jdR+8q<_Zk!sJai^(x=3DF~x|4t)YufiyiK_1^Nn%T^L-b5X
z-MsRBgVGq(zmRe)84&|k<m|}JiGdhuOoY5ax2DD7%Lk4=3Dx-CT~YS%(k1ugZ7T7MK}
zV)nCd3N~!&D=3Dow5NUfm8LdVLj5`naftya6FoP+(sfS5zLUSemlzxB*norgnOuaVV4
zdTxv|#Y`}z*jQjaY%ZAEBlH_#A1i#A3rXoD=3DceFRf;BDk-KO*wPxiHrzT|vc_JJUm
z5=3DmYZhI@$Px2|lvZwtaS-!xSAtqR?$c{W4?rvvSNg|B;{j#1a;w3Lo6YjCxfx;in)
z;qE~(H-*^)XJgh!%%w%GZVD&1#k&&3i7>pFw8h9FepD>~{XFvMD54Jxq2NlbkTh;d
z&P4vqsDKMJiu$0(jfdL4gTGbT!xADPFlvZtY*1nh3P&VD0)W`H|KYRuq~`)Futnb3
zodhs*5W_GZFAC`xlCkm-I4-t($f<GHI<-Lw#PG1-!K3=3DQLWQn)xLETD1jyDUJqePh
zkHnlQI|xDUH}{lM5}G*S1&E~w^y6fQ0npRAoW;>JB^nQKFX5OrFlR~9zD*^R#&M1U
zD~e(6ce`U(BSomap1UxsA<K6LBisSTCv|L-*z^1}CI`EI2nd6j0y6b@7Z+CcCzpl>
zy{Xf_{q1tqK#+A{;Htv-L#OZh{f{U9L=3D+vY9AQ|CH#82>(Ra;-{!8YZAA<n8Hu})y
z1PvB@AstW(#>y!Re@+X{ISbBhw(wn1Yk#g$1#;U^RCcR32+Ek?{A+f6>+|_&l*uXu
zxn6h02?qx_@0!>~A+(unc53N)``f{Gml^fN=3D{ROoYmTlLZA>8$jH*y#di}MG+gt&o
zzde@eeQV-m<G;Cw<MytxcLyiTfS7A~-QkJv5ITs*9bpvZu>R1K3IEhP4pCZI>d%c(
zp-?|R$>qvBb>cmn%oL4cctmoA#z*k1U0bjuWugCmWHb~opTB~iLN*-q>(Gj^NMEp(
z3Le$Pd`SL>wT%}nWOX>OgTGPtw_887^UAZ+iz&`I3R`{&UeeaJn1b+S1famJ@|(85
zO``SRV(Zi%Fg$q=3DMTkY-uH4FRJ^b(b^Ymoj!w`Wf^Kcp0gY9wOeviDboWcx&GihdE
z0b9b@OwDtFut@K^IS4>%@KU4Wm`);A<GGn49vxfN;s>nX%w`>6w6m(A?t`YCOD)>T
zSXN1PafksGJhOqkBcF17Z{pYE6UF(KDJuXKN)W{p>;E=3D^&z=3Dbp4A;eC_+!RG<|y#l
zuf=3DWn&>5!@hbeCSzVg*M6f4Q&yD2y2-b6>>dT#Qlakwu{@0k!NcOlC4-6YJn_zrcu
zZ-(qfc`wpl))X{6oKv$oky6Khwq1!#MW5eLVZwnCVP4V-$6s^kH<*91G}DFk@H!<&
zGBK}F^%{^KSF_qK-NO3`fl;u?OzAv;f=3D@ps)WG8(zk;2A5ODN_v3)o3*Bb%(Na4bu
zD$|=3DuuR#m>mZ&@($sPcH69@m0GJCK8Y9>&k=3DPJXlWPoBH$hg(YLjm=3D0=3D%?ItR!UP=
C
zou0EvpmxmChrFfp6Nm*3Z#e??cSxIFaW0`PjPfoo3+`Xe$pi0G3P*TVvV#ThKM<DA
z0#A0Su|h(|?UD95);LFr6F=3D5w?Zwo97>EXbPrp7E2FscR?U&8)vu7hm_i^50KCNA^
zoE+QlbuBJ}&H}-*9Gg&fgli=3DpRCEBa%6_md2hQ>~ku(UA`{mLcpN572B<h4cS?@IP
zVXN?{kCBlatOSeJQCbk1Dys`w{D+6l)3obraZtEx71Qy=3Dd|p(x#PX3Dpu>QBgnGc4
zkcpPLD`s`j>gf3Uexv+8e!pDyVx^$6?F@YLGrLk7IS5fKz_|z7Ttr0}oJ5_5GR;^h
zFP&kMz+rcOo_f=3DqSMDVgzxT}uG!2e@6p^R{n4AVs5NOKY$W;nQZ!Z@zXi-k;kOo4e
zsZprdzc$qhjw<(>y5X>cO=3D7XIk%USF)r9HtxNiSOoQ^8K<896fZbHYO>xJk$qk9pV
zQ=3DQ!S(+NjJ3(-=3DmOy&mxBzj48vqC}6Z`M?Gfs(DW_pX^o-~&#42x&-cQ*9dpQLvI2
zRnnf)z|D{s1gEM=3D0&V^w?;bt2Rm7ApHBXQ^4CAtzu;Z^J1GHe&B2=3D445OD+$<PtxA
zrO=3DTGT1~ZYqxsF$c26QZxyAu}uaD~!+Mh>oH~10G`}pLl4Yy+bTo$NJ<USZuvK&=3D{
zo4gX(ie3ct>d}wP9$4o)n=3DAbNhBzi!D^RQbL&X!r6DQ13^N46IT}nKpXK575_-egd
zVSe5RF+NG_P5P>vJNxgOFLezqz};5}=3DGTxuke)`g8Uk;!EO;mJvGa4ay`0#tBRlZ>
zu#jp{Xl3YbQfa2J;z%%wsYVun)73iNdJ5p_699<y#r$QbMQhprFmUkwio#V%Q7p04
zb(++JDqJl{!w-$^hawVU0o))eTBTh$aZq%)W<ccdEHLFNXu+H7dX9W~q0yggtToQd
z16wI7eK{YXS<OxMcR3^R&AG{x7;!A(P`(`UnDzK9bFv<|(Og`9puQ+vB<_R7X8?FZ
z=3D#q8$vk1~rQj8!zJGR;QU!&BBb^uVNI&!xN!cW-tT>Jpua57U5RInGjqWCmKb<<_s
zoV^GaCkf<<JJ;x_!$Lc)VVJ^S9hAIsF2sK;;=3DL;uRnx)B9eGjnA04UbWoaaZ)#kdY
zQl`W(#O~QM)=3D|!&J}4FB?ivB`v+WT}ka+;}V37M=3DM$OTkB_Io45c(_MDUL`JJvaD6
z6%f2_kKJX(-*z4}D3^YBG1JfC5&U+3V8%%Cih;7vz+uR6zxX0sw#cUXNskn+%~iEW
z9IJ}_(;lxMtaZ4H4t!h{ET8@1)40f<?JxJpF&bDi!!du+NPW-UNt41r9sfqmZvX11
z=3D@WVHsQqwUCIrcL1dIkqEE?Oxy@mJDD9Mfng^D5B<JdaQLz+3bLf~lI)O7p}=3DgLsh
z8#-=3Dazg#=3Dj_4AiYY!}X-e1&{snZE$csxoP}TOUx0zDR)YrsZ>~E;-_pWPvm~OBE=3Dm
z3I&#t!7~Jq#dnnIQsLRd9C2kXM-K@ArpST^B|8b6vtd{4ktM9Oe_;t32H@BMcG1@#
zD*>AuGHFZk&{EbB3kF5=3DBzO2$l-99ef}gzqWN2Eg)gUAfoB56>A3D=3D$Kz;&u0=3DD8r
zo~p2j(cs+aPetbM=3D?x7=3DW6v_(J6EMFnBVF)Oh`HMCdMb8hjB?<Zqqy~lLz4qutVCo
z`Y_(wuJoi1zCHawNUISZX4>QJ6RP_8-ND$suv(21<Aao%Viy3AI~RA~I#HxE>6n=3D!
zg`>e=3Dljm7Q_v@Y9<~e@&)Ox;zDiFwc-tJl8T0yR{uYO`4Lz>a$P%r}S+^)W+LizG{
zhHXQ{K)sdOYg5>*9W&Q1#WPo&c}whQQ@+2>UA+}#Gh>J{(XS@>izXeq>)D~axUzy5
z-rnIR83p7?$6JY_V_FsnD!FBVDz$=3DPCj6uyT^Bsu(pEl}#x^b-KKA!79$LKYZXVp$
zI-8$f6wfzSUq8CvJJC+9%?aY)riIxqTD^J>fu-#x!>(nTPj)K(NF3Lv8J7T~tu2h*
zd|1@cfesllr;$2OR>;9N;@F})pr7b-pb0;}j3__<e*?~+Fmt*`43|hRFZN$8^?E`@
z@UUQ3{XbHu0)hf)<-ZUp{MB+4!Q;ev{7GO$L&Nem)vPb|s*g9f%S!!9@gY3Dn_5`O
zTSP)W#38A5Ia$vKTHT^roxD5M^h=3DiLzx_!yAljiL$WTS_tu*GRZTT5s5|Z*<Mn<y9
z)^WbIbMiah$R+E=3D&YnUw4v5>wIq)b@uuY1y+T<wxA*8nqpS<s&uNUlh^kd9P&4^X{
z4eX1H;i3rfL2z&1ua1yC5<^gaVqDTlvJ#=3DE_qq|t1L|?p>e1teU0P^^`aR-`8Ejr`
zC>4JQAo}4&UIf(KI@A1Qk!jD--i?b#LEE9-Wx$UCPB9q*HqT3*$F=3DelEG&n(Uv$}b
ze;atfd^TxhN*C`Rsx20zyt^2z3z%LDD1JVPx)$UJMtYxHY;L#Y47qjf!A?HpiwEwC
z0HwZbz&i8fSq%fY8hHmwR@6Q4ir{!dTf|lY;6Yt7nKcWX>uc+)E1gEiZ*PG2M%xW4
zS~sN6OaPd!xUc}=3D<Lk+8FN*u5e76=3D+wF3a4KEFaC0Rd9e(Lagc_M(!4;0Iu+a6p*T
zzBgU~06suefKS1B`E<=3DeMezZ6;OYSd1Ua7y8v69tX<y%X@#vCDnq>ozL;q>AR1i*W
z(fIjdxMa0@U-FtfUjYaR$i)R5JfBU=3D81GwKW{~g&+d-z=3D`9r$f`O~Tuw%?R7BjLYt
zO-m$?5d5!v3;6dUlldR2?%yP|nDdO&Y$$LLzRK2PPX}#A5hmon+S7uBR=3DxK@awG-u
zS3O2rX5zh8t2x}1OyH~RYRPBA|7!^PU+rc8_tj5wOw>{U!rq_wq4$fAWt#0R;cHKr
z{*$tIDux8L@%?Tu@+1u=3D73-y7(M{9mgQ}wGDAJ9`29k&8L?PAM8LOnLjZQ6J)@KV<
ziaE@_t<7YUsJ5h^GkNr5PzKp8@{X$~jDPKphS2V9Zs#ONKMD<3ZSU4F>2)K~;Bpbk
zizfQ*?ub{k5o`Ru|CN^~mj`RH`Yzpsmr1!``gA?LeM6g4{k(LKj;m#qC+tb#GP-XX
z&s|G+Z9}Js5IiW{O~r!J>XaSqv0WQyKozoNrd9QFrG8Q~TGkv@Pd)8bx2MaPPpYK`
z%qhBTMc`}zCse_ZHx<ekUl&MP#C0@d4&r54GJwXl64y%~45hwbv%eCE{rx3EYxyAL
z$+xxIpCF=3DT%V0~a-I8Zh7iWCT!tTkS4-MP%77MEt)$^Wke?K{Wxi7G`{U~$evWHpV
zOzSVVS8ZQZj)Z01p=3DOpu^~Rs5w+TDfGsMJ)<?-{N&g$78aQ(ZgCakU?!Y57zXS=3DcH
zXNu@{9;Si<KEDKrzKdpNwn;9}{H)#LsiaW#hbxi}<QrqD`Yn6$B=3DN$&hnQ^dR4O_N
z>zP`W&_$bgolpx3-<^|HXt!KL<B>#@?YNx$us8qb+dPcv^$cy;r3nL~kvuEM0#ar4
zwsV<Um~dqB9(0!S55+uN3Du6|-V7-D>!S`)El9N5-m<k*{)g89BrpkI)~X|?Ur?-Z
zXW<iJSSAPIW;2Pq5sg_`^(Dap>hjDLi-XOHE`w%}Qy5q?^*4yH5f>xVV4Z(0;(`Z*
zq$D#1c99Uf0|-7<suBo_hR4h|?(`}kxsX!v*?QXSr{s<Mct7|S$nBVLL3%>63%B8t
zJ|Fih^Q<4OxKUAyJeX->C0~{eRud+|#j}SxoatU!-|O3o>ZWEqMSyA5W=3Do8j-mq-3
z1RkvB+BmJ2Vxdb1w8BVIQewt{-J@pDK5w_?48}$obi}nmcI>DAnKACYppb?*CuzYF
zpe-^@`_b&_u9vD$P1jw}W%fEDS(;6DJg%hrJSSk%TOT)oNQVAQ*28tk$lK}I93iBW
zjKW;_h|Q92V;_2?$r|s^Ms%(#_h!?^Prsdex!QATFHXH*0)2|x4IoqKf_3+3M#HJC
zlvg_KR_+Cpp<NGXor+Fa1;xhiN_x41nk7Q}tHIDynDEHCKt!&(3G2CnBA8=3DKOy@QR
zec3mi;@d3u%bT|Qs<6oFnQ4wHsz&?$+^K~}PyqRJSFc0ZUEe=3Dt8e)8sZ*|{YU1i(c
zA?&0L3XiLNn&QuU;A&f=3DS7y`g*A}j43Ipl}4e^(Dpvq1!F*dBA^LZ<?lABD~ez3P(
z8pnWJxK+5%Cv}5Rh4Vd*CI>c(OFw_GMu(a}YwJdeb|Ij`sz@}w2o$<z=3Dy&H&RKIyJ
zdJLF{o0(a;F2{X1VE66oE1Iyluw~kLZiZpAJhofOcdR{ImLNidR6BJULH~A#X>H*7
z>3(I~e_Ik+zJUJhnAz352xU2gWrwk@1HvK4Sa?&nC!zJqz=3DgGVy|By7n3+(;)Bo1Y
zm3*$AIWh1y8a-7$=3D;+3D;~GA2U{z5Phe2Cou|q(nl;o<aSFszhxT(+xJcdPNPOtw{
z^I*B2cQ7_Vf`smc-7X=3DK(M&UD_Iu*Z&ONo(V07B(l`=3Dd`v*|oRZ~0gm7iOk5M^A&5
zE^UQ^O}*P2eRxZE#!3{v`gzl5E@euoLZLDRr=3Dfh?`VV)^r;(9~BSm;(MeqH7_0Y>x
zofR!PR$bT7y^5Tv(mZYBOnKjk`}dLhE?L8rHjdO4;r_3jYtynWNR6RW*C;Zs(XjY=3D
z8=3DVIkuElGNi*Olvqc+eQ<x+oHqcP}p>T33p6Ozj5n*TWs*w1=3D=3D)maCre9W$XpY#0C
zHGebS+uoDSj&w&$x)Vl)3&}W0C{~Z%pUQd1JLZt@%D^I8EyOUwQQ3~>3<cZ77Hm%0
z<SQ%}B)LK!RO^n}5S@c(hrY;1%V~T#V*MITN#(pGA3y4@SNkeP+K18xx_08+u3#tp
zUOrsqsT(%<-fK_>6U<;W3sD6CLwdB^6U!0WcOVaoVK1io4;;TrhuoID#)9oK`@HU1
z9&z?(mq;gDfBDM5lT!G?f8hVR$mn&OGB$kFFKja!0FjK!d^n84Q*9ZDxA#-ueqFU4
z(!iAev4V|SwlUUNP&zOhjQ+M*?*ccqHz4!(9rYwUnlMK1BF77!p!y`t)jF2nE~sW(
zNy-$?fpo?$r$KvZTZLwQq=3DP4-301k46yeK@iDLFdR^=3D;kClWDFP_bl{^YA(yB!{uY
z*}gq#)vnp&%mkSTM%J#?fc|(^3U7Us9t~J?`(97UpO8x)9PWHy+hV}Ra!riY*Rr#4
zbRJ8+|BPryuUve;{Y;fnEW^B3dm>{llF^R|`+|tfG1jtfEi~(P?mEZGl`@UFsRK`N
zIq@xkE<M`K^D&LccFR;Z(t|w>jfAI~Oe)S~#N>MQ7CI7^h{4s41%Kb>I$YJ-{TeIH
zXd=3DhFbDotW8F*j6;su6!+v?l?Zm|+IAKBpMA#V+t)wd7B!*cy3DI4nLZwH*JNFU!?
z*^{iypttQoqKm)Xd1?q<EYn^H;CUJ|0=3DrS|sznS@nZ%q0JWZjFE0m-qfp(VZUt}LE
z)cfl@HPoK)G755*>im7}Q+79G_Xw4cW*wtoDR`O4tt~x+3L~A^lW>f?!)Ct#|2uP1
zOGyZcOh_o|o5E1<g&wTl($_yO%J=3D+uc39nAFkyXsW<Fd4qe{l&gkLdFt5xrVZ@B^W
zt#dAXu#x>L;QbmnQ!`&JdT5*^1|>x=3DZaVr<mG%0FFsjnd`97*_sV?n?1^9aiL=3DahU
zxaYT{o{!&?B`>kr2?bm`_piJu0)|}d?fwDsO17K3Y`Bl$2pFI4OfU2IsxaD#;D_e|
z26Hvuni4dLVmBmm`KHhv?J9ZFkN1E&(1wYmprg_O*3jFVy-WhG0D005bNhaFcP>&i
zIA4$EYAd?ZR;B&PX3){IH(l1Y#%ge2H`;?=3D5jLZE7n#`@a_(#=3D^97r;L+00z`KA`?
z?q0vgfYMsR{}@BDXx8LNMI5o0pe*Svm_WevJWSx2rz*s`a)8m>DWP4f^+Tzc%*3Ta
zNWH9sep%%&w{0R~>8EGH656p(CJojJwR+Fudqu;2P{FUbqRc~Xr`IC!6zfi#&NfCT
znZ&V06z6qALU@U>6b=3DOSHZ)~}?_r8Ul2;Ep6pp5{FyuG)!E79XBND(!J5EnB5j*G>
zf??_4Tx*GKZQQ5q=3DPJu-B!N^#s>%Oo+t&=3DzO*OFqr82+$ZJ^QWVDo(qTZ1Xt=3DcZ8p
zHK;z^D*lY;Y<e)*I$R}sn|S99le#vxQ_Q@}WHHtjqjcJH89s4#O|+=3DVPyt~z^Mo%+
z7M$)zW$+kiPV|js!+nYkOLocSoBX^LX`PyAn<odf;(_e+wG}g?ff8hVd305=3DV!f*Z
zt$}#!gz%J$%WubqFlE%w^H3Tl{;#!~f5(|!KYeHSjCwy(>#|FLP}17OWwA%f(Y<<G
z*yI6?Mm0g69}IQ~zQH;oa+N2?O2X-tj-v(l#Lh4h22+)y22zfGln24B);c;(Gfbqx
z8rd6M;0(-Sb7~%3t&H8fG-KF8|HoEGAFX%R;%<L|sHH}#d+!1PH<hJgT2|p$chS2@
z=3Dv&bBPlm=3DWUe+i=3Dr1MrJvj#h^JS-RuB(Ow{@c@x4XEvh>V7kWK&Gq5)TU-xch4v(d
zyR=3DxZl`<GzA)k`<Dk6Cj^WE$TF30Em0^1A7kK;^)p&Qn?IYM7EFU?KWGZc6PK7n|I
zQ3q1UPe)-K|LHDvS6}wj3$v{Am%M4>FF3>Jm!xaW2kVTSelkb28}YSm@!KU)Mkx;B
zGF#qBR?*Cai6=3D9gFGKYfzn5n7gT%ymXTT_36@pu&4peaTJ1KD^<ZKC$N(WiA@kPW2
zWa-{r^K<UYuGV!b!5Yps!F)fTf9o4g`2~u-sROe0VZ$*xT|insm9zp!xSb&TbDhT{
z>>!x!kqDib+&3)9141-0Asx2*Wq;xb8mkT0D@wHzg(S14d?}e;)@_l~fUAgMVXJog
zqXNr)af?d>8oY+cd|tolU<7!yTKpm#E-%;}S%IH`5HDz;BVC;-$$_?6{vK)O7TH85
zN&_zOr_L)4ZoO($P%Wr5SsxlddsX=3Dp2pCOSKkeC#wuFHs#SFx2qlAudi(EdX99mLp
zyRo`0hkPKjfxZl_=3D|Lm$bH66DWJ+j~1Bb@P!-nvQi|(;Rcdn!Ps|O~-JcrBzU3!}4
zjfyoR!`yHAn%h-ePYxL$HNo|BR%wjT1bp#b<V4AI{;h_BsynXHdl$;@P8Jdk43t;v
z4KX(<6tPo1QF=3D2iGY8!;sm*M0{q(+FGifR<?~t=3DN8OC-cUJAHuP%&fr1mNRZK_zsG
zu+p(;xi&?v=3DC2#}&x~-nqJDC$s)2S7hZOT=3Dmtc*ej5f^L_`x_xUb}U4aCh`;`V-fG
zzt3CrfelbN*hsx>d%DGT&@c_d>Ks-IXAd-?3HiD5dBeFS((Vt>?B(`+XKf5RD`mFj
zu+w{P;UMKypnbMxTJ}L?n?ADpk3|;R1#R;@3|ko4S8thawk4;5#`_EOk{JF{sIS3*
z8YkC&c-E0pk?EnTW`Z+jH(QW0Krud%HR6xuR(zz2W)!sAG@%++a1d3NGLvC-;eSKq
zpmeQ(+tp;%*}Zh#*$J9QfKwkNy?fjxYknagCt0XEB$vn4USv=3D3Fhv%5r#YDJxu37f
zeOQiapir!Ni|3w1UMtL?&(FHwOd(TzK;^3FHCTD@K<{Fs^{oCjnyML>jL03D<(WB>
zU%&7@<mUiM8biP`mA1&japmtHm($lG%CVm?n2q*_C9Zo0X~lOHiiecZI`Tg08|CX0
zxYElg0G6;(dS|9!D-B(59VYI^=3D5hhA^WjAQMN9S7Qv&IP*qGucYtsf#boo=3DjEb|u~
zBEcNewc2yM&a_20aIQL3$3$b;;GVd##uwH)a`O3mCT(3mWPhE7?x>0I_lFJ+bZawW
zB9#l%E*oNhCZgC&;y>f$_9mWoX30XLgVM7T<HV=3DlPJlFOO^~Q1jOuR}a`gcP;dU|s
zqT-V!FJ{01+P%k9v*cf*Pj{*KjH)F+aSc(sf3dHJjx=3DOdPnzZzx-*rN+T$PW&iLgS
zh=3DxKNibs;(Oto9}A)wrQcn%+Qw_8(H<zW%mZ9v9s|1`%1{|ouskmk>kFcfHG3*Llm
zSs#1d;Q|L1mZmQ_8V+#!U!C8a1O&Ljj^n96hfPJm3jL_c`i*z(CX$(e2{kUq-zqP_
z{i`JB|1#MBzk>w+e_F*P(Rs{J+P7DU6i|HO7_kCpLu<zo71B(fr-;vz%S-U@{dK7L
zU#tJl8viT#f9mw#t*#?eJbw<6nn|6NCpp``#SSYA*pJV+NDJ7nyYVa>EerndhWJ1H
z>;EI;<@|}@k@MVlK=3DJ>=3DTgYVG-IZSko@(snhpAg$%++pDz*x*B*1w}^UFVCm1x6SR
z|K7n`^k!+M`C>~<e($ZkOCGAKopy&F*7}(Gj_x;Ea7XJ^b~qDBz^|+8^wFjf^6DSn
zyA@~2u^+5IJbA?J`$#l`;s+M&Na8M1b<wc9b}%zk))}D)gq1hxo(LV;rsD`6nRA-G
zH*dl*s^azb6a6>B@^vdere<~*lq<yl0XqD*LyRu;YP$svTcytD5rAK+?f2Y@rAEOi
zE~YrYCs1_WXV0lJXH!?rP^$^-1XFj1f8|*^*bu}EvzgI(>EfZfDG`{?(X{39t1><O
zY<`B*zK@1&GV(;Mt=3DNR0Zg$e0^XD!z)9Zb$H=3D?7yEpa&FMgCeY+zhEazfX5~ZiHBs
z&NR)rL71WHHRR~Hdm_^V!Epm##{%uostp&wx6v_?J*#kK)*-sp)v+!e;cAAf9a{mC
zo(Q1TW+PG9pk(42jzYf|I^yGp7s!@#NzqU@v}PmK>t+~H{om}cf?tdDAv|*1R*7LY
zj6?s4Q{yq8#wcr~2T7pEUb9a*>R+u`MS|FQ0<>tr^z-2e>7gQj;B7h`PZ6<JU7gkO
zkr|z8NE>hPsnr|j)nyE>Y;(}}?<p;_Zv;#k#L~~ir<bgi;J$g{|I*4Uf~x#TH?ZgM
zdTsvicC7Fm%`z6AgY;1i?b15ZWCSUtbj3zG*L#q88<%^?$4bGb3(PZ)$#7DUN92ZX
zuoDq*DJv~RFhS4-22$YZx$@p9yOd`Vi)|S8To%HCWf;ZImK^fZ2St+`6(?XLSS5J>
z5I%QjXrVm1shptD1`O~o?C!%jpaKoGJpo2Ck*Vl@UYxVpQ*@7#kp1AOjg*l6qCJtT
zS-t(fhU;YlZ1W5K<H<5b3;9yo!OnvJ(>}v%I;0G@`S6+h*bKCjRrkyvtUICLc-lO}
zoe#nVkN7abd1!nW@H6p3OhI0sq^4!R)#zng<CPOw-*<BEL+Q8A=3D!<RbfA|O_wA@<K
zLln2fsJGk8`1zK<@m5T{`>_u%1v;(AM+DSuID2}-^Nc+0Lx7hnlj!uGn$x{RrfnhQ
zY)l4MyP&gGWvlNNM{BnhX4(6`=3D_tm~lgWDBDO+Bwi)Q6{N%#Dr%lDCWts_LnZI;BK
z{j4bmmpalD3Wo0uiu3Z5jh#bkUz^b;|1DT)wt=3DCq0{`kMU>=3DrW1QFbG<B>^GuAd5{
zW=3Dq%>+Osd}1$=3Dt@TAX`=3D1_eXz)ouCBHtDP!+detiUEgvXOCp3xHr}bu|Ig1?7?;P5
z#m9qq7CTRmD~-g-zgcLtow{hx9O#=3DBa7bKebnmVv_cUe_%$wWco(dZ}eAV`bfcWE|
z-rRq;%MT9SuOE0K<fYuGycPD;=3D{k=3D*I;eOO88#$zH)d{>zih^NFXX}n+rk@xmQwog
z(JR}aG2~Wvj>`N+-*utt;gf@qspO(4(*#BSjLxTlvq}=3D(3Vfw6fSm7oBknDBytMS?
zMR0Ir$lz)xC}(>IN~}X)3=3Dx_~yToot)gwBPO-7*xbIg68Ar*M3&c3jRojVe$1Q$QN
z5@yAa=3Dic`bq!WUx<kLjLvA<@9Gv>g&#~V)e1q;5+DSeTO3`qEKQ$ObH?CMwVvjWG!
zU~FzyB4C~)^$-?MYa#8uVE|k3r+>J6FSGn)9jL|AEqS`PWs2}-hPGW~UV1~I#`1^i
zp03njAYL)+1=3DWD-L6n=3D?;04EH?I>D2GkA}Cv-ytDhFDSN8d>ZB2<I^WMb`5qp@FUy
z;nfq1Pf3b<N;8)~1xy)$2leCG+n3Ga<Nf9|7G=3DQIK=3DfgcrY+6OCyd*V5HABeqP3>P
z0t`R?jti{jOpMYL4NCjufg#0x0l9S(fV&XfJh{$QLc1X!uWRU|!FA`|^9DZ25OZ;f
zp?I3r&YOEs<D5HDYa9fFd!v_Ww_^)ou%cYFdl+OB1_FjrylzHTJKRom2oj(xTZEM6
zx*O_*V2c-4#`bfg8s=3DiZ+=3DkBQ4=3D@L-Wkyh4^#OgJq7K;DsgwoM=3DBb#NBzu_F3|0Q=
f
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
s
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
m
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
c
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
B
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
MPEEF4+T_!J0YMX48UO$Q

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0002-arm-t=
rusted-firmware-m-disable-address-warnings-into.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/0002-arm-trusted-firmware-m-disable-addr=
ess-warnings-into.patch
new file mode 100644
index 00000000..1f19f55c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0002-arm-trusted-=
firmware-m-disable-address-warnings-into.patch
@@ -0,0 +1,26 @@
+From 961d2e3718e9e6d652cadf5b4d3597cfe822dd04 Mon Sep 17 00:00:00 2001
+From: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Date: Wed, 24 Jan 2024 16:10:08 +0000
+Subject: [PATCH] arm/trusted-firmware-m: disable address warnings into a=
n
+ error
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Upstream-Status: Inappropriate
+
+---
+ toolchain_GNUARM.cmake | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/toolchain_GNUARM.cmake b/toolchain_GNUARM.cmake
+index b6ae50ec3..4c2f5b3d7 100644
+--- a/toolchain_GNUARM.cmake
++++ b/toolchain_GNUARM.cmake
+@@ -111,6 +111,7 @@ add_compile_options(
+     -Wno-format
+     -Wno-return-type
+     -Wno-unused-but-set-variable
++    -Wno-error=3Daddress
+     -c
+     -fdata-sections
+     -ffunction-sections
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-=
corstone1000-Increase-BL2-size-in-flash-lay.patch
deleted file mode 100644
index 4f00ea28..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 60598f3b44237bd5038e33400e749ec1e7e8fbda Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Mon, 15 May 2023 10:42:23 +0100
-Subject: [PATCH] Platform: corstone1000: Increase BL2 size in flash layo=
ut
-
-Increases BL2 size to align with the flash page size in corstone1000.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/24103]
-
----
- platform/ext/target/arm/corstone1000/partition/flash_layout.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index 41b4c6323f..bfe8c4fb3c 100644
---- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-+++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-@@ -89,7 +89,7 @@
- #endif
-=20
- /* Static Configurations of the Flash */
--#define SE_BL2_PARTITION_SIZE           (0x18800)    /* 98 KB */
-+#define SE_BL2_PARTITION_SIZE           (0x19000)    /* 98 KB */
- #define SE_BL2_BANK_0_OFFSET            (0x9000)  /* 72nd LBA */
- #define SE_BL2_BANK_1_OFFSET            (0x1002000)  /* 32784th LBA */
-=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-platform-corstone1000-Update-MPU-configuration.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-platform-corsto=
ne1000-Update-MPU-configuration.patch
new file mode 100644
index 00000000..25e53b56
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-platform-corstone1000-Update-MPU-configuration.patch
@@ -0,0 +1,274 @@
+From eb096e4c03b80f9f31e5d15ca06e5a38e4112664 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Tue, 7 Nov 2023 20:25:49 +0100
+Subject: [PATCH 1/2] platform: corstone1000: Update MPU configuration
+
+In Armv6-M the MPU requires the regions to be aligned with
+region sizes.
+The commit aligns the different code/data sections using the
+alignment macros. The code/data sections can be covered by
+multiple MPU regions in order to save memory.
+
+Small adjustments had to be made in the memory layout in order to
+not overflow the flash:
+- Decreased TFM_PARTITION_SIZE
+- Increased S_UNPRIV_DATA_SIZE
+
+Added checks to the MPU configuration function for checking the
+MPU constraints:
+- Base address has to be aligned to the size
+- The minimum MPU region size is 0x100
+- The MPU can have 8 regions at most
+
+Change-Id: I059468e8aba0822bb354fd1cd4987ac2bb1f34d1
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/25393]
+
+---
+ .../target/arm/corstone1000/CMakeLists.txt    | 19 +++++
+ .../arm/corstone1000/create-flash-image.sh    |  8 +-
+ .../arm/corstone1000/partition/flash_layout.h |  2 +-
+ .../arm/corstone1000/partition/region_defs.h  |  6 +-
+ .../arm/corstone1000/tfm_hal_isolation.c      | 83 +++++++++++++++----
+ 5 files changed, 93 insertions(+), 25 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index e6cf15b11..8817f514c 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -22,6 +22,25 @@ target_compile_definitions(platform_region_defs
+     INTERFACE
+         $<$<BOOL:${TFM_S_REG_TEST}>:TFM_S_REG_TEST>
+ )
++
++# The Armv6-M MPU requires that the MPU regions be aligned to the regio=
n sizes.
++# The minimal region size is 0x100 bytes.
++#
++# The alignments have to be a power of two and ideally bigger than the =
section size (which
++# can be checked in the map file).
++# In some cases the alignment value is smaller than the actual section
++# size to save memory. In that case, multiple MPU region has to be conf=
igured to cover it.
++#
++# To save memory, the attributes are set to XN_EXEC_OK and AP_RO_PRIV_U=
NPRIV for
++# the SRAM so the PSA_ROT_LINKER_CODE, TFM_UNPRIV_CODE and APP_ROT_LINK=
ER_CODE don't have to
++# be aligned. The higher-priority regions will overwrite these attribut=
es if needed.
++# The RAM is also located in the SRAM so it has to be configured to ove=
rwrite these default
++# attributes.
++target_compile_definitions(platform_region_defs
++    INTERFACE
++        TFM_LINKER_APP_ROT_LINKER_DATA_ALIGNMENT=3D0x2000
++        TFM_LINKER_SP_META_PTR_ALIGNMENT=3D0x100
++)
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform common defs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+=20
+ # Specify the location of platform specific build dependencies.
+diff --git a/platform/ext/target/arm/corstone1000/create-flash-image.sh =
b/platform/ext/target/arm/corstone1000/create-flash-image.sh
+index 2522d3674..a6be61384 100755
+--- a/platform/ext/target/arm/corstone1000/create-flash-image.sh
++++ b/platform/ext/target/arm/corstone1000/create-flash-image.sh
+@@ -8,7 +8,7 @@
+=20
+ ######################################################################
+ # This script is to create a flash gpt image for corstone platform
+-#=20
++#
+ #  Flash image layout:
+ #       |------------------------------|
+ #       |        Protective MBR        |
+@@ -82,15 +82,15 @@ sgdisk  --mbrtogpt \
+         --new=3D4:56:+4K --typecode=3D4:$PRIVATE_METADATA_TYPE_UUID --p=
artition-guid=3D4:$(uuidgen) --change-name=3D4:'private_metadata_replica_=
1' \
+         --new=3D5:64:+4k --typecode=3D5:$PRIVATE_METADATA_TYPE_UUID --p=
artition-guid=3D5:$(uuidgen) --change-name=3D5:'private_metadata_replica_=
2' \
+         --new=3D6:72:+100k --typecode=3D6:$SE_BL2_TYPE_UUID --partition=
-guid=3D6:$(uuidgen) --change-name=3D6:'bl2_primary' \
+-        --new=3D7:272:+376K --typecode=3D7:$TFM_TYPE_UUID --partition-g=
uid=3D7:$(uuidgen) --change-name=3D7:'tfm_primary' \
++        --new=3D7:272:+368K --typecode=3D7:$TFM_TYPE_UUID --partition-g=
uid=3D7:$(uuidgen) --change-name=3D7:'tfm_primary' \
+         --new=3D8:32784:+100k --typecode=3D8:$SE_BL2_TYPE_UUID --partit=
ion-guid=3D8:$(uuidgen) --change-name=3D8:'bl2_secondary' \
+-        --new=3D9:32984:+376K --typecode=3D9:$TFM_TYPE_UUID --partition=
-guid=3D9:$(uuidgen) --change-name=3D9:'tfm_secondary' \
++        --new=3D9:32984:+368K --typecode=3D9:$TFM_TYPE_UUID --partition=
-guid=3D9:$(uuidgen) --change-name=3D9:'tfm_secondary' \
+         --new=3D10:65496:65501  --partition-guid=3D10:$(uuidgen) --chan=
ge-name=3D10:'reserved_2' \
+         $IMAGE
+=20
+ [ $? -ne 0 ] && echo "Error occurs while writing the GPT layout" && exi=
t 1
+=20
+-# Write partitions=20
++# Write partitions
+ # conv=3Dnotrunc avoids truncation to keep the geometry of the image.
+ dd if=3D$BIN_DIR/bl2_signed.bin of=3D${IMAGE}  seek=3D72 conv=3Dnotrunc
+ dd if=3D$BIN_DIR/tfm_s_signed.bin of=3D${IMAGE} seek=3D272 conv=3Dnotru=
nc
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index 568c8de28..7fffd94c6 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -134,7 +134,7 @@
+=20
+ /* Bank configurations */
+ #define BANK_PARTITION_SIZE             (0xFE0000)   /* 15.875 MB */
+-#define TFM_PARTITION_SIZE              (0x5E000)    /* 376 KB */
++#define TFM_PARTITION_SIZE              (0x5C000)    /* 368 KB */
+=20
+ /************************************************************/
+ /* Bank : Images flash offsets are with respect to the bank */
+diff --git a/platform/ext/target/arm/corstone1000/partition/region_defs.=
h b/platform/ext/target/arm/corstone1000/partition/region_defs.h
+index 99e822f51..64ab786e5 100644
+--- a/platform/ext/target/arm/corstone1000/partition/region_defs.h
++++ b/platform/ext/target/arm/corstone1000/partition/region_defs.h
+@@ -1,8 +1,10 @@
+ /*
+- * Copyright (c) 2017-2022 Arm Limited. All rights reserved.
++ * Copyright (c) 2017-2023 Arm Limited. All rights reserved.
+  * Copyright (c) 2021-2023 Cypress Semiconductor Corporation (an Infine=
on company)
+  * or an affiliate of Cypress Semiconductor Corporation. All rights res=
erved.
+  *
++ * SPDX-License-Identifier: Apache-2.0
++ *
+  * Licensed under the Apache License, Version 2.0 (the "License");
+  * you may not use this file except in compliance with the License.
+  * You may obtain a copy of the License at
+@@ -53,7 +55,7 @@
+=20
+ #define S_DATA_START            (SRAM_BASE + TFM_PARTITION_SIZE)
+ #define S_DATA_SIZE             (SRAM_SIZE - TFM_PARTITION_SIZE)
+-#define S_UNPRIV_DATA_SIZE      (0x2160)
++#define S_UNPRIV_DATA_SIZE      (0x4000)
+ #define S_DATA_LIMIT            (S_DATA_START + S_DATA_SIZE - 1)
+ #define S_DATA_PRIV_START       (S_DATA_START + S_UNPRIV_DATA_SIZE)
+=20
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c b/=
platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
+index 01f7687bc..98e795dde 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2022, Arm Limited. All rights reserved.
++ * Copyright (c) 2020-2023, Arm Limited. All rights reserved.
+  * Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon
+  * company) or an affiliate of Cypress Semiconductor Corporation. All r=
ights
+  * reserved.
+@@ -14,9 +14,11 @@
+ #include "tfm_hal_isolation.h"
+ #include "mpu_config.h"
+ #include "mmio_defs.h"
++#include "flash_layout.h"
+=20
+ #define PROT_BOUNDARY_VAL \
+     ((1U << HANDLE_ATTR_PRIV_POS) & HANDLE_ATTR_PRIV_MASK)
++#define MPU_REGION_MIN_SIZE (0x100)
+=20
+ #ifdef CONFIG_TFM_ENABLE_MEMORY_PROTECT
+=20
+@@ -31,20 +33,38 @@ REGION_DECLARE(Image$$, TFM_SP_META_PTR, $$ZI$$Base)=
;
+ REGION_DECLARE(Image$$, TFM_SP_META_PTR, $$ZI$$Limit);
+ #endif /* CONFIG_TFM_PARTITION_META */
+=20
+-static void configure_mpu(uint32_t rnr, uint32_t base, uint32_t limit,
+-                          uint32_t is_xn_exec, uint32_t ap_permissions)
++static enum tfm_hal_status_t configure_mpu(uint32_t rnr, uint32_t base,
++                          uint32_t limit, uint32_t is_xn_exec, uint32_t=
 ap_permissions)
+ {
+-    uint32_t size; /* region size */
++    uint32_t rbar_size_field; /* region size as it is used in the RBAR =
*/
+     uint32_t rasr; /* region attribute and size register */
+     uint32_t rbar; /* region base address register */
+=20
+-    size =3D get_rbar_size_field(limit - base);
++    rbar_size_field =3D get_rbar_size_field(limit - base);
++
++    /* The MPU region's base address has to be aligned to the region
++     * size for a valid MPU configuration */
++    if ((base % (1 << (rbar_size_field + 1))) !=3D 0) {
++        return TFM_HAL_ERROR_INVALID_INPUT;
++    }
++
++    /* The MPU supports only 8 memory regions */
++    if (rnr > 7) {
++        return TFM_HAL_ERROR_INVALID_INPUT;
++    }
++
++    /* The minimum size for a region is 0x100 bytes */
++    if((limit - base) < MPU_REGION_MIN_SIZE) {
++        return TFM_HAL_ERROR_INVALID_INPUT;
++    }
+=20
+     rasr =3D ARM_MPU_RASR(is_xn_exec, ap_permissions, TEX, NOT_SHAREABL=
E,
+-            NOT_CACHEABLE, NOT_BUFFERABLE, SUB_REGION_DISABLE, size);
++            NOT_CACHEABLE, NOT_BUFFERABLE, SUB_REGION_DISABLE, rbar_siz=
e_field);
+     rbar =3D base & MPU_RBAR_ADDR_Msk;
+=20
+     ARM_MPU_SetRegionEx(rnr, rbar, rasr);
++
++    return TFM_HAL_SUCCESS;
+ }
+=20
+ #endif /* CONFIG_TFM_ENABLE_MEMORY_PROTECT */
+@@ -56,33 +76,60 @@ enum tfm_hal_status_t tfm_hal_set_up_static_boundari=
es(
+     uint32_t rnr =3D TFM_ISOLATION_REGION_START_NUMBER; /* current regi=
on number */
+     uint32_t base; /* start address */
+     uint32_t limit; /* end address */
++    enum tfm_hal_status_t ret;
+=20
+     ARM_MPU_Disable();
+=20
+-    /* TFM Core unprivileged code region */
+-    base =3D (uint32_t)&REGION_NAME(Image$$, TFM_UNPRIV_CODE_START, $$R=
O$$Base);
+-    limit =3D (uint32_t)&REGION_NAME(Image$$, TFM_UNPRIV_CODE_END, $$RO=
$$Limit);
+-
+-    configure_mpu(rnr++, base, limit, XN_EXEC_OK, AP_RO_PRIV_UNPRIV);
+-
+-    /* RO region */
+-    base =3D (uint32_t)&REGION_NAME(Image$$, TFM_APP_CODE_START, $$Base=
);
+-    limit =3D (uint32_t)&REGION_NAME(Image$$, TFM_APP_CODE_END, $$Base)=
;
++    /* Armv6-M MPU allows region overlapping. The region with the highe=
r RNR
++     * will decide the attributes.
++     *
++     * The default attributes are set to XN_EXEC_OK and AP_RO_PRIV_UNPR=
IV for the
++     * whole SRAM so the PSA_ROT_LINKER_CODE, TFM_UNPRIV_CODE and APP_R=
OT_LINKER_CODE
++     * don't have to be aligned and memory space can be saved.
++     * This region has the lowest RNR so the next regions can overwrite=
 these
++     * attributes if it's needed.
++     */
++    base =3D SRAM_BASE;
++    limit =3D SRAM_BASE + SRAM_SIZE;
++
++    ret =3D configure_mpu(rnr++, base, limit,
++                            XN_EXEC_OK, AP_RW_PRIV_UNPRIV);
++    if (ret !=3D TFM_HAL_SUCCESS) {
++        return ret;
++    }
+=20
+-    configure_mpu(rnr++, base, limit, XN_EXEC_OK, AP_RO_PRIV_UNPRIV);
+=20
+     /* RW, ZI and stack as one region */
+     base =3D (uint32_t)&REGION_NAME(Image$$, TFM_APP_RW_STACK_START, $$=
Base);
+     limit =3D (uint32_t)&REGION_NAME(Image$$, TFM_APP_RW_STACK_END, $$B=
ase);
+=20
+-    configure_mpu(rnr++, base, limit, XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV=
);
++    /* The section size can be bigger than the alignment size, else the=
 code would
++     * not fit into the memory. Because of this, the sections can use m=
ultiple MPU
++     * regions. */
++    do {
++        ret =3D configure_mpu(rnr++, base, base + TFM_LINKER_APP_ROT_LI=
NKER_DATA_ALIGNMENT,
++                                XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV);
++        if (ret !=3D TFM_HAL_SUCCESS) {
++            return ret;
++        }
++        base +=3D TFM_LINKER_APP_ROT_LINKER_DATA_ALIGNMENT;
++    } while (base < limit);
++
+=20
+ #ifdef CONFIG_TFM_PARTITION_META
+     /* TFM partition metadata pointer region */
+     base =3D (uint32_t)&REGION_NAME(Image$$, TFM_SP_META_PTR, $$ZI$$Bas=
e);
+     limit =3D (uint32_t)&REGION_NAME(Image$$, TFM_SP_META_PTR, $$ZI$$Li=
mit);
+=20
+-    configure_mpu(rnr++, base, limit, XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV=
);
++    do {
++        ret =3D configure_mpu(rnr++, base, base + TFM_LINKER_SP_META_PT=
R_ALIGNMENT,
++                                XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV);
++        if (ret !=3D TFM_HAL_SUCCESS) {
++            return ret;
++        }
++        base +=3D TFM_LINKER_SP_META_PTR_ALIGNMENT;
++    } while (base < limit);
++
+ #endif
+=20
+     arm_mpu_enable();
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-Corstone=
1000-Increase-BL2_DATA_SIZE.patch
deleted file mode 100644
index 6bbd66fd..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b05fb661b3afc3ed8e3d4817df2798e9d4877b39 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Mon, 15 May 2023 10:46:18 +0100
-Subject: [PATCH] Platform: Corstone1000: Increase BL2_DATA_SIZE
-
-Increases BL2_DATA_SIZE to accommodate the changes in
-metadata_write/read.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/24103]
-
----
- platform/ext/target/arm/corstone1000/partition/region_defs.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/partition/region_defs.=
h b/platform/ext/target/arm/corstone1000/partition/region_defs.h
-index abfac39b62..e7f0bad2ba 100644
---- a/platform/ext/target/arm/corstone1000/partition/region_defs.h
-+++ b/platform/ext/target/arm/corstone1000/partition/region_defs.h
-@@ -90,9 +90,10 @@
- #define BL2_CODE_SIZE     (IMAGE_BL2_CODE_SIZE)
- #define BL2_CODE_LIMIT    (BL2_CODE_START + BL2_CODE_SIZE - 1)
-=20
-+#define BL2_DATA_ADDITIONAL 448 /* To increase the BL2_DATA_SIZE more t=
han the default value */
- #define BL2_DATA_START    (BOOT_TFM_SHARED_DATA_BASE + \
-                            BOOT_TFM_SHARED_DATA_SIZE)
--#define BL2_DATA_SIZE     (BL2_CODE_START - BL2_HEADER_SIZE - BL2_DATA_=
START)
-+#define BL2_DATA_SIZE     (BL2_CODE_START - BL2_HEADER_SIZE - BL2_DATA_=
START + BL2_DATA_ADDITIONAL)
- #define BL2_DATA_LIMIT    (BL2_DATA_START + BL2_DATA_SIZE - 1)
-=20
- /* SE BL1 regions */
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-platform-corstone1000-Cover-S_DATA-with-MPU.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0002-platform-corstone1=
000-Cover-S_DATA-with-MPU.patch
new file mode 100644
index 00000000..6676acf8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-platform-corstone1000-Cover-S_DATA-with-MPU.patch
@@ -0,0 +1,76 @@
+From ca7696bca357cfd71a34582c65a7c7c08828b6dc Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Mon, 18 Dec 2023 14:00:14 +0100
+Subject: [PATCH 2/2] platform: corstone1000: Cover S_DATA with MPU
+
+The S_DATA has to be covered with MPU regions to override the
+other MPU regions with smaller RNR values.
+
+Change-Id: I45fec65f51241939314941e25d287e6fdc82777c
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/25583]
+
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |  8 +++++++
+ .../arm/corstone1000/tfm_hal_isolation.c      | 22 +++++++++++++++++++
+ 2 files changed, 30 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 8817f514c..541504368 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -40,6 +40,14 @@ target_compile_definitions(platform_region_defs
+     INTERFACE
+         TFM_LINKER_APP_ROT_LINKER_DATA_ALIGNMENT=3D0x2000
+         TFM_LINKER_SP_META_PTR_ALIGNMENT=3D0x100
++
++        # The RAM MPU Region block sizes are calculated manually. The R=
AM has to be covered
++        # with the MPU regions. These regions also have to be the power=
 of 2 and
++        # the start addresses have to be aligned to these sizes. The si=
zes can be calculated
++        # from the S_DATA_START and S_DATA_SIZE defines.
++        RAM_MPU_REGION_BLOCK_1_SIZE=3D0x4000
++        RAM_MPU_REGION_BLOCK_2_SIZE=3D0x20000
++
+ )
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform common defs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+=20
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c b/=
platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
+index 98e795dde..39b19c535 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
+@@ -15,6 +15,7 @@
+ #include "mpu_config.h"
+ #include "mmio_defs.h"
+ #include "flash_layout.h"
++#include "region_defs.h"
+=20
+ #define PROT_BOUNDARY_VAL \
+     ((1U << HANDLE_ATTR_PRIV_POS) & HANDLE_ATTR_PRIV_MASK)
+@@ -132,6 +133,27 @@ enum tfm_hal_status_t tfm_hal_set_up_static_boundar=
ies(
+=20
+ #endif
+=20
++    /* Set the RAM attributes. It is needed because the first region ov=
erlaps the whole
++     * SRAM and it has to be overridden.
++     * The RAM_MPU_REGION_BLOCK_1_SIZE and RAM_MPU_REGION_BLOCK_2_SIZE =
are calculated manually
++     * and added to the platform_region_defs compile definitions.
++     */
++    base =3D S_DATA_START;
++    limit =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE;
++    ret =3D configure_mpu(rnr++, base, limit,
++                            XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV);
++    if (ret !=3D TFM_HAL_SUCCESS) {
++        return ret;
++    }
++
++    base =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE;
++    limit =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE + RAM_MPU_REGI=
ON_BLOCK_2_SIZE;
++    ret =3D configure_mpu(rnr++, base, limit,
++                            XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV);
++    if (ret !=3D TFM_HAL_SUCCESS) {
++        return ret;
++    }
++
+     arm_mpu_enable();
+=20
+ #endif /* CONFIG_TFM_ENABLE_MEMORY_PROTECT */
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0003-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-=
Corstone1000-Calculate-the-new-CRC32-value-.patch
deleted file mode 100644
index 7a07c0c1..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 88cfce2e04913d48ec8636b6a3550d71ebdd49c4 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Mon, 15 May 2023 10:47:27 +0100
-Subject: [PATCH] Platform: Corstone1000: Calculate the new CRC32 value a=
fter
- changing the metadata
-
-Calculates the new CRC32 value for the metadata struct after chaing a va=
lue
-during the capsule update. It also updates the CRC32 field in the metada=
ta
-so it doesn't fail the CRC check after a succesfull capsule update.
-It also skips doing a sanity check the BL2 nv counter after the capsule
-update since the tfm bl1 does not sync metadata and nv counters in OTP d=
uring
-the boot anymore.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/24104/7]
-
----
- .../arm/corstone1000/fw_update_agent/fwu_agent.c       | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index afd8d66e42..f564f2902c 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -802,6 +802,8 @@ static enum fwu_agent_error_t flash_full_capsule(
-     }
-     metadata->active_index =3D previous_active_index;
-     metadata->previous_active_index =3D active_index;
-+    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
-+                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
-=20
-     ret =3D metadata_write(metadata);
-     if (ret) {
-@@ -913,6 +915,8 @@ static enum fwu_agent_error_t accept_full_capsule(
-     if (ret) {
-         return ret;
-     }
-+    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
-+                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
-=20
-     ret =3D metadata_write(metadata);
-     if (ret) {
-@@ -1007,6 +1011,8 @@ static enum fwu_agent_error_t fwu_select_previous(
-     if (ret) {
-         return ret;
-     }
-+    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
-+                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
-=20
-     ret =3D metadata_write(metadata);
-     if (ret) {
-@@ -1119,8 +1125,7 @@ static enum fwu_agent_error_t update_nv_counters(
-=20
-     FWU_LOG_MSG("%s: enter\n\r", __func__);
-=20
--    for (int i =3D 0; i <=3D FWU_MAX_NV_COUNTER_INDEX; i++) {
--
-+    for (int i =3D 1; i <=3D FWU_MAX_NV_COUNTER_INDEX; i++) {
-         switch (i) {
-             case FWU_BL2_NV_COUNTER:
-                 tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL1_0;
-@@ -1141,7 +1146,6 @@ static enum fwu_agent_error_t update_nv_counters(
-         if (err !=3D TFM_PLAT_ERR_SUCCESS) {
-             return FWU_AGENT_ERROR;
-         }
--
-         if (priv_metadata->nv_counter[i] < security_cnt) {
-             return FWU_AGENT_ERROR;
-         } else if (priv_metadata->nv_counter[i] > security_cnt) {
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0003-Platform-corstone1000-Fix-issues-due-to-adjustment-M.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-=
corstone1000-Fix-issues-due-to-adjustment-M.patch
new file mode 100644
index 00000000..23609921
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-Platform-corstone1000-Fix-issues-due-to-adjustment-M.patch
@@ -0,0 +1,76 @@
+From f7b58b5ba5b48e071eb360c1bcfc4d31290a77c1 Mon Sep 17 00:00:00 2001
+From: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Date: Tue, 5 Mar 2024 21:01:59 +0000
+Subject: [PATCH] Platform:corstone1000:Fix issues due to adjustment Mail=
box
+ Agent params
+
+Adjust Mailbox Agent API parameters patch changed memory check and
+related parameters. As a result, platform-specific issues occurred.
+Secure side client IDs are converted to negative values. Control
+parameter is created.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Upstream-Status: Pending
+
+---
+ .../tfm_spe_dual_core_psa_client_secure_lib.c | 23 +++++++++++++++----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_dual_c=
ore_psa_client_secure_lib.c b/platform/ext/target/arm/corstone1000/openam=
p/tfm_spe_dual_core_psa_client_secure_lib.c
+index d2eabe144..39e11b8cd 100644
+--- a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_dual_core_psa=
_client_secure_lib.c
++++ b/platform/ext/target/arm/corstone1000/openamp/tfm_spe_dual_core_psa=
_client_secure_lib.c
+@@ -18,6 +18,9 @@
+ #include "utilities.h"
+ #include "thread.h"
+=20
++#define SE_PROXY_SP_UID 0
++#define SMM_GW_SP_UID 0x8003
++
+ /**
+  * In linux environment and for psa_call type client api,
+  * the layout of the reply from tf-m to linux is as following.
+@@ -174,7 +177,14 @@ static psa_status_t prepare_params_for_psa_call(str=
uct client_params_t *params,
+ {
+     psa_status_t ret =3D PSA_SUCCESS;
+=20
+-    params->ns_client_id_stateless =3D s_map_entry->msg.client_id;
++    if (s_map_entry->msg.client_id =3D=3D SE_PROXY_SP_UID) {
++        params->ns_client_id_stateless =3D -1;
++    }
++    else if (s_map_entry->msg.client_id =3D=3D SMM_GW_SP_UID) {
++        params->ns_client_id_stateless =3D -1 * s_map_entry->msg.client=
_id;
++    } else {
++        params->ns_client_id_stateless =3D s_map_entry->msg.client_id;
++    }
+=20
+     params->p_outvecs =3D NULL;
+     ret =3D alloc_and_prepare_out_vecs(&params->p_outvecs, s_map_entry)=
;
+@@ -250,6 +260,9 @@ void deliver_msg_to_tfm_spe(void *private)
+     struct client_params_t params =3D {0};
+     psa_status_t psa_ret =3D PSA_ERROR_GENERIC_ERROR;
+     unordered_map_entry_t* s_map_entry =3D (unordered_map_entry_t*)priv=
ate;
++    uint32_t control =3D PARAM_PACK(s_map_entry->msg.params.psa_call_pa=
rams.type,
++                                  s_map_entry->msg.params.psa_call_para=
ms.in_len,
++                                  s_map_entry->msg.params.psa_call_para=
ms.out_len);
+=20
+     switch(s_map_entry->msg.call_type) {
+         case OPENAMP_PSA_FRAMEWORK_VERSION:
+@@ -266,11 +279,11 @@ void deliver_msg_to_tfm_spe(void *private)
+                 send_service_reply_to_non_secure(psa_ret, s_map_entry);
+                 break;
+             }
++            control =3D PARAM_SET_NS_INVEC(control);
++            control =3D PARAM_SET_NS_OUTVEC(control);
++            control =3D PARAM_SET_NS_VEC(control);          =20
+             psa_ret =3D tfm_rpc_psa_call(s_map_entry->msg.params.psa_ca=
ll_params.handle,
+-                                       PARAM_PACK(s_map_entry->msg.para=
ms.psa_call_params.type,
+-                                                  s_map_entry->msg.para=
ms.psa_call_params.in_len,
+-                                                  s_map_entry->msg.para=
ms.psa_call_params.out_len),
+-                                       &params, NULL);
++                                       control, &params, NULL);
+             if (psa_ret !=3D PSA_SUCCESS) {
+                 send_service_reply_to_non_secure(psa_ret, s_map_entry);
+                 break;
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0004-arm-trusted-firmware-m-disable-fatal-warnings.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-arm-trusted-firm=
ware-m-disable-fatal-warnings.patch
deleted file mode 100644
index 07db4f6d..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-arm-trusted-firmware-m-disable-fatal-warnings.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 04ce07d289e8cec75223349e9ebf7e69126fc04d Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com>
-Date: Wed, 18 Jan 2023 15:13:37 -0500
-Subject: [PATCH] arm/trusted-firmware-m: disable fatal warnings
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Inappropriate
-
----
- toolchain_GNUARM.cmake | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/toolchain_GNUARM.cmake b/toolchain_GNUARM.cmake
-index 7989718515..a5939323d6 100644
---- a/toolchain_GNUARM.cmake
-+++ b/toolchain_GNUARM.cmake
-@@ -71,7 +71,6 @@ macro(tfm_toolchain_reset_linker_flags)
-         --entry=3DReset_Handler
-         -specs=3Dnano.specs
-         LINKER:-check-sections
--        LINKER:-fatal-warnings
-         LINKER:--gc-sections
-         LINKER:--no-wchar-size-warning
-         ${MEMORY_USAGE_FLAG}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0008-platform-corstone1000-align-capsule-update-structs.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-platform-co=
rstone1000-align-capsule-update-structs.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0008-platform-corstone1000-align-capsule-update-structs.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0004-platform-corstone1000-align-capsule-update-structs.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0005-Platform-corstone1000-add-unique-firmware-GUID.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corsto=
ne1000-add-unique-firmware-GUID.patch
deleted file mode 100644
index e4eba624..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-Platform-corstone1000-add-unique-firmware-GUID.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3004fda909079ebebd62c495a4e49e64d6c8a85f Mon Sep 17 00:00:00 2001
-From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
-Date: Tue, 8 Aug 2023 10:58:01 +0000
-Subject: [PATCH] Platform corstone1000 add unique firmware GUID
-
-Add unique Corstone-1000 firmware GUID
-
-Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/24132/3]
----
- .../target/arm/corstone1000/fw_update_agent/fwu_agent.c   | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index f564f2902c..9c31aeee9d 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -113,10 +113,10 @@ enum fwu_agent_state_t {
- };
-=20
- struct efi_guid full_capsule_image_guid =3D {
--    .time_low =3D 0xe2bb9c06,
--    .time_mid =3D 0x70e9,
--    .time_hi_and_version =3D 0x4b14,
--    .clock_seq_and_node =3D {0x97, 0xa3, 0x5a, 0x79, 0x13, 0x17, 0x6e, =
0x3f}
-+    .time_low =3D 0x989f3a4e,
-+    .time_mid =3D 0x46e0,
-+    .time_hi_and_version =3D 0x4cd0,
-+    .clock_seq_and_node =3D {0x98, 0x77, 0xa2, 0x5c, 0x70, 0xc0, 0x13, =
0x29}
- };
-=20
-=20
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-platform-corstone1000-fix-synchronization-issue-on-o.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-platform-=
corstone1000-fix-synchronization-issue-on-o.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0009-platform-corstone1000-fix-synchronization-issue-on-o.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0005-platform-corstone1000-fix-synchronization-issue-on-o.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-Platform-Corstone1000-Enable-Signed-Capsule.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-Corstone1=
000-Enable-Signed-Capsule.patch
deleted file mode 100644
index f805a44d..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-Corstone1000-Enable-Signed-Capsule.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From fa0988fd876400dc1bb451fffc4b167265b40d25 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Thu, 14 Sep 2023 12:14:28 +0100
-Subject: [PATCH] Platform: Corstone1000: Enable Signed Capsule
-
-Enables signed capsule update and adjusts the necessary structs (fmp_pay=
load_header
-, image_auth, etc.) to comply with the new capsule generation tool (mkef=
icapsule).
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/24131/3]
----
- .../fw_update_agent/uefi_capsule_parser.c     | 25 +++++++++++--------
- .../fw_update_agent/uefi_capsule_parser.h     |  2 ++
- 2 files changed, 17 insertions(+), 10 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.c b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.c
-index b72ff1eb91..c706c040ac 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
-@@ -102,11 +102,9 @@ enum uefi_capsule_error_t uefi_capsule_retrieve_ima=
ges(void* capsule_ptr,
-     }
-=20
-     capsule_header =3D (efi_capsule_header_t*)ptr;
--    ptr +=3D sizeof(efi_capsule_header_t) + sizeof(uint32_t);
-+    ptr +=3D sizeof(efi_capsule_header_t);
-     fmp_capsule_header =3D (efi_firmware_management_capsule_header_t*)p=
tr;
-=20
--    fmp_payload_header =3D fmp_capsule_header + sizeof(*fmp_capsule_hea=
der);
--
-     total_size =3D capsule_header->capsule_image_size;
-     image_count =3D fmp_capsule_header->payload_item_count;
-     images_info->nr_image =3D image_count;
-@@ -119,22 +117,20 @@ enum uefi_capsule_error_t uefi_capsule_retrieve_im=
ages(void* capsule_ptr,
-     }
-=20
-     for (int i =3D 0; i < image_count; i++) {
--
-         image_header =3D (efi_firmware_management_capsule_image_header_=
t*)(ptr +
-                                 fmp_capsule_header->item_offset_list[i]=
);
-=20
-         images_info->size[i] =3D image_header->update_image_size;
--        images_info->version[i] =3D fmp_payload_header->fw_version;
--        FWU_LOG_MSG("%s: image %i version =3D %u\n\r", __func__, i,
--                                images_info->version[i]);
-+
- #ifdef AUTHENTICATED_CAPSULE
-         image_auth =3D (efi_firmware_image_authentication_t*)(
-                         (char*)image_header +
-                         sizeof (efi_firmware_management_capsule_image_h=
eader_t)
-                      );
-         auth_size =3D sizeof(uint64_t) /* monotonic_count */  +
--                    image_auth->auth_info.hdr.dwLength /* WIN_CERTIFICA=
TE + cert_data */ +
--                    sizeof(struct efi_guid) /* cert_type */;
-+                    image_auth->auth_info.hdr.dwLength/* WIN_CERTIFICAT=
E + cert_data + cert_type */;
-+
-+        fmp_payload_header =3D (fmp_payload_header_t*)((char*)image_aut=
h + auth_size);
-=20
-         FWU_LOG_MSG("%s: auth size =3D %u\n\r", __func__, auth_size);
-=20
-@@ -143,16 +139,25 @@ enum uefi_capsule_error_t uefi_capsule_retrieve_im=
ages(void* capsule_ptr,
-         images_info->image[i] =3D (
-                 (char*)image_header +
-                 sizeof(efi_firmware_management_capsule_image_header_t) =
+
--                auth_size);
-+                auth_size +
-+                sizeof(*fmp_payload_header));
- #else
-         images_info->image[i] =3D (
-                 (char*)image_header +
-                 sizeof(efi_firmware_management_capsule_image_header_t) =
+
-                 sizeof(*fmp_payload_header));
-+
-+        fmp_payload_header =3D (fmp_payload_header_t*)((char*)image_hea=
der +
-+                sizeof(efi_firmware_management_capsule_image_header_t))=
;
-+
- #endif
-         memcpy(&images_info->guid[i], &(image_header->update_image_type=
_id),
-                                                         sizeof(struct e=
fi_guid));
-=20
-+        images_info->version[i] =3D fmp_payload_header->fw_version;
-+        FWU_LOG_MSG("%s: image %i version =3D %d\n\r", __func__, i,
-+                                images_info->version[i]);
-+
-         FWU_LOG_MSG("%s: image %d at %p, size=3D%u\n\r", __func__, i,
-                         images_info->image[i], images_info->size[i]);
-=20
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.h b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.h
-index a890a709e9..a31cd8a3a0 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.h
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.h
-@@ -12,6 +12,8 @@
- #include "fip_parser/external/uuid.h"
- #include "flash_layout.h"
-=20
-+#define AUTHENTICATED_CAPSULE 1
-+
- enum uefi_capsule_error_t {
-     UEFI_CAPSULE_PARSER_SUCCESS =3D 0,
-     UEFI_CAPSULE_PARSER_ERROR =3D (-1)
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-Platform-Corstone1000-skip-the-first-nv-counter.patch b/meta-arm-=
bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-Corst=
one1000-skip-the-first-nv-counter.patch
new file mode 100644
index 00000000..4c486e69
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-Corstone1000-skip-the-first-nv-counter.patch
@@ -0,0 +1,33 @@
+From 001e5bea183bc78352ac3ba6283d9d7912bb6ea5 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Wed, 21 Feb 2024 07:44:25 +0000
+Subject: [PATCH] Platform: Corstone1000: skip the first nv counter
+
+It skips doing a sanity check the BL2 nv counter after the capsule
+update since the tfm bl1 does not sync metadata and nv counters in OTP d=
uring
+the boot anymore.
+
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+Upstream-Status: Pending
+
+---
+ .../ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c     | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index 2e6de255b..2e6cf8047 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -1125,7 +1125,7 @@ static enum fwu_agent_error_t update_nv_counters(
+=20
+     FWU_LOG_MSG("%s: enter\n\r", __func__);
+=20
+-    for (int i =3D 0; i <=3D FWU_MAX_NV_COUNTER_INDEX; i++) {
++    for (int i =3D 1; i <=3D FWU_MAX_NV_COUNTER_INDEX; i++) {
+=20
+         switch (i) {
+             case FWU_BL2_NV_COUNTER:
+--=20
+2.25.1
+
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0007-platform-corstone1000-increase-ITS-max-asset-size.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-platform-cor=
stone1000-increase-ITS-max-asset-size.patch
deleted file mode 100644
index 97cd14da..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-platform-corstone1000-increase-ITS-max-asset-size.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From ef97f7083279565dab45a550139935d741f159a9 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Fri, 29 Sep 2023 09:57:19 +0100
-Subject: [PATCH] platform: corstone1000: Increase ITS max asset size
-=E2=80=8B
-Increases the max asset size for ITS to enable parsec services & tests
-=E2=80=8B
-Upstream-Status: Pending
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Signed-off-by: Vikas Katariya <vikas.katariya@arm.com>
----
- platform/ext/target/arm/corstone1000/config_tfm_target.h | 5 +++++
- 1 files changed, 5 insertions(+)
-=E2=80=8B
-diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
-index e968366639..3f6e8477e5 100644
---- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
-+++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
-@@ -24,4 +24,9 @@
- #undef PS_NUM_ASSETS
- #define PS_NUM_ASSETS        20
-
-+/* The maximum size of asset to be stored in the Internal Trusted Stora=
ge area. */
-+#undef ITS_MAX_ASSET_SIZE
-+#define ITS_MAX_ASSET_SIZE        2048
-+
-+
- #endif /* __CONFIG_TFM_TARGET_H__ */
---=20
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-1.8.1-src.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-fi=
rmware-m-1.8.1-src.inc
deleted file mode 100644
index f7e202ad..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.=
1-src.inc
+++ /dev/null
@@ -1,46 +0,0 @@
-# Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
-
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
-
-LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
-                    file://../tf-m-tests/license.rst;md5=3D4481bae2221b0=
cfca76a69fb3411f390 \
-                    file://../mbedtls/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57 \
-                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
-
-SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
M/tf-m-tests.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "git://github.com/ARMmbed/mbedtl=
s.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
-SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dgit/tfm \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dgit/tfm-extras \
-            "
-
-# The required dependencies are documented in tf-m/config/config_default=
.cmake
-# TF-Mv1.8.1
-SRCBRANCH_tfm ?=3D "master"
-SRCREV_tfm =3D "53aa78efef274b9e46e63b429078ae1863609728"
-# TF-Mv1.8.1
-SRCBRANCH_tfm-tests ?=3D "master"
-SRCREV_tfm-tests =3D "1273c5bcd3d8ade60d51524797e0b22b6fd7eea1"
-# mbedtls-3.4.1
-SRCBRANCH_mbedtls ?=3D "master"
-SRCREV_mbedtls =3D "72718dd87e087215ce9155a826ee5a66cfbe9631"
-# mcuboot v1.10.0
-SRCBRANCH_mcuboot ?=3D "main"
-SRCREV_mcuboot =3D "23d28832f02dcdc18687782c6cd8ba99e9b274d2"
-# QCBOR v1.2
-SRCBRANCH_qcbor ?=3D "master"
-SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
-# TF-Mv1.8.1
-SRCBRANCH_tfm-extras ?=3D "master"
-SRCREV_tfm-extras =3D "504ae9a9a50981e9dd4d8accec8261a1dba9e965"
-
-SRCREV_FORMAT =3D "tfm"
-
-S =3D "${WORKDIR}/git/tfm"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 19ad2897..716d3f1c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -9,13 +9,14 @@ TFM_DEBUG =3D "1"
 ## Default is the MPS3 board
 TFM_PLATFORM_IS_FVP ?=3D "FALSE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
-EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DON"
+EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
=20
 # libmetal v2023.04.0
 LICENSE +=3D "& BSD-3-Clause"
 LIC_FILES_CHKSUM +=3D "file://../libmetal/LICENSE.md;md5=3Df4d5df0f12dce=
a1b1a0124219c0dbab4"
 SRC_URI +=3D "git://github.com/OpenAMP/libmetal.git;protocol=3Dhttps;bra=
nch=3Dmain;name=3Dlibmetal;destsuffix=3Dgit/libmetal \
             file://0001-cmake-modify-path-to-libmetal-version-file.patch=
;patchdir=3D../libmetal \
+            file://0002-arm-trusted-firmware-m-disable-address-warnings-=
into.patch \
            "
 SRCREV_libmetal =3D "28fa2351d6a8121ce6c1c2ac5ee43ce08d38dbae"
 EXTRA_OECMAKE +=3D "-DLIBMETAL_SRC_PATH=3D${S}/../libmetal -DLIBMETAL_BI=
N_PATH=3D${B}/libmetal-build"
@@ -32,15 +33,12 @@ EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${S}/../o=
penamp -DLIBOPENAMP_BIN_PATH=3D${
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI:append:corstone1000 =3D " \
-    file://0001-Platform-corstone1000-Increase-BL2-size-in-flash-lay.pat=
ch \
-    file://0002-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch \
-    file://0003-Platform-Corstone1000-Calculate-the-new-CRC32-value-.pat=
ch \
-    file://0004-arm-trusted-firmware-m-disable-fatal-warnings.patch \
-    file://0005-Platform-corstone1000-add-unique-firmware-GUID.patch \
-    file://0006-Platform-Corstone1000-Enable-Signed-Capsule.patch \
-    file://0007-platform-corstone1000-increase-ITS-max-asset-size.patch =
\
-    file://0008-platform-corstone1000-align-capsule-update-structs.patch=
 \
-    file://0009-platform-corstone1000-fix-synchronization-issue-on-o.pat=
ch \
+    file://0001-platform-corstone1000-Update-MPU-configuration.patch \
+    file://0002-platform-corstone1000-Cover-S_DATA-with-MPU.patch \
+    file://0003-Platform-corstone1000-Fix-issues-due-to-adjustment-M.pat=
ch \
+    file://0004-platform-corstone1000-align-capsule-update-structs.patch=
 \
+    file://0005-platform-corstone1000-fix-synchronization-issue-on-o.pat=
ch \
+    file://0006-Platform-Corstone1000-skip-the-first-nv-counter.patch \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
@@ -54,10 +52,10 @@ apply_tfm_patches() {
 do_patch[postfuncs] +=3D "apply_tfm_patches"
=20
 do_install() {
-  install -D -p -m 0644 ${B}/install/outputs/tfm_s_signed.bin ${D}/firmw=
are/tfm_s_signed.bin
-  install -D -p -m 0644 ${B}/install/outputs/bl2_signed.bin ${D}/firmwar=
e/bl2_signed.bin
-  install -D -p -m 0644 ${B}/install/outputs/bl1_1.bin ${D}/firmware/bl1=
_1.bin
-  install -D -p -m 0644 ${B}/install/outputs/bl1_provisioning_bundle.bin=
 ${D}/firmware/bl1_provisioning_bundle.bin
+  install -D -p -m 0644 ${B}/bin/tfm_s_signed.bin ${D}/firmware/tfm_s_si=
gned.bin
+  install -D -p -m 0644 ${B}/bin/bl2_signed.bin ${D}/firmware/bl2_signed=
.bin
+  install -D -p -m 0644 ${B}/bin/bl1_1.bin ${D}/firmware/bl1_1.bin
+  install -D -p -m 0644 ${B}/bin/bl1_provisioning_bundle.bin ${D}/firmwa=
re/bl1_provisioning_bundle.bin
 }
=20
 create_bl1_image(){
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-scripts-native_1.8.1.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/=
trusted-firmware-m-scripts-native_1.8.1.bb
deleted file mode 100644
index d50d886f..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scri=
pts-native_1.8.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m_1.8.1.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmwar=
e-m_1.8.1.bb
deleted file mode 100644
index 3464f49d..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.8.=
1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
diff --git a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in b/meta-a=
rm-bsp/wic/corstone1000-flash-firmware.wks.in
index 88559dee..6919afd0 100644
--- a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
+++ b/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
@@ -17,7 +17,7 @@ part --source empty --size 4k --align 4 --offset 32k --=
part-name=3D"private_metada
=20
 part --source rawcopy --size 100k --sourceparams=3D"file=3Dbl2_signed.bi=
n" --offset 36k --align 4 --part-name=3D"bl2_primary" --uuid 9A3A8FBF-55E=
F-439C-80C9-A3F728033929 --part-type 64BD8ADB-02C0-4819-8688-03AB4CAB0ED9
=20
-part --source rawcopy --size 376k --sourceparams=3D"file=3Dtfm_s_signed.=
bin" --align 4 --part-name=3D"tfm_primary" --uuid 07F9616C-1233-439C-ACBA=
-72D75421BF70 --part-type D763C27F-07F6-4FF0-B2F3-060CB465CD4E
+part --source rawcopy --size 368k --sourceparams=3D"file=3Dtfm_s_signed.=
bin" --align 4 --part-name=3D"tfm_primary" --uuid 07F9616C-1233-439C-ACBA=
-72D75421BF70 --part-type D763C27F-07F6-4FF0-B2F3-060CB465CD4E
=20
 # Rawcopy of the FIP binary
 part --source rawcopy --size 2 --sourceparams=3D"file=3Dsigned_fip-corst=
one1000.bin" --align 4 --part-name=3D"FIP_A" --uuid B9C7AC9D-40FF-4675-95=
6B-EEF4DE9DF1C5 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7
@@ -26,8 +26,8 @@ part --source rawcopy --size 2 --sourceparams=3D"file=3D=
signed_fip-corstone1000.bin"
 part --source rawcopy --size 12 --sourceparams=3D"file=3DImage.gz-initra=
mfs-${MACHINE}.bin" --align 4 --part-name=3D"kernel_primary" --uuid BF7A6=
142-0662-47FD-9434-6A8811980816 --part-type 8197561D-6124-46FC-921E-141CC=
5745B05
=20
=20
-part --source empty --size 100k --offset 16492k --align 4 --part-name=3D=
"bl2_secondary" --uuid 3F0C49A4-48B7-4D1E-AF59-3E4A3CE1BA9F --part-type 6=
4BD8ADB-02C0-4819-8688-03AB4CAB0ED9
-part --source empty --size 376k --align 4 --part-name=3D"tfm_secondary" =
--uuid 009A6A12-64A6-4F0F-9882-57CD79A34A3D --part-type D763C27F-07F6-4FF=
0-B2F3-060CB465CD4E
+part --source empty --size 100k --offset 16488k --align 4 --part-name=3D=
"bl2_secondary" --uuid 3F0C49A4-48B7-4D1E-AF59-3E4A3CE1BA9F --part-type 6=
4BD8ADB-02C0-4819-8688-03AB4CAB0ED9
+part --source empty --size 368k --align 4 --part-name=3D"tfm_secondary" =
--uuid 009A6A12-64A6-4F0F-9882-57CD79A34A3D --part-type D763C27F-07F6-4FF=
0-B2F3-060CB465CD4E
 part --source empty --size 2 --align 4 --part-name=3D"FIP_B" --uuid 9424=
E370-7BC9-43BB-8C23-71EE645E1273 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB=
228FFEA7
 part --source empty --size 12 --align 4 --part-name=3D"kernel_secondary"=
 --uuid A2698A91-F9B1-4629-9188-94E4520808F8 --part-type 8197561D-6124-46=
FC-921E-141CC5745B05
=20
--=20
2.34.1



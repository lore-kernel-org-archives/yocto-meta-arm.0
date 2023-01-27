Return-Path: <gsonvin@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8F7C38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 15:58:01 +0000 (UTC)
Received: from sonic303-2.consmr.mail.bf2.yahoo.com (sonic303-2.consmr.mail.bf2.yahoo.com [74.6.131.41])
 by mx.groups.io with SMTP id smtpd.web11.105624.1674835079253766211
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 07:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=hmULA76Q;
 spf=neutral (domain: yahoo.com, ip: 74.6.131.41, mailfrom: gsonvin@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674835078; bh=/XWd+M3XnqALBIByrwv3FmWi8SLfiyKXTUGWvKAnTpQ=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=hmULA76Q+UX+ZYlsu1tlUnU7d4nO7Fk54XvB6H9BKyP5S4EpWlAgnatA0TLWIY3crIRsiMSK1M1CvTZcU0J6+NsrCwg4wH1BaoK8RDliT5E7Nfq7QGCwLAUPpAD7/5B/PQ/9zQ5OKf+b7YADOIbLDk2icMTVlBK6jk1vIw8EF6/mVTfjg/wEauk6LLztyp6TdzaACRQhlu7/l/+MvzAG9fDUk2i1rJ10VhYcO3kDykp+hJa4uF8xkU07jCXbxfw3DGVFgIe4C9zWu6DE0I/VJDKHKM0wcjNZM06GNk+7SCbGaPLcIibqkpQl94bOTVe3e4K327CPUVtAIgdEnjX9VA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674835078; bh=KaJfII5q2xw6YEl93gk1LcCPJR4oaUnVuIYcjLUfwxb=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=VUPGP9gffebTY65pTr5hi0rai9+vCJ99znuk4Jsscu7bGoG/t7mjxOPq0emQ45ud/RTAx2Watx0v5/WSYcFXfsGw7rKusJb4h/MvNTZBKPcxhOXx7YXTTkeuPQ8arz84V75Y+uhGZgnwO9Dr+raFfx+heEHdtNGh3PxNgAAMaIsRfQubS8IYT70FaH/9cov/WFVfrvjhBjzCNpBxygitgY/UrSV1XKltmHwRGct4a3jwWb2AijsGXrQ6nPuFst0mPl+2jM6p1pTDrwRxeWZPThWNa96qnrng7dwYGC2KsHZ7iNfR7S4XFPyqWMmmsYBqIgRwR7urJbZfVeLn7WKbuA==
X-YMail-OSG: XpU8u3cVM1nchdVI.lXG.un8PKBn7oQqLvBpN8Nw406VTGerOkzMFzWxqQJTd2O
 ZUemBnAwYsP0lilcVNJONb3GlB.HdhoSFxK22ht1w4.tn2H11UJUoVX0Cfc5pmsMk7ItNdeMv297
 wO6Nmr.2zOTJjcPRA2bjpGfzs5FIDVbuvfkV_U1UOgUiVQgdKS0adWnKanyO1MpxJ8t_Kv09ESFt
 womtiNCoDKnm0Fz8UeL0yi2dGDKfypTgBvuXyxEoDTKtqSGBphPn0l0IgHOkUW2aiMBWgAAueF_S
 J93SeJGvyLJwEHiWOEVfPhmRDBsavH28lFF2f9GZZnYe9HrWrNTDcciJbbVE60pZdbLdGwPu1CPh
 juWWHM4xSfZrLxxaHYuyPnJIwitUiNHn4z3xrwG5bVg606_zTWYpySt71lyO795GmwUOIwW.38NQ
 5_ekNI2emErg2skQvhIxJlSxMNWIT47jcg9kUAXiSaL5t0j3nBSEPQdWJhjBE2XDTDMjoM8lgebL
 xfLuWFugXFHn8sz5jy2vhcWmCSnevIUV_406IxMh87X.UxCKif9Ctscx7KdgSrH_pYyNdY0_PDAR
 mpDIcRUB0M4x9KLCEVtk4MJyoreoa9PHqTvxWzpKQ_Sfm1i5.lMjvBoDzSfJBqn.CvnIOk7hpTBY
 DqhGpghlU8t9PWEv.Z4wBfpNHKAvxBzlZBWdJiFBimoBLP.5DpqKOw9oce_W4w9bZ.kmDj.xUjd1
 .5rFK_.vAd91beRzNSWgv8F6kdTQ7krU7tjXYTDs1PN_FZl9YoDCb6PvIZ49_8bLIJOEre11NJh4
 S2d49mxlzL._I4tBGo_2ZMPxVUky5e9nnRkLcWQqEXIzUnXGu_ul_X1SAYi_zXB7a1VGcP_MwGX7
 RNJJ2imV8XHgxWP.0TKCSe_bkI4HxaM5S.9tHd1TmDNrOpDByGHDgdKi8g5nTxqn9FBNuLcr9zhp
 KoKDOmIbEbnyFTrl_WIGeuiZ2mLXH_8cofD0.F4LiDLJvo5t1X8iHA7m9M9rzqsPKdjz5pJTHPim
 oTWed1tJ0GKAbJHFUip5TUUExDGNHwIz13x_aFmBjwpaamtXHp_ZCewo6yMa3DzW._8dpCGtZPHk
 RllmaTt4W1RnBYIuDWckR22HD7lPVVAPriZpEyWPtdTzDmcCONXG_1fwctv0s1xJ9zYg8L9HquuQ
 kvywo.BKpiDeSHI7zj8OuAyByBXfCLgj_lyV6InTl.qKMXV9cbC3sHpxZPmSakB_oAqNGd4narb_
 vS4E3JhF7F2E_yPebvMQergW_abp6hn.j4E_I22aijpP0yxBU6BxrlDwkJCxw86Rslhfovlw_N8A
 p7ZIv65iWAAmuj.gULOt5qdc4Oel3zI6rpA6UB3V_w0XmQCQeO8gb1dpWe_nV3q3lFgo4p9hR1O5
 Em3w7zWocrWsM.MCtZtl.1AGosQVKX3No2ZZ6w7w5L7NNe6r5pONTwxys7z0JZiD9J6vFJWnEeIP
 0yVB367Izr96jVRYJXqn7hC9xriGn3sNqSBrlm5skxea9.qwlr4GQ1CYJ_UYwbokKP.ZOTnnyblK
 ckjInXuYwejUueC2hFMgC_38EVuJBu0JVTeX4VZ7erEFeBLI5QzdR3iTD8GfZV_vbLxfn2jWBwVo
 uLzdjDLqnwHEk.YuLShwL4IZhROfZo5KbhU.DMujVtnR62BLOGJyVYnf7WKJV4iFtwdLvDD3bJzE
 xfezjIgw.ClXWNAZ1N3EL7jvJ02lVA5307pL8Kuu3EqMBGj7_KxXs6NkLKGSsF12E3OEavD5x5zv
 SYUyVgFh_4GsoHBtYsjI5QS8pWJM9GJfg6hzwYTK7tcWqO6Njvet1vAsasrT1QC.uj23KWm1BIsp
 PtJdvDwCigl8DvjZfxljr6YhSSKLQeTvhAmpWaYY5fdP5h44K2vHALdI54PunLS.kIBXuwu7a5I6
 KBDsrJOcBqP.OiHlSzsE_PCcb.udrOUK1AWmpSDOfKqaVK.WV28gNl8JiGTCUk3jTs1yPQOUnM1p
 zSkOtWb6F9GWHmlwZJKAx6gzYN78e2_4L574bwSwZNsMDgiphImM5u40hoQ3l830EACRFSt8BRnA
 dIp0JK0wzXCXXKVGEo_7Yy3mPulTg.E2KxoP2B1dGYEyjywqkJDhL6jConGmAKuehbmfVBgWfGNx
 To226DNKi4NeGwh4y3899wxCvKXGxNDMKBQuqJ9eNG37mAwfBX20e7pcXEtz8VkjyAxRQ3yJDzL8
 PmKnYqOzgw1xFV.g6QoekDA--
X-Sonic-MF: <gsonvin@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.bf2.yahoo.com with HTTP; Fri, 27 Jan 2023 15:57:58 +0000
Date: Fri, 27 Jan 2023 15:57:57 +0000 (UTC)
From: Amy Smith <gsonvin@yahoo.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Message-ID: <792563674.226679.1674835077915@mail.yahoo.com>
Subject: yocto multilib: 32-bit libraries support
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_226678_1812018216.1674835077914"
References: <792563674.226679.1674835077915.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.21123 YMailNorrin
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 15:58:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4326

------=_Part_226678_1812018216.1674835077914
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,I'm trying to build 32-bit libraries to support both 32-bit and 64-bit u=
ser application on 64-bit aarch64 target. I have modified the conf/local.co=
nf as below. bitbake fails at rootfs (described below). Any help would be r=
eally appreciated in figuring out the issue.
Thanks,Amay
from file: conf/local.conf ----
require conf/multilib.confMULTILIBS =3D "multilib:lib32"DEFAULTTUNE_virtcla=
ss-multilib-lib32 =3D "armv7a"IMAGE_INSTALL_append +=3D " lib32-bash lib32-=
glibc lib32-libgcc lib32-libstdc++"


After issuing bitbake command, I get error below. I can see all lib32 libra=
ries were built in tmp/work/Install=C2=A0 524 PackagesTotal size: 335 MInst=
alled size: 1.4 GDownloading Packages:Running transaction checkTransaction =
check succeeded.Running transaction testError: Transaction test error:=C2=
=A0=C2=A0file /sbin/ldconfig conflicts between attempted installs of lib32-=
ldconfig-2.33-r0.armv7a and ldconfig-2.33-r0.armv8_2a=C2=A0=C2=A0file /lib/=
ld-linux-aarch64.so.1 conflicts between attempted installs of libc6-2.33-r0=
.armv8_2a and lib32-libc6-2.33-r0.armv7a=C2=A0 file /bin/bash.bash conflict=
s between attempted installs of lib32-bash-5.1-r0.armv7a and bash-5.1-r0.ar=
mv8_2a
ERROR: Logfile of failure stored in: xxxxx/xxxxxx/temp/log.do_rootfs.326255=
1ERROR: Task (xxxxxxx/xxxxx/:do_rootfs) failed with exit code '1'
------=_Part_226678_1812018216.1674835077914
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div><div>=
<div dir=3D"ltr">Hi,</div><div dir=3D"ltr">I'm trying to build 32-bit libra=
ries to support both 32-bit and 64-bit user application on 64-bit aarch64 t=
arget. I have modified the conf/local.conf as below. bitbake fails at rootf=
s (described below). Any help would be really appreciated in figuring out t=
he issue.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Thanks,</div><di=
v dir=3D"ltr">Amay</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><b>from=
 file: conf/local.conf ----</b></div><div dir=3D"ltr"><div><div><br></div><=
div><b>require conf/multilib.conf</b></div><div><b>MULTILIBS =3D "multilib:=
lib32"</b></div><div><b>DEFAULTTUNE_virtclass-multilib-lib32 =3D "armv7a"</=
b></div><div><b>IMAGE_INSTALL_append +=3D " lib32-bash lib32-glibc lib32-li=
bgcc lib32-libstdc++"</b></div></div><div><b><br></b></div><div><b><br></b>=
</div><br></div><div dir=3D"ltr"><b>After issuing bitbake command, I get er=
ror below. I can see all lib32 libraries were built in tmp/work/</b></div><=
div dir=3D"ltr"><div>Install&nbsp; 524 Packages</div><div>Total size: 335 M=
</div><div>Installed size: 1.4 G</div><div>Downloading Packages:</div><div>=
Running transaction check</div><div>Transaction check succeeded.</div><div>=
Running transaction test</div><div>Error: Transaction test error:</div><div=
>&nbsp;&nbsp;<font color=3D"#cd232c"><b>file /sbin/ldconfig conflicts betwe=
en attempted installs of lib32-ldconfig-2.33-r0.armv7a and ldconfig-2.33-r0=
.armv8_2a</b></font></div><div>&nbsp;<font color=3D"#cd232c"><b>&nbsp;file =
/lib/ld-linux-aarch64.so.1 conflicts between attempted installs of libc6-2.=
33-r0.armv8_2a and lib32-libc6-2.33-r0.armv7a</b></font></div><div><font co=
lor=3D"#cd232c"><b>&nbsp; file /bin/bash.bash conflicts between attempted i=
nstalls of lib32-bash-5.1-r0.armv7a and bash-5.1-r0.armv8_2a</b></font></di=
v><div><font color=3D"#cd232c"><b><br></b></font></div><div dir=3D"ltr"><fo=
nt color=3D"#cd232c"><b><div>ERROR: Logfile of failure stored in: xxxxx/xxx=
xxx/temp/log.do_rootfs.3262551</div><div dir=3D"ltr" data-setdir=3D"false">=
ERROR: Task (xxxxxxx/xxxxx/:do_rootfs) failed with exit code '1'</div></b><=
/font></div></div></div></div></div></body></html>
------=_Part_226678_1812018216.1674835077914--


Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web12.4599.1586417714590483952
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Apr 2020 00:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kQAxaCPG;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id g6so5179659ybh.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Apr 2020 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SDs7LRIwZ4P4+mQuc/+oiqS1p3rHyrj8JFthErCWgH0=;
        b=kQAxaCPGPwO31tHhZLrBafxePFbvf+cHMCycTj5V9G8LovKhOaeoyrbPnryVSYc+A5
         MpQZvQqIdOpWY6ufJVoHyBZlHl5iCoIyLqemx6PYN3EVyiSUrkNbPH2tfE/pO3l5LR4Y
         rrLMyUe9FFVe7/vmBS4e+urEOqwQxB2JKKQ3mWyBX4zmz6E4CduFc+22c9cIUcHqCE7e
         9fWre7M0FyrR2ty4sWOFvHUlBLLLBgD6lskRDlATtzsviRkR6yunZTaXTREILaLcn9fa
         N10BQXh4yP4U7LQQd9IKouFaYkdaJ9TxsH3kqIpmYmTJ4EENrCZu2q97PR4J9YtW+XdH
         x/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SDs7LRIwZ4P4+mQuc/+oiqS1p3rHyrj8JFthErCWgH0=;
        b=gtQloL1+xrVqGIz3wgacbuKjVRiHIz2+2zl7bAkcbHZz7M5B2OOYKra9F1vaq0Bzmm
         fO2/ZT9ECX3BHRt0pjLV7ba6ExyqI6j4GBqLFAHFbC4uWo/eg+Xla5e1PmFf4ZuqfCXC
         5FOc6PfEG3qVrVQnFBeNc8UGfLx+U35Rv18X675vI3mmnN9fuTcPRK4RZT5SDJB+6+CO
         Ql8gU12sNl0VoJ8jxFnW2zxHGVW8Cl1EWtrdHWMT2kPUg2ECCiF82/z8mW9UiYz8+cvs
         QGw1qw1spzH9JdhXQdu51pU3Fmc5yAq93qsAPDPp2zq4A0Oc6af2BRw8bzB+PSHLWfpw
         fqlQ==
X-Gm-Message-State: AGi0Puaxi6WzVlupbs1ubaasqx+0v47nO4Ql/xIQcPYrQpilGgMuxpNr
	JzcTzZ+xHVucjn81lgxTfP9Yvi/yJfJy//kPgN6DkA==
X-Google-Smtp-Source: APiQypI9Cc5tfzZHrNvpLZiYPhujCwVJ8ZZjPJqDOEnzjKQnMdDTMJdIDeizSE0pc/y5HtDx8a+06LA83jVShDDzzXE=
X-Received: by 2002:a25:21c6:: with SMTP id h189mr18196554ybh.133.1586417713578;
 Thu, 09 Apr 2020 00:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <1586413772-31763-1-git-send-email-sumit.garg@linaro.org>
 <AM0PR08MB3987BA60B6716249954D79A592C10@AM0PR08MB3987.eurprd08.prod.outlook.com>
 <CAFA6WYP1u0qGV4HR+a9-cLa+6B=BZamGqJBOTMFt+Xv6ENdHag@mail.gmail.com>
In-Reply-To: <CAFA6WYP1u0qGV4HR+a9-cLa+6B=BZamGqJBOTMFt+Xv6ENdHag@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 9 Apr 2020 09:35:02 +0200
Message-ID: <CAP71Wjy_=WWJ24SUwaXK7akOt5P7knVZ2+MnSUjmHb77R0oVbQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar ball insted of svn
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Jon Mason <Jon.Mason@arm.com>, 
	"riku.voipio@linaro.org" <riku.voipio@linaro.org>, "denis@denix.org" <denis@denix.org>, 
	"daniel.thompson@linaro.org" <daniel.thompson@linaro.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="00000000000048a0db05a2d6a8aa"

--00000000000048a0db05a2d6a8aa
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 9, 2020 at 9:20 AM Sumit Garg <sumit.garg@linaro.org> wrote:

> On Thu, 9 Apr 2020 at 12:36, Diego Sueiro <Diego.Sueiro@arm.com> wrote:
> >
> > > -----Original Message-----
> > > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org
> >
> > > On Behalf Of Sumit Garg via lists.yoctoproject.org
> > > Sent: 09 April 2020 07:30
> > > To: meta-arm@lists.yoctoproject.org
> > > Cc: Jon Mason <Jon.Mason@arm.com>; nicolas.dechesne@linaro.org;
> > > riku.voipio@linaro.org; denis@denix.org; daniel.thompson@linaro.org;
> > > Sumit Garg <sumit.garg@linaro.org>
> > > Subject: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar
> ball
> > > insted of svn
> > >
> > > GCC 9.2 source fetch from svn is quite slow as compared to source tar
> ball.
> > > So switch to fetch GCC 9.2 source tar ball instead.
> > >
> > > Reported-by: Riku Voipio <riku.voipio@linaro.org>
> > > Suggested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc | 9 ++++-----
> > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> b/meta-
> > > arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > > index 366a070..08e8f7f 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > > @@ -27,10 +27,7 @@ LIC_FILES_CHKSUM = "\
> > >      file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \  "
> > >
> > > -#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> > > -#RELEASE ?= "5a5ca2d"
> > > -#BASEURI ?= "https://repo.or.cz/official-
> > > gcc.git/snapshot/${RELEASE}.tar.gz;downloadfilename=gcc-
> > > ${RELEASE}.tar.gz"
> > > -BASEURI ?=
> > > "svn://gcc.gnu.org/svn/gcc/branches/ARM;rev=277439;module=arm-9-
> > > branch"
> > > +BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-
> > > a/9.2-2019.12/srcrel/gcc-arm-src-snapshot-9.2-2019.12.tar.xz"
> >
> > Any specific reason for having a softer assignment here? Are we expecting
> > the user to customize this variable?
>
> This trend has been followed on from OE-core gcc recipes. AFAIK, this
> will be useful in case the source package is hosted somewhere else
> like local storage etc. User can simply override this variable via
> ".bbapend".
>

this is correct. The whole point of having BASEURI in the first place is to
all a 'user' to override it. Otherwise the link would be added to SRC_URI
directly.


>
> -Sumit
>
> >
> > >  SRC_URI = "\
> > >             ${BASEURI} \
> > >             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \ @@
> -71,7
> > > +68,9 @@ SRC_URI = "\
> > >             file://0036-Re-introduce-spe-commandline-options.patch \
> > >
>  file://0037-Fix-up-libsanitizer-build-with-master-glibc.patch \  "
> > > -S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/arm-9-branch"
> > > +SRC_URI[md5sum] = "9c570fc4286825b4e6f67b3d34aade23"
> > > +
> > > +S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-9.2-
> > > 2019.12"
> > >
> > >  # For dev release snapshotting
> > >  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
> > > --
> > > 2.7.4
> >
>

--00000000000048a0db05a2d6a8aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 9, 2020 at 9:20 AM Sumit =
Garg &lt;<a href=3D"mailto:sumit.garg@linaro.org">sumit.garg@linaro.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
hu, 9 Apr 2020 at 12:36, Diego Sueiro &lt;<a href=3D"mailto:Diego.Sueiro@ar=
m.com" target=3D"_blank">Diego.Sueiro@arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:meta-arm@lists.yoctoproject.org" target=
=3D"_blank">meta-arm@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:meta-=
arm@lists.yoctoproject.org" target=3D"_blank">meta-arm@lists.yoctoproject.o=
rg</a>&gt;<br>
&gt; &gt; On Behalf Of Sumit Garg via <a href=3D"http://lists.yoctoproject.=
org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a><br>
&gt; &gt; Sent: 09 April 2020 07:30<br>
&gt; &gt; To: <a href=3D"mailto:meta-arm@lists.yoctoproject.org" target=3D"=
_blank">meta-arm@lists.yoctoproject.org</a><br>
&gt; &gt; Cc: Jon Mason &lt;<a href=3D"mailto:Jon.Mason@arm.com" target=3D"=
_blank">Jon.Mason@arm.com</a>&gt;; <a href=3D"mailto:nicolas.dechesne@linar=
o.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>;<br>
&gt; &gt; <a href=3D"mailto:riku.voipio@linaro.org" target=3D"_blank">riku.=
voipio@linaro.org</a>; <a href=3D"mailto:denis@denix.org" target=3D"_blank"=
>denis@denix.org</a>; <a href=3D"mailto:daniel.thompson@linaro.org" target=
=3D"_blank">daniel.thompson@linaro.org</a>;<br>
&gt; &gt; Sumit Garg &lt;<a href=3D"mailto:sumit.garg@linaro.org" target=3D=
"_blank">sumit.garg@linaro.org</a>&gt;<br>
&gt; &gt; Subject: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 sourc=
e tar ball<br>
&gt; &gt; insted of svn<br>
&gt; &gt;<br>
&gt; &gt; GCC 9.2 source fetch from svn is quite slow as compared to source=
 tar ball.<br>
&gt; &gt; So switch to fetch GCC 9.2 source tar ball instead.<br>
&gt; &gt;<br>
&gt; &gt; Reported-by: Riku Voipio &lt;<a href=3D"mailto:riku.voipio@linaro=
.org" target=3D"_blank">riku.voipio@linaro.org</a>&gt;<br>
&gt; &gt; Suggested-by: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dech=
esne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;<br>
&gt; &gt; Signed-off-by: Sumit Garg &lt;<a href=3D"mailto:sumit.garg@linaro=
.org" target=3D"_blank">sumit.garg@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc | 9=
 ++++-----<br>
&gt; &gt;=C2=A0 1 file changed, 4 insertions(+), 5 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.=
inc b/meta-<br>
&gt; &gt; arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc<br>
&gt; &gt; index 366a070..08e8f7f 100644<br>
&gt; &gt; --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc<br>
&gt; &gt; +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc<br>
&gt; &gt; @@ -27,10 +27,7 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 file://COPYING.RUNTIME;md5=3Dfe60d87048567d4f=
e8c8a0ed2448bcc8 \=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt; -#BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz=
&quot;<br>
&gt; &gt; -#RELEASE ?=3D &quot;5a5ca2d&quot;<br>
&gt; &gt; -#BASEURI ?=3D &quot;<a href=3D"https://repo.or.cz/official-" rel=
=3D"noreferrer" target=3D"_blank">https://repo.or.cz/official-</a><br>
&gt; &gt; gcc.git/snapshot/${RELEASE}.tar.gz;downloadfilename=3Dgcc-<br>
&gt; &gt; ${RELEASE}.tar.gz&quot;<br>
&gt; &gt; -BASEURI ?=3D<br>
&gt; &gt; &quot;svn://<a href=3D"http://gcc.gnu.org/svn/gcc/branches/ARM;re=
v=3D277439;module=3Darm-9-" rel=3D"noreferrer" target=3D"_blank">gcc.gnu.or=
g/svn/gcc/branches/ARM;rev=3D277439;module=3Darm-9-</a><br>
&gt; &gt; branch&quot;<br>
&gt; &gt; +BASEURI ?=3D &quot;<a href=3D"https://developer.arm.com/-/media/=
Files/downloads/gnu-" rel=3D"noreferrer" target=3D"_blank">https://develope=
r.arm.com/-/media/Files/downloads/gnu-</a><br>
&gt; &gt; a/9.2-2019.12/srcrel/gcc-arm-src-snapshot-9.2-2019.12.tar.xz&quot=
;<br>
&gt;<br>
&gt; Any specific reason for having a softer assignment here? Are we expect=
ing<br>
&gt; the user to customize this variable?<br>
<br>
This trend has been followed on from OE-core gcc recipes. AFAIK, this<br>
will be useful in case the source package is hosted somewhere else<br>
like local storage etc. User can simply override this variable via<br>
&quot;.bbapend&quot;.<br></blockquote><div><br></div><div>this is correct. =
The whole point of having BASEURI in the first place is to all a &#39;user&=
#39; to override it. Otherwise the link would be added to SRC_URI directly.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-Sumit<br>
<br>
&gt;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${BASEURI} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gcc-4.=
3.1-ARCH_FLAGS_FOR_TARGET.patch \ @@ -71,7<br>
&gt; &gt; +68,9 @@ SRC_URI =3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0036-Re-int=
roduce-spe-commandline-options.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0037-Fix-up=
-libsanitizer-build-with-master-glibc.patch \=C2=A0 &quot;<br>
&gt; &gt; -S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/arm-9-branch&q=
uot;<br>
&gt; &gt; +SRC_URI[md5sum] =3D &quot;9c570fc4286825b4e6f67b3d34aade23&quot;=
<br>
&gt; &gt; +<br>
&gt; &gt; +S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-sn=
apshot-9.2-<br>
&gt; &gt; 2019.12&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # For dev release snapshotting<br>
&gt; &gt;=C2=A0 #S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/official=
-gcc-${RELEASE}&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.7.4<br>
&gt;<br>
</blockquote></div></div>

--00000000000048a0db05a2d6a8aa--

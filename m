Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.2102.1624822247244419279
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 27 Jun 2021 12:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kOQpM4oK;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id p7so4984987qvn.5
        for <meta-arm@lists.yoctoproject.org>; Sun, 27 Jun 2021 12:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=820vEThusW4SyGjs9ZI5BUlXv/kEpAGBNDATvA+boWQ=;
        b=kOQpM4oK45KQK0jHiLJC5baFt9LaqHc1ob0ac2bXkeNpZq43XUXNyu9t17I0ocoJMI
         g926OH4CzZpKkF/qEUtsTXEVXt21Cl0r9vQSLdQhRfkHKqaTCQGliUDJSyKkuMtm8KkG
         oP8dxLgizu7336eQ4dEo4J2fYL284xqgvvNcg1M56gYq/kKFZLTFOrPV+RJD4A+tT+tq
         tIJ3p/wLE7Z3R4vvKNBYLGpOgfO2MOYAu6diNW7tm7wf/RIuV8nceV+r/CS/Ckc3RCnt
         mor3UzKQqZ5/GMujKkFlZx8Kgtvn93oOfFnqnHXoaKnzPY/e6P8iI5Knu8QkbsTZDN+H
         Y9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=820vEThusW4SyGjs9ZI5BUlXv/kEpAGBNDATvA+boWQ=;
        b=XkTi8B6WPuXOGBZH1ha7ZcqzmJURJvbBQdD3KJcz6Erz+pSRlbsyfWIrgu6BDBgOch
         5ySBrcQZZocQrHXbrW/l1CodAAK4mnEjwD9ZWZik5X2MOlnGGogMPK6hahX6lUAzGQoH
         scOTe3331HzFRb45K4EvdDqXdQQhF9Y1u0TNVNd0OklPWtIDfpBQQhrL5riisA6riVR7
         dhykZUpEV/z9j4WQVt5pP/ICpA/PolAjcOtz3WmJLJ6G98NZpeMp9EEG7FG32vZF4UeB
         ckJjz489EOsvRIS+oyoyaLZx5R+n2aA8SCmKmq8RaDLInQyk5tdOciTpbAWoBgPaXbwI
         UJYw==
X-Gm-Message-State: AOAM530vO3MRjEvvRqTHoEJBC8sB6hxcCDkTjLGMJznwcbIhrW50nNkI
	Uz8hTElmrOhqDh+yqyfeNGIq7vckE2aslr3M9DQ=
X-Google-Smtp-Source: ABdhPJxdRwO+8jFKec1TIuSPxQdGZDEBjIEX+cpF1QVFj4A649nx7Gi6v7X9/IRoYHwZWIs7pPkzhL/Kv7W1zGlREaQ=
X-Received: by 2002:ad4:58d1:: with SMTP id dh17mr18018036qvb.16.1624822246108;
 Sun, 27 Jun 2021 12:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210626212806.1956740-1-raj.khem@gmail.com> <20210627190850.GV1528@denix.org>
In-Reply-To: <20210627190850.GV1528@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 27 Jun 2021 12:30:35 -0700
Message-ID: <CAMKF1sp9RoA3MvNz2HHwHgFe9ubTxipmR5F8OXKK-_5rARD0fw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gator-daemon: Do not specify header files in GATORD_CXX_SRC_FILES
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jon.mason@arm.com>, Ross Burton <ross.burton@arm.com>, 
	meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000cd70a805c5c4685f"

--000000000000cd70a805c5c4685f
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 27, 2021 at 12:08 PM Denys Dmytriyenko <denis@denix.org> wrote:

> On Sat, Jun 26, 2021 at 02:28:06PM -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Jon Mason <jon.mason@arm.com>
> > Cc: Ross Burton <ross.burton@arm.com>
> > ---
> >  ...e-xml-PmuXMLParser.h-header-from-GAT.patch | 31 +++++++++++++++++++
> >  .../gator-daemon/gator-daemon_7.7.0.bb        |  4 ++-
> >  2 files changed, 34 insertions(+), 1 deletion(-)
> >  create mode 100644
> meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
> >
> > diff --git
> a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
> b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
> > new file mode 100644
> > index 0000000..fc39f4e
> > --- /dev/null
> > +++
> b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
> > @@ -0,0 +1,31 @@
> > +From 6f62c77f0a51de17b7f81f225ef483ed8214640e Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sat, 26 Jun 2021 14:19:10 -0700
> > +Subject: [PATCH] Sources.mk: Remove xml/PmuXMLParser.h header from
> > + GATORD_CXX_SRC_FILES
> > +
> > +This otherwise appears in final linker cmdline and clang is not happy
> > +since it sees this as an output file along with the real output file
> > +specified with -o and bails out
> > +
> > +| clang-13: error: cannot specify -o when generating multiple output
> files
> > +
>
> Upstream-Status?


Pending


>
>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + daemon/Sources.mk | 3 +--
> > + 1 file changed, 1 insertion(+), 2 deletions(-)
> > +
> > +diff --git a/daemon/Sources.mk b/daemon/Sources.mk
> > +index 60d15ef..3e679f5 100644
> > +--- a/daemon/Sources.mk
> > ++++ b/daemon/Sources.mk
> > +@@ -147,5 +147,4 @@ GATORD_CXX_SRC_FILES := \
> > +     xml/EventsXMLProcessor.cpp \
> > +     xml/MxmlUtils.cpp \
> > +     xml/PmuXML.cpp \
> > +-    xml/PmuXMLParser.cpp \
> > +-    xml/PmuXMLParser.h
> > ++    xml/PmuXMLParser.cpp
> > +--
> > +2.32.0
> > +
> > diff --git a/meta-arm/recipes-devtools/gator-daemon/
> gator-daemon_7.7.0.bb b/meta-arm/recipes-devtools/gator-daemon/
> gator-daemon_7.7.0.bb
> > index 61b1731..b3ba437 100644
> > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> > +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> > @@ -16,7 +16,9 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >                     "
> >
> >  SRCREV = "9d8d75fa08352470c51abc23fe3b314879bd8b78"
> > -SRC_URI = "git://
> github.com/ARM-software/gator.git;protocol=http;branch=main"
> > +SRC_URI = "git://
> github.com/ARM-software/gator.git;protocol=http;branch=main \
> > +
>  file://0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch;striplevel=2
> \
> > +          "
> >
> >  S = "${WORKDIR}/git/daemon"
> >
> > --
> > 2.32.0
> >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>

--000000000000cd70a805c5c4685f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jun 27, 2021 at 12:08 PM Denys Dmytriyenko &lt;<a h=
ref=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">On Sat, Jun 26, 2021 at 02:28:06PM -0700, Khem R=
aj wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Jon Mason &lt;<a href=3D"mailto:jon.mason@arm.com" target=3D"_blan=
k">jon.mason@arm.com</a>&gt;<br>
&gt; Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_=
blank">ross.burton@arm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...e-xml-PmuXMLParser.h-header-from-GAT.patch | 31 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../gator-daemon/<a href=3D"http://gator-daemon_7.7.0.bb" rel=3D=
"noreferrer" target=3D"_blank">gator-daemon_7.7.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 4 ++-<br>
&gt;=C2=A0 2 files changed, 34 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-=
daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch<br>
&gt; <br>
&gt; diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-=
Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch b/meta-arm/recip=
es-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLPars=
er.h-header-from-GAT.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..fc39f4e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources=
.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch<br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +From 6f62c77f0a51de17b7f81f225ef483ed8214640e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Sat, 26 Jun 2021 14:19:10 -0700<br>
&gt; +Subject: [PATCH] Sources.mk: Remove xml/PmuXMLParser.h header from<br=
>
&gt; + GATORD_CXX_SRC_FILES<br>
&gt; +<br>
&gt; +This otherwise appears in final linker cmdline and clang is not happy=
<br>
&gt; +since it sees this as an output file along with the real output file<=
br>
&gt; +specified with -o and bails out<br>
&gt; +<br>
&gt; +| clang-13: error: cannot specify -o when generating multiple output =
files<br>
&gt; +<br>
<br>
Upstream-Status?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">=
Pending=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x" dir=3D"auto"><br>
<br>
<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + daemon/Sources.mk | 3 +--<br>
&gt; + 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/daemon/Sources.mk b/daemon/Sources.mk<br>
&gt; +index 60d15ef..3e679f5 100644<br>
&gt; +--- a/daemon/Sources.mk<br>
&gt; ++++ b/daemon/Sources.mk<br>
&gt; +@@ -147,5 +147,4 @@ GATORD_CXX_SRC_FILES :=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xml/EventsXMLProcessor.cpp \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xml/MxmlUtils.cpp \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xml/PmuXML.cpp \<br>
&gt; +-=C2=A0 =C2=A0 xml/PmuXMLParser.cpp \<br>
&gt; +-=C2=A0 =C2=A0 xml/PmuXMLParser.h<br>
&gt; ++=C2=A0 =C2=A0 xml/PmuXMLParser.cpp<br>
&gt; +-- <br>
&gt; +2.32.0<br>
&gt; +<br>
&gt; diff --git a/meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://=
gator-daemon_7.7.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.=
7.0.bb</a> b/meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://gator=
-daemon_7.7.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.7.0.b=
b</a><br>
&gt; index 61b1731..b3ba437 100644<br>
&gt; --- a/meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://gator-d=
aemon_7.7.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.7.0.bb<=
/a><br>
&gt; +++ b/meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://gator-d=
aemon_7.7.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.7.0.bb<=
/a><br>
&gt; @@ -16,7 +16,9 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234=
ee4d69f5fce4486a80fdaf4a4263 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRCREV =3D &quot;9d8d75fa08352470c51abc23fe3b314879bd8b78&quot;<=
br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/ARM-software/gat=
or.git;protocol=3Dhttp;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">=
github.com/ARM-software/gator.git;protocol=3Dhttp;branch=3Dmain</a>&quot;<b=
r>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/ARM-software/gat=
or.git;protocol=3Dhttp;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">=
github.com/ARM-software/gator.git;protocol=3Dhttp;branch=3Dmain</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Sources.mk-Remov=
e-xml-PmuXMLParser.h-header-from-GAT.patch;striplevel=3D2 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git/daemon&quot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.32.0<br>
&gt; <br>
<br>
-- <br>
Regards,<br>
Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">=
denis@denix.org</a>&gt;<br>
PGP: 0x420902729A92C964 - <a href=3D"https://denix.org/0x420902729A92C964" =
rel=3D"noreferrer" target=3D"_blank">https://denix.org/0x420902729A92C964</=
a><br>
Fingerprint: 25FC E4A5 8A72 2F69 1186=C2=A0 6D76 4209 0272 9A92 C964<br>
</blockquote></div></div>

--000000000000cd70a805c5c4685f--

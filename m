Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.12218.1586534769536356529
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Apr 2020 09:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xne3hOd2;
 spf=pass (domain: linaro.org, ip: 209.85.219.169, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f169.google.com with SMTP id n188so867243ybc.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Apr 2020 09:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=GlI2tj1TX37Eqf3H2i6eb5VtUmc9gDkzzXZVbUfncxs=;
        b=xne3hOd2EX4wdAZii0uBwN2tuV8c2eiIrDGBjzxpXP5M+LRzEypfBvVDgVnYlZhIzd
         C5Ose387eO+MVA53PmjVpFXJcjPHMd5ze2B25cZ5kvzLWj+Nq+XX39c63Hsd8pOaA74J
         UrMC0S9pAKj7jm0fUSGgsWyfIj9rRP/Bs1Oh+Fxo4KjD7+okukYvK14bg94mpQFsW2hQ
         ebPpvHIdx26CU7Vr5jtGamrLlECw8QkicujrVcTksvBfUSUTMxGiGS+3L7VAD3WFSepN
         xeje2KsYVZCVZ+G+C5g0J3Jj41G0scDJ4vBEFEoD7MnLDL68Jvhb0fb+4m8Y8cJNa8JP
         WlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=GlI2tj1TX37Eqf3H2i6eb5VtUmc9gDkzzXZVbUfncxs=;
        b=ntTEk+xP1PZDVfY43JdCHFhrz8w/5yHNL1pDiyiv28HOEelryldNgoq8WOpz5eLeHq
         mDiq418BN+ChZwRr2DoibEOWZJur74S2ggz4rVz15htWsY/9V7wV51cOHqGAvN3FLFvc
         O4lt8QVDFn85fksdr8sWEfxtAxhdNkiBcTXX2KBCqlP9DzRPk1kv8GaewQlbXHxdBz69
         FPqi5qJMTBA77Vdt4BIxcijrdX8mmhwqeaF/7lJsDY0sGrSOywNAh5FzHapA1OXE9+VH
         ef7uds6+x9IgR9oJMvJQZA+syahSGqz9OToQNFnseyGsEQ9grQBlG9twplcRHVp6+6ZI
         1HHg==
X-Gm-Message-State: AGi0PuYRlndFlMOmS/lAtPvwy143VUW3oSN5yJOr9UIAepjVbd7GsgBj
	+JktuN5IqMWuXWIzcxfmVueSnOnA+geXtsJMEPX2Qg==
X-Google-Smtp-Source: APiQypJOEcfNkUN7/Og7r4gW0lWhHbC+VCF4zcYTEMD9CJW5jiBb7pyOLMFgVooDchEio6ElPZq12jJHmPZlcDkivFw=
X-Received: by 2002:a25:ccc3:: with SMTP id l186mr8074504ybf.454.1586534768573;
 Fri, 10 Apr 2020 09:06:08 -0700 (PDT)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 10 Apr 2020 18:05:57 +0200
Message-ID: <CAP71WjwuQWL9Efja199LFO6BORe0tT6DYyKP1ntqj+taFWdPEQ@mail.gmail.com>
Subject: meta-linaro-toolchain transition to meta-arm-toolchain
To: Linaro list for OpenEmbedded topics <openembedded@lists.linaro.org>, meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004e119505a2f1e9e3"

--0000000000004e119505a2f1e9e3
Content-Type: text/plain; charset="UTF-8"

hi there,

over the last few months, we've transitioned the gcc-arm toolchain from
meta-linaro-toolchain for master. Since we are approaching the next YP
release, I would like to remove/cleanup recipes in meta-linaro-toolchain
before we create the dunfell branch.

as of now, meta-linaro-toolchain has the following recipes:
gcc_arm-8.2.bb
gcc_arm-8.3.bb
gcc_arm-9.2.bb
gcc_linaro-7.2.bb

including all their usual dependencies, and the 'external' toolchain
recipes.

meta-arm-toolchain has
gcc_arm-8.2.bb
gcc_arm-8.3.bb
gcc_arm-9.2.bb

and it's strictly the same metadata, as of now.

As such, I am proposing to remove all recipes from meta-linaro-toolchain
master branch, and require every user to transition to meta-arm.

it will effectively become an empty layer.. so I have 2 options:
1. keep an empty layer with conf/layer.conf
2. remove the layer completely (e.g. remote meta-linaro-toolchain folder)

I am not sure which one is better.. #2 will generate an obvious error
message for anyone using the layer. Maybe that would be a strong signal..

I will default to #2 right before we create the dunfell branch (in a couple
of weeks max), unless someone speaks before that!

Nothing will change of course for our stable branches.

cheers
nico

--0000000000004e119505a2f1e9e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi there,</div><div><br></div><div>over the last few =
months, we&#39;ve transitioned the gcc-arm toolchain from meta-linaro-toolc=
hain for master. Since we are approaching the next YP release, I would like=
 to remove/cleanup recipes in meta-linaro-toolchain before we create the du=
nfell branch.</div><div><br></div><div>as of now, meta-linaro-toolchain has=
 the following recipes:</div><div><a href=3D"http://gcc_arm-8.2.bb">gcc_arm=
-8.2.bb</a><br><a href=3D"http://gcc_arm-8.3.bb">gcc_arm-8.3.bb</a><br><a h=
ref=3D"http://gcc_arm-9.2.bb">gcc_arm-9.2.bb</a><br><a href=3D"http://gcc_l=
inaro-7.2.bb">gcc_linaro-7.2.bb</a></div><div><br></div><div>including all =
their usual dependencies, and the &#39;external&#39; toolchain recipes.</di=
v><div><br></div><div>meta-arm-toolchain has <br></div><div><a href=3D"http=
://gcc_arm-8.2.bb">gcc_arm-8.2.bb</a><br><a href=3D"http://gcc_arm-8.3.bb">=
gcc_arm-8.3.bb</a><br><a href=3D"http://gcc_arm-9.2.bb">gcc_arm-9.2.bb</a><=
/div><div><br></div><div>and it&#39;s strictly the same metadata, as of now=
.</div><div><br></div><div>As such, I am proposing to remove all recipes fr=
om meta-linaro-toolchain master branch, and require every user to transitio=
n to meta-arm.</div><div><br></div><div>it will effectively become an empty=
 layer.. so I have 2 options:</div><div>1. keep an empty layer with conf/la=
yer.conf</div><div>2. remove the layer completely (e.g. remote meta-linaro-=
toolchain folder)</div><div><br></div><div>I am not sure which one is bette=
r.. #2 will generate an obvious error message for anyone using the layer. M=
aybe that would be a strong signal.. <br></div><div><br></div><div>I will d=
efault to #2 right before we create the dunfell branch (in a couple of week=
s max), unless someone speaks before that!</div><div><br></div><div>Nothing=
 will change of course for our stable branches.</div><div><br></div><div>ch=
eers</div><div>nico<br></div></div>

--0000000000004e119505a2f1e9e3--

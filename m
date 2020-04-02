Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.2952.1585821485060329033
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 02:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Qok3ntgM;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: peter.griffin@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id r24so2575868ljd.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Apr 2020 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+yVo/lZWnxacxqOWQWs/wrzASYzHFmDhco3O5DQpESU=;
        b=Qok3ntgMqDi7onzwhopCdJAANaKi8wNT1qi9gS7eI6EMbWQD9xOTIE09ZXE2Y0VLaN
         0zwn2D2Ga2Jwk22DdWnG+QRBd6nbvPR4KqXKKlz9p1wAAa+ZDV5/a8acQyeBWI34J1fz
         Oh4vk6FOmx1vnJxvIm8BO6hZL+IIXDIjUwv6e08pnJbXa1xLhVIr3yLZgNJ2jppQvCxi
         LEctXoaJ0tHVmD1GloWOwVFw8KKvmMUAt8224MrGsdCDnx5LJ4cYJBn6+iLzzlXEgata
         asH9rbPMlyLQYdNqxjh02DYjvKeKm4WwE8APzceNeQlMVT54RArrC3i9FG287iZFAy4e
         JInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+yVo/lZWnxacxqOWQWs/wrzASYzHFmDhco3O5DQpESU=;
        b=SeEDh90xWH5UzmeaB/c245OBz3e9b17PExV7GHNTWbtPJqCi4/jsTU4IMi8k2wjBcP
         XIJVf0OowGW7HpMJlEJCCyvF6ZDj8fVWj/JRhL/ifTwJ2M0HSsdq/jLEyk2dV3LD8zMU
         aUfQucVkTzWTNb/AS7/zSRIYuumkH/xvRPCIJycX6XFc/h56bPLYo0Y5yfgjg2ukEM4N
         dFz12imfLSlLCXkvBfC2m4Mo2TT/TXQjequ76aPkLm9aeVlxFuslKnXvkrcW5oSRCHWi
         RcHrLeEzB61GPKhmw1+5L7dddB03tkbA7sU6T4fm3VLtn1ATOuHRg5TqMCGPXSvXnX+M
         13Pw==
X-Gm-Message-State: AGi0PuYvJWezf8U7LGAHd8Gwqf5jqQGD0zJAc08J4LPCyWzAK9HCfbIM
	FxuIsYTmS12XAgPe296eKMAscBQFZ+QPWLIhX/709wgCobM=
X-Google-Smtp-Source: APiQypISM6VUHwDxTsZu6N99KPNLJ/WxbtaNGcnFGQKEg89ArKGPiT6IwnZ+SQNzTSOS/059pAzBa2s4tfp4paB2vbg=
X-Received: by 2002:a2e:3919:: with SMTP id g25mr1574602lja.248.1585821482696;
 Thu, 02 Apr 2020 02:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <1585782786-34477-1-git-send-email-denis@denix.org> <1585782786-34477-5-git-send-email-denis@denix.org>
In-Reply-To: <1585782786-34477-5-git-send-email-denis@denix.org>
From: "Peter Griffin" <peter.griffin@linaro.org>
Date: Thu, 2 Apr 2020 10:57:51 +0100
Message-ID: <CADrjBPqCtonpTnaAXiKh_2SGsm2nrAjKDxGoN7Rit0L972XrzQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 5/5] optee-examples: cleanup
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: multipart/alternative; boundary="000000000000274e6805a24bd6e9"

--000000000000274e6805a24bd6e9
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

On Thu, 2 Apr 2020 at 00:13, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> * Rename with _git suffix to match other optee recipes
> * Set PV
> * Add DESCRIPTION
> * Depend on Python3 version of PyCryptodomex instead of Python2 version of
> PyCrypto
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../optee/{optee-examples.bb => optee-examples_git.bb}               | 5
> ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>  rename meta-arm/recipes-security/optee/{optee-examples.bb =>
> optee-examples_git.bb} (87%)
>
> diff --git a/meta-arm/recipes-security/optee/optee-examples.bb
> b/meta-arm/recipes-security/optee/optee-examples_git.bb
> similarity index 87%
> rename from meta-arm/recipes-security/optee/optee-examples.bb
> rename to meta-arm/recipes-security/optee/optee-examples_git.bb
> index aaec4c4..768a55b 100644
> --- a/meta-arm/recipes-security/optee/optee-examples.bb
> +++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
> @@ -1,10 +1,13 @@
>  SUMMARY = "OP-TEE examples"
> +DESCRIPTION = "Open Portable Trusted Execution Environment - Sample
> Applications"
>  HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
>
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM =
> "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
>
> -DEPENDS = "optee-client optee-os python-pycrypto-native"
> +PV = "3.8.0+git${SRCPV}"
>

You have set PV to indicate 3.8.0 but not updated the SRCREV?

Apart from that:
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter.

--000000000000274e6805a24bd6e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Denys,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 2 Apr 2020 at 00:13, Den=
ys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">den=
ys@ti.com</a>&gt;<br>
<br>
* Rename with _git suffix to match other optee recipes<br>
* Set PV<br>
* Add DESCRIPTION<br>
* Depend on Python3 version of PyCryptodomex instead of Python2 version of =
PyCrypto<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=
=3D"_blank">denys@ti.com</a>&gt;<br>
---<br>
=C2=A0.../optee/{<a href=3D"http://optee-examples.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">optee-examples.bb</a> =3D&gt; <a href=3D"http://optee-examp=
les_git.bb" rel=3D"noreferrer" target=3D"_blank">optee-examples_git.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta-arm/recipes-security/optee/{<a href=3D"http://optee-examp=
les.bb" rel=3D"noreferrer" target=3D"_blank">optee-examples.bb</a> =3D&gt; =
<a href=3D"http://optee-examples_git.bb" rel=3D"noreferrer" target=3D"_blan=
k">optee-examples_git.bb</a>} (87%)<br>
<br>
diff --git a/meta-arm/recipes-security/optee/<a href=3D"http://optee-exampl=
es.bb" rel=3D"noreferrer" target=3D"_blank">optee-examples.bb</a> b/meta-ar=
m/recipes-security/optee/<a href=3D"http://optee-examples_git.bb" rel=3D"no=
referrer" target=3D"_blank">optee-examples_git.bb</a><br>
similarity index 87%<br>
rename from meta-arm/recipes-security/optee/<a href=3D"http://optee-example=
s.bb" rel=3D"noreferrer" target=3D"_blank">optee-examples.bb</a><br>
rename to meta-arm/recipes-security/optee/<a href=3D"http://optee-examples_=
git.bb" rel=3D"noreferrer" target=3D"_blank">optee-examples_git.bb</a><br>
index aaec4c4..768a55b 100644<br>
--- a/meta-arm/recipes-security/optee/<a href=3D"http://optee-examples.bb" =
rel=3D"noreferrer" target=3D"_blank">optee-examples.bb</a><br>
+++ b/meta-arm/recipes-security/optee/<a href=3D"http://optee-examples_git.=
bb" rel=3D"noreferrer" target=3D"_blank">optee-examples_git.bb</a><br>
@@ -1,10 +1,13 @@<br>
=C2=A0SUMMARY =3D &quot;OP-TEE examples&quot;<br>
+DESCRIPTION =3D &quot;Open Portable Trusted Execution Environment - Sample=
 Applications&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/linaro-swg/optee_exa=
mples" rel=3D"noreferrer" target=3D"_blank">https://github.com/linaro-swg/o=
ptee_examples</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${S}/LICENSE;md5=3Dcd95ab417e23b94f=
381dafc453d70c30&quot;<br>
<br>
-DEPENDS =3D &quot;optee-client optee-os python-pycrypto-native&quot;<br>
+PV =3D &quot;3.8.0+git${SRCPV}&quot;<br></blockquote><div><br></div><div>Y=
ou have set PV to indicate 3.8.0 but not updated the SRCREV?</div><div><br>=
</div><div>Apart from that:</div><div>Reviewed-by: Peter Griffin &lt;<a hre=
f=3D"mailto:peter.griffin@linaro.org">peter.griffin@linaro.org</a>&gt;<br><=
/div><div><br></div><div>regards,</div><div><br></div><div>Peter.</div></di=
v></div>

--000000000000274e6805a24bd6e9--

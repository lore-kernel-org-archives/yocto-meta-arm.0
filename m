Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.2905.1585821570151018791
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 02:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SQAyYD4D;
 spf=pass (domain: linaro.org, ip: 209.85.167.68, mailfrom: peter.griffin@linaro.org)
Received: by mail-lf1-f68.google.com with SMTP id f8so825078lfe.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Apr 2020 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vhVUDsVOaHDjiWmNgmQCsAMFV3dXEWaqtlFgd0MSLbw=;
        b=SQAyYD4DQEntRBk51PZrOOuBwbVt6514XukYWbz38V7IeW9rYh0quz03UxoVgmHvF7
         grYXGFLPTAExtvCu/SEc8xjurvA6zJo1EXkMZXzqt1vRdN6lL2bVNzRaFlqvBD+tvSqY
         v7wAA5RN5oGDjp6l7x7i3Wiut1xr3KLOYFH8OhDBIV5b2WBPfWPl33CSrKWDWYHtTgx5
         kKErzVsJWUkxm0BlsV5XXwRwQ5u6TeHZpGhmNVKQgNhOFnYz2PYElOMK/hFLoP3jsW8H
         fkM5DIO+0+z1IIGVi1wEEL9zg/7QlKWU+z4ZAyi1IVDk215v0Ur57CaBAgJEWxRAiaJ3
         ttiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vhVUDsVOaHDjiWmNgmQCsAMFV3dXEWaqtlFgd0MSLbw=;
        b=JZRMGar72vKj6Q6LcaS4ScLNZV/cusL3MvB+nPVgyWjSOk5Bilrcj5b9+SW0Bts7kE
         9LZ/tpFVNnHkwb1Bw7tNMYXJI7SOVga3M3FD3OwHvxeDCN1qcnoPmkR9C4FgOAfgTvaj
         ZhV1OAO25+WUXCe6XvRPH9roymvmSuScv+QzYufWefysmYrkJ3R6gViCE9CbB5FeriBn
         jPTGjO5MeNOZofqAU7f/8gCMqbkglvB2H+U5tK8HLclTWV96hVTw0/XeP2nc7xfjhymo
         nB2NBVFEd79f+TXJZ2Rjv2jivPZbxYLwdra0g90HbyJHyGRgzUOPZg8ygkGAe0cHlOgZ
         i3tg==
X-Gm-Message-State: AGi0PuZQDRdK/CzU1IwVtajn8m5iqjuhlj4KSfH1J0W0SFR3ce0yLpYk
	e7elN8huxcCgz6W3zI7cEpH1jf37vfTCaomfg5Yw8XmDLPA=
X-Google-Smtp-Source: APiQypIRIzt9IXu2Bq73ZBJodMYsrmycN3xmwf6vhT5BCM/dV0FkCmr1dvOHTPNK9Wi2HYPZ0Jz53Oemk3RlOGg1twk=
X-Received: by 2002:ac2:5096:: with SMTP id f22mr1655234lfm.79.1585821567827;
 Thu, 02 Apr 2020 02:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <1585782786-34477-1-git-send-email-denis@denix.org>
In-Reply-To: <1585782786-34477-1-git-send-email-denis@denix.org>
From: "Peter Griffin" <peter.griffin@linaro.org>
Date: Thu, 2 Apr 2020 10:59:16 +0100
Message-ID: <CADrjBPoO9ZvfrFVWb_+r56dNfqPJd36EHtRxCHLrp8vBRqN+2g@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/5] layer.conf: add meta-python to LAYERDEPENDS for optee components
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: multipart/alternative; boundary="0000000000003a552b05a24bdbf6"

--0000000000003a552b05a24bdbf6
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Apr 2020 at 00:13, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> optee components use pycrypto, pycryptodomex and pyelftools from
> meta-python layer
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>

 Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

---
>  meta-arm/conf/layer.conf | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 0b93e8d..d96e9f1 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -9,5 +9,8 @@ BBFILE_COLLECTIONS += "meta-arm"
>  BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm = "6"
>
> -LAYERDEPENDS_meta-arm = "core"
> +LAYERDEPENDS_meta-arm = " \
> +    core \
> +    meta-python \
> +"
>  LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> --
> 2.7.4
>
> 
>

--0000000000003a552b05a24bdbf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, 2 Apr 2020 at 00:13, Denys Dmytri=
yenko &lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Denys Dmy=
triyenko &lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com=
</a>&gt;<br>
<br>
optee components use pycrypto, pycryptodomex and pyelftools from meta-pyth=
on layer<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" targe=
t=3D"_blank">denys@ti.com</a>&gt;<br></blockquote><div>=C2=A0</div><div>=C2=
=
=A0Reviewed-by: Peter Griffin &lt;<a href=3D"mailto:peter.griffin@linaro.o=
rg">peter.griffin@linaro.org</a>&gt;</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta-arm/conf/layer.conf | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf<br>
index 0b93e8d..d96e9f1 100644<br>
--- a/meta-arm/conf/layer.conf<br>
+++ b/meta-arm/conf/layer.conf<br>
@@ -9,5 +9,8 @@ BBFILE_COLLECTIONS +=3D &quot;meta-arm&quot;<br>
=C2=A0BBFILE_PATTERN_meta-arm =3D &quot;^${LAYERDIR}/&quot;<br>
=C2=A0BBFILE_PRIORITY_meta-arm =3D &quot;6&quot;<br>
<br>
-LAYERDEPENDS_meta-arm =3D &quot;core&quot;<br>
+LAYERDEPENDS_meta-arm =3D &quot; \<br>
+=C2=A0 =C2=A0 core \<br>
+=C2=A0 =C2=A0 meta-python \<br>
+&quot;<br>
=C2=A0LAYERSERIES_COMPAT_meta-arm =3D &quot;warrior zeus dunfell&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div></div>

--0000000000003a552b05a24bdbf6--

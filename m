Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.10136.1586270043804487022
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 07:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cFY/Wge4;
 spf=pass (domain: linaro.org, ip: 209.85.208.194, mailfrom: peter.griffin@linaro.org)
Received: by mail-lj1-f194.google.com with SMTP id q19so3948021ljp.9
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Apr 2020 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=whTqKxmXQUpPI8Tz4R93NkP6sMQ2YD6C3PtIYqp5DmM=;
        b=cFY/Wge49HcMieEEFWFyOCVGEyCrtkEUPxAeXSMpxw6gRqixtQ2PFZ4Z86hs4Fon1D
         r9wi3vHaUEvjZi+wI2+kLx5ZW27a5QQYom0pWMM54pXsuTHyNup6M5klcS0N2j5rFTmR
         xUNTK6nIKZngI6uGxdH1NwiR21dMGv63IdgBDrNP0Kbv+uFwcqnR5FKxyWgZ1wKMP2zz
         4nll7llekNdo1HcLluf8G2BGOv6p1auLXLaxlu4khgKCFVas5mduUjUWn+HZINA12HJU
         VM0u4CuCrx5pNi2EKuOo2Lk/zQPluOrgu31WHNPOUNKyZ7n77H9IcDA9cAfcohA9qVeC
         +65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=whTqKxmXQUpPI8Tz4R93NkP6sMQ2YD6C3PtIYqp5DmM=;
        b=VyLiUNow0hVo/v7ASTAe6+FKWy1UbtCa3vaEV+YVCOBAWykgLjw6jyP0OlXEVI+vPH
         699SKmoCXUhHHel+eL8g2EaeNr7Vj7NZVYiuQ0e+1QSDTE7DipF3sXWxgT3hifoOw30O
         h4BGXpf6h8bnyMLDy9iERi7fSa4Q9iXt2DO0pc901BGI75RFXvqIJRHS5Ce35N4RPLNu
         GrBVbi998Rx4xhRKlLbbAZ4AaPQTgBej1CFZsYFAcZRU9mEBAPee0SuAwVg5EhBHRAH1
         bfGxL+CCHu1MQZwtRo2CcHPxm5Xu+ixNLwF4Gx5N7jg9ydny4Kt95GYqQR+acTQ0T0Tw
         ESYQ==
X-Gm-Message-State: AGi0PubijmcIN1/9SSn61levg7padcIvCixtIeikvEHf11+AAwUpWx6l
	IIlPZ9E7QwmjBfXQPJig3SVgfuRegcAIye5LLqi9+YYmpB0=
X-Google-Smtp-Source: APiQypJxdWQurWkWTyNwLtpv3UIC3DM0vcYL5gqgYs4X0jRrAVFODt0tJkYs/Di7yCBpZFtONqaHkt4VaG7q0VS5o2I=
X-Received: by 2002:a2e:b5cf:: with SMTP id g15mr1903861ljn.36.1586270041554;
 Tue, 07 Apr 2020 07:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <1585684637-53492-1-git-send-email-denis@denix.org>
In-Reply-To: <1585684637-53492-1-git-send-email-denis@denix.org>
From: "Peter Griffin" <peter.griffin@linaro.org>
Date: Tue, 7 Apr 2020 15:33:50 +0100
Message-ID: <CADrjBPp-i+4REoHhtVkp03wPRtKJyB9jA_9s6u8GakFnEAwnkw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for dunfell
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: multipart/alternative; boundary="00000000000058598305a2b44631"

--00000000000058598305a2b44631
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2020 at 20:57, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>


> ---
>  meta-arm-bsp/conf/layer.conf       | 2 +-
>  meta-arm-toolchain/conf/layer.conf | 3 +--
>  meta-arm/conf/layer.conf           | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 0632ba3..8afcbe5 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp = "6"
>
>  LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
> -LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus"
> +LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
>
>  # We have patches for xen but meta-virtualization might not be there so
> filter
>  # out recipes-extended/xen unless xen is activated in the features
> diff --git a/meta-arm-toolchain/conf/layer.conf
> b/meta-arm-toolchain/conf/layer.conf
> index a247dc1..3a4c4f0 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -8,8 +8,7 @@ BBFILE_COLLECTIONS += "arm-toolchain"
>  BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_arm-toolchain = "30"
>
> -LAYERSERIES_COMPAT_arm-toolchain = "zeus"
> +LAYERSERIES_COMPAT_arm-toolchain = "zeus dunfell"
>
>  # do not error out on bbappends for missing recipes
>  BB_DANGLINGAPPENDS_WARNONLY = "true"
> -
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 65ccd15..0b93e8d 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm = "6"
>
>  LAYERDEPENDS_meta-arm = "core"
> -LAYERSERIES_COMPAT_meta-arm = "warrior zeus"
> +LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> --
> 2.7.4
>
> 
>

--00000000000058598305a2b44631
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Tue, 31 Mar 2020 at 20:57, Denys Dmytriyenko &lt;<=
a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=3D"_bla=
nk">denys@ti.com</a>&gt;<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" targe=
t=3D"_blank">denys@ti.com</a>&gt;<br></blockquote><div><br></div><div>Revie=
wed-by: Peter Griffin &lt;<a href=3D"mailto:peter.griffin@linaro.org">peter=
.griffin@linaro.org</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
---<br>
=C2=A0meta-arm-bsp/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-arm-toolchain/conf/layer.conf | 3 +--<br>
=C2=A0meta-arm/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
 +-<br>
=C2=A03 files changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf<b=
r>
index 0632ba3..8afcbe5 100644<br>
--- a/meta-arm-bsp/conf/layer.conf<br>
+++ b/meta-arm-bsp/conf/layer.conf<br>
@@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-arm-bsp =3D &quot;^${LAYERDIR}/&quot=
;<br>
=C2=A0BBFILE_PRIORITY_meta-arm-bsp =3D &quot;6&quot;<br>
<br>
=C2=A0LAYERDEPENDS_meta-arm-bsp =3D &quot;core openembedded-layer meta-arm=
&quot;<br>
-LAYERSERIES_COMPAT_meta-arm-bsp =3D &quot;warrior zeus&quot;<br>
+LAYERSERIES_COMPAT_meta-arm-bsp =3D &quot;warrior zeus dunfell&quot;<br>
<br>
=C2=A0# We have patches for xen but meta-virtualization might not be there=
 so filter<br>
=C2=A0# out recipes-extended/xen unless xen is activated in the features<b=
r>
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/=
layer.conf<br>
index a247dc1..3a4c4f0 100644<br>
--- a/meta-arm-toolchain/conf/layer.conf<br>
+++ b/meta-arm-toolchain/conf/layer.conf<br>
@@ -8,8 +8,7 @@ BBFILE_COLLECTIONS +=3D &quot;arm-toolchain&quot;<br>
=C2=A0BBFILE_PATTERN_arm-toolchain :=3D &quot;^${LAYERDIR}/&quot;<br>
=C2=A0BBFILE_PRIORITY_arm-toolchain =3D &quot;30&quot;<br>
<br>
-LAYERSERIES_COMPAT_arm-toolchain =3D &quot;zeus&quot;<br>
+LAYERSERIES_COMPAT_arm-toolchain =3D &quot;zeus dunfell&quot;<br>
<br>
=C2=A0# do not error out on bbappends for missing recipes<br>
=C2=A0BB_DANGLINGAPPENDS_WARNONLY =3D &quot;true&quot;<br>
-<br>
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf<br>
index 65ccd15..0b93e8d 100644<br>
--- a/meta-arm/conf/layer.conf<br>
+++ b/meta-arm/conf/layer.conf<br>
@@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm =3D &quot;^${LAYERDIR}/&quot;<br=
>
=C2=A0BBFILE_PRIORITY_meta-arm =3D &quot;6&quot;<br>
<br>
=C2=A0LAYERDEPENDS_meta-arm =3D &quot;core&quot;<br>
-LAYERSERIES_COMPAT_meta-arm =3D &quot;warrior zeus&quot;<br>
+LAYERSERIES_COMPAT_meta-arm =3D &quot;warrior zeus dunfell&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div></div>

--00000000000058598305a2b44631--

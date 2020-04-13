Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.9969.1586756369268741691
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Apr 2020 22:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gLk1CMIj;
 spf=pass (domain: linaro.org, ip: 209.85.167.67, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f67.google.com with SMTP id k28so5680374lfe.10
        for <meta-arm@lists.yoctoproject.org>; Sun, 12 Apr 2020 22:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dxJpoP0dEtKZ2hSlQvfDKQn206CaekA6lGI5ziOWxnw=;
        b=gLk1CMIjpk4C22bkYbTxkWJFHXZ5dgTNn3H6jPs+FVCj4qhkS1I8fX5ScGfNV7N1Yp
         FQkysZwPptWkIvN1CynXYdPggsfUdsq5M6vbE8giz+03qUeg2XoZZ30HzkXmJKNV4wQu
         MFeK4pTdcvwmM1FZoEsYFy0GFz5eTwzRn2RQn+pp88wgBOs/6abYHVq4ifYXkOg5Gc0e
         9h32cAOcldGTlQFX6m3d2GJrpO26ByKR7Ami/16tUmHurgm5osJ+VX89PsL/1pundWY3
         +6kA5BA7wIeZAXvave6KBsjTgelUi8eE1qTHGQoIbY5rNjbQS+hO+TKSMf2nDKd+oQAj
         aWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dxJpoP0dEtKZ2hSlQvfDKQn206CaekA6lGI5ziOWxnw=;
        b=o3IaqX2Z1NFKgCF94r1YsoxBGE1AnJadjJUBCOsEer5R+c/bWD6+nCM9Lndp2njGWg
         PRdrJ8pe2gN9fLzm8zKezYG1QVxOz/DKV71hwXvuv2v6IjaSNLFHdJjFGSYCyI6452Xc
         zKt/Y57kZaN6+uV1mOx0dLBAqbrKGUrU4fQWFtBiPcqlWIq7/hE9YvZQSbYQO/Yx7T95
         cO4MFyoj9vKtAoEF7QghXRNmxSDa4Wz7dBHFz3U+Zd2dd5s7OSkEsvytJQxO+KF2/tcp
         b7UpJD7mFzZGYY5XQVDW/zmYdCinf76qptWn83kL3zspHL8K+5z3bNTydQ30v6JtJKlY
         129w==
X-Gm-Message-State: AGi0PuYzz0LdBoAVev+tuWeugYQEJij5zTGhI14Eq0CNFBMKgZe/xFl9
	arW+oaNr63H3ox2V3fWMDiRlLnh+6F7P4eMfpoz0hGub69k=
X-Google-Smtp-Source: APiQypK1CVVemWssTiQ0J7hLDLt6yomSEg1sQAS9a1lHPp+14oUDwsQa8QN44JO060txvvwO+nBcBFUWsGXRVyCznoo=
X-Received: by 2002:ac2:4c34:: with SMTP id u20mr9693093lfq.40.1586756366846;
 Sun, 12 Apr 2020 22:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <1586650807-24249-1-git-send-email-denis@denix.org>
In-Reply-To: <1586650807-24249-1-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Mon, 13 Apr 2020 11:09:14 +0530
Message-ID: <CAFA6WYM5Ut_2fDvSjrdjPz0ZKAOSjzMDBnpdjfakjiyXR1iqwQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: meta-arm-toolchain should depend on core layer
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 12 Apr 2020 at 05:50, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> While core layer may be implied, it's still nice to depend on it explicitly
> for building gcc and other toolchain components in this layer.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arm-toolchain/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

>
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index 3a4c4f0..76eac9d 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -8,6 +8,7 @@ BBFILE_COLLECTIONS += "arm-toolchain"
>  BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_arm-toolchain = "30"
>
> +LAYERDEPENDS_arm-toolchain = "core"
>  LAYERSERIES_COMPAT_arm-toolchain = "zeus dunfell"
>
>  # do not error out on bbappends for missing recipes
> --
> 2.7.4
>
> 

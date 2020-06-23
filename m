Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web11.5044.1592912389848700286
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Jun 2020 04:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yQxx1k8F;
 spf=pass (domain: linaro.org, ip: 209.85.167.66, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f66.google.com with SMTP id k15so4456489lfc.4
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Jun 2020 04:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XpEwNdkcqn4kaleU25EZjnBHWSvXnY7soVYJwWTrYdQ=;
        b=yQxx1k8FxITcJM4Z5Las9z+WrSc8EsQIXRE4LOvbBiKLbT4xgdfVfU40QE9G2Fvg2U
         EfOO/ZdJpb6Bd5SH+w4o6UxNbrHUpS2lJB89vyllF36VfpqWm+CD3dTtfBxZKmyFQQyR
         Y0N9bpX+4i07NkbIVkWCaCWzvJycP9xH08VG712PoQL8GncuYCObQSK2HJzj7vk105/f
         KAvyRjem3y5kKlam8fgS3yHrtfmPBrd20LIUs1ep28C9dV09pCztYQFwXrk7VOoqOFQN
         18SDMvX3I3aHt7+Hx4UKQwj30M9YiIP7nbsteuzn5RCsfOc8RnXF78YJMPwM9DOXCzqK
         1DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XpEwNdkcqn4kaleU25EZjnBHWSvXnY7soVYJwWTrYdQ=;
        b=DYYlXdEGmfW2BtE72HlvDYKr7oYpoCA4Ay7OTuk2An7tnzfvJykBen8GZPjzj4QGbG
         goimakubAeyVo9cpb3Ov68MJyNYYx61zdyaFFnavkylypCHvZ06kQqaqULjOkw9lKJgO
         TorkvLpMmi8JcF91uhHrCc9MVfnnRxsjpM3wHfg3Ossn8KvlzAeE8tyHJZH8tKrAPrMf
         ug/wk7Jy2ZXq8gZvah/4Dt1O2EWlgNvFkJ5y2aWJsXIE3lWzuvOmGB67YWjesnOQMgFy
         Etux4O9ZpYhZuB/IsHD2+bTDUBJDAwfrDkZ/9hwVK5tP5OE9x0H8OvDz7T+8Jk5LKxgf
         0IVw==
X-Gm-Message-State: AOAM530R6WQncCjLoizxuk7i1WQed09eoEl28B0BP38euH5+gu72FpP0
	s+W1XEAraK2Xjx4BKyrVLdbSbYaW7v8/sPbLXZsliQ==
X-Google-Smtp-Source: ABdhPJwwZ0d8xhCI72Fxyu3zdqPgmpMpXdj3g3tQsxvSPkJCQs5WVUzLoHLaUQIs+SvbyuY4DqPp2Y2/w+wJpQQ1NxE=
X-Received: by 2002:ac2:5467:: with SMTP id e7mr11710658lfn.122.1592912386844;
 Tue, 23 Jun 2020 04:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <1592526937-38479-1-git-send-email-denis@denix.org> <1592526937-38479-3-git-send-email-denis@denix.org>
In-Reply-To: <1592526937-38479-3-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 23 Jun 2020 17:09:34 +0530
Message-ID: <CAFA6WYPDPHmLS2-8H+o=v91e1m0iiumiEy9usjxSuheiebrJQg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 2/4] external-arm-toolchain-versions: set per-component toolchain licenses
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2020 at 06:05, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> This code is upstreamed from meta-arago layer.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../distro/include/external-arm-toolchain-versions.inc     | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> index a89f2f0..9d4f967 100644
> --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> @@ -139,5 +139,19 @@ python external_arm_toolchain_version_handler () {
>      d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
>      d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
>      d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
> +
> +    lc_libc = "LGPL-2.1"
> +    lc_gcc = "GPL-3.0"
> +    lc_rle = "GPL-3.0-with-GCC-exception"
> +    lc_gdb = "GPL-3.0"
> +    lc_bfd = "GPL-3.0"
> +
> +    d.setVar('EAT_LIBC_LICENSE', lc_libc)
> +    d.setVar('EAT_GCC_LICENSE', lc_gcc)
> +    d.setVar('EAT_RLE_LICENSE', lc_rle)
> +    d.setVar('EAT_GDB_LICENSE', lc_gdb)
> +    d.setVar('EAT_BFD_LICENSE', lc_bfd)
> +
> +    d.setVar('EAT_LICENSE', "%s & %s & %s & %s & %s" % (lc_libc, lc_gcc, lc_rle, lc_gdb, lc_bfd))
>  }
>  addhandler external_arm_toolchain_version_handler
> --
> 2.7.4
>
> 

Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.5098.1592912558941851030
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Jun 2020 04:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EIj4gscE;
 spf=pass (domain: linaro.org, ip: 209.85.208.195, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f195.google.com with SMTP id i27so23006501ljb.12
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Jun 2020 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rCrEx2QcZrrZIisCqVtJcZu2XS1XuEEzn5/l7cZy9z8=;
        b=EIj4gscEiSNO6USVIfV9dZ5Q8I+8vqPzW3RIowNz5KWPtx8cThtGx2NRl1u5FMlZAC
         pSZC9yHpsd8cW+oua2kQojLLknqwQyzFr48yQdjvuHR85DfmdNoFC9QpL5wwMtkbRR5S
         joTGFHxlBZwxFWLeArWPBPHN84kDZaoXtqYxhG/nWQpCHu6YVZHzkjHxyBJawa5yxd6x
         MbHW/XuTpSwD25ujzzuduAIG8hkn5JOvJNwgcwzvyTGQi+n1Nyhn5qzgktELjgsH/Kym
         BmJa+YZ059H5i+aZakWOTEwXH90kya/Qpl0YTCRxhbce3Hv1hD5eG39Rz7A/xsWW+xWg
         DT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rCrEx2QcZrrZIisCqVtJcZu2XS1XuEEzn5/l7cZy9z8=;
        b=Ol80IOKccrXyNFIcxAQ9VfBL/hH9EWdxp+W103XEJTsZGWKc0AUhLrFPnXyf9ssOqh
         ailzATMUlAWc17BGCiQYdskXQM9xGbHeBrDOisy+JBFjo1iWjYd/fU+okkbzR9ZWwCYw
         DyveD3Dt7LHDU6Xpm0RuwUsF4+CqRrQ8jPgSxlXBapc/BpvjBqQoiuJ97UZ2TI3Oj4iL
         7Q6faA05huAbfOJyyRBB8Po8t3AE7oQE86Sz6ZyTa8VlojGSMlOi/SblOLTbvwpxX/7S
         HVkwibC0nKxGty2HEvz97hB9SA9Si7jYBInWDz5Tcw6/CrpfKMnh3m4J9jIuMl6515KO
         Gt7Q==
X-Gm-Message-State: AOAM533viJ4VfCOK2Nl4UQ5zfN+WN78+b4ceyb1MteHw/dWwFOtVo0WI
	ifDbljxK7w0j8m7pizmqh1gygE1ZBMSlxUI4c9NPNw==
X-Google-Smtp-Source: ABdhPJwSnsjJfOSEvil9YTREzzkVHNPvSrw0PJSVXgpqCCzfllRa8NTJO6BHHDPelADe8KAyfQrz4o1qq+Rf/+lmtP8=
X-Received: by 2002:a2e:b04c:: with SMTP id d12mr10007036ljl.256.1592912557101;
 Tue, 23 Jun 2020 04:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <1592526937-38479-1-git-send-email-denis@denix.org> <1592526937-38479-4-git-send-email-denis@denix.org>
In-Reply-To: <1592526937-38479-4-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 23 Jun 2020 17:12:25 +0530
Message-ID: <CAFA6WYOMmTExQFeDwVMHncNp==zRMT-KNxf5vO=EHZGW0yxM5A@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 3/5] external-arm-toolchain: check for TCLIBC being glibc
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2020 at 06:05, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> The old TARGET_OS check doesn't work, as it only checks for uclibc and musl at
> the end, while TARGET_OS is usually "linux-musleabi", uclibc has been deprecated
> and new options like "newlib" and "baremetal" were added. Plus it only works for
> the target, but not SDK. Switch to simply checking for TCLIBC = glibc.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../external-arm-toolchain/external-arm-toolchain.bb              | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index 73a2cf6..14a585f 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -668,13 +668,9 @@ SUMMARY_libitm-staticdev = "GNU transactional memory support library - static de
>
>  EAT_VER_MAIN ??= ""
>
> -
>  python () {
>      if not d.getVar("EAT_VER_MAIN", False):
>          raise bb.parse.SkipPackage("External ARM toolchain not configured (EAT_VER_MAIN not set).")
> -    import re
> -    notglibc = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None) or (re.match('.*musl$', d.getVar('TARGET_OS', True)) != None)
> -    if notglibc:
> -        raise bb.parse.SkipPackage("incompatible with target %s" %
> -                                   d.getVar('TARGET_OS', True))
> +    if d.getVar('TCLIBC', True) != "glibc":
> +        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TCLIBC', True))
>  }
> --
> 2.7.4
>
> 

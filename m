Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.3905.1588240307867197614
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 02:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bTNqCENm;
 spf=pass (domain: linaro.org, ip: 209.85.167.67, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f67.google.com with SMTP id b20so410025lff.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Apr 2020 02:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HbVCG6eu/GO8tzMVa/KLERGTcGc+AUC5JQ72rKjvt94=;
        b=bTNqCENmYItAvit/MLKVTvRO5OHqqrQju9SM4EsojsPWR+947ePYttb5h95dWv+pOA
         vKW9xcIfEf7Irg1SfjrkIhhl/tFT84kBxsSMJYEdZsnbQUwdc48qfjNPoqwyVWqGmVlV
         ccB+eRAfcnupDRKlmfXXP9tSKXiYqWImfcwlNzv7XRKvhVtkBVvQfbsnWHtc6uOaz4ML
         APh5/dmALV+6wlBwC178VBsj+IV2itIc4Dsm6lZO2EfxZcBZ1sjTDRbGPrecRAg5L+ay
         Zid0RW/SgANynbJldQRxwkwNiZKbEe+FCYV1NjB/Q1TWJ+L4VLrR0dmWT0B7AXonDhAt
         4WXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HbVCG6eu/GO8tzMVa/KLERGTcGc+AUC5JQ72rKjvt94=;
        b=SH5cSTVUzvzcIYtVsAEKDTvVsNt/krKYN6M3qjOjpDv1s+r17Vh2oADT0BBB1Gn25y
         Orb0lASdGMrJEM2OeVEcK91/hf2joVZOcXaR81DNe2ivydmOuzUu4VgtItmQXQaoeTex
         4QYr0CX8gCX8VgdlTspGqgFab+I0TwAOnqIqCACd2eepSYf0oCo3D6O5MoXb0+VsCggM
         Gjp6IgOkaahWQhqgtSX1hwbNVMBkn5+HNBpu+a2sU2RARSr7lu+yNIr+OZYYvzDoB5ZW
         xPDKGbwobSy3H2CpMjcmnziMSccJudFo/SZuQ6Tl0WiAfY5takcVGg1RDlAFRUgYtt18
         1Erg==
X-Gm-Message-State: AGi0PuYGG7Ql4Y2UfEccWOJ1uZ2PHxuDwrXnMnPNSC0Pbbn4o6s3LpzW
	rmd4YJjFguZU9alnZLBo8BhKCt+68mQTX8tYUwStNIVc5fs=
X-Google-Smtp-Source: APiQypKKhEdkaIbMvYQpybbGEviaaisGTTbHGl7/IWZzEtCGGWRV7gyIsvySYGBIirDIwcBsKBRtnGkqe5YFqMfHegk=
X-Received: by 2002:a19:cb41:: with SMTP id b62mr1594237lfg.21.1588240305432;
 Thu, 30 Apr 2020 02:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <1588219828-34791-1-git-send-email-denis@denix.org>
In-Reply-To: <1588219828-34791-1-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 30 Apr 2020 15:21:33 +0530
Message-ID: <CAFA6WYMZeQgDLUYrCj+FeAuwjnaLu18uEWt=ZmkEKY9cpg-zHA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/4] tcmode-external-arm: drop unnecessary CPPFLAGS and LDFLAGS adjustments
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2020 at 09:40, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> These were there from the very beginning and they were used as crutches to
> prop up the build by pointing directly to the external toolchain location,
> in case early versions of external-arm-toolchain missed staging/packaging
> something from there.
>
> First of all, it is unnecessary to adjust CPPFLAGS and LDFLAGS in this way,
> as external-arm-toolchain is supposed to stage everything needed from the
> toolchain in internal sysroot.
>
> And second, these settings can be harmful and conflict with component's own
> CPPFLAGS/LDFLAGS. For example, OpenCV 4.1 fails to link internal libraries
> because of incorrect -Wl,-rpath-link passed down the build.
>

In general I agree with you to drop these CPPFLAGS and LDFLAGS as
external-arm-toolchain already stages headers and libraries in
internal sysroot. But just out of curiosity, could you share the link
failure for OpenCV 4.1?

> After dropping these, I was able to verify that everything still builds,
> including BSP, Wayland/Weston, Qt5, gstreamer, OpenCV, etc for Aarch64 and
> Armv7a platforms.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 2 --
>  1 file changed, 2 deletions(-)

FWIW:

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

>
> diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> index 8ddaf53..9171380 100644
> --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> @@ -44,8 +44,6 @@ PREFERRED_PROVIDER_glibc-thread-db = "external-arm-toolchain"
>  PREFERRED_PROVIDER_glibc-mtrace = "external-arm-toolchain"
>  PREFERRED_PROVIDER_libc-mtrace = "external-arm-toolchain"
>  PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-arm-toolchain"
> -TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include "
> -TARGET_LDFLAGS_prepend = " -L${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib "
>
>  TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
>
> --
> 2.7.4
>
> 

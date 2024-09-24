Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9C3CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 08:19:02 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.8888.1727165940804497918
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Sep 2024 01:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gklnWHv7;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f763e9e759so59749851fa.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 24 Sep 2024 01:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727165939; x=1727770739; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oKPJ4Y5weGI9e7RXhXl05JXfSbjqHGx4sIXLgF0q1wA=;
        b=gklnWHv7m1DN7tX1QSRM/ac6ynXmmXBPanDzzS1y6oA4C8aw2wj6Q4j2ua/TGif3LG
         dZP5K9r682wLLREHZdz83u2edFbA6xWD14mZ7lrQx/NtMA1JBM08mVc9Da+v13/h3yrY
         K2CkVLtr13R4tVvZneDavDStlI6oJ0ak5yL2yP7v34UYG6A/5RBvcw/BblXvuYzsRwJz
         1wc5F/8VTU7X7XIAQwi0YXXTy1EUMbQk7Hy53Nvitoy7cGV5C+whJXrOILmT2qDGf7ry
         MenQsIYOWu5aY6zo/d15t1TzDgSWO3V0LuyG1+6QRapjVhOJqOTN9T+RK0gV8bpgFFWE
         4toQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727165939; x=1727770739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKPJ4Y5weGI9e7RXhXl05JXfSbjqHGx4sIXLgF0q1wA=;
        b=GyP8UIQ63BBXbJDyFBgrC5xtv4E14cKReFXDz+pVYDFzUitUH0tNMHfv0Rf81IgiNH
         ZXGLf9Jj5WjcnTBywhSelP6G+kPNkd1qs1YDA8uw6sgCGIaVr2BpSQEP6yFNViOOTntF
         K+hDBf6fWUXKSI+AsbB2u5M+y2/fH/bi9Wsp4VHnmCp+KqTWTedkMS/a5TDbvqCIxYtk
         duKVUUtw8k/L9XmUYfvKS/yeb0LsAHTAnphiwR6DyyTT4xCq6VXtIhhLT4Ma3TM1yXNF
         4taCa9dYIUTrot/5bjQoKVcadEX2Sk6wQ1ygwisoLKtyA+IQ59UWNvygbhIlgVWwqZBw
         SOqQ==
X-Gm-Message-State: AOJu0YzRpd7Q7lbJ5eiSe77/l0+FcMQJ3Zq3MrckeJd7rlYXlqA3AqZS
	hmAIqAvBiY6ZAtcBMVcL2QdxBuvpkGcXfm02ztK5IZaW5FZ4/tdoikCmCkG2wmA=
X-Google-Smtp-Source: AGHT+IETuCsUhnH5xYlqRUsUgffUJPDxOBZw7psfdYbyV3MLyp/ehuiZsWg2aMU2eHCV/4ZAwiy0IA==
X-Received: by 2002:a05:651c:1992:b0:2f5:a29:5a42 with SMTP id 38308e7fff4ca-2f7cb3190f8mr79080631fa.14.1727165938695;
        Tue, 24 Sep 2024 01:18:58 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d283bffasm1431351fa.38.2024.09.24.01.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 01:18:56 -0700 (PDT)
Date: Tue, 24 Sep 2024 11:18:53 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: jon.mason@arm.com
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 3/3] arm-bsp/fvp: Re-enable parselogs
Message-ID: <ZvJ17f543giDXFf8@nuoska>
References: <20240920125716.13293-1-jon.mason@arm.com>
 <20240920125716.13293-3-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920125716.13293-3-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Sep 2024 08:19:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6100

Hi,

One minor issue,

On Fri, Sep 20, 2024 at 08:57:16AM -0400, Jon Mason via lists.yoctoproject.org wrote:
> Re-enable parselogs testing for fvp-base and corstone1000-fvp, and add
> an ignore file for the relevant entries.  Also, increase the testing
> being done on corstone1000-fvp.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  ci/fvp.yml                                                | 5 -----
>  meta-arm-bsp/conf/machine/corstone1000-fvp.conf           | 3 ++-
>  .../runtime/cases/parselogs-ignores-corstone1000-fvp.txt  | 8 ++++++++
>  .../lib/oeqa/runtime/cases/parselogs-ignores-fvp-base.txt | 1 +
>  4 files changed, 11 insertions(+), 6 deletions(-)
>  create mode 100644 meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-corstone1000-fvp.txt
>  create mode 100644 meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-fvp-base.txt
> 
> diff --git a/ci/fvp.yml b/ci/fvp.yml
> index 2bf1cef024a8..667bb641092a 100644
> --- a/ci/fvp.yml
> +++ b/ci/fvp.yml
> @@ -7,8 +7,3 @@ local_conf_header:
>    testimagefvp: |
>      LICENSE_FLAGS_ACCEPTED += "Arm-FVP-EULA"
>      IMAGE_CLASSES += "fvpboot"
> -  failing_tests: |
> -    # This fails but we can't add to the ignorelist from meta-arm yet
> -    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=14604
> -    TEST_SUITES:remove = "parselogs"
> -    TEST_SUITES:remove = "xorg"
> diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
> index 2c724bfeb2b8..a605a695b19a 100644
> --- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
> +++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
> @@ -9,7 +9,8 @@ TFM_PLATFORM_IS_FVP = "TRUE"
>  
>  # testimage config
>  TEST_TARGET = "OEFVPTarget"
> -TEST_SUITES = "fvp_boot"
> +TEST_TARGET_IP = "127.0.0.1:2222"
> +DEFAULT_TEST_SUITES:append = " fvp_boot fvp_devices"
>  
>  # FVP Config
>  FVP_PROVIDER ?= "fvp-corstone1000-native"
> diff --git a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-corstone1000-fvp.txt b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-corstone1000-fvp.txt
> new file mode 100644
> index 000000000000..63cef943e792
> --- /dev/null
> +++ b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-corstone1000-fvp.txt
> @@ -0,0 +1,8 @@
> +psci: failed to boot CPU1 (-95)
> +CPU1: failed to boot: -95
> +psci: failed to boot CPU2 (-95)
> +CPU2: failed to boot: -95
> +psci: failed to boot CPU3 (-95)
> +CPU3: failed to boot: -95
> +ARM FF-A: Notification setup failed -95, not enabled
> +ARM FF-A: Failed to register driver sched callback -95

These lines could be amended with comment lines using # in case
some analysis of the failures has been done. Sometimes these
could be open bug reports to upstream etc or HW related
quirks.

Cheers,

-Mikko


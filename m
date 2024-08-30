Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D23CA1003
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 15:28:19 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.19300.1725031690371268934
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 08:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ivBf6yEy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6c34c02ff1cso4476816d6.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725031689; x=1725636489; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RvTCuFRfBEgKnHUXLTnFhg5v0JLWi/TPaW44YeF5k8I=;
        b=ivBf6yEy85kwcKAQCgrRC1BTekT1GRK5geeYc0W1RVq49Lq9L8OZImskSB07ybzSev
         B7Acy6TVFu0u1jCOuHFF9JdNXMpCgGC0JrC4Yw19Tfjb9ttIZ2TvAhIM20AUrmndJmBZ
         KHHf+ufUf8ptMMuZT95Rcu2/hRkY5cfNgDDxRBKEg4b6kyl92t2AIH4ZGMwhbNTlX7GV
         O9x779oSzM2ETLCYcavh3cG8zQDxpI0/ZuD0xAyRMBhx5JVdKglWu1bOYsse5sAkLJCN
         WzG+99QkDJ4VIiSJo104PsshirtZ4ygz4uz1VUU20ccjYb5uMmzQ1p/ztXf4Qsad+qrZ
         2dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725031689; x=1725636489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvTCuFRfBEgKnHUXLTnFhg5v0JLWi/TPaW44YeF5k8I=;
        b=TISfan/Wqhl0dDHz/aeCW+lfaEw4FCXNA/dpadlrKyZQYpxhoACJukjp3bd7c/QIey
         M6BYz1FKtAzq0Q5jhuj1erxim4snHmvzHCPNKjPKw0rcXzW11bOOdXuheYeeoFmEqOPw
         899o5kCb/iRU4lN1SBjKNcd1sz61abcKI8kmpGeLs4SooVSN+goasMacsED99y9W4oLI
         WFPIsfvUJ4FKOOSqXPzfJZS+96MkgOdbI/mSGVd4UeyG3M6CxlRWyfYmm8Xg1aQOsYfk
         8+BHML0D3kDM9uFyUAzGfk9lgMsqk62SobHzYQpx/kSpPCn1z0w5GPD2uXBEVxYUOCEO
         wosw==
X-Gm-Message-State: AOJu0YxGt1Kl1Og996q8rnREK9PTt8P3BxBYp2ZP3lbWh2tqMn1d6yvR
	trXckobN6IkJbDQsVNB+Dw+I2b7Xg5okUARWDWOwyG3NDNf3kojNVvbfoFTB2g==
X-Google-Smtp-Source: AGHT+IH8YS929hvqmpVEpVdpZhyWBQMsU9v/tLnazINphbuY6y4uy+g3Tih6sf8cBicSzP104X5G5Q==
X-Received: by 2002:a05:6214:2c13:b0:6b7:b277:dd12 with SMTP id 6a1803df08f44-6c33e6962e7mr87134436d6.49.1725031689260;
        Fri, 30 Aug 2024 08:28:09 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340ca651esm15350416d6.115.2024.08.30.08.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:28:08 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:28:07 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 13/13] meta-arm: Add UEFI Secure Boot test
Message-ID: <ZtHlByeUhPAFkB-f@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-14-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829163209.47945-14-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 15:28:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6038

On Thu, Aug 29, 2024 at 10:32:09AM -0600, Javier Tia wrote:
> Add a test to verify UEFI Secure Boot is enabled
> 
> Run the test:
> 
> kas build 'ci/qemuarm64-secureboot.yml:ci/testimage.yml'
> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  ci/qemuarm64-secureboot.yml                   |  2 ++
>  .../oeqa/runtime/cases/uefi_secure_boot.py    | 32 +++++++++++++++++++
>  .../core-image-minimal-uefi-secureboot.inc    |  6 +++-
>  3 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py
> 
> diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
> index 03281a08..3eb8c20c 100644
> --- a/ci/qemuarm64-secureboot.yml
> +++ b/ci/qemuarm64-secureboot.yml
> @@ -11,6 +11,8 @@ local_conf_header:
>    optee: |
>      IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
>      TEST_SUITES:append = " optee ftpm"
> +  uefi_secure_boot: |
> +    TEST_SUITES:append = " uefi_secure_boot"
>  
>  machine: qemuarm64-secureboot
>  
> diff --git a/meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py b/meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py
> new file mode 100644
> index 00000000..4a62b54c
> --- /dev/null
> +++ b/meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py
> @@ -0,0 +1,32 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import os
> +
> +from oeqa.runtime.case import OERuntimeTestCase
> +from oeqa.runtime.decorator.package import OEHasPackage
> +from oeqa.core.decorator.oetimeout import OETimeout
> +
> +
> +class UEFI_SB_TestSuite(OERuntimeTestCase):
> +    """
> +    Validate Secure Boot is Enabled
> +    """
> +
> +    @OETimeout(1300)
> +    def test_uefi_secure_boot(self):
> +        # Validate Secure Boot is enabled by checking
> +        # 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot.
> +        # The GUID '8be4df61-93ca-11d2-aa0d-00e098032b8c' is a well-known
> +        # identifier for the Secure Boot UEFI variable. By checking the value of
> +        # this variable, specifically
> +        # '8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot', we can determine
> +        # whether Secure Boot is enabled or not. This variable is set by the
> +        # UEFI firmware to indicate the current Secure Boot state. If the
> +        # variable is set to a value of '0x1' (or '1'), it indicates that Secure
> +        # Boot is enabled. If the variable is set to a value of '0x0' (or '0'),
> +        # it indicates that Secure Boot is disabled.
> +        cmd = "efivar -d -n 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot"
> +        status, output = self.target.run(cmd, timeout=120)
> +        self.assertEqual(output, "1", msg="\n".join([cmd, output]))
> diff --git a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> index e5cf7760..ce64b8b5 100644
> --- a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> +++ b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> @@ -10,4 +10,8 @@ QB_DEFAULT_KERNEL = "none"
>  
>  KERNEL_IMAGETYPE = "Image"
>  
> -IMAGE_INSTALL += "systemd systemd-boot"
> +IMAGE_INSTALL += "systemd systemd-boot util-linux coreutils efivar"
> +
> +inherit extrausers
> +
> +EXTRA_IMAGE_FEATURES += "allow-root-login empty-root-password"

I don't think you want this.  testimage adds all that fun stuff, but
this is making part of the image, which is making it for all machines
that have this machine feature enabled (due to the previous patches in
this series).

Thanks,
Jon

> -- 
> 2.46.0
> 
> 


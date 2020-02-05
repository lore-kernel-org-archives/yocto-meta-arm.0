Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web09.72.1580917496573732888
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Feb 2020 07:44:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=K078xGLE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.66, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f66.google.com with SMTP id n21so2596645ioo.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 Feb 2020 07:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vAU5CNA5jdA3FuFTiPt3Un/hmS4rhRjOfq8tzODoG/8=;
        b=K078xGLElS6o3y//jKFOt/1RtD6lIG/ZhDijM4BUe2ytwsMglsWo5OsWjHSsSQQAp7
         74dFBkirTrfss6m4ua0wih3LKzvRflzQq5TUE8kZeO0qf74BndcR83k80yfft0TBBTtT
         Vnl1lh6eC7ZI8fRYpLR7RvL7SEXz316c6ajag3sQsUUb6TBYiKpfW9dClbxm+zKEk4B+
         w+XjKbW/h1kX1uU8kZ6otCgXYWJ6zYN8XK9YipLRCV1XlE7IjRxNNBfvj/juhsjy9DXY
         id606JxpCAbkCsCEVgFuIqkVnsi4DTE8tghEkiOj+7TgBogvEszZo4/IsMbR8ivKXdNs
         MxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vAU5CNA5jdA3FuFTiPt3Un/hmS4rhRjOfq8tzODoG/8=;
        b=Z4rwW1HO2GETwNgClAsxUcS7i4dfL4uq/TXBsi9oRVGtbISxGb4VqZsE+9DqvWJp1C
         hKsoO56YSG61v1Dt+wlcB7ghXCgwQI8p7FqcZA6qoOa6xxzxToiCJm3HU+rpV9pkpjzV
         SHmTn/bI8KYTJz7C6ReLXavlLD2r/tbJPvZGve6orR3c2/siMWo9iWnoY4mF8q3A6fv+
         k4YuXSnVdUj4iv9YXF1U7xuu8mur4FEthOsP+PzkXuf4zLVLUXUnFsye/PxayfnFwISw
         Y23duwjB0OuBFyOHDeXQkPQRGwGWy2BIciXpq+5DOx2AqCEJi3Ali5X3BaJM5sdCbUFU
         W47Q==
X-Gm-Message-State: APjAAAW/wDviz81rS539T+HhWWchgVrfjg3uKfYCwHfjj3pXZbvEogdL
	p0rMMSw/90eOAIVzzxTiOOtvnuHCU4SYla1sD5z7xSIMj32AWg==
X-Google-Smtp-Source: APXvYqykvSI1Ol+3SfCkEw0p6FLcpoqH7nA9DpeYX5UKmLokWDHBNH8bClCMZV9D789TefC7CjAbtIwjK0tnZWEt8DM=
X-Received: by 2002:a5d:97d7:: with SMTP id k23mr16105126ios.97.1580917495758;
 Wed, 05 Feb 2020 07:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20200204162530.11719-1-vineeth.raveendran@arm.com>
In-Reply-To: <20200204162530.11719-1-vineeth.raveendran@arm.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Wed, 5 Feb 2020 15:44:45 +0000
Message-ID: <CAPoiz9xzJieBi9O+_kOR8V7wzFpwBJ4aYdOpzyXNScPf9mGeOQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] Fix to improve boot time on Emulators
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com, Vineeth Raveendran <vineeth.raveendran@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 4, 2020 at 4:26 PM Vineeth Raveendran
<vineeth.raveendran@arm.com> wrote:
>
> Use haveged instead of rngd (That gets added when adding ssh) since rngd
> init is taking ~7 mins during boot time

The patch has been accepted and pushed to the master branch of
meta-arm.  Thank you for doing this work.

Thanks,
Jon

>
> Change-Id: I038c42b8a7c025959248d78940483322421ad5ef
> Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>
> ---
>  meta-arm-bsp/conf/machine/foundation-armv8.conf | 5 +++++
>  meta-arm-bsp/conf/machine/fvp-base.conf         | 5 +++++
>  meta-arm-bsp/conf/machine/gem5-arm64.conf       | 4 ++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/meta-arm-bsp/conf/machine/foundation-armv8.conf b/meta-arm-bsp/conf/machine/foundation-armv8.conf
> index 9a3f43f..10d3eea 100644
> --- a/meta-arm-bsp/conf/machine/foundation-armv8.conf
> +++ b/meta-arm-bsp/conf/machine/foundation-armv8.conf
> @@ -8,3 +8,8 @@ require conf/machine/fvp-common/fvp.inc
>
>  KERNEL_DEVICETREE = "arm/foundation-v8-gicv3-psci.dtb"
>  EXTRA_IMAGEDEPENDS += "foundation-armv8-native"
> +
> +# Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
> +# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
> +PACKAGE_EXCLUDE_append = " rng-tools"
> +IMAGE_INSTALL_append = " haveged"
> diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
> index 5592dc1..4c79250 100644
> --- a/meta-arm-bsp/conf/machine/fvp-base.conf
> +++ b/meta-arm-bsp/conf/machine/fvp-base.conf
> @@ -8,3 +8,8 @@ require conf/machine/fvp-common/fvp.inc
>
>  KERNEL_DEVICETREE = "arm/fvp-base-gicv3-psci-custom.dtb"
>  EXTRA_IMAGEDEPENDS += "fvp-base-native"
> +
> +# Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
> +# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
> +PACKAGE_EXCLUDE_append = " rng-tools"
> +IMAGE_INSTALL_append = " haveged"
> diff --git a/meta-arm-bsp/conf/machine/gem5-arm64.conf b/meta-arm-bsp/conf/machine/gem5-arm64.conf
> index 54f7ede..4775940 100644
> --- a/meta-arm-bsp/conf/machine/gem5-arm64.conf
> +++ b/meta-arm-bsp/conf/machine/gem5-arm64.conf
> @@ -56,3 +56,7 @@ XEN_CONFIG_EARLY_PRINTK = "vexpress"
>  BOOT_WRAPPER_AARCH64_XEN_CMDLINE = "noreboot dom0_mem=256M console=dtuart \
>      dtuart=/uart@1c090000 bootscrub=0"
>
> +# Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
> +# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
> +PACKAGE_EXCLUDE_append = " rng-tools"
> +IMAGE_INSTALL_append = " haveged"
> --
> 2.17.1
>
> 

Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41458C369B1
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 09:19:46 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.11195.1727255981139652370
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 02:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fHCPy1gO;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f7502f09fdso6596661fa.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 02:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727255979; x=1727860779; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iafsu53GDuRt73vwnvphsrFoZsdC1IoX5GIZXx+dZNo=;
        b=fHCPy1gO7axaadSYan9eHopoIvKNQikJRfKDCauR4IPdbekcssz+t74XK1r14qdQp0
         bVIDJdZAfIvqAc1BDowYUhcE+iEOLDl9FMl1fryBIhH1OW15o8m3s0Q9sTpRxAIzlqKw
         ogimDGphC1BuWkoSFs22XasjE2hAUj5dJxM3WuvzFloZBNEss1Ko1s+cH0zThg6HdnDL
         hWCgj4V+AWvnW+SNcP79EqQp86Mm3XQVGuCxGW/b+NdUIP0Jrbg4Hxa6GD6vABGLteV2
         n2l8ia2wFN0GJ2bnv8DlFcWA27+9pvf9pdo6XxJf7P6J+Rr50/ULI8hdE/ojn9+2c8/S
         ZYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727255979; x=1727860779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iafsu53GDuRt73vwnvphsrFoZsdC1IoX5GIZXx+dZNo=;
        b=KuZYD00WO3/RW/S7uPwehpqidKvUa5OKy4kw0A1g3Xoro8wgELKzFAOON/wDYxBM2J
         dhMA6Rf5QmfEebx9PCVCMU46Jak6IVikprJdJXIFZQuBDPpLpoBr2kY8tKaXzdtnQrCW
         JAb3xHLW+RvS34ImMPfjXSxCtkLzBxzuymewo72Vg0Tu/TUnIq5Tr58vC6HturEjxNId
         zoKiueRED/7sGyw9O8A9VMzLjS5fF/DoIByzBxcL1b/S9qps59VGFSHkn49dybNnzE5e
         5q2VHKWU3TwVfyNpwBWry0NADitkdfhhwDF3Hx4mVvmk+spmHa0SGiU47emcuZjimFKf
         DO4Q==
X-Gm-Message-State: AOJu0YwXAN4Bo5iLSqI3ZZmrfBmiE1QSP2JwG0X0R+c2OZ4GR8Y1daH6
	rWPT+pwytx5NlsqBEljH+vuVkpxtv2Qnl8Yop4gPASfKn6l5B7xvOQrWf7qgXoZIzdtnJxfI7EG
	f5UA=
X-Google-Smtp-Source: AGHT+IEv/w9DAJo4246dJbuEbYZnlxwBkR+GJ925icidia4w1EMLJ9Nt0y4ttoxm0pdn2JR8+wWlEg==
X-Received: by 2002:a05:651c:198d:b0:2f7:9100:315d with SMTP id 38308e7fff4ca-2f94d730bddmr7626121fa.4.1727255979009;
        Wed, 25 Sep 2024 02:19:39 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d289fdcfsm4737171fa.122.2024.09.25.02.19.35
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:19:37 -0700 (PDT)
Date: Wed, 25 Sep 2024 12:19:34 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 3/4] optee-client: fix systemd service dependencies
Message-ID: <ZvPVpnV_8EqxTsvM@nuoska>
References: <20240925090147.66618-1-mikko.rapeli@linaro.org>
 <20240925090147.66618-4-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925090147.66618-4-mikko.rapeli@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 09:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6107

Hi,

On Wed, Sep 25, 2024 at 12:01:46PM +0300, Mikko Rapeli wrote:
> udev starts tee-supplicant once optee has been found.
> Fix dependencies in systemd service so that starting it in
> initrd is possible. Stopping requires that ftpm
> kernel module is disabled or any TPM related actions will fail until
> the next reboot so working around these in the service file. These
> are limitations of current kernel optee and ftpm drivers.
> 
> tpm2.target requires systemd 256 or newer. With older system version
> there is no simple way to queue in service before TPM device is
> available.
> 
> https://www.freedesktop.org/software/systemd/man/devel/systemd.special.html#tpm2.target
> 
> Note that
> https://www.freedesktop.org/software/systemd/man/devel/systemd-tpm2-generator.html
> detects TPM support from either existing kernel driver (built in or
> loaded really early in initrd and rootfs boot) or ACPI table entry for
> TPM device. If firmware used a TPM device but doesn't provide ACPI table
> entry for it, then a kernel patch has been proposed to expose this to
> userspace:
> 
> https://lore.kernel.org/lkml/20240422112711.362779-1-mikko.rapeli@linaro.org/
> 
> and matching change proposal for systemd:
> 
> https://github.com/systemd/systemd/pull/32400
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  .../optee/optee-client/tee-supplicant@.service         | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
> index 72c0b9aa..8325b6be 100644
> --- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
> +++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
> @@ -1,10 +1,12 @@
>  [Unit]
>  Description=TEE Supplicant on %i
> +DefaultDependencies=no
> +After=dev-%i.device
> +Wants=dev-%i.device
> +Conflicts=shutdown.target
> +Before=tpm2.target sysinit.target shutdown.target
>  
>  [Service]

Sorry, needs here:

Type=notify

Will add this in v2.

Cheers,

-Mikko

> -User=root
>  EnvironmentFile=-@sysconfdir@/default/tee-supplicant
>  ExecStart=@sbindir@/tee-supplicant $OPTARGS
> -
> -[Install]
> -WantedBy=basic.target
> +ExecStop=-/bin/sh -c "/sbin/modprobe -v -r tpm_ftpm_tee ; /bin/kill $MAINPID"
> -- 
> 2.34.1
> 


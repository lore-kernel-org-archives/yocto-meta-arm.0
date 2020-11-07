Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.2036.1604742453608921220
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 07 Nov 2020 01:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AFJmV7hn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id h62so3484761wme.3
        for <meta-arm@lists.yoctoproject.org>; Sat, 07 Nov 2020 01:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=HpAMC7XC+711WBv3pWopJUG/H//Ts8wwX145nAqMx+U=;
        b=AFJmV7hnyMr3XSSZDlC7+akcf2UgVGy+v3fo29dp5f1FOKk8+gjr1v0HYQAyjJg5+c
         9WuSJaj492A2Y+6/OFCD7yec/UdGcx+zcYj+FPicWIBCkUPKCxwX5JQAZie/5bPBReUI
         cdcSsa0aVIwYUAgcJjN0jheVZDyxqrxCnL4Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HpAMC7XC+711WBv3pWopJUG/H//Ts8wwX145nAqMx+U=;
        b=It6I2NvECfHNZXQvGgXfhRGtAj2whCJj+XR5G7q6PdmNfY8z21ja1lv+83tHj1Pfuk
         1/uUYkgZdX86kULtswa7dNEkaxIQiu2rfSr/1nXx4HSDcGXfkEcFrP/nJ0ZSFaVM8j2m
         gHtB3EVmVXZEdZSItGQWWbMdUAboLTBORsf93fE4EQuED9mdrEwab/pOYio6TvjMcWM4
         m7U67PQW4cLZvpBzJ9+XaunoZlrdbf5H0rlnur731zl6A62E0nkrH6VCNO5b2JA7lFXt
         uwwywIYI0Dq9u3CM1ycRruZ0KseAMZ/qZIzATP/hDRtHAHRda6N9pHVITc3OxoIw2n2s
         VTow==
X-Gm-Message-State: AOAM530D7eEZzups75RP/5CBzglO3nC0b8cLVFJs0ZHmGY5tcsjeLsID
	+HsWtE02xwzpkyagKS18fkVm2w==
X-Google-Smtp-Source: ABdhPJzb9tcDPmAuDQifCwEY+YNHXQpNLJCBTy5tBpstAyMXkzvTdfoLbRnNaPonUexv0mem4cvNXg==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr3884460wmc.173.1604742451725;
        Sat, 07 Nov 2020 01:47:31 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.e.4.c.9.7.4.3.c.6.2.9.7.2.8.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.e.4.c.9.7.4.3.c.6.2.9.7.2.8.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:5827:926c:3479:c4e7])
        by smtp.gmail.com with ESMTPSA id i11sm5625312wro.85.2020.11.07.01.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 01:47:31 -0800 (PST)
Message-ID: <e3b77a6c6d7459af70d526f8fab5e6a5a82119eb.camel@linuxfoundation.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp: convert general u-boot bbappend to version specific
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org
Date: Sat, 07 Nov 2020 09:47:28 +0000
In-Reply-To: <20201103172047.18147-2-jon.mason@arm.com>
References: <20201103172047.18147-1-jon.mason@arm.com>
	 <20201103172047.18147-2-jon.mason@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-11-03 at 12:20 -0500, Jon Mason wrote:
> The generic u-boot bbappend is causing issues upstream when trying to
> use new or older versions of u-boot, by trying to apply patches from
> folders that do not exist.
> 
> Change-Id: I399e3234fba852382fc73ab68f14a7e826bb5a42
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .../0001-arm-Add-corstone700-platform.patch            |  0
>  ...02-boot-add-bootx-command-to-start-XiP-images.patch |  0
>  ...t-starting-the-XIP-kernel-using-bootx-command.patch |  0
>  .../0004-arm-enabling-the-arch_timer-driver.patch      |  0
>  .../recipes-bsp/u-boot/u-boot_2020.04.bbappend         |  8 ++++++++

Thanks for this, it did resolve an error we were seeing on the
autobuilder. Unfortunately it is still generating a warning:

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/427

Cheers,

Richard



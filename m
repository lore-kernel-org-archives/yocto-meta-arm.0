Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7EEC3DA70
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 09:47:44 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.15391.1721382459408912800
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Jul 2024 02:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QkGNfPeh;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ea952ce70so1543708e87.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 19 Jul 2024 02:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721382457; x=1721987257; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w2MUQOGLWuziqOeX/fb0xKKbI50KgDTnReixr+TbrdI=;
        b=QkGNfPehwN01PVAuah+aHBVjVTOEvh5RA5wkIhpCduPbwUiyQUVqIBx0+CchX581Mb
         3Xatudxzcgj/lh0l13QC1jLOxUZWG2Xpx+51r2v2Rak+H1oHM/PGBq7zjUWid98XZFti
         vvkoorYkkPAMG+Rmk/aBGzGDAtPx7kLAlzE6VnhtlM8aXTsufZl9OnAyP2d3YeerM4yp
         co3Z+Bv98ULheYn7uN5rQATp2cATJj/8aUN+b6b8gbHHxINcl1GOakCvXjYRhzfLbaza
         zU//7RHhKZIXAY+DFGHnHTuverdctt07gK0+kti/iX4Txto3+JY2cQ1nO7xqN0LcLMR3
         ITng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721382457; x=1721987257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2MUQOGLWuziqOeX/fb0xKKbI50KgDTnReixr+TbrdI=;
        b=nMo6MzC1sNhaJoZ7XwZ+1lLn3s/zo8IR2ownm6ilh6JuSRrEkkiwttX8N2AbTod6eZ
         UJ3dq6hFZS+aVT2iNkRn3gSxulXlftd8djzze0G2BjgrphGlEgDoqig0nwd7W5ah53TR
         dDqyxn0sOMPnCPjagJhzwPmp8tjDGG0uhfaACCEPPlfhpiuTrnIp3UlkGkFsLA5HqVrQ
         Fs3WKF2VuRrjoQIMwfBm9j3MNBPCuVLh55afx6L9IIuYhehtbYemleUDcPh6eVjvRSS8
         7+9JSmIMyCpxkKW/s+kxV2JlbG0QyqP1dOly8whMPgiizVjCaLSMJk/ntdG7L8JlIKdy
         j7ew==
X-Gm-Message-State: AOJu0YylLZbvIHYZ9PfitqySHjLa/0u/IOV+reGvQMDzxY/hLwoGGbC7
	IDCvuMdRJ90MQDNLug9NRWuuDwKiA2k24KCxN/MozxK5XkxVZh9ftttq0BQwuA4=
X-Google-Smtp-Source: AGHT+IHfpmvttGW8o0QSAiJrZF8dMUkcUfGNM0+rIeUCI2IPQp5u34gHHg8AdREvVSxCF3+r6/Wkww==
X-Received: by 2002:a05:6512:31cc:b0:52e:74d5:4bf9 with SMTP id 2adb3069b0e04-52ef5880222mr944389e87.54.1721382457378;
        Fri, 19 Jul 2024 02:47:37 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef557770fsm140340e87.242.2024.07.19.02.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:47:36 -0700 (PDT)
Date: Fri, 19 Jul 2024 12:47:35 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <Ross.Burton@arm.com>
Subject: Re: [PATCH v1 7/7] qemuarm64-secureboot: Add UEFI systemd support
Message-ID: <Zpo2N_1o22pzXGlG@nuoska>
References: <20240718203526.52214-1-javier.tia@linaro.org>
 <20240718203526.52214-8-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718203526.52214-8-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Jul 2024 09:47:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5911

Hi,

Subject should have "systemd:" prefix.

On Thu, Jul 18, 2024 at 02:35:26PM -0600, Javier Tia wrote:
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc | 1 +
>  meta-arm/recipes-core/systemd/systemd_%.bbappend          | 1 +
>  2 files changed, 2 insertions(+)
>  create mode 100644 meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc
>  create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
> 
> diff --git a/meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc b/meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc
> new file mode 100644
> index 00000000..5572e51a
> --- /dev/null
> +++ b/meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc
> @@ -0,0 +1 @@
> +PACKAGECONFIG:append = " efi"
> diff --git a/meta-arm/recipes-core/systemd/systemd_%.bbappend b/meta-arm/recipes-core/systemd/systemd_%.bbappend
> new file mode 100644
> index 00000000..577c4f0c
> --- /dev/null
> +++ b/meta-arm/recipes-core/systemd/systemd_%.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'systemd-uefi-secureboot.inc', '', d)}

I think this should be machine feature "efi", and this should possibly go to poky
upstream systemd recipe.

Then, it's possible to switch from grub to systemd-boot with uki binaries
but that requires some more work. There both kernel and initrd will be signed
into an efi binary. Only problem for me there is the split between different
layers: poky, meta-arm, meta-security and meta-secure-core. Not clear which
bits would belong where, and which layer would contain the test build config
and oeqa tests.

Cheers,

-Mikko


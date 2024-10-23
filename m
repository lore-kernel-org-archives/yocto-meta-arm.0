Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740BBCF5395
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 14:30:22 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.10416.1729693821040764563
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 07:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UpyjuPFO;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso69678151fa.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 23 Oct 2024 07:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729693819; x=1730298619; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EJHfdDJtjKiIrThi7/2ohSMu8WhgRxe32fBdEMvwcUs=;
        b=UpyjuPFO6G5gqN3GDfH31Hd/jCk+4Fef0F3GnVZ0EtKe+8LEzqWrA7PXmy+3dn6bd1
         B3l4/ko2WkQe3sVTZp8znSDcY5PHGscd9TyWH9ahE/a/0UvPgrloO0UjcBPlrOf5/azZ
         FDhMzXbZlB3yP+S7/k8DlSw0UbEJPiWhPh7YqzLBqtiuXqH3kp3PThBB3temM0tkhlOs
         mX4Oo1MTceVvBUkZuzSSv5tDgmQdKS7FUjMO3WJTDxI5NgArzrL6S4ho2ImwYPclwRm0
         S3aYJxA5gLwSQumva70AJq7IFlXFsi3DEFNfG5b0/DcpETZSWUQ9gjXU+nUYlQJvpz3W
         hq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729693819; x=1730298619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJHfdDJtjKiIrThi7/2ohSMu8WhgRxe32fBdEMvwcUs=;
        b=bC1VFIsa4H6LCm+rb/vjyR1G6SCRsjZyxgGVBKHGKVH6VTFRbalnBRzZ5MFu7ZLpeV
         mpPDg26rXlLTujTASxfbvneemJUMuPItUOwUGj46qMAUtcDs60oZYRfq9ofMk0T+E2qM
         I3iN/kC3un2E8Qlgwh4F/ewf4Sc2YqAXUumN9BBjWqcHwTttzsJT71BMpD7uSYdxnssY
         uMeF4udkbrzinlKEvM6ty5i8RzfRAOLOb5eTPsNMSAI4uA8FgOcysdg+gOl0f//fBz84
         +TFdzASysGodFvdy3eAF5e+9ALQi75KpKwcQhAPar27PJwinCZ8yuPpB4Ss9Odkof+s5
         2XFg==
X-Gm-Message-State: AOJu0YzG895zONZ7fYORpnlBrq8QeCMskUBp9nquNyRL8RFfAmLeN1Yc
	zp63Lf7jrpKNnIoesNBvD/ThS73pvticEfFNaLUkE1FLkEopqKZO2DYksmq60Io=
X-Google-Smtp-Source: AGHT+IE0xPSsIWRnqzthPauhN8QxS+1KUxAXpVaL+M9+36Y9htrxNcYMA1ry6hAso/hPWtTE9Etr8g==
X-Received: by 2002:a2e:b8cc:0:b0:2fc:a347:6d90 with SMTP id 38308e7fff4ca-2fca3476e1fmr7538151fa.27.1729693819139;
        Wed, 23 Oct 2024 07:30:19 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad4b804sm11056391fa.1.2024.10.23.07.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:30:18 -0700 (PDT)
Date: Wed, 23 Oct 2024 17:30:15 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: "Tom Hochstein (OSS)" <tom.hochstein@oss.nxp.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Tom Hochstein <tom.hochstein@nxp.com>,
	Sahil Malhotra <sahil.malhotra@nxp.com>
Subject: Re: [PATCH v3 1/2] optee-client: use udev rule and systemd service
 from upstream
Message-ID: <ZxkId04rSl5ykKCJ@nuoska>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <PAXPR04MB9448F0D1DE0F84A6634EFBC5E24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9448F0D1DE0F84A6634EFBC5E24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Oct 2024 14:30:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6221

Hi,

On Wed, Oct 23, 2024 at 02:22:30PM +0000, Tom Hochstein (OSS) wrote:
> Hi Mikko,
> 
> We have multilib testing that is failing now because the systemd folder is being installed in `libdir` instead of the non-arch-specific `systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"` as is codified in `bitbake.conf`.
> 
> ERROR: optee-client-4.4.0.imx-r0 do_package: QA Issue: optee-client: Files/directories were installed but not shipped in any package:
>   /usr/lib64/systemd
>   /usr/lib64/systemd/system
>   /usr/lib64/systemd/system/tee-supplicant@.service
> 
> I'm not sure how this should be fixed, as it doesn't appear that CMAKE can handle more than one libdir. Can the install of the service file be hard-coded to use /usr/lib? Or does this need to be fixed in the recipe?

As mentioned in https://github.com/OP-TEE/optee_client/issues/393
your use case is "sysvinit" without "usrmerge" in distro features.
"sysvinit" conflicts with "systemd" init.

These recipe changes only install the systemd service file if "systemd" is
enabled in DISTRO_FEATURES. Your usecase should be covered by that.

Cheers,

-Mikko


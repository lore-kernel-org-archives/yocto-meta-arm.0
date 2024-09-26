Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FBACDE020
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 15:58:27 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.47644.1727366304974258461
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 08:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qa9H52F/;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f66423686bso11766681fa.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727366303; x=1727971103; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=00Cd6zVyIW/VnpaZIzxQCCwPBqDrQJYO3eFNVctUZmo=;
        b=qa9H52F/0vKgMvTkO5NS/9RoBVmaxEBeSAMcuC50M0wXyNgoK0XnlY2Ib+sxZjAUoJ
         sGx6sRvAZ5YUs/WGBcqVaDqxQHFfMxlwL+lPMKlXPaavNEtz1QEwH5IQ+3Df71s4LPBQ
         isrj3/5ky0msRx+Nj+N1SoweDV0tkPvIvgCT7Vh99hLbhNDAA0qKz8BZasFB7Jgt0czg
         soCfb9AiYme8tw3ey3ouPoT5QL31DnPKIKI2Ui+RIV7Akid3iXeV2QEIQtTYEUwNptfN
         5KzTTlZoVH8n4zHS74kSFWQ8dgH8UFa5fs2OTYKrxcq6mNWiBr7+esYUGNCwk3X9pFJi
         Q7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727366303; x=1727971103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00Cd6zVyIW/VnpaZIzxQCCwPBqDrQJYO3eFNVctUZmo=;
        b=SQoMakKECHbNpfxzmflf9fVDjYYmGSG/pulY8FdPtTdlHscVPSXhMQ/SONh8M4BDZv
         EIfn2gYy1Ae980ypywse27fkB/ytFzSK+F26pz4Opdeg2JYWSp1p93EIEJPFDT4KDbrd
         JAVpXbJcmaK9VgwUPKHmPCdPBNwyASWjnWn7RtgKO5N/htj40cXVPXhOwhDERop9NwxG
         qG8qTdEMYiub5k+xJvOFkFj5XtVshEMx8ob00EAgneIL46M9PPapEfAOXu+ZCMgZuzDW
         v0Sz7BRIX1bAI9Ysq7AfWOVV2tLQb75xYfg14NxPhVyRR4yhjczsykeicEFhRM0GhuaJ
         t2nQ==
X-Gm-Message-State: AOJu0YxWPL3eEBCVFJJFymoSNzPgzTbtGVva6dFICL7N5XOOcpX7Pbpb
	vpPrBgeNE3OC6g/eac7uAbL+OjfAXD5D5F4fVpyo02y21d7mp3Yvop9Xb3ZlIio=
X-Google-Smtp-Source: AGHT+IHl4cMPBzpF7faH9xn5wjF0qTwWMr41iqYforf2YLk2+1mfED6vvk8I2h5h9hvT/xnyyEV0dg==
X-Received: by 2002:a2e:bc12:0:b0:2f3:fd6a:d170 with SMTP id 38308e7fff4ca-2f9d41979bamr802521fa.36.1727366303030;
        Thu, 26 Sep 2024 08:58:23 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d28998aasm8071651fa.102.2024.09.26.08.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:58:21 -0700 (PDT)
Date: Thu, 26 Sep 2024 18:58:16 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: jdmason@kudzu.us
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v7 0/4] UEFI secureboot
Message-ID: <ZvWEmMhzov6EiJET@nuoska>
References: <20240926154739.2379609-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926154739.2379609-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 15:58:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6123

Hi,

On Thu, Sep 26, 2024 at 11:47:35AM -0400, Jon Mason via lists.yoctoproject.org wrote:
> Sending a modified version of Javier's patches, combined with a subset
> of the patches sent out by Mikko recently.  This was done to expedite
> the acceptance of this series (given the code freeze tomorrow).  Also,
> the optee update that Mikko's series included cannot be included (given
> the code freeze).  2 of that series are needed for this one.  So,
> combining everything into this and sending it out publicly for Javier,
> Mikko, and anyone else to ack/nack.

ACK, optee 4.3 stuff later then.

Cheers,

-Mikko

> Thanks,
> Jon
> 
> 
> Javier Tia (3):
>   arm/optee: Add optee udev rules
>   arm: Enable Secure Boot in all required recipes
>   arm/qemuarm64-secureboot: Enable UEFI Secure Boot
> 
> Mikko Rapeli (1):
>   arm/optee-client: fix systemd service dependencies
> 
>  .gitlab-ci.yml                                |  1 +
>  ci/uefi-secureboot.yml                        | 37 +++++++++++++
>  meta-arm/classes/sbsign.bbclass               | 31 +++++++++++
>  .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++
>  .../u-boot/u-boot-uefi-secureboot.inc         | 17 ++++++
>  .../u-boot/u-boot/uefi-secureboot.cfg         | 10 ++++
>  meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  2 +
>  meta-arm/recipes-bsp/uefi/gen-sbkeys.bb       | 48 +++++++++++++++++
>  .../recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh | 52 +++++++++++++++++++
>  .../systemd/systemd-boot-uefi-secureboot.inc  |  7 +++
>  .../systemd/systemd-boot_%.bbappend           |  1 +
>  meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
>  .../recipes-core/systemd/systemd_%.bbappend   |  1 +
>  .../linux/linux-yocto%.bbappend               |  2 +
>  .../linux/linux-yocto-uefi-secureboot.inc     | 14 +++++
>  .../recipes-security/optee/optee-client.inc   |  8 ++-
>  .../optee/optee-client/optee-udev.rules       |  6 +++
>  .../optee-client/tee-supplicant@.service      | 10 ++--
>  18 files changed, 272 insertions(+), 5 deletions(-)
>  create mode 100644 ci/uefi-secureboot.yml
>  create mode 100644 meta-arm/classes/sbsign.bbclass
>  create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
>  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
>  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
>  create mode 100644 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb
>  create mode 100755 meta-arm/recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh
>  create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
>  create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
>  create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
>  create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
>  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
>  create mode 100644 meta-arm/recipes-security/optee/optee-client/optee-udev.rules
> 
> -- 
> 2.39.5
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6117): https://lists.yoctoproject.org/g/meta-arm/message/6117
> Mute This Topic: https://lists.yoctoproject.org/mt/108670112/7159507
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



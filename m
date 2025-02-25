Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DA8C021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 07:57:30 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.3467.1740470246246415763
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 23:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ThSjPN/Q;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5484fa1401cso1091696e87.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Feb 2025 23:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740470244; x=1741075044; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhXsWOB4hcg/GZb5cxGGWdexDPVbcG2T9O+GcwuA8nk=;
        b=ThSjPN/Q2j2PJxujYxi90NCgsxJ6zeKVOwLLVTsUcm+LUJuRGfnMQewCA9cYpon6GE
         C3gx0w5y8T4bVqpDiD7szd3jwVTmXK4Om6rDT0NHcm900N9SVRWuahpu3s/qDBZt2uAP
         s0TZ224qRSjhlvpGXzpayE11VJgZOmfAKn3NUS82q+iUsbx1JrpBHKJHo8ASFutkHPMt
         MBWh64GbNvzis/tKKTtpA/sy94hmlfO/h0wgeKtgflm9EfIfE8Kq8xIpU5rY/4DLGgOL
         Q99+r8JnBxj2nCCNnp5wZ1ClvmzwJmrp90eLAK2aIOGsLXg39MzKvuEGL3asS9zNEdmM
         E2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470244; x=1741075044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhXsWOB4hcg/GZb5cxGGWdexDPVbcG2T9O+GcwuA8nk=;
        b=fOHEtokPqR46nBvB0mrmTaYvVoTO0m6LuDlreK6VMleZL+lFljMHtlmYYHQ3EaEJHG
         3hbcoAznLzFJmLVaMsVkPCvLC2KfG9KbuF29L4p2Gpe8mrU6gRPalWJy048fBZHaeQcg
         wH1rMQMtUFM8P2ExwrTRebCdtYNfYPKhFqgb8Nyk0eIjPaAtYTReA9WfnPA742rM6RXQ
         WdvOtvuAyg1/Xg2yoHi1kx2AhTP+VYSP/aOVvckAuVubGgShAs7K6E9FoemEMZQnR342
         iHuk/WdXNRTpCToNEhYX9D1MY0U0xq+vmDq8VdijSpquN9FyifS25HAqBsrw1y058gHy
         VuEg==
X-Forwarded-Encrypted: i=1; AJvYcCUSGNGyUNNp7778iXK0Ae67ygZCncT9sHFubCwBHGihHiAPYlKUQz/i8b+O0Q4SeUl0r5kWFKjhQg==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YywgL/XvUkS8d+5uVFX8fBHYxLfQ/ICMS2ahh86xduTCAtnYNpi
	Z/e0OBnREnAflNlzmgjLT+CanVFfvoywVtQnZNqkeDINXRclFvbvb5VpAJi4YkE=
X-Gm-Gg: ASbGnctfr0F+NIeKob3rwGlnrDdTT95tf2zYSHlNBUwzAVqEmL2VxDMyuuUT3yaRIS/
	Lvoji0X/jNkCZKdREvSyiuA6+HdUo6bCnqhy6BwkyN/7N1Vz0NUBuEKeW9xEQwtMedV3+2QPo0U
	bCvMy+TDye8omWqAFrVToAQt0cIiRBh/+pzQUa60PQOxRLl6c1Zbl3EVWTdg9PZNFx9AUOwJyaj
	3ABEGfoMh0HNFVwW+Z32O6OWeupAP/3Eo/BjPlfb5VH/0PcAn3hl4wf98GlhGfezJRACV3UbCG2
	cMmyFCUfauoc8+Ih6ft229xRbvwJ7xBZdXju81RtVFOsM3IGn+A=
X-Google-Smtp-Source: AGHT+IFfJg6cX+DYqgL+RvMOzy5J+0Jf91eUsLtMD2z+MCq4X0KmF9ItU9y5vBpTcsagv7/CWD7fgw==
X-Received: by 2002:a05:6512:ea7:b0:545:2f0c:a29c with SMTP id 2adb3069b0e04-54838f4e483mr6582435e87.36.1740470243926;
        Mon, 24 Feb 2025 23:57:23 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514efd8esm107570e87.158.2025.02.24.23.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:57:22 -0800 (PST)
Date: Tue, 25 Feb 2025 09:57:19 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Haixiao.Yan.CN@windriver.com
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH 1/1] optee-client: disable build on qemux86-64
Message-ID: <Z7133_PThNHpWi4I@nuoska>
References: <20250221013348.2622293-1-haixiao.yan.cn@eng.windriver.com>
 <CAPoiz9xmFk9zq_aCYBfRD7UfWLDXrUbZe4jJK2TGqGGwevqR1w@mail.gmail.com>
 <152e3bb6-2a81-4754-9d3c-9476082475e2@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <152e3bb6-2a81-4754-9d3c-9476082475e2@windriver.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:57:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6384

Hi,

On Tue, Feb 25, 2025 at 08:41:04AM +0800, Yan, Haixiao (CN) via lists.yoctoproject.org wrote:
> My local branch is mickledore. tee-supplicant.service start failed on
> qemux86-64.
> 
> https://git.yoctoproject.org/meta-arm/commit/meta-arm/recipes-security/optee/optee-client.inc?id=1bff41eee67d6dafc7c58b0c88923a3c6f7a2a7c
> 
> 
> this commit can resolve my issue.
> 
> My question is could we add the COMPATIBLE_MACHINE for optee-client?  So for
> qemux86-64, if there is no OP-TEE supplicant device, optee-client build
> 
> can skip.
> 
> 
> root@qemux86-64:~#  systemctl status tee-supplicant.service
> 
> x tee-supplicant.service - TEE Supplicant
> 
>      Loaded: loaded (/lib/systemd/system/tee-supplicant.service; enabled;
> preset: enabled)
> 
>      Active: failed (Result: exit-code) since Sun 2025-02-23 22:41:08 UTC;
> 32s ago
> 
>    Duration: 191ms
> 
>     Process: 468 ExecStart=/usr/sbin/tee-supplicant $OPTARGS (code=exited,
> status=1/FAILURE)
> 
>    Main PID: 468 (code=exited, status=1/FAILURE)
> 
> Feb 23 22:41:08 qemux86-64 systemd[1]: Started TEE Supplicant.
> 
> Feb 23 22:41:08 qemux86-64 tee-supplicant[468]: ERR [468] TSUP:main:884:
> failed to find an OP-TEE suppli>
> 
> Feb 23 22:41:08 qemux86-64 systemd[1]: tee-supplicant.service: Main process
> exited, code=exited, status=>
> 
> Feb 23 22:41:08 qemux86-64 systemd[1]: tee-supplicant.service: Failed with
> result 'exit-code'.

One way to fix this is to change tee-supplicante.service to be started by udev
when optee kernel drivers get loaded and optee is found from firmware.

Patches were sent but caused regressions and fixing those are on my todo list, sadly
way back there.

https://lists.yoctoproject.org/g/meta-arm/message/6203

sysvinit scripts are a different story.

Cheers,

-Mikko

> Thanks,
> Haixiao
> 
> 
> On 2/21/2025 11:06 PM, Jon Mason wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > On Thu, Feb 20, 2025 at 8:34 PM Yan, Haixiao (CN) via
> > lists.yoctoproject.org
> > <Haixiao.Yan.CN=windriver.com@lists.yoctoproject.org> wrote:
> > > From: Haixiao Yan <haixiao.yan.cn@windriver.com>
> > > 
> > > optee-client will be built on qemux86-64, there is no OP-TEE supplicant
> > > device on this platform.
> > I don't think I understand what you mean.  More verbosity in the
> > commit message might help in the future.
> > I was able to add optee-client to qemux86-64 and it compiled without issue.
> > 
> > Either way, this patch breaks corstone1000 and fvp-base (with
> > fvp-base-ts).  You can see it in
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/9203534679
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/9203534694
> > 
> > Thanks,
> > Jon
> > 
> > > Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> > > ---
> > >   meta-arm/recipes-security/optee/optee-client.inc | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
> > > index f387c80574b0..aafb1efcf726 100644
> > > --- a/meta-arm/recipes-security/optee/optee-client.inc
> > > +++ b/meta-arm/recipes-security/optee/optee-client.inc
> > > @@ -6,6 +6,7 @@ LICENSE = "BSD-2-Clause"
> > >   LIC_FILES_CHKSUM = "file://LICENSE;md5=69663ab153298557a59c67a60a743e5b"
> > > 
> > >   inherit systemd update-rc.d cmake useradd
> > > +require optee.inc
> > > 
> > >   SRC_URI = " \
> > >       git://github.com/OP-TEE/optee_client.git;branch=master;protocol=https \
> > > --
> > > 2.34.1
> > > 
> > > 
> > > 
> > > 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6383): https://lists.yoctoproject.org/g/meta-arm/message/6383
> Mute This Topic: https://lists.yoctoproject.org/mt/111301214/7159507
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



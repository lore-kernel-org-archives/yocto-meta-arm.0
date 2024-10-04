Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C80CF8552
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 14:07:25 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.22821.1728050841221428768
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 07:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EiClLHoi;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5389e24a4d1so2620775e87.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728050839; x=1728655639; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rLWT2rIyCgjKAa0GqXF9d6YaNEg8UxGuDOWd+vm5CwQ=;
        b=EiClLHoiyVjpWhE7hXFnH4uRe7YVqMbbMOVdbz04Ilijj65ui9V6lFjuTKmPqJZ9+Q
         WofwzE0xFAcWsfeg/FYmDUGNdJ7jDZMcRwZ83xXAwwQC9PWX8lEaugfeEQEJcTh1lD+h
         4gqMiLiqDVemjC0privAaktqyWR1PQAL3Ca1FoYTjLRhyQ3DtqZBr/Ynf7CzSIZyIlvS
         Bc2bFglqDmuj2uoD8amaUG/iWdzUvQi5IGLqK2TUsopRo6mefhGDL+g6PTY1BW1naj4V
         MQeVm0hdO5Is+BQL1O4YW12bKGulI+h9nR9DHxZc3U/tPB1T5kWzjU+TCxivY57u5j6k
         UnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728050839; x=1728655639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLWT2rIyCgjKAa0GqXF9d6YaNEg8UxGuDOWd+vm5CwQ=;
        b=tSeGmY9r67A8GcBFiEgvc7zkDLreEMux7ODjUznBMj/t7Vg5x0M7pTx3dEP001QMn+
         JHRpfx7n0hoc6Voybe3Gt6HJn09PkCfXk0z4pPIF4kzucPql216Z79XYfMu4PQYNOqVl
         u87nokzteT7r0ln+ZSDGORg68EXxXdZ4UajYROguIHGbPZXgOBP6QHhgJtjlFPJZAiyV
         /Xib+XOs6dseJ8pilMgh7JdpyzkaLHYpoELaMXDUbTe6FCVpwaKNcFP8gD5Zmoz0zE4N
         7G5bCBPJbOzdcicNIczvYZB7AJetFkarogVebRCjIudmxQRPebgpyNgmbW7GZZy4kU6h
         t9jw==
X-Gm-Message-State: AOJu0YzCKnZ4Ba9OIMiZKu20jd9SnurgoDMtEB/6d3z20UOVRSfZWCtr
	1e4RAhlPHbfz/uoEoLV1czYeetDwfakGN5iR69sxGUErwJm6Q1KGERO2sIHaahw=
X-Google-Smtp-Source: AGHT+IFeMe1XfqE/wjYUuEr0IkN4DKSZWq3IBHYG5jNSGcitXVBCqp0wLcPei6mxr411Q63E+kjx4w==
X-Received: by 2002:a05:6512:e91:b0:535:6ad6:2d40 with SMTP id 2adb3069b0e04-539ab84a6d3mr1752296e87.11.1728050839026;
        Fri, 04 Oct 2024 07:07:19 -0700 (PDT)
Received: from nuoska (2001-14ba-7430-3d00--193.rev.dnainternet.fi. [2001:14ba:7430:3d00::193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a8251043sm438638e87.2.2024.10.04.07.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:07:16 -0700 (PDT)
Date: Fri, 4 Oct 2024 17:07:15 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH master-next 2/2] qemuarm*-secureboot.conf: fix kernel
 serial consoles
Message-ID: <Zv_2k7RyuQUzdISJ@nuoska>
References: <20241004130427.217611-1-mikko.rapeli@linaro.org>
 <20241004130427.217611-2-mikko.rapeli@linaro.org>
 <Zv_1RfzWjJp6DJtJ@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv_1RfzWjJp6DJtJ@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 14:07:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6169

Hi,

On Fri, Oct 04, 2024 at 10:01:41AM -0400, Jon Mason wrote:
> On Fri, Oct 04, 2024 at 04:04:27PM +0300, Mikko Rapeli wrote:
> > Kernel boot serial console is not visible in runqemu stdout.
> > Fix this by setting SERIAL_CONSOLES to include ttyAMA0
> > and use that as KERNEL_CONSOLE in .wks file bootloader
> > configuration which assembles the kernel command line.
> > Now kernel boot log is again visible, incase there are problems
> > with it.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta-arm/conf/machine/qemuarm-secureboot.conf   | 3 +++
> >  meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/conf/machine/qemuarm-secureboot.conf
> > index f08b84fe..c01ca47a 100644
> > --- a/meta-arm/conf/machine/qemuarm-secureboot.conf
> > +++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
> > @@ -21,3 +21,6 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
> >  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
> >  
> >  MACHINE_FEATURES += "optee-ftpm"
> > +
> > +SERIAL_CONSOLES = "115200;ttyAMA0"
> > +KERNEL_CONSOLE ?= "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[::-1]) or 'ttyS0'}"
> > diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > index 78a39c03..2f8c093a 100644
> > --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > @@ -22,3 +22,6 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
> >  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
> >  
> >  MACHINE_FEATURES += "optee-ftpm"
> > +
> > +SERIAL_CONSOLES = "115200;ttyAMA0"
> > +KERNEL_CONSOLE ?= "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[::-1]) or 'ttyS0'}"
> > -- 
> > 2.34.1
> > 
> > 
> 
> I'm not inclined to include this patch, and it should be unnecessary
> soon (and I'll need to revert it then).  The patch that adds that
> KERNEL_CONSOLE is in poky/oe-core master-next.  So, it should be very
> soon.  The SERIAL_CONSOLES line should be unnecessary, and that should
> be inherited from qemuarm/qemuarm64.

Ok, I'll wait for the patches to oe-core/poky.

Cheers,

-Mikko


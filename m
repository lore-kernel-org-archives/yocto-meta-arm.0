Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5950C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:06:55 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.2958.1752566805854394618
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 01:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XpD25KLw;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55502821bd2so5342182e87.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Jul 2025 01:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752566804; x=1753171604; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pYyXD2852vWNbgHe1T7KeCBvy//wJUNpBjzJgrTmgR0=;
        b=XpD25KLwV/8gEXe7n32ZWw+0EBKRy9dsVjx01c9FB9doJdj4ByCOKnhTH3pElA4jiJ
         s9Y9ZmQbI/PfnePkWAqfrg8GPPlvJvWwLQgCBilJSpxeeKaMVc82GbDW4AXFchnHCItt
         fkbuIlJCDRIVd06aMLheEt/z0fqzy1TJurTsXJ0heo0mYJ7ubLBxVfzsOzOknc3kQ7Lu
         2nQa/5FWrl3I9hIuHu7tPjeCKM8XfrHl7uHePQoyjedGVQOoFxP5+QbSyCmMOo7rpNEW
         AqhPSmFlDoK/VjiVzK5YLkiqGiuwrav/07ekOYkgqMCpKcPuXgFckn0nT+Kdfdn3bVOM
         GkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566804; x=1753171604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYyXD2852vWNbgHe1T7KeCBvy//wJUNpBjzJgrTmgR0=;
        b=tzaY95QV2NYphpFfA/rYdKI7wnefj9lrbNVeJzHyQjw3EK1aF2I5NBbfy6VOk1H07T
         JMRQ2t3Fhl4wn+daf8HpmYQwQcaRWuyswWFDSNN3/7AGc2n25p+TjPyaaL2QV3OCVNCw
         /R1F/49sFinQNrRMgZLgWWLKnMjHUv+bXZFZDHNXdy/F4Nr9xA3gUjVm1Qo1ZhtcJ7ED
         13n48OXdP2g17n3HFrReyoVRST4nZ2VbmlE2vNerWboQ4DVp5OSeeSXQUo7VSG+eaZ7m
         J238cmvCEe0ON3Ky1MENzCnb7ObUtIvgqRNslZcORtFKX0+2aJUHgqVOHP8QGD4a4iMF
         V+vQ==
X-Gm-Message-State: AOJu0YyLi3chbZ5S8ntzeanUtRTCeU50X5TlrpNoSro1vFX47pqFsiJU
	0Fcn77CmapoRYhf14GP7MIhdL0WFu4mHsmr8x7SwHJXIOd/CkJGjgVE0qGhKQoSPAxE=
X-Gm-Gg: ASbGncvbGJBQXYBLNF3cJdM0HGgHGRIJpi/qkFlwHR5MJJZAx+2kCbYlSmc1YddPr4H
	AyD5Bc6cLnBBgR5ZuCxOuRz7NRkBQ5xez9nRxH+qGe4Sj4pwY8Gdo1B6x04Y0iqc0SxCtbHe6Ey
	+LpCBvTXvh+FHl1v+1dI4Yhqwo2nvZHGdE4bhTPDFnroeDr3REHJmf2IMazMUOB5V/BZa6yfLBI
	rsjTFxjLtAPWBdGi0jBr+PMwiJ2idQ8guCUbdvKfcfDDoSCJYKjGIvn1Ur3a1R3k5XreUm3Dqhv
	94/osZhSM6sIepD86nCmUd5I+wgqjbRifypRt7JSOs2X/5/ywA5s3BuqCEgUIMUkNAZxRYaOJ77
	yyTC0ZoFsWQIog7ol6o0RQR2eLSltyylUdojpo5W78dZh7qWYKz6MqC0=
X-Google-Smtp-Source: AGHT+IGDDwve9YvIaTujgVwxH+52pLazNRQrFlWhKVDwKjABzi028FE5981912JgdZjCL6i9swa/Tw==
X-Received: by 2002:a05:6512:1250:b0:553:2e4e:cf74 with SMTP id 2adb3069b0e04-55a045f0a14mr4655350e87.27.1752566803589;
        Tue, 15 Jul 2025 01:06:43 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6070csm2197235e87.153.2025.07.15.01.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:06:43 -0700 (PDT)
Date: Tue, 15 Jul 2025 11:06:41 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: m.grand@trustngo.tech
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] Full secure boot with qemuarm64
Message-ID: <aHYMEYkgUWBKsuhm@nuoska>
References: <MR1P264MB1841ADD5E68964B57B0DA05BE157A@MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MR1P264MB1841ADD5E68964B57B0DA05BE157A@MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Jul 2025 08:06:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6613

Hi,

On Tue, Jul 15, 2025 at 07:57:28AM +0000, Michael Grand via lists.yoctoproject.org wrote:
> Dear all,
> 
> I'm trying to develop a PoC of a fully secure embedded software. Because this PoC is intended for educational use, I don't want to depend on a specific hardware vendor and therefore, I'm using qemuarm64 as target.
> 
> Unfortunately, i'm struggling in having a working secure boot (TF-A + OP-TEE + U-boot + kernel) and I cannot find useful (and working) information on the internet. Do somebody has some kind of a minimal working secure boot example based on qemuarm64 ?

Check the meta-arm layer and build for example
"kas build ci/qemuarm64-secureboot:ci/uefi-secureboot.yml:ci/testimage.yml"

These build u-boot for UEFI secureboot and then load a UKI binary
signed with matching keys, which includes kernel and initrd.

The testimage part boots the thing with u-boot and checks that
boot was secure. The config files have the details.

Hope this helps,

-Mikko


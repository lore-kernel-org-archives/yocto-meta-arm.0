Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9968DC54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 16:38:06 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web11.109004.1673368676293076100
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 08:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=bL5kWldG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.221.181, mailfrom: jdmason@kudzu.us)
Received: by mail-vk1-f181.google.com with SMTP id j18so4122879vkn.10
        for <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 08:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ucVgPQWLE+AhPLLKJgCo5UpHdsvcJ13ZMTVowhssyA0=;
        b=bL5kWldGTBz1dAAca4l5cu8tTPZOhkrkE1PdEsJtprRpBY78RKg2Os7OXGLPUoEpVK
         5QrMGshkM1ERDQnSCaGm4WANQP2fwwl6tjLPMLXADIvsLU6FCw4XxXm6xIobMIF7Wg1H
         euvYOHOkxKyTKbHN93J9nIY+AQSdbUdtosPDOIrQw2l5ODgmUHAqEaTE7FqKxVTgxc+s
         F0bk18o2ybgWamsZvS7jA9vm6wF0d2JioLpHUHo38q7hYelA9wNLtnxQXjaOZKQBVThN
         9gz1uZrjN3CY0YL47h6bDXUN7gUwghOdi1QDH9tabgNAdrP2TGgO9thgWmQCBLwo/mdi
         sfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ucVgPQWLE+AhPLLKJgCo5UpHdsvcJ13ZMTVowhssyA0=;
        b=hKUTlzuph3K3sOoW/VJh0z4CDftv+ZVrjxqGCoc5U21+pHpVIvVIbhy0rze1wTmKux
         jvHAWjNGSdTZdQg8OEJTvmzJfURwjqBq7px489hvIV3TUDhZ2HWHyOTveyQ9Lp7ZsU+F
         1Mmy/WQaQHtz7EjaaBFrJquB8xu/EKV7HNO9cSLhfKyB5NlDDEMxXcD+oGP04ZDcTbny
         RCR6ea9fKVknTyCPX4hztoFDU1Bv89PrGiSxQHFukrpU8Q/npfLaceeTnzkF9QQZMQh1
         moE9arApsW8GS0z5GomuLOa6fdKbMOukvm8bJH9prl8mhbrJTfDiJdvsAfb6ku9jlebj
         5LHA==
X-Gm-Message-State: AFqh2kqIPyR5hENV4k4xKT8P3YlVYwVeghAQmwdE/LF4+S6GNY9I6IHs
	wZpoqwm8RvsnRX2aBb7G4t9D1g==
X-Google-Smtp-Source: AMrXdXtQd7STERchdpOGe+3iQs3+msPEmzN0+tppK4rOssBJI1f6fMunZFZwNbYoCSn5pbzwvOWDfg==
X-Received: by 2002:a1f:b443:0:b0:3d5:9c53:6c18 with SMTP id d64-20020a1fb443000000b003d59c536c18mr21312607vkf.3.1673368675295;
        Tue, 10 Jan 2023 08:37:55 -0800 (PST)
Received: from kudzu.us ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id bm16-20020a05620a199000b006e16dcf99c8sm7403570qkb.71.2023.01.10.08.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 08:37:54 -0800 (PST)
Date: Tue, 10 Jan 2023 11:37:53 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Emekcan Aras <Emekcan.Aras@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [PATCH 2/5] arm/optee: support optee 3.19
Message-ID: <Y72UYV/BG39wEykn@kudzu.us>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
 <20221221143942.15196-3-emekcan.aras@arm.com>
 <7DEFE610-F0A9-44D3-AAAB-2B7E7919669B@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7DEFE610-F0A9-44D3-AAAB-2B7E7919669B@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 16:38:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4251

On Thu, Jan 05, 2023 at 03:30:14PM +0000, Ross Burton wrote:
> > +++ b/meta-arm/recipes-security/optee/optee-os-3_19.inc
> > @@ -0,0 +1,82 @@
> > +SUMMARY = "OP-TEE Trusted OS"
> > +DESCRIPTION = "Open Portable Trusted Execution Environment - Trusted side of the TEE"
> > +HOMEPAGE = "https://www.op-tee.org/"
> > +
> > +LICENSE = "BSD-2-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
> > +
> > +inherit deploy python3native
> > +require optee.inc
> 
> …
> 
> This file is 99% identical to optee-os.inc apart from FILEEXTRAPATHS, so put that assignment in the .bb and include the common optee-os.inc.
> 
> Whilst I’m there…
> 
> > +do_compile:prepend() {
> > + PLAT_LIBGCC_PATH=$(${CC} -print-libgcc-file-name)
> > +}
> 
> This doesn’t appear to do anything, can you remove it in a separate commit.
> 
> > +# note: "textrel" is not triggered on all archs
> > +INSANE_SKIP:${PN} = "textrel"
> > +# Build paths are currently embedded
> > +INSANE_SKIP:${PN} += "buildpaths"
> 
> Can you experiment and remove these to see if they’re still valid?
> 
> Ross
> 

Looks like I missed this and pulled it in without being commented on.
Emekcan, can you address this in a follow-on patch?

Thanks,
Jon


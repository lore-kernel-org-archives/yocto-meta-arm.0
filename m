Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD9DD6AAF7
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 17:56:21 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2550.1775152575102383179
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 10:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ETehJ53n;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2beddab48so1254764e87.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Apr 2026 10:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775152573; x=1775757373; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wlHlu2p2S3942KUXDAa9Ht1BzQ2YRyFxREAAv/SpHV4=;
        b=ETehJ53nzvejhNr0JyPtKvn98sPLik81V6mmhapvVNWSLhIlJeavmXv7DoSzt9dZs1
         4l8pFA7zl3TGLI8ntfdXap5W4hK4YBPkXN3+x3NuduAVK0TsgEZSKpxCKvDZLN08p78N
         8h0lTzXe9fGmdPfueNaU6jqylC6yWuGPVYOzu+OfY+Tsr/mjRp2DtouHHxMVvj1ELk2f
         4ox2C13uYi/xlhaIu2Gsde/thDLMLv3bZrX1TadziL2PXxGKDNHr/N58vDvcPGH9/iXD
         LLt4Xs+nOOOHgUAitAjp3w6QRTmW6XCkKUhmyE8SndMn47w1hEFZ0sMqyr1PmMuEDSxZ
         uwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775152573; x=1775757373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlHlu2p2S3942KUXDAa9Ht1BzQ2YRyFxREAAv/SpHV4=;
        b=iLTqu7GnnG7Netmz+Gnean487DgZW1H56JPPJKzNl+AJxaV1owt8eS/s1f9SKO4nHI
         Dm3G7PMpTIYGJOfDG5XRx5macwoo2ttyvJphOi7/m7DvtiVYLDyY6Zh+fjXfo9m5kqCL
         H1CeOrwLm51p8JZhi+vpicW/ylrnnUHRmMEQvHtWeJZrXkMHhjH0pCytXXLbxvdGnh8m
         cFd+qdic75ov1ZrfTmfp7Y8c34X5GI0ArcMbyTlwtxyPnrFt9zgbp2wgzWZuaftA52v9
         Xj9XMQQ5OXkT0kcpZqtOgDekDZK1nObXwac7k/JnQXW502i5wH5AJSLu1z2knOgH7r/c
         OO9g==
X-Gm-Message-State: AOJu0YzLvHx63DgZfsNzj8JxSzsqWSadnmLcoZ7+c3UsYyLgiYlgBtQf
	idMFXnVGnMAdfcaT2jxiKbZJHmjzq0yb9a7N/9esKb9LKMYclLpTJurDC8uBzJEMmZY=
X-Gm-Gg: ATEYQzx2+j2WxydxA0DnIf+tjgjMh1tmwRdOYwQMR7SyDCN9wAg0Dp12GXPnk8JZD/K
	b69dglZyxgvDbOWLuJ6/jf/7GLh7gMZeZN7d1KXJ43s/ajNYkb2gFFO9YIfepMJpkdi4UQar67O
	/78shWzO6aqhvY9NUcoCK9p/jXBa/gouYn6oThVct1BYkUO4no/Wqd7ONHmKu61n9T7zftUfakO
	xd+/48ZTSPjushyG88eURHzMR4GcbbTc8ZScm/kPt8f+S1xAC1vd1830WzxtlXrPk4EFqh9vnDo
	87BRm+7V3c207oixopvwPEO2+8m2TGAen/xXRT/dIJLMZbOq6A5/39jHGQmGTB+oNNJ3V3kUawT
	AlpEubyO1fLevBuGb/4x811bvECGbFsDI3wC5uKA3H0OjvsFLB8OWKf8jMs7nyfoR/eVph2masi
	/kFGciwjRcKDtInAjXJjEVqUk3JvQ+3eWC4atLnZ7cQEn71QiVIxk+3Q==
X-Received: by 2002:a05:6512:2253:b0:5a2:792f:b836 with SMTP id 2adb3069b0e04-5a2c1f2ac30mr2959169e87.30.1775152573050;
        Thu, 02 Apr 2026 10:56:13 -0700 (PDT)
Received: from nuoska (37-33-177-132.bb.dnainternet.fi. [37.33.177.132])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9d04fsm838796e87.34.2026.04.02.10.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 10:56:12 -0700 (PDT)
Date: Thu, 2 Apr 2026 20:56:10 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 2/2] u-boot: enable tf-a support for
 genericarm64
Message-ID: <ac6tunq9rpv6IfPA@nuoska>
References: <20260401102931.781169-1-mikko.rapeli@linaro.org>
 <20260401102931.781169-2-mikko.rapeli@linaro.org>
 <0810276D-F3CA-4C31-B9DB-41016EAC973A@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0810276D-F3CA-4C31-B9DB-41016EAC973A@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Apr 2026 17:56:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7000

Hi,

On Thu, Apr 02, 2026 at 04:42:02PM +0000, Ross Burton wrote:
> On 1 Apr 2026, at 11:29, Mikko Rapeli via lists.yoctoproject.org <mikko.rapeli=linaro.org@lists.yoctoproject.org> wrote:
> > 
> > +SRC_URI:append:genericarm64 = " file://qemuarm64.cfg”
> 
> Whilst I don’t disagree with the principle of the series, this line means we’d fail the compatibility testing (and if we didn’t, that’s a problem with the testing).
> 
> Simply adding layers shouldn’t impact things outside of them, and this will mean that adding meta-arm automatically pulls in TF-A to genericarm64 builds.
> 
> I’m not sure what the right solution here is. Maybe literally guarding the SRC_URI change with a variable (that defaults to off) would be sufficient.

True. I did not want another machine variant which enables these. Maybe
MACHINE_FEATURE like "tf-a", which then for genericarm64 adds these
qemuarm64 configs. Using other custom variables doesn't feel right either.

These do not impact anything in systemd-boot, kernel or userspace
or in the wic image which is compatible with a lot of HW.

Cheers,

-Mikko 


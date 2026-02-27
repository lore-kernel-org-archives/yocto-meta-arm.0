Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFFAFD530A
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 19:01:34 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.103883.1772218884741289881
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 11:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=dEhu1jqW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cb38e6d164so301461685a.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 11:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1772218884; x=1772823684; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzMN6jiqIqqSp/MTL4lblUPPVyeL35Z/zJJDwZzQ9QQ=;
        b=dEhu1jqWaEiEl2Mxq9+6S5DQ/bcGQvVpn6Em8seg2RAhR3jZdaWcJp3yP6kus6zy81
         dr1n2oi/GmbFrASFqLh3ec00BIdpKA+RE8egm0LO67EGb0ErUlNyxhDfPvRXiT+M1gpY
         AgG5F3WakIPTrjQJkVN8kWKARbc9pcauDYN+Ffx2tPBZB6TXBVJWICnndseYPN2Upzxb
         hOHoQTPi738IjZqBWki6x5b1hrZj79D8Q01oSmUbD9H3Tb5ptJKkpctG41JgV1wcs+PL
         fBG22L6LEVauAONZpdFb/0ZAOgvhRXgUSZEW8E9tvv6ADGjLPi3k/Fb+unfihDD9kfNM
         bx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772218884; x=1772823684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hzMN6jiqIqqSp/MTL4lblUPPVyeL35Z/zJJDwZzQ9QQ=;
        b=jREXUzaVoS+sP+aprNQBrwjdUMpRWYSGhod6vZKEcOpcAKv3MUYv+s8AIZcJlH9hGG
         UoF0eaco0C3uQyyYXRuMgZCrZYQMnTl9+ZGBTShEzLKB9YyKW+WHXvqQ038KNoQmyvWu
         lbKsO5df4QVrlcIJGhUDgspm/jiMcLSLcPOga/bZx0aBiTehro3CLThEuZGYQofjmTlK
         sMeJ+/CmQ9v87MyN+Qx5GOIbOwX+m4B3Z56aGnQjw10KkKWARH1bQhaKUXvDEnFrJEYd
         CIpaNDMo0JxLox/s3ue8Wo/40ZHTEhyh3FULt71zCTrDauf9eZQ4wTAmfMjvYOu3M201
         1iiQ==
X-Gm-Message-State: AOJu0YwgYzSoctE1/rAauigl/C8gR+A38pDbuCblVLL1kOdcR2v3mVco
	fPr/6zM9VWYwrGs6NHOrodjmUewoyjCUsOEBn/CMpjTxOu5UYiIj8+WiWieZR03WaKzDIN1nohD
	1oEM=
X-Gm-Gg: ATEYQzy/PtxYNS1kXEc6JjI6cLLkfIvpIBidQuraoWHoyI5Kh8aORQkYRwt/DF8NzfL
	+4IZlh8R2rccUVsacfRmtMxjiZx68J2LGx8TpaTb+pMpYxeLU49EpK/u0pgdwbKbZXouKQkAVa0
	ac2jqXChOmH7I1r0wsaVr2mrejADpkDCNClV63XlIMpMLpi1Vk5tGegPt7fH4dcgCvMFHz1PwyC
	mZovVM/c74xIrClI5wOSvGcnHXxHUUq+zWzzMNV3StFcfGW2y9j3FhJ4Do7smGd61SkgAovYf60
	lKoJ1dGCwT1APMB7ReHSQtEaLGzhEA45IlfOraTE+HEugcn49Ak5A4nmEVsOmNhgljOVvmZE8Lp
	gEmn4aoJPVFqQbykYjbe4X1OM2KKERw0du4JBlGi3emfsDUtL44zvK8NT8lhEfaUn5m/P2UISN2
	2PggZQ5AJN9ZopWS6XE2I5qYE=
X-Received: by 2002:a05:620a:9493:b0:8c7:16fb:ed49 with SMTP id af79cd13be357-8cbc8e79da4mr354814885a.63.1772218883428;
        Fri, 27 Feb 2026 11:01:23 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf7161fcsm523538985a.33.2026.02.27.11.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:01:22 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] CI: don't testimage core-image-initramfs-boot
Date: Fri, 27 Feb 2026 14:00:40 -0500
Message-Id: <177221883995.575698.227049031649407009.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227135234.2011194-1-ross.burton@arm.com>
References: <20260227135234.2011194-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 19:01:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6928


On Fri, 27 Feb 2026 13:52:34 +0000, Ross Burton wrote:
> A recent change to image dependencies in oe-core master[1] means that
> TESTIMAGE_AUTO tries to test more images than before.
> 
> Explicitly reset TESTIMAGE_AUTO for core-image-initramfs-boot so that it
> doesn't try to testimage an initramfs.
> 
> [1] oe-core b75c21fb950 ("image_types_wic.bbclass: add depend on initramfs")
> 
> [...]

Applied, thanks!

[1/1] CI: don't testimage core-image-initramfs-boot
      commit: 3c92c9950f256ce6a10780b63dc79234efcfa7bb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6DFC38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:25:21 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.109878.1674843914766705454
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 10:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=q7QnExN6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id v19so4743301qtq.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 10:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1peWRvaT1SYCNdeg5vqp5qIFWZUALt0JhUWTGirOZoY=;
        b=q7QnExN6YmpcrS20Jv+XWm11kyazfUc7avosJf2xqvfv2zw2/EMcBBaevPUt1orIJj
         jw/UqbiloIhHUg7l7tnK45rIUj+YrPf73lhzTD4it4FoYckyNkCUqfRqSOdYC+mcPpVv
         +Y7p6ph70iy1yOtXuJUSKcMYW//fP4GVjZzly4M4yuRm9E4jctH0b0CiQp1b8SOs0ilm
         vUaUBmS0xJ5j2sa/pzCYSAb7kVzsr4uGRT2x5dYiFmdjUlq0jLGV6ItIWsnDSE/+Itve
         f8njPsVXgwEfb2FMxjqBaWAVfunqwNQKrnXNtvs8Y0wDxvgeEQorGxIvYttzD4M6cg8n
         V8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1peWRvaT1SYCNdeg5vqp5qIFWZUALt0JhUWTGirOZoY=;
        b=QrbCcfmOg5vwKFdfYX1HWRic4zEQ0rT2xgbxGzn8bBKvVcLDxdfb8Gd5hsjhRRoO7x
         s0DAUTGBCNyUzsWk5Nb9cr2Vm4Gs18BTi+mzKCkc67gPMo9foUwbAFQlUBi7VQpkGXCt
         v8bRP5NdwPbYOwkone8fm2282oh3V0ovmoX7woUZGp5jNCVCUAQm8jCQ3MitMGrB03D3
         Nf/tX/XqqIXPFbfl17TE44KV/PvEGV7UrUpGGQRo2yEaPkC5NKs2TbAEfYHr20DTcEDW
         mM86eUeQuBXhmDIdilCEvD0A7DfvCy0KHNMIcfQPsJJbqq6+jULDifpv2vIK+sgcH6RP
         fA7w==
X-Gm-Message-State: AFqh2kpnYQ4fqDjjA+Je6vjTWpBEU1V3c0/FNgBFCy77geuLYZsJ4l/H
	HzqK4gW1xstJ4QOc6YSSYkyTmBl/IUKzFBSm
X-Google-Smtp-Source: AMrXdXvKS8bGDPjFwe5xfKn7d9mfDvFO9zSA10Y6lWTUepKiGaDer06Cg+xfENIfJ9zY4cuoTp+OzQ==
X-Received: by 2002:ac8:7ed1:0:b0:3ab:5a62:453b with SMTP id x17-20020ac87ed1000000b003ab5a62453bmr58413023qtj.53.1674843918494;
        Fri, 27 Jan 2023 10:25:18 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id em7-20020a05622a438700b003b646123691sm3030290qtb.31.2023.01.27.10.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:25:17 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH] arm: Use SRC* variables consistently
Date: Fri, 27 Jan 2023 13:24:48 -0500
Message-Id: <167484388780.842866.17586124246717198383.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230123134855.3793215-1-peter.hoyes@arm.com>
References: <20230123134855.3793215-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 18:25:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4331

On Mon, 23 Jan 2023 13:48:55 +0000, Peter Hoyes wrote:
> The SRC_URI, SRCREV AND SRCBRANCH variables are currently used
> inconsistently across recipes in meta-arm, leading to difficulties
> customizing the configuration in external BSP layers where necessary.
> 
> Standardize usage across commonly used recipes so that:
>  * SRC_URI contains a SRC_URI_PACKAGE_NAME variable per component which
>    can be used to easily configure a mirror. This variable uses
>    default assignment so that it can be easily overridden using an
>    environment variable, e.g. to point to an internal mirror that cannot
>    be committed externally.
>  * SRCBRANCH is defined per component.
>  * SRCREV is defined per component.

Applied, thanks!

[1/1] arm: Use SRC* variables consistently
      commit: bf204866e8642733e6aea1eaddd61823d9267c40

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


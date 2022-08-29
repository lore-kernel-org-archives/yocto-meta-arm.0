Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9FBECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 18:59:19 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.2234.1661799552709601694
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 11:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ir3H+u2y;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id w28so6881967qtc.7
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 11:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=MX6hluJJ107UqTehLuo5cG54q6yMM0fJaca5VG8ASzc=;
        b=ir3H+u2ywrVJaZBaK5dwPzM4afyYiK9rUmCFCx+ph5YQOIBmV53BAC0UwPiU59B+WI
         AFh941vhxbs8lqcyMTKJAhUvf4OSl9zt+WE3Hbo1I2mVZjsvRY0tSMhsO5BG1oCV4s9S
         858cKekqYBQhY7c4Vh08eHCHuq10LEwMWx27CetUlbAY1JsyzvFTqYeJ5hxc1Ag7VZ8m
         GevdHBRQ6iAiV3ezjudDQzmkd+r0LmST5OxwHasYKfWd7CPV2K/RqjXZ2ta0T6gcz/wk
         I5fq0dvU6/PJ+kaYGk4KLqjnZgDbxORt/Vmq82ig1+3KCsBr//AfVpAKYUygx7cTTqhI
         GrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=MX6hluJJ107UqTehLuo5cG54q6yMM0fJaca5VG8ASzc=;
        b=imLQA3Db8DXaElNJz1ipt8/1KAKPr5qRRBBc8sfWf9g3XsJnu4w7DDvJppVUyybzJl
         M3E5TU3t4Rw8HeCmU63qjIJeMeYTvHTjV4/re1WBXVLThBrTDShHh96n1o/UKBWuBkpu
         E5jeC0cx8NSuLrh5fgYRqkcC3s1KTLDHbHD/D0P2Dr8RYSkZHvhpV57IssmOldt1pFFJ
         VfR8tsDVgj4UM4+FbUbuSQ6CIvUcuQULKwbZtgpFw8YV3fGSrZubp5Nm66zN0N7MpyP9
         45jrNNf+GJMXej5hiWd2h2QMvyz3c2+YA2HNSLXhe+WbQLm3YB9ItH6Pfb+iSs+RZwiK
         DhLg==
X-Gm-Message-State: ACgBeo23S1cgOYr2AZobSIGJ9u5SnDmAsLQu6NpOQARzzwADCNKeY2G8
	jS0SSngl4ekyy2u2vX6GBWu64S0CrWKAMRPQ
X-Google-Smtp-Source: 
 AA6agR5yxJekS6tJw3KLpkpfMyzW5ATvIKZ/p1wxzKY6ouCWRW6f2rrua39FPm4WBFABgbDmKm3ybw==
X-Received: by 2002:ac8:5b51:0:b0:344:7c4f:5a8f with SMTP id
 n17-20020ac85b51000000b003447c4f5a8fmr11861082qtw.398.1661799551261;
        Mon, 29 Aug 2022 11:59:11 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 d5-20020ac86685000000b00342f7beccd0sm5550069qtp.45.2022.08.29.11.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:59:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/corstone1000: use compressed kernel image
Date: Mon, 29 Aug 2022 14:16:21 -0400
Message-Id: <166179698237.462911.6071597411300794295.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825173656.10004-1-jon.mason@arm.com>
References: <20220825173656.10004-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Aug 2022 18:59:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3723

On Thu, 25 Aug 2022 13:36:56 -0400, Jon Mason wrote:
> To fit the kernel image into the allotted space, a compressed kernel
> image is now needed.  Use the Image.gz from the kernel build process
> and change the relevant places to use the new image name.  This also
> necessitates adding an unzip command to u-boot to uncompress it to
> memory (and the loadm is still needed to setup the efi mem boot device).
> Also, the unzipped image is larger than before.  So, increase the size
> that loadm is copying.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/corstone1000: use compressed kernel image
      commit: 8854f98d3c1a48eb888119306f5350185b223852

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


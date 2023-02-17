Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB75AC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 04:31:30 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.260.1676608277540722560
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 20:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Tg/FA5Ah;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id z5so4351422qtn.8
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 20:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fW8IYjHN8Kgx8dRQJH4ReIfIA5G1pPMdq9x4ZVzkIA=;
        b=Tg/FA5AhnzghZI/EyIEOx3rHPKoU9E1Mo/SXBhgOeZjUl+JGHf3IJ55ePydbysr1BY
         qgrsfWvWRz9+eUPousWNl8Hd37ThWK0wQuTqRUXqI1a78g91REeYvD8kAqGIKJ95JhzV
         u5LY0LpIXKt7vDoyWg3ta6t5szIyrDvDxCZ1EahuC/txguTVS1yF9ijtow8yiGWMI901
         VbSfJo70aiEfrkh/RE6azWXIycEIarLeGlItVDPOH34+uwXzpf88efU/bmqxEhs55loC
         dn0khk5RZMV21PmYBvWhunhCf35b7LGtpdkylRdo+GPj5yJHGhi14BqADB0KjJGC0+bb
         VuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fW8IYjHN8Kgx8dRQJH4ReIfIA5G1pPMdq9x4ZVzkIA=;
        b=igRdTpZ1jTIUyg7PkOVh4qsedQXlUDWG3IxyRrN0jBHGIEOTbkxk/FMDCPIKa+q+sK
         9dc/+4ryBz+lV1aX8w+E9DKEXiYirl3OkSfntDESI/JUOCSoO7FQn3aTcaXfaghLdNcb
         YcfJB91J/XCxDhUoy0XwFdzdHC0fefSoOEinKnu9D3vgiNhQ39ykuLph7tIioYlDzti9
         HKe5qhkFG5uHmcQxh0DzRvtkKGOjRnYE19xvaJz0jfzPvFZdIZPc3Kxxx2wpIHcNHS2u
         au+d5e51zoikrHW1FUpa2Oam8HTk+IW/3P6N/g9UGWZashytXEsCQ8yGzi133e3FUiAB
         7jzg==
X-Gm-Message-State: AO0yUKXSfFV1f4vfq4xj/ZJ9n6QHr9/ClGDXqLotuEU04xdkETA8YElC
	daRxU9TKSzTW+s3lLFWNA7qDtgxZzI23rkhM
X-Google-Smtp-Source: AK7set+MipM1Vf/Bf03qPJKintvy6NQDHaj3NalQSBFlSIz8FQ+qvwlsTKWZLws/OpsiOXvfkmtTrQ==
X-Received: by 2002:ac8:7f91:0:b0:3ba:3ac7:ccf1 with SMTP id z17-20020ac87f91000000b003ba3ac7ccf1mr13416779qtj.58.1676608284973;
        Thu, 16 Feb 2023 20:31:24 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id a138-20020ae9e890000000b0072396cb73cdsm2604030qkg.13.2023.02.16.20.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 20:31:24 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm/boot-wrapper-aarch64: tell upgrade checker to look for new SHAs
Date: Thu, 16 Feb 2023 23:30:56 -0500
Message-Id: <167660825903.685488.15346380849079398225.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216161133.3488226-1-ross.burton@arm.com>
References: <20230216161133.3488226-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Feb 2023 04:31:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4419

On Thu, 16 Feb 2023 16:11:32 +0000, Ross Burton wrote:
> This repository doesn't tag releases, so just track the latest SHA.

Applied, thanks!

[1/2] arm/boot-wrapper-aarch64: tell upgrade checker to look for new SHAs
      commit: 93f5170eb2aa764078d04468ec2e80544cf6f3bb
[2/2] CI/machine-summary: add missing recipes
      commit: 402cfcc4e85f56f14f3ec67b5fe373e00a18d7d4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

